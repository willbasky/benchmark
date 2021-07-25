
module Main (main) where

import ValidateInput (validateInput, validateInputOptimized, validateInputAtto, validateInputOptimized2)
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
  validateInputShould
  -- validateInputOptimizedShould -- not correct
  validateInputOptimizedShould2
  validateInputAttoShould

validateInputShould :: Spec
validateInputShould =
  describe "validateInput Text" $ do
    it "Success with Test 1" $ validateInput "9002876543___1234" `shouldBe` True
    it "Success with Test 2" $ validateInput "AAb9002876-543___1234" `shouldBe` True
    it "Success with Test 3" $ validateInput "@-AAb9002876-543___1234" `shouldBe` False
    it "Success with Test 4" $ validateInput "---AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 5" $ validateInput "AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 6" $ validateInput "AAb900-OPadff2876-543___1234" `shouldBe` True
    it "Success with Test 7" $ validateInput "AAb900-OPadff2876-543___1234-----_______" `shouldBe` True
    it "Success with Test 8" $ validateInput "AAb900-OPadff2876-543___1234-----_______*" `shouldBe` False
    it "Success with Test 9" $ validateInput "900-O_Pad-_ff2-876-543___1234-----______JAULOqw" `shouldBe` True
    it "Success with Test 10" $ validateInput "AAb-90111&80-O_Pad-_ff2-876-543___1234-----______JAUL;/\\'Oqw" `shouldBe` False
    it "Success with Test 11" $ validateInput "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'Oqw" `shouldBe` False
    it "Success with Test 12" $ validateInput "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'\\Oqw" `shouldBe` False
    it "Success with Test 13" $ validateInput "AASDFGHJERTYUCFGHJTYU" `shouldBe` True
    it "Success with Test 14" $ validateInput "12345678098765434567" `shouldBe` True
    it "Success with Test 15" $ validateInput "awertyuijhgfdertyuioiuy" `shouldBe` True
    it "Success with Test 16" $ validateInput "---------------------------------------" `shouldBe` False
    it "Success with Test 17" $ validateInput "MOJOTestUPIPJ13'''(select*from(select(sleep(20)))a)'''MOJOTestUPIPJ13}}yl7z7'''/<juaa1;console.log(299792458}}]],(299792458);" `shouldBe` False
    it "Success with Test 18" $ validateInput "++**&@#E#(#*&@#&*(*&@&*!" `shouldBe` False
    it "Success with Test 19" $ validateInput "1F ÝÞ1Fáãæç§© ¬         F1F1F1F1F1F1        " `shouldBe` False
    it "Success with Test 20" $ validateInput "11    AADYEJI       aasd        dfgh" `shouldBe` False
    it "Success with Test 21" $ validateInput "11\t\t\t\t\t\t\t" `shouldBe` False
    it "Success with Test 22" $ validateInput "asdfghΛλCyrillicЛ." `shouldBe` False
    it "Success with Test 23" $ validateInput "asdλfgh" `shouldBe` False
    it "Success with Test 24" $ validateInput "asd.fgh" `shouldBe` False
    it "Success with Test 25" $ validateInput "1asdAZ00010100101-_123fgh1" `shouldBe` True
    it "Success with Test 26" $ validateInput "1asdAZ0001α0100101-_123fgh1" `shouldBe` False
    it "Success with Test 27" $ validateInput "1asdAZβ" `shouldBe` False
    it "Success with Test 28" $ validateInput "1asdAZγ" `shouldBe` False
    it "Success with Test 29" $ validateInput "1asδϵζdAZ" `shouldBe` False
    it "Success with Test 30" $ validateInput "1asμνdAZ" `shouldBe` False
    it "Success with Test 31" $ validateInput "ΑΒΓΔΕΘΙΛΞ" `shouldBe` False
    it "Success with Test 32" $ validateInput "awerЫаырмuy" `shouldBe` False
    it "Success with Test 33" $ validateInput "aweruy_Ελληνική" `shouldBe` False

