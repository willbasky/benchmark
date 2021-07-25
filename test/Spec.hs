
module Main (main) where

import Benchmarks (patternMatch, patternMatchOptimized, patternMatchAtto, patternMatchOptimized2)
import Data.Text (Text)
import Hedgehog (Gen, PropertyT, forAll, (===))
import Hedgehog.Gen (alphaNum, choice, frequency, sample, text, element)
import qualified Hedgehog.Gen as G
import Hedgehog.Range (constant)
import Test.Hspec (Spec, describe, hspec, it, shouldBe)
import Test.Hspec.Hedgehog (hedgehog)


main :: IO ()
main = hspec $ do
  compareThem
  patternMatchShould
  -- patternMatchOptimizedShould -- not correct
  patternMatchOptimizedShould2
  patternMatchAttoShould

patternMatchShould :: Spec
patternMatchShould =
  describe "patternMatch Text" $ do
    it "Success with Test 1" $ patternMatch "9002876543___1234" `shouldBe` True
    it "Success with Test 2" $ patternMatch "AAb9002876-543___1234" `shouldBe` True
    it "Success with Test 3" $ patternMatch "@-AAb9002876-543___1234" `shouldBe` False
    it "Success with Test 4" $ patternMatch "---AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 5" $ patternMatch "AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 6" $ patternMatch "AAb900-OPadff2876-543___1234" `shouldBe` True
    it "Success with Test 7" $ patternMatch "AAb900-OPadff2876-543___1234-----_______" `shouldBe` True
    it "Success with Test 8" $ patternMatch "AAb900-OPadff2876-543___1234-----_______*" `shouldBe` False
    it "Success with Test 9" $ patternMatch "900-O_Pad-_ff2-876-543___1234-----______JAULOqw" `shouldBe` True
    it "Success with Test 10" $ patternMatch "AAb-90111&80-O_Pad-_ff2-876-543___1234-----______JAUL;/\\'Oqw" `shouldBe` False
    it "Success with Test 11" $ patternMatch "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'Oqw" `shouldBe` False
    it "Success with Test 12" $ patternMatch "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'\\Oqw" `shouldBe` False
    it "Success with Test 13" $ patternMatch "AASDFGHJERTYUCFGHJTYU" `shouldBe` True
    it "Success with Test 14" $ patternMatch "12345678098765434567" `shouldBe` True
    it "Success with Test 15" $ patternMatch "awertyuijhgfdertyuioiuy" `shouldBe` True
    it "Success with Test 16" $ patternMatch "---------------------------------------" `shouldBe` False
    it "Success with Test 17" $ patternMatch "MOJOTestUPIPJ13'''(select*from(select(sleep(20)))a)'''MOJOTestUPIPJ13}}yl7z7'''/<juaa1;console.log(299792458}}]],(299792458);" `shouldBe` False
    it "Success with Test 18" $ patternMatch "++**&@#E#(#*&@#&*(*&@&*!" `shouldBe` False
    it "Success with Test 19" $ patternMatch "1F ÝÞ1Fáãæç§© ¬         F1F1F1F1F1F1        " `shouldBe` False
    it "Success with Test 20" $ patternMatch "11    AADYEJI       aasd        dfgh" `shouldBe` False
    it "Success with Test 21" $ patternMatch "11\t\t\t\t\t\t\t" `shouldBe` False
    it "Success with Test 22" $ patternMatch "asdfghΛλCyrillicЛ." `shouldBe` False
    it "Success with Test 23" $ patternMatch "asdλfgh" `shouldBe` False
    it "Success with Test 24" $ patternMatch "asd.fgh" `shouldBe` False
    it "Success with Test 25" $ patternMatch "1asdAZ00010100101-_123fgh1" `shouldBe` True
    it "Success with Test 26" $ patternMatch "1asdAZ0001α0100101-_123fgh1" `shouldBe` False
    it "Success with Test 27" $ patternMatch "1asdAZβ" `shouldBe` False
    it "Success with Test 28" $ patternMatch "1asdAZγ" `shouldBe` False
    it "Success with Test 29" $ patternMatch "1asδϵζdAZ" `shouldBe` False
    it "Success with Test 30" $ patternMatch "1asμνdAZ" `shouldBe` False
    it "Success with Test 31" $ patternMatch "ΑΒΓΔΕΘΙΛΞ" `shouldBe` False
    it "Success with Test 32" $ patternMatch "awerЫаырмuy" `shouldBe` False
    it "Success with Test 33" $ patternMatch "aweruy_Ελληνική" `shouldBe` False

