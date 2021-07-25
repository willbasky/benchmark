
module Main (main) where

import Data.Text (Text)
import Hedgehog (Gen, PropertyT, forAll, (===))
import Hedgehog.Gen (alphaNum, choice, element, frequency, sample, text)
import qualified Hedgehog.Gen as G
import Hedgehog.Range (constant)
import Test.Hspec (Spec, describe, hspec, it, shouldBe)
import Test.Hspec.Hedgehog (hedgehog)
import ValidateInput (validateInput, validateInputAtto, validateInputOptimized2, validateInputRegexPcre, validateInputRegexPosix)


main :: IO ()
main = hspec $ do
  compareThem
  validateInputElemSpec
  validateInputOptimized2Spec
  validateInputAttoSpec
  validateInputRegexPcreSpec
  validateInputRegexPosixSpec

validateInputElemSpec :: Spec
validateInputElemSpec =
  describe "Elem Text" $ do
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

validateInputOptimized2Spec :: Spec
validateInputOptimized2Spec =
  describe "Optimized Text" $ do
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

validateInputAttoSpec :: Spec
validateInputAttoSpec =
  describe "Attoparsec" $ do
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

validateInputRegexPcreSpec :: Spec
validateInputRegexPcreSpec =
  describe "Regex pcre" $ do
    it "Success with Test 1" $ validateInputRegexPcre "9002876543___1234" `shouldBe` True
    it "Success with Test 2" $ validateInputRegexPcre "AAb9002876-543___1234" `shouldBe` True
    it "Success with Test 3" $ validateInputRegexPcre "@-AAb9002876-543___1234" `shouldBe` False
    it "Success with Test 4" $ validateInputRegexPcre "---AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 5" $ validateInputRegexPcre "AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 6" $ validateInputRegexPcre "AAb900-OPadff2876-543___1234" `shouldBe` True
    it "Success with Test 7" $ validateInputRegexPcre "AAb900-OPadff2876-543___1234-----_______" `shouldBe` True
    it "Success with Test 8" $ validateInputRegexPcre "AAb900-OPadff2876-543___1234-----_______*" `shouldBe` False
    it "Success with Test 9" $ validateInputRegexPcre "900-O_Pad-_ff2-876-543___1234-----______JAULOqw" `shouldBe` True
    it "Success with Test 10" $ validateInputRegexPcre "AAb-90111&80-O_Pad-_ff2-876-543___1234-----______JAUL;/\\'Oqw" `shouldBe` False
    it "Success with Test 11" $ validateInputRegexPcre "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'Oqw" `shouldBe` False
    it "Success with Test 12" $ validateInputRegexPcre "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'\\Oqw" `shouldBe` False
    it "Success with Test 13" $ validateInputRegexPcre "AASDFGHJERTYUCFGHJTYU" `shouldBe` True
    it "Success with Test 14" $ validateInputRegexPcre "12345678098765434567" `shouldBe` True
    it "Success with Test 15" $ validateInputRegexPcre "awertyuijhgfdertyuioiuy" `shouldBe` True
    it "Success with Test 16" $ validateInputRegexPcre "---------------------------------------" `shouldBe` False
    it "Success with Test 17" $ validateInputRegexPcre "MOJOTestUPIPJ13'''(select*from(select(sleep(20)))a)'''MOJOTestUPIPJ13}}yl7z7'''/<juaa1;console.log(299792458}}]],(299792458);" `shouldBe` False
    it "Success with Test 18" $ validateInputRegexPcre "++**&@#E#(#*&@#&*(*&@&*!" `shouldBe` False
    it "Success with Test 19" $ validateInputRegexPcre "1F ÝÞ1Fáãæç§© ¬         F1F1F1F1F1F1        " `shouldBe` False
    it "Success with Test 20" $ validateInputRegexPcre "11    AADYEJI       aasd        dfgh" `shouldBe` False
    it "Success with Test 21" $ validateInputRegexPcre "11\t\t\t\t\t\t\t" `shouldBe` False
    it "Success with Test 22" $ validateInputRegexPcre "asdfghΛλCyrillicЛ." `shouldBe` False
    it "Success with Test 23" $ validateInputRegexPcre "asdλfgh" `shouldBe` False
    it "Success with Test 24" $ validateInputRegexPcre "asd.fgh" `shouldBe` False
    it "Success with Test 25" $ validateInputRegexPcre "1asdAZ00010100101-_123fgh1" `shouldBe` True
    it "Success with Test 26" $ validateInputRegexPcre "1asdAZ0001α0100101-_123fgh1" `shouldBe` False
    it "Success with Test 27" $ validateInputRegexPcre "1asdAZβ" `shouldBe` False
    it "Success with Test 28" $ validateInputRegexPcre "1asdAZγ" `shouldBe` False
    it "Success with Test 29" $ validateInputRegexPcre "1asδϵζdAZ" `shouldBe` False
    it "Success with Test 30" $ validateInputRegexPcre "1asμνdAZ" `shouldBe` False
    it "Success with Test 31" $ validateInputRegexPcre "ΑΒΓΔΕΘΙΛΞ" `shouldBe` False
    it "Success with Test 32" $ validateInputRegexPcre "awerЫаырмuy" `shouldBe` False
    it "Success with Test 33" $ validateInputRegexPcre "aweruy_Ελληνική" `shouldBe` False

