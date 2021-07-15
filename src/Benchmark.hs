

module Benchmark
    ( patternMatch
    , patternMatchAtto
    ) where

-- import qualified Data.Char as C
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



-- Attoparsec
patternMatchAtto:: Text -> Bool
patternMatchAtto txt = case parseOnly (textParser <* endOfInput) txt of
  Left _ -> False
  Right _ -> True

textParser :: Parser Text
textParser = do
  f <- validCahrsParser
  ts <- many1 (try validCharsAndSpecial)
  pure $ T.pack $ f:ts

validCahrsParser :: Parser Char
validCahrsParser = try digit <|> try letterL <|> try letterU

validCharsAndSpecial :: Parser Char
validCharsAndSpecial = try validCahrsParser <|> try special

letterL :: Parser Char
letterL = satisfy isLetter
  where isLetter c = c >= 'a' && c <= 'z'

letterU :: Parser Char
letterU = satisfy isLetter
  where isLetter c = c >= 'A' && c <= 'Z'

special :: Parser Char
special = satisfy special
  where special c = c == '-' || c == '_'