-- patternMatchOptimizedShould :: Spec
-- patternMatchOptimizedShould =
--   describe "patternMatch optimized Text" $ do
--     it "Success with Test 1" $ patternMatchOptimized "9002876543___1234" `shouldBe` True
--     it "Success with Test 2" $ patternMatchOptimized "AAb9002876-543___1234" `shouldBe` True
--     it "Success with Test 3" $ patternMatchOptimized "@-AAb9002876-543___1234" `shouldBe` False
--     it "Success with Test 4" $ patternMatchOptimized "---AAb9002+876-543___1234" `shouldBe` False
--     it "Success with Test 5" $ patternMatchOptimized "AAb9002+876-543___1234" `shouldBe` False
--     it "Success with Test 6" $ patternMatchOptimized "AAb900-OPadff2876-543___1234" `shouldBe` True
--     it "Success with Test 7" $ patternMatchOptimized "AAb900-OPadff2876-543___1234-----_______" `shouldBe` True
--     it "Success with Test 8" $ patternMatchOptimized "AAb900-OPadff2876-543___1234-----_______*" `shouldBe` False
--     it "Success with Test 9" $ patternMatchOptimized "900-O_Pad-_ff2-876-543___1234-----______JAULOqw" `shouldBe` True
--     it "Success with Test 10" $ patternMatchOptimized "AAb-90111&80-O_Pad-_ff2-876-543___1234-----______JAUL;/\\'Oqw" `shouldBe` False
--     it "Success with Test 11" $ patternMatchOptimized "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'Oqw" `shouldBe` False
--     it "Success with Test 12" $ patternMatchOptimized "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'\\Oqw" `shouldBe` False
--     it "Success with Test 13" $ patternMatchOptimized "AASDFGHJERTYUCFGHJTYU" `shouldBe` True
--     it "Success with Test 14" $ patternMatchOptimized "12345678098765434567" `shouldBe` True
--     it "Success with Test 15" $ patternMatchOptimized "awertyuijhgfdertyuioiuy" `shouldBe` True
--     it "Success with Test 16" $ patternMatchOptimized "---------------------------------------" `shouldBe` False
--     it "Success with Test 17" $ patternMatchOptimized "MOJOTestUPIPJ13'''(select*from(select(sleep(20)))a)'''MOJOTestUPIPJ13}}yl7z7'''/<juaa1;console.log(299792458}}]],(299792458);" `shouldBe` False
--     it "Success with Test 18" $ patternMatchOptimized "++**&@#E#(#*&@#&*(*&@&*!" `shouldBe` False
--     it "Success with Test 19" $ patternMatchOptimized "1F ÝÞ1Fáãæç§© ¬         F1F1F1F1F1F1        " `shouldBe` False
--     it "Success with Test 20" $ patternMatchOptimized "11    AADYEJI       aasd        dfgh" `shouldBe` False
--     it "Success with Test 21" $ patternMatchOptimized "11\t\t\t\t\t\t\t" `shouldBe` False
--     it "Success with Test 22" $ patternMatchOptimized "asdfghΛλCyrillicЛ." `shouldBe` False
--     it "Success with Test 23" $ patternMatchOptimized "asdλfgh" `shouldBe` False
--     it "Success with Test 24" $ patternMatchOptimized "asd.fgh" `shouldBe` False
--     it "Success with Test 25" $ patternMatchOptimized "1asdAZ00010100101-_123fgh1" `shouldBe` True
--     it "Success with Test 26" $ patternMatchOptimized "1asdAZ0001α0100101-_123fgh1" `shouldBe` False
--     it "Success with Test 27" $ patternMatchOptimized "1asdAZβ" `shouldBe` False
--     it "Success with Test 28" $ patternMatchOptimized "1asdAZγ" `shouldBe` False
--     it "Success with Test 29" $ patternMatchOptimized "1asδϵζdAZ" `shouldBe` False
--     it "Success with Test 30" $ patternMatchOptimized "1asμνdAZ" `shouldBe` False
--     it "Success with Test 31" $ patternMatchOptimized "ΑΒΓΔΕΘΙΛΞ" `shouldBe` False
--     it "Success with Test 32" $ patternMatchOptimized "aweruy_Ελληνική" `shouldBe` False
--     it "Success with Test 33" $ patternMatchOptimized "awerЫаырмuy" `shouldBe` False