-- validateInputOptimizedShould :: Spec
-- validateInputOptimizedShould =
--   describe "validateInput optimized Text" $ do
--     it "Success with Test 1" $ validateInputOptimized "9002876543___1234" `shouldBe` True
--     it "Success with Test 2" $ validateInputOptimized "AAb9002876-543___1234" `shouldBe` True
--     it "Success with Test 3" $ validateInputOptimized "@-AAb9002876-543___1234" `shouldBe` False
--     it "Success with Test 4" $ validateInputOptimized "---AAb9002+876-543___1234" `shouldBe` False
--     it "Success with Test 5" $ validateInputOptimized "AAb9002+876-543___1234" `shouldBe` False
--     it "Success with Test 6" $ validateInputOptimized "AAb900-OPadff2876-543___1234" `shouldBe` True
--     it "Success with Test 7" $ validateInputOptimized "AAb900-OPadff2876-543___1234-----_______" `shouldBe` True
--     it "Success with Test 8" $ validateInputOptimized "AAb900-OPadff2876-543___1234-----_______*" `shouldBe` False
--     it "Success with Test 9" $ validateInputOptimized "900-O_Pad-_ff2-876-543___1234-----______JAULOqw" `shouldBe` True
--     it "Success with Test 10" $ validateInputOptimized "AAb-90111&80-O_Pad-_ff2-876-543___1234-----______JAUL;/\\'Oqw" `shouldBe` False
--     it "Success with Test 11" $ validateInputOptimized "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'Oqw" `shouldBe` False
--     it "Success with Test 12" $ validateInputOptimized "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'\\Oqw" `shouldBe` False
--     it "Success with Test 13" $ validateInputOptimized "AASDFGHJERTYUCFGHJTYU" `shouldBe` True
--     it "Success with Test 14" $ validateInputOptimized "12345678098765434567" `shouldBe` True
--     it "Success with Test 15" $ validateInputOptimized "awertyuijhgfdertyuioiuy" `shouldBe` True
--     it "Success with Test 16" $ validateInputOptimized "---------------------------------------" `shouldBe` False
--     it "Success with Test 17" $ validateInputOptimized "MOJOTestUPIPJ13'''(select*from(select(sleep(20)))a)'''MOJOTestUPIPJ13}}yl7z7'''/<juaa1;console.log(299792458}}]],(299792458);" `shouldBe` False
--     it "Success with Test 18" $ validateInputOptimized "++**&@#E#(#*&@#&*(*&@&*!" `shouldBe` False
--     it "Success with Test 19" $ validateInputOptimized "1F ÝÞ1Fáãæç§© ¬         F1F1F1F1F1F1        " `shouldBe` False
--     it "Success with Test 20" $ validateInputOptimized "11    AADYEJI       aasd        dfgh" `shouldBe` False
--     it "Success with Test 21" $ validateInputOptimized "11\t\t\t\t\t\t\t" `shouldBe` False
--     it "Success with Test 22" $ validateInputOptimized "asdfghΛλCyrillicЛ." `shouldBe` False
--     it "Success with Test 23" $ validateInputOptimized "asdλfgh" `shouldBe` False
--     it "Success with Test 24" $ validateInputOptimized "asd.fgh" `shouldBe` False
--     it "Success with Test 25" $ validateInputOptimized "1asdAZ00010100101-_123fgh1" `shouldBe` True
--     it "Success with Test 26" $ validateInputOptimized "1asdAZ0001α0100101-_123fgh1" `shouldBe` False
--     it "Success with Test 27" $ validateInputOptimized "1asdAZβ" `shouldBe` False
--     it "Success with Test 28" $ validateInputOptimized "1asdAZγ" `shouldBe` False
--     it "Success with Test 29" $ validateInputOptimized "1asδϵζdAZ" `shouldBe` False
--     it "Success with Test 30" $ validateInputOptimized "1asμνdAZ" `shouldBe` False
--     it "Success with Test 31" $ validateInputOptimized "ΑΒΓΔΕΘΙΛΞ" `shouldBe` False
--     it "Success with Test 32" $ validateInputOptimized "aweruy_Ελληνική" `shouldBe` False
--     it "Success with Test 33" $ validateInputOptimized "awerЫаырмuy" `shouldBe` False

