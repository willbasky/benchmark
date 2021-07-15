module Main (main) where

import Benchmark (patternMatch, patternMatchAtto)
import Test.Hspec


main :: IO ()
main = hspec $ do
	describe "patternMatch Text" $ do
		it "Success with Test 1, all regex check successful" $ do
			patternMatch "9002876543___1234" `shouldBe` True
		it "Success with Test 2, all regex check successful" $ do
			patternMatch "AAb9002876-543___1234" `shouldBe` True
		it "Success with Test 3, all regex check successful" $ do
			patternMatch "@-AAb9002876-543___1234" `shouldBe` False
		it "Success with Test 4, all regex check successful" $ do
			patternMatch "---AAb9002+876-543___1234" `shouldBe` False
		it "Success with Test 5, all regex check successful" $ do
			patternMatch "AAb9002+876-543___1234" `shouldBe` False
		it "Success with Test 6, all regex check successful" $ do
			patternMatch "AAb900-OPadff2876-543___1234" `shouldBe` True
		it "Success with Test 7, all regex check successful" $ do
			patternMatch "AAb900-OPadff2876-543___1234-----_______" `shouldBe` True
		it "Success with Test 8, all regex check successful" $ do
			patternMatch "AAb900-OPadff2876-543___1234-----_______*" `shouldBe` False
		it "Success with Test 9, all regex check successful" $ do
			patternMatch "900-O_Pad-_ff2-876-543___1234-----______JAULOqw" `shouldBe` True
		it "Success with Test 10, all regex check successful" $ do
			patternMatch "AAb-90111&80-O_Pad-_ff2-876-543___1234-----______JAUL;/\\'Oqw" `shouldBe` False
		it "Success with Test 11, all regex check successful" $ do
			patternMatch "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'Oqw" `shouldBe` False
		it "Success with Test 12, all regex check successful" $ do
			patternMatch "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'\\Oqw" `shouldBe` False
		it "Success with Test 13, all regex check successful" $ do
			patternMatch "AASDFGHJERTYUCFGHJTYU" `shouldBe` True
		it "Success with Test 14, all regex check successful" $ do
			patternMatch "12345678098765434567" `shouldBe` True
		it "Success with Test 15, all regex check successful" $ do
			patternMatch "awertyuijhgfdertyuioiuy" `shouldBe` True
		it "Success with Test 16, all regex check successful" $ do
			patternMatch "---------------------------------------" `shouldBe` False

	describe "patternMatchAtto Atto" $ do
		it "Success with Test 1, all regex check successful" $ do
			patternMatchAtto "9002876543___1234" `shouldBe` True
		it "Success with Test 2, all regex check successful" $ do
			patternMatchAtto "AAb9002876-543___1234" `shouldBe` True
		it "Success with Test 3, all regex check successful" $ do
			patternMatchAtto "@-AAb9002876-543___1234" `shouldBe` False
		it "Success with Test 4, all regex check successful" $ do
			patternMatchAtto "---AAb9002+876-543___1234" `shouldBe` False
		it "Success with Test 5, all regex check successful" $ do
			patternMatchAtto "AAb9002+876-543___1234" `shouldBe` False
		it "Success with Test 6, all regex check successful" $ do
			patternMatchAtto "AAb900-OPadff2876-543___1234" `shouldBe` True
		it "Success with Test 7, all regex check successful" $ do
			patternMatchAtto "AAb900-OPadff2876-543___1234-----_______" `shouldBe` True
		it "Success with Test 8, all regex check successful" $ do
			patternMatchAtto "AAb900-OPadff2876-543___1234-----_______*" `shouldBe` False
		it "Success with Test 9, all regex check successful" $ do
			patternMatchAtto "900-O_Pad-_ff2-876-543___1234-----______JAULOqw" `shouldBe` True
		it "Success with Test 10, all regex check successful" $ do
			patternMatchAtto "AAb-90111&80-O_Pad-_ff2-876-543___1234-----______JAUL;/\\'Oqw" `shouldBe` False
		it "Success with Test 11, all regex check successful" $ do
			patternMatchAtto "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'Oqw" `shouldBe` False
		it "Success with Test 12, all regex check successful" $ do
			patternMatchAtto "A80-O_Pad-_ff2-876-543___1234-----______JAUL\\'\\Oqw" `shouldBe` False
		it "Success with Test 13, all regex check successful" $ do
			patternMatchAtto "AASDFGHJERTYUCFGHJTYU" `shouldBe` True
		it "Success with Test 14, all regex check successful" $ do
			patternMatchAtto "12345678098765434567" `shouldBe` True
		it "Success with Test 15, all regex check successful" $ do
			patternMatchAtto "awertyuijhgfdertyuioiuy" `shouldBe` True
		it "Success with Test 16, all regex check successful" $ do
			patternMatchAtto "---------------------------------------" `shouldBe` False