patternMatchOptimizedShould2 :: Spec
patternMatchOptimizedShould2 =
  describe "patternMatch optimized Text" $ do
    it "Success with Test 1" $ patternMatchOptimized2 "9002876543___1234" `shouldBe` True
    it "Success with Test 2" $ patternMatchOptimized2 "AAb9002876-543___1234" `shouldBe` True
    it "Success with Test 3" $ patternMatchOptimized2 "@-AAb9002876-543___1234" `shouldBe` False
    it "Success with Test 4" $ patternMatchOptimized2 "---AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 5" $ patternMatchOptimized2 "AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 6" $ patternMatchOptimized2 "AAb900-OPadff2876-543___1234" `shouldBe` True
    it "Success with Test 7" $ patternMatchOptimized2 "AAb900-OPadff2876-543___1234-----_______" `shouldBe` True
    it "Success with Test 8" $ patternMatchOptimized2 "AAb900-OPadff2876-543___1234-----_______*" `shouldBe` False
    it "Success with Test 9" $ patternMatchOptimized2 "900-O_Pad-_ff2-876-543___1234-----______JAULOqw" `shouldBe` True
    it "Success with Test 10" $ patternMatchOptimized2 "AAb-90111&80-O_Pad-_ff2-876-543___1234-----______JAUL;/\\'Oqw" `shouldBe` False
    it "Success with Test 11" $ patternMatchOptimized2 "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'Oqw" `shouldBe` False
    it "Success with Test 12" $ patternMatchOptimized2 "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'\\Oqw" `shouldBe` False
    it "Success with Test 13" $ patternMatchOptimized2 "AASDFGHJERTYUCFGHJTYU" `shouldBe` True
    it "Success with Test 14" $ patternMatchOptimized2 "12345678098765434567" `shouldBe` True
    it "Success with Test 15" $ patternMatchOptimized2 "awertyuijhgfdertyuioiuy" `shouldBe` True
    it "Success with Test 16" $ patternMatchOptimized2 "---------------------------------------" `shouldBe` False
    it "Success with Test 17" $ patternMatchOptimized2 "MOJOTestUPIPJ13'''(select*from(select(sleep(20)))a)'''MOJOTestUPIPJ13}}yl7z7'''/<juaa1;console.log(299792458}}]],(299792458);" `shouldBe` False
    it "Success with Test 18" $ patternMatchOptimized2 "++**&@#E#(#*&@#&*(*&@&*!" `shouldBe` False
    it "Success with Test 19" $ patternMatchOptimized2 "1F ÝÞ1Fáãæç§© ¬         F1F1F1F1F1F1        " `shouldBe` False
    it "Success with Test 20" $ patternMatchOptimized2 "11    AADYEJI       aasd        dfgh" `shouldBe` False
    it "Success with Test 21" $ patternMatchOptimized2 "11\t\t\t\t\t\t\t" `shouldBe` False
    it "Success with Test 22" $ patternMatchOptimized2 "asdfghΛλCyrillicЛ." `shouldBe` False
    it "Success with Test 23" $ patternMatchOptimized2 "asdλfgh" `shouldBe` False
    it "Success with Test 24" $ patternMatchOptimized2 "asd.fgh" `shouldBe` False
    it "Success with Test 25" $ patternMatchOptimized2 "1asdAZ00010100101-_123fgh1" `shouldBe` True
    it "Success with Test 26" $ patternMatchOptimized2 "1asdAZ0001α0100101-_123fgh1" `shouldBe` False
    it "Success with Test 27" $ patternMatchOptimized2 "1asdAZβ" `shouldBe` False
    it "Success with Test 28" $ patternMatchOptimized2 "1asdAZγ" `shouldBe` False
    it "Success with Test 29" $ patternMatchOptimized2 "1asδϵζdAZ" `shouldBe` False
    it "Success with Test 30" $ patternMatchOptimized2 "1asμνdAZ" `shouldBe` False
    it "Success with Test 31" $ patternMatchOptimized2 "ΑΒΓΔΕΘΙΛΞ" `shouldBe` False
    it "Success with Test 32" $ patternMatchOptimized2 "aweruy_Ελληνική" `shouldBe` False
    it "Success with Test 33" $ patternMatchOptimized2 "awerЫаырмuy" `shouldBe` False