validateInputOptimizedShould2 :: Spec
validateInputOptimizedShould2 =
  describe "validateInput optimized Text" $ do
    it "Success with Test 1" $ validateInputOptimized2 "9002876543___1234" `shouldBe` True
    it "Success with Test 2" $ validateInputOptimized2 "AAb9002876-543___1234" `shouldBe` True
    it "Success with Test 3" $ validateInputOptimized2 "@-AAb9002876-543___1234" `shouldBe` False
    it "Success with Test 4" $ validateInputOptimized2 "---AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 5" $ validateInputOptimized2 "AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 6" $ validateInputOptimized2 "AAb900-OPadff2876-543___1234" `shouldBe` True
    it "Success with Test 7" $ validateInputOptimized2 "AAb900-OPadff2876-543___1234-----_______" `shouldBe` True
    it "Success with Test 8" $ validateInputOptimized2 "AAb900-OPadff2876-543___1234-----_______*" `shouldBe` False
    it "Success with Test 9" $ validateInputOptimized2 "900-O_Pad-_ff2-876-543___1234-----______JAULOqw" `shouldBe` True
    it "Success with Test 10" $ validateInputOptimized2 "AAb-90111&80-O_Pad-_ff2-876-543___1234-----______JAUL;/\\'Oqw" `shouldBe` False
    it "Success with Test 11" $ validateInputOptimized2 "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'Oqw" `shouldBe` False
    it "Success with Test 12" $ validateInputOptimized2 "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'\\Oqw" `shouldBe` False
    it "Success with Test 13" $ validateInputOptimized2 "AASDFGHJERTYUCFGHJTYU" `shouldBe` True
    it "Success with Test 14" $ validateInputOptimized2 "12345678098765434567" `shouldBe` True
    it "Success with Test 15" $ validateInputOptimized2 "awertyuijhgfdertyuioiuy" `shouldBe` True
    it "Success with Test 16" $ validateInputOptimized2 "---------------------------------------" `shouldBe` False
    it "Success with Test 17" $ validateInputOptimized2 "MOJOTestUPIPJ13'''(select*from(select(sleep(20)))a)'''MOJOTestUPIPJ13}}yl7z7'''/<juaa1;console.log(299792458}}]],(299792458);" `shouldBe` False
    it "Success with Test 18" $ validateInputOptimized2 "++**&@#E#(#*&@#&*(*&@&*!" `shouldBe` False
    it "Success with Test 19" $ validateInputOptimized2 "1F ÝÞ1Fáãæç§© ¬         F1F1F1F1F1F1        " `shouldBe` False
    it "Success with Test 20" $ validateInputOptimized2 "11    AADYEJI       aasd        dfgh" `shouldBe` False
    it "Success with Test 21" $ validateInputOptimized2 "11\t\t\t\t\t\t\t" `shouldBe` False
    it "Success with Test 22" $ validateInputOptimized2 "asdfghΛλCyrillicЛ." `shouldBe` False
    it "Success with Test 23" $ validateInputOptimized2 "asdλfgh" `shouldBe` False
    it "Success with Test 24" $ validateInputOptimized2 "asd.fgh" `shouldBe` False
    it "Success with Test 25" $ validateInputOptimized2 "1asdAZ00010100101-_123fgh1" `shouldBe` True
    it "Success with Test 26" $ validateInputOptimized2 "1asdAZ0001α0100101-_123fgh1" `shouldBe` False
    it "Success with Test 27" $ validateInputOptimized2 "1asdAZβ" `shouldBe` False
    it "Success with Test 28" $ validateInputOptimized2 "1asdAZγ" `shouldBe` False
    it "Success with Test 29" $ validateInputOptimized2 "1asδϵζdAZ" `shouldBe` False
    it "Success with Test 30" $ validateInputOptimized2 "1asμνdAZ" `shouldBe` False
    it "Success with Test 31" $ validateInputOptimized2 "ΑΒΓΔΕΘΙΛΞ" `shouldBe` False
    it "Success with Test 32" $ validateInputOptimized2 "aweruy_Ελληνική" `shouldBe` False
    it "Success with Test 33" $ validateInputOptimized2 "awerЫаырмuy" `shouldBe` False

