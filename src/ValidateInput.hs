{-# LANGUAGE QuasiQuotes #-}

module ValidateInput
    ( validateInput
    -- , validateInputOptimized
    , validateInputOptimized2
    , validateInputAtto

    , regexPosix
    , regex
    , regexPcre
    , regexTdfa
    , regexLight
    ) where

import Control.Applicative
import Data.Attoparsec.Text
import Data.ByteString (ByteString)
import Data.Bits ((.|.))
import qualified Data.Char as C
import qualified Data.Set as Set
import Data.Text (Text)
import qualified Data.Text as T

import qualified Text.RE.TDFA.ByteString as Re
-- import qualified Text.Regex.Base as Base
import qualified Text.Regex.Posix as Posix

-- Best by performance
-- See https://wiki.haskell.org/Regular_expressions
import qualified Text.Regex.PCRE as Pcre
import qualified Text.Regex.PCRE.Light as Light
import qualified Text.Regex.TDFA as Tdfa

-------------------------------------------------------------------------------
-- Text approach
-------------------------------------------------------------------------------
validateInput :: Text -> Bool
validateInput txt =
  ((T.unpack txt !! 0) `elem` validCahrs) && not (containSpecialChars txt)

containSpecialChars :: Text -> Bool
containSpecialChars txt = any isSpecialChar (Set.fromList $ T.unpack txt)

isSpecialChar :: Char -> Bool
isSpecialChar a = Set.notMember a $ Set.fromList (validCahrs ++ ['-','_'])

validCahrs :: String
validCahrs = (['a'..'z'] ++ ['A'..'Z'] ++ ['0','1','2','3','4','5','6','7','8','9'])


-------------------------------------------------------------------------------
-- Text optimized approach
-- it consumes unicode chars, hence it is wrong
-------------------------------------------------------------------------------
-- validateInputOptimized :: Text -> Bool
-- validateInputOptimized txt =
--   C.isAlphaNum (T.unpack txt !! 0) && (alphaNumSpecial txt)

-- alphaNumSpecial :: Text -> Bool
-- alphaNumSpecial txt = all (\c -> isSpecial c || C.isAlphaNum c)  (Set.fromList $ T.unpack txt)

isSpecial :: Char -> Bool
isSpecial a = a == '-' || a == '_'

-------------------------------------------------------------------------------
-- Text optimized approach 2
-------------------------------------------------------------------------------

validateInputOptimized2 :: Text -> Bool
validateInputOptimized2 txt = isAlphaNumOpt2 (T.unpack txt !! 0) && (alphaNumSpecial2 txt)

alphaNumSpecial2 :: Text -> Bool
alphaNumSpecial2 txt =
  all (\c -> isSpecial c || isAlphaNumOpt2 c) (Set.fromList $ T.unpack txt)

isAlphaNumOpt2 :: Char -> Bool
isAlphaNumOpt2 a = (C.ord a >= 97 && C.ord a <=122) || (C.ord a >= 65 && C.ord a <= 90) || C.isDigit a

-------------------------------------------------------------------------------
-- Attoparsec approach
-------------------------------------------------------------------------------

runParser :: Parser a -> Text -> Either String a
runParser p t = parseOnly (p <* endOfInput) t

validateInputAtto:: Text -> Bool
validateInputAtto txt = case runParser textParser txt of
  Left _  -> False
  Right _ -> True

textParser :: Parser Text
textParser = do
  f <- alphaNum
  ts <- many' (try alphaNumAndSpecial)
  pure $ T.pack $ f:ts

alphaNumAndSpecial :: Parser Char
alphaNumAndSpecial = try alphaNum <|> try special

alphaNum :: Parser Char
alphaNum = satisfy $ inClass "a-zA-Z0-9"

special :: Parser Char
special = satisfy $ inClass "-_"


-------------------------------------------------------------------------------
-- Simple regex and string
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- regex library
-------------------------------------------------------------------------------

regex :: Re.RE -> ByteString -> Bool
regex re isin = Re.matched $ isin Re.?=~ re

-------------------------------------------------------------------------------
-- regex-posix
-- Regex. Declarative approach or Posix.
-- I use regex-base. It adoptes Posix for PCRE regex.
-------------------------------------------------------------------------------

regexForInputPosix :: ByteString -> Posix.Regex
regexForInputPosix r =
  Posix.makeRegexOpts
    (Posix.compIgnoreCase .|. Posix.compExtended)
    Posix.defaultExecOpt
    r

regexPosix :: ByteString -> ByteString -> Bool
regexPosix r = Posix.matchTest (regexForInputPosix r)

-------------------------------------------------------------------------------
-- regex-pcre
-------------------------------------------------------------------------------

regexPcre :: ByteString -> ByteString -> Bool
regexPcre r input = input Pcre.=~ r

-------------------------------------------------------------------------------
-- regex-tdfa
-------------------------------------------------------------------------------

regexTdfa :: ByteString -> ByteString -> Bool
regexTdfa r input = input Tdfa.=~ r

-------------------------------------------------------------------------------
-- pcre-light
-------------------------------------------------------------------------------

regexLight :: Light.Regex -> ByteString -> Bool
regexLight re input =
  case Light.match re input [] of
    Nothing -> False
    Just list -> not $ null list