patternMatchAttoShould :: Spec
patternMatchAttoShould =
  describe "patternMatchAtto Atto" $ do
    it "Success with Test 1" $ patternMatchAtto "9002876543___1234" `shouldBe` True
    it "Success with Test 2" $ patternMatchAtto "AAb9002876-543___1234" `shouldBe` True
    it "Success with Test 3" $ patternMatchAtto "@-AAb9002876-543___1234" `shouldBe` False
    it "Success with Test 4" $ patternMatchAtto "---AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 5" $ patternMatchAtto "AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 6" $ patternMatchAtto "AAb900-OPadff2876-543___1234" `shouldBe` True
    it "Success with Test 7" $ patternMatchAtto "AAb900-OPadff2876-543___1234-----_______" `shouldBe` True
    it "Success with Test 8" $ patternMatchAtto "AAb900-OPadff2876-543___1234-----_______*" `shouldBe` False
    it "Success with Test 9" $ patternMatchAtto "900-O_Pad-_ff2-876-543___1234-----______JAULOqw" `shouldBe` True
    it "Success with Test 10" $ patternMatchAtto "AAb-90111&80-O_Pad-_ff2-876-543___1234-----______JAUL;/\\'Oqw" `shouldBe` False
    it "Success with Test 11" $ patternMatchAtto "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'Oqw" `shouldBe` False
    it "Success with Test 12" $ patternMatchAtto "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'\\Oqw" `shouldBe` False
    it "Success with Test 13" $ patternMatchAtto "AASDFGHJERTYUCFGHJTYU" `shouldBe` True
    it "Success with Test 14" $ patternMatchAtto "12345678098765434567" `shouldBe` True
    it "Success with Test 15" $ patternMatchAtto "awertyuijhgfdertyuioiuy" `shouldBe` True
    it "Success with Test 16" $ patternMatchAtto "---------------------------------------" `shouldBe` False
    it "Success with Test 17" $ patternMatchAtto "MOJOTestUPIPJ13'''(select*from(select(sleep(20)))a)'''MOJOTestUPIPJ13}}yl7z7'''/<juaa1;console.log(299792458}}]],(299792458);" `shouldBe` False
    it "Success with Test 18" $ patternMatchAtto "++**&@#E#(#*&@#&*(*&@&*!" `shouldBe` False
    it "Success with Test 19" $ patternMatchAtto "1F ÝÞ1Fáãæç§© ¬         F1F1F1F1F1F1        " `shouldBe` False
    it "Success with Test 20" $ patternMatchAtto "11    AADYEJI       aasd        dfgh" `shouldBe` False
    it "Success with Test 21" $ patternMatchAtto "11\t\t\t\t\t\t\t" `shouldBe` False
    it "Success with Test 22" $ patternMatchAtto "asdfghΛλCyrillicЛ." `shouldBe` False
    it "Success with Test 23" $ patternMatchAtto "asdλfgh" `shouldBe` False
    it "Success with Test 24" $ patternMatchAtto "asd.fgh" `shouldBe` False
    it "Success with Test 25" $ patternMatchAtto "1asdAZ00010100101-_123fgh1" `shouldBe` True
    it "Success with Test 26" $ patternMatchAtto "1asdAZ0001α0100101-_123fgh1" `shouldBe` False
    it "Success with Test 27" $ patternMatchAtto "1asdAZβ" `shouldBe` False
    it "Success with Test 28" $ patternMatchAtto "1asdAZγ" `shouldBe` False
    it "Success with Test 29" $ patternMatchAtto "1asδϵζdAZ" `shouldBe` False
    it "Success with Test 30" $ patternMatchAtto "1asμνdAZ" `shouldBe` False
    it "Success with Test 31" $ patternMatchAtto "ΑΒΓΔΕΘΙΛΞ" `shouldBe` False
    it "Success with Test 32" $ patternMatchAtto "awerЫаырмuy" `shouldBe` False
    it "Success with Test 33" $ patternMatchAtto "aweruy_Ελληνική" `shouldBe` False

