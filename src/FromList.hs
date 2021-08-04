module FromList
    (
      alphaNumSpecial
    , alphaNumSpecialSet
    ) where

import qualified Data.Char as C
import qualified Data.Set as Set
import Data.Text (Text)
import qualified Data.Text as T

alphaNumSpecial :: Text -> Bool
alphaNumSpecial txt = T.all (\c -> isSpecial c || isAlphaNum c) txt

alphaNumSpecialSet :: Text -> Bool
alphaNumSpecialSet txt =
  all (\c -> isSpecial c || isAlphaNum c) (Set.fromList $ T.unpack txt)

isAlphaNum :: Char -> Bool
isAlphaNum a = (a >= 'a' && a <= 'z') || (a >= 'A' && a <= 'Z') || C.isDigit a

isSpecial :: Char -> Bool
isSpecial a = a == '-' || a == '_'