validateInputRegexPosixSpec :: Spec
validateInputRegexPosixSpec =
  describe "Regex posix" $ do
    it "Success with Test 1" $ validateInputRegexPosix "9002876543___1234" `shouldBe` True
    it "Success with Test 2" $ validateInputRegexPosix "AAb9002876-543___1234" `shouldBe` True
    it "Success with Test 3" $ validateInputRegexPosix "@-AAb9002876-543___1234" `shouldBe` False
    it "Success with Test 4" $ validateInputRegexPosix "---AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 5" $ validateInputRegexPosix "AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 6" $ validateInputRegexPosix "AAb900-OPadff2876-543___1234" `shouldBe` True
    it "Success with Test 7" $ validateInputRegexPosix "AAb900-OPadff2876-543___1234-----_______" `shouldBe` True
    it "Success with Test 8" $ validateInputRegexPosix "AAb900-OPadff2876-543___1234-----_______*" `shouldBe` False
    it "Success with Test 9" $ validateInputRegexPosix "900-O_Pad-_ff2-876-543___1234-----______JAULOqw" `shouldBe` True
    it "Success with Test 10" $ validateInputRegexPosix "AAb-90111&80-O_Pad-_ff2-876-543___1234-----______JAUL;/\\'Oqw" `shouldBe` False
    it "Success with Test 11" $ validateInputRegexPosix "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'Oqw" `shouldBe` False
    it "Success with Test 12" $ validateInputRegexPosix "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'\\Oqw" `shouldBe` False
    it "Success with Test 13" $ validateInputRegexPosix "AASDFGHJERTYUCFGHJTYU" `shouldBe` True
    it "Success with Test 14" $ validateInputRegexPosix "12345678098765434567" `shouldBe` True
    it "Success with Test 15" $ validateInputRegexPosix "awertyuijhgfdertyuioiuy" `shouldBe` True
    it "Success with Test 16" $ validateInputRegexPosix "---------------------------------------" `shouldBe` False
    it "Success with Test 17" $ validateInputRegexPosix "MOJOTestUPIPJ13'''(select*from(select(sleep(20)))a)'''MOJOTestUPIPJ13}}yl7z7'''/<juaa1;console.log(299792458}}]],(299792458);" `shouldBe` False
    it "Success with Test 18" $ validateInputRegexPosix "++**&@#E#(#*&@#&*(*&@&*!" `shouldBe` False
    it "Success with Test 19" $ validateInputRegexPosix "1F ÝÞ1Fáãæç§© ¬         F1F1F1F1F1F1        " `shouldBe` False
    it "Success with Test 20" $ validateInputRegexPosix "11    AADYEJI       aasd        dfgh" `shouldBe` False
    it "Success with Test 21" $ validateInputRegexPosix "11\t\t\t\t\t\t\t" `shouldBe` False
    it "Success with Test 22" $ validateInputRegexPosix "asdfghΛλCyrillicЛ." `shouldBe` False
    it "Success with Test 23" $ validateInputRegexPosix "asdλfgh" `shouldBe` False
    it "Success with Test 24" $ validateInputRegexPosix "asd.fgh" `shouldBe` False
    it "Success with Test 25" $ validateInputRegexPosix "1asdAZ00010100101-_123fgh1" `shouldBe` True
    it "Success with Test 26" $ validateInputRegexPosix "1asdAZ0001α0100101-_123fgh1" `shouldBe` False
    it "Success with Test 27" $ validateInputRegexPosix "1asdAZβ" `shouldBe` False
    it "Success with Test 28" $ validateInputRegexPosix "1asdAZγ" `shouldBe` False
    it "Success with Test 29" $ validateInputRegexPosix "1asδϵζdAZ" `shouldBe` False
    it "Success with Test 30" $ validateInputRegexPosix "1asμνdAZ" `shouldBe` False
    it "Success with Test 31" $ validateInputRegexPosix "ΑΒΓΔΕΘΙΛΞ" `shouldBe` False
    it "Success with Test 32" $ validateInputRegexPosix "awerЫаырмuy" `shouldBe` False
    it "Success with Test 33" $ validateInputRegexPosix "aweruy_Ελληνική" `shouldBe` False

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
