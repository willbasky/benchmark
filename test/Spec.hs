-- {-# LANGUAGE BlockArguments #-}

module Main (main) where

import Benchmark (patternMatch, patternMatchOptimized, patternMatchAtto)
import Data.Text (Text)
import Hedgehog (Gen, PropertyT, forAll, (===))
import Hedgehog.Gen (alphaNum, text, frequency, sample)
import qualified Hedgehog.Gen as G
import Hedgehog.Range (constant)
import Test.Hspec (Spec, describe, hspec, it, shouldBe)
import Test.Hspec.Hedgehog (hedgehog)


main :: IO ()
main = hspec $ do
  patternMatchShould
  patternMatchOptimizedShould
  patternMatchAttoShould
  compareThem

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

patternMatchOptimizedShould :: Spec
patternMatchOptimizedShould =
  describe "patternMatch optimized Text" $ do
    it "Success with Test 1" $ patternMatchOptimized "9002876543___1234" `shouldBe` True
    it "Success with Test 2" $ patternMatchOptimized "AAb9002876-543___1234" `shouldBe` True
    it "Success with Test 3" $ patternMatchOptimized "@-AAb9002876-543___1234" `shouldBe` False
    it "Success with Test 4" $ patternMatchOptimized "---AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 5" $ patternMatchOptimized "AAb9002+876-543___1234" `shouldBe` False
    it "Success with Test 6" $ patternMatchOptimized "AAb900-OPadff2876-543___1234" `shouldBe` True
    it "Success with Test 7" $ patternMatchOptimized "AAb900-OPadff2876-543___1234-----_______" `shouldBe` True
    it "Success with Test 8" $ patternMatchOptimized "AAb900-OPadff2876-543___1234-----_______*" `shouldBe` False
    it "Success with Test 9" $ patternMatchOptimized "900-O_Pad-_ff2-876-543___1234-----______JAULOqw" `shouldBe` True
    it "Success with Test 10" $ patternMatchOptimized "AAb-90111&80-O_Pad-_ff2-876-543___1234-----______JAUL;/\\'Oqw" `shouldBe` False
    it "Success with Test 11" $ patternMatchOptimized "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'Oqw" `shouldBe` False
    it "Success with Test 12" $ patternMatchOptimized "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'\\Oqw" `shouldBe` False
    it "Success with Test 13" $ patternMatchOptimized "AASDFGHJERTYUCFGHJTYU" `shouldBe` True
    it "Success with Test 14" $ patternMatchOptimized "12345678098765434567" `shouldBe` True
    it "Success with Test 15" $ patternMatchOptimized "awertyuijhgfdertyuioiuy" `shouldBe` True
    it "Success with Test 16" $ patternMatchOptimized "---------------------------------------" `shouldBe` False

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

compareThem :: Spec
compareThem = do
  describe "Compare Text Atto parsers" $ do
    it "Short text" shortCompare
    it "Long text" longCompare
    it "Very long text" veryLongCompare

validChar :: Gen Char
validChar = frequency [(90, alphaNum), (5, G.constant '_'), (5, G.constant '-')]

shortText :: Gen Text
shortText = text (constant 1 10) validChar

-- run 'sample longText' to check
longText :: Gen Text
longText = text (constant 11 100) validChar

veryLongText :: Gen Text
veryLongText = text (constant 101 1000) validChar

shortCompare :: PropertyT IO ()
shortCompare = hedgehog $ do
  short <- forAll shortText
  patternMatch short === patternMatchAtto short
  patternMatchOptimized short === patternMatchAtto short
  patternMatch short === patternMatchOptimized short

longCompare :: PropertyT IO ()
longCompare = hedgehog $ do
  short <- forAll longText
  patternMatch short === patternMatchAtto short
  patternMatchOptimized short === patternMatchAtto short
  patternMatch short === patternMatchOptimized short

veryLongCompare :: PropertyT IO ()
veryLongCompare = hedgehog $ do
  short <- forAll veryLongText
  patternMatch short === patternMatchAtto short
  patternMatchOptimized short === patternMatchAtto short
  patternMatch short === patternMatchOptimized short
