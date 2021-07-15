

module Benchmark
    ( patternMatch
    ) where

import qualified Data.Char as C
import qualified Data.Set as Set
import Data.Text (Text)
import qualified Data.Text as T


-- Text approach
patternMatch :: Text -> Bool
patternMatch txt =
  ((T.unpack txt !! 0) `elem` allowedSymbols) && not (containSpecialChars txt)

containSpecialChars :: Text -> Bool
containSpecialChars txt = any isSpecialChar (Set.fromList $ T.unpack txt)

isSpecialChar :: Char -> Bool
isSpecialChar a = Set.notMember a $ Set.fromList (allowedSymbols ++ ['-','_'])

allowedSymbols :: String
allowedSymbols = (['a'..'z'] ++ ['A'..'Z'] ++ ['0','1','2','3','4','5','6','7','8','9'])
