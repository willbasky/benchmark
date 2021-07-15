

module Benchmark
    ( patternMatch
    , patternMatchOptimized
    , patternMatchAtto
    ) where

import qualified Data.Char as C
import qualified Data.Set as Set
import Data.Text (Text)
import qualified Data.Text as T
import Data.Attoparsec.Text
import Control.Applicative


-- Text approach
patternMatch :: Text -> Bool
patternMatch txt =
  ((T.unpack txt !! 0) `elem` validCahrs) && not (containSpecialChars txt)

containSpecialChars :: Text -> Bool
containSpecialChars txt = any isSpecialChar (Set.fromList $ T.unpack txt)

isSpecialChar :: Char -> Bool
isSpecialChar a = Set.notMember a $ Set.fromList (validCahrs ++ ['-','_'])

validCahrs :: String
validCahrs = (['a'..'z'] ++ ['A'..'Z'] ++ ['0','1','2','3','4','5','6','7','8','9'])


-- Text optimized approach

patternMatchOptimized :: Text -> Bool
patternMatchOptimized txt =
  C.isAlphaNum (T.unpack txt !! 0) && (alphaNumSpecial txt)

alphaNumSpecial :: Text -> Bool
alphaNumSpecial txt = all (\c -> isSpecial c || C.isAlphaNum c)  (Set.fromList $ T.unpack txt)

isSpecial :: Char -> Bool
isSpecial a = a == '-' || a == '_'

-- Attoparsec approach

runParser :: Parser a -> Text -> Either String a
runParser p t = parseOnly (p <* endOfInput) t

patternMatchAtto:: Text -> Bool
patternMatchAtto txt = case runParser textParser txt of
  Left _ -> False
  Right _ -> True

textParser :: Parser Text
textParser = do
  f <- alphaNum
  ts <- many' (try alphaNumAndSpecial)
  pure $ T.pack $ f:ts

alphaNumAndSpecial :: Parser Char
alphaNumAndSpecial = try alphaNum <|> try special

alphaNum :: Parser Char
alphaNum = satisfy C.isAlphaNum

special :: Parser Char
special = satisfy special'
  where special' c = c == '-' || c == '_'

-- letterL :: Parser Char
-- letterL = satisfy isLetter
--   where isLetter c = c >= 'a' && c <= 'z'

-- letterU :: Parser Char
-- letterU = satisfy isLetter
--   where isLetter c = c >= 'A' && c <= 'Z'