compareThem :: Spec
compareThem = do
  describe "Compare Text Atto parsers" $ do
    it "Short text" shortCompare
    it "Long text" longCompare
    it "Very long text" veryLongCompare

invalidChar :: Gen Char
invalidChar = element "Εληνική_ΑΒΓΔΕΘΙΛΞ_йцукенгшщф_ÝÞ1Fáãæç§©_+*&@(#!"

validChar :: Gen Char
validChar = frequency [(90, alphaNum), (5, G.constant '_'), (5, G.constant '-')]

withInvalidChar :: Gen Char
withInvalidChar = frequency [(50, alphaNum), (50, invalidChar), (5, G.constant '_'), (5, G.constant '-')]

shortText :: Gen Text
shortText = text (constant 1 10) $ choice [validChar, withInvalidChar]

-- run 'sample longText' to check
longText :: Gen Text
longText = text (constant 11 100) $ choice [validChar, withInvalidChar]

veryLongText :: Gen Text
veryLongText = text (constant 101 1000) $ choice [validChar, withInvalidChar]

shortCompare :: PropertyT IO ()
shortCompare = hedgehog $ do
  short <- forAll shortText
  patternMatch short === patternMatchAtto short
  patternMatch short === patternMatchOptimized2 short
  patternMatchAtto short === patternMatchOptimized2 short
  -- patternMatchOptimized short === patternMatchAtto short
  -- patternMatch short === patternMatchOptimized short
  -- patternMatchOptimized short === patternMatchOptimized2 short

longCompare :: PropertyT IO ()
longCompare = hedgehog $ do
  short <- forAll longText
  patternMatch short === patternMatchAtto short
  patternMatch short === patternMatchOptimized2 short
  patternMatchAtto short === patternMatchOptimized2 short
  -- patternMatchOptimized short === patternMatchAtto short
  -- patternMatch short === patternMatchOptimized short
  -- patternMatchOptimized short === patternMatchOptimized2 short

veryLongCompare :: PropertyT IO ()
veryLongCompare = hedgehog $ do
  short <- forAll veryLongText
  patternMatch short === patternMatchAtto short
  patternMatch short === patternMatchOptimized2 short
  patternMatchAtto short === patternMatchOptimized2 short
  -- patternMatchOptimized short === patternMatchAtto short
  -- patternMatch short === patternMatchOptimized short
  -- patternMatchOptimized short === patternMatchOptimized2 short