validateInputAttoShould :: Spec
validateInputAttoShould =
  describe "validateInputAtto Atto" $ do
    it "Success with Test 1" $ validateInputAtto "9002876543___1234" `shouldBe` True
    it "Success with Test 2" $ validateInputAtto "AAb9002876-543___1234" `shouldBe` True
    it "Success with Test 3" $ validateInputAtto "@-AAb9002876-543___1234" `shouldBe` False
    it "Success with Test 4" $ validateInputAtto "---AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 5" $ validateInputAtto "AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 6" $ validateInputAtto "AAb900-OPadff2876-543___1234" `shouldBe` True
    it "Success with Test 7" $ validateInputAtto "AAb900-OPadff2876-543___1234-----_______" `shouldBe` True
    it "Success with Test 8" $ validateInputAtto "AAb900-OPadff2876-543___1234-----_______*" `shouldBe` False
    it "Success with Test 9" $ validateInputAtto "900-O_Pad-_ff2-876-543___1234-----______JAULOqw" `shouldBe` True
    it "Success with Test 10" $ validateInputAtto "AAb-90111&80-O_Pad-_ff2-876-543___1234-----______JAUL;/\\'Oqw" `shouldBe` False
    it "Success with Test 11" $ validateInputAtto "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'Oqw" `shouldBe` False
    it "Success with Test 12" $ validateInputAtto "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'\\Oqw" `shouldBe` False
    it "Success with Test 13" $ validateInputAtto "AASDFGHJERTYUCFGHJTYU" `shouldBe` True
    it "Success with Test 14" $ validateInputAtto "12345678098765434567" `shouldBe` True
    it "Success with Test 15" $ validateInputAtto "awertyuijhgfdertyuioiuy" `shouldBe` True
    it "Success with Test 16" $ validateInputAtto "---------------------------------------" `shouldBe` False
    it "Success with Test 17" $ validateInputAtto "MOJOTestUPIPJ13'''(select*from(select(sleep(20)))a)'''MOJOTestUPIPJ13}}yl7z7'''/<juaa1;console.log(299792458}}]],(299792458);" `shouldBe` False
    it "Success with Test 18" $ validateInputAtto "++**&@#E#(#*&@#&*(*&@&*!" `shouldBe` False
    it "Success with Test 19" $ validateInputAtto "1F ÝÞ1Fáãæç§© ¬         F1F1F1F1F1F1        " `shouldBe` False
    it "Success with Test 20" $ validateInputAtto "11    AADYEJI       aasd        dfgh" `shouldBe` False
    it "Success with Test 21" $ validateInputAtto "11\t\t\t\t\t\t\t" `shouldBe` False
    it "Success with Test 22" $ validateInputAtto "asdfghΛλCyrillicЛ." `shouldBe` False
    it "Success with Test 23" $ validateInputAtto "asdλfgh" `shouldBe` False
    it "Success with Test 24" $ validateInputAtto "asd.fgh" `shouldBe` False
    it "Success with Test 25" $ validateInputAtto "1asdAZ00010100101-_123fgh1" `shouldBe` True
    it "Success with Test 26" $ validateInputAtto "1asdAZ0001α0100101-_123fgh1" `shouldBe` False
    it "Success with Test 27" $ validateInputAtto "1asdAZβ" `shouldBe` False
    it "Success with Test 28" $ validateInputAtto "1asdAZγ" `shouldBe` False
    it "Success with Test 29" $ validateInputAtto "1asδϵζdAZ" `shouldBe` False
    it "Success with Test 30" $ validateInputAtto "1asμνdAZ" `shouldBe` False
    it "Success with Test 31" $ validateInputAtto "ΑΒΓΔΕΘΙΛΞ" `shouldBe` False
    it "Success with Test 32" $ validateInputAtto "awerЫаырмuy" `shouldBe` False
    it "Success with Test 33" $ validateInputAtto "aweruy_Ελληνική" `shouldBe` False

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
  validateInput short === validateInputAtto short
  validateInput short === validateInputOptimized2 short
  validateInputAtto short === validateInputOptimized2 short
  -- validateInputOptimized short === validateInputAtto short
  -- validateInput short === validateInputOptimized short
  -- validateInputOptimized short === validateInputOptimized2 short

longCompare :: PropertyT IO ()
longCompare = hedgehog $ do
  short <- forAll longText
  validateInput short === validateInputAtto short
  validateInput short === validateInputOptimized2 short
  validateInputAtto short === validateInputOptimized2 short
  -- validateInputOptimized short === validateInputAtto short
  -- validateInput short === validateInputOptimized short
  -- validateInputOptimized short === validateInputOptimized2 short

veryLongCompare :: PropertyT IO ()
veryLongCompare = hedgehog $ do
  short <- forAll veryLongText
  validateInput short === validateInputAtto short
  validateInput short === validateInputOptimized2 short
  validateInputAtto short === validateInputOptimized2 short
  -- validateInputOptimized short === validateInputAtto short
  -- validateInput short === validateInputOptimized short
  -- validateInputOptimized short === validateInputOptimized2 short
