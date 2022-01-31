module Main (main) where

import Criterion
import Criterion.Main (defaultMain)
import Data.String (IsString)
import ValidateInput (validateInput, validateInputAtto, validateInputOptimized2,
                      validateInputRegexPcre, validateInputRegexPosix, validateInputRegexTDFA)

main :: IO ()
main = validateInputBenchmark

validateInputBenchmark :: IO ()
validateInputBenchmark = do
  defaultMain
      [ bench "Elem text 10" $ nf validateInput text10
      , bench "Optimized2 10" $ nf validateInputOptimized2 text10
      , bench "Attoparsec 10" $ nf validateInputAtto text10
      -- , bench "Regex pcre 10" $ nf validateInputRegexTextIcu text10
      , bench "Regex posix 10" $ nf validateInputRegexPosix text10
      , bench "Regex TDFA 10" $ nf validateInputRegexTDFA text10
      , bench "Regex Pcre 10" $ nf validateInputRegexPcre text10

      , bench "Elem text 50" $ nf validateInput text50
      , bench "Optimized2 50" $ nf validateInputOptimized2 text50
      , bench "Attoparsec 50" $ nf validateInputAtto text50
      -- , bench "Regex pcre 50" $ nf validateInputRegexTextIcu text50
      , bench "Regex posix 50" $ nf validateInputRegexPosix text50
      , bench "Regex TDFA 50" $ nf validateInputRegexTDFA text50
      , bench "Regex Pcre 50" $ nf validateInputRegexPcre text50

      , bench "Elem text 100" $ nf validateInput text100
      , bench "Optimized2 100" $ nf validateInputOptimized2 text100
      , bench "Attoparsec 100" $ nf validateInputAtto text100
      -- , bench "Regex pcre 100" $ nf validateInputRegexTextIcu text100
      , bench "Regex posix 100" $ nf validateInputRegexPosix text100
      , bench "Regex TDFA 100" $ nf validateInputRegexTDFA text100
      , bench "Regex Pcre 100" $ nf validateInputRegexPcre text100

      , bench "Elem text 200" $ nf validateInput text200
      , bench "Optimized2 200" $ nf validateInputOptimized2 text200
      , bench "Attoparsec 200" $ nf validateInputAtto text200
      -- , bench "Regex pcre 200" $ nf validateInputRegexTextIcu text200
      , bench "Regex posix 200" $ nf validateInputRegexPosix text200
      , bench "Regex TDFA 200" $ nf validateInputRegexTDFA text200
      , bench "Regex Pcre 200" $ nf validateInputRegexPcre text200
      ]

text10 :: IsString a => a
text10 = "asd4FDE4_G"

text50 :: IsString a => a
text50 = "asd4FDE43GjpPD_8JKwe89QWkdo3p-opDF09j3IdQp0j2F3D_-"

text100 :: IsString a => a
text100 = "asd4FDE43GjpPD98JKwe89QWkdo-pDopDF09j3IdQp0j2F3D_-asd4FDE43GjpPD98JKwe89QWkdo_pDopDF09j3IdQp0j2F3D_"

text200 :: IsString a => a
text200 = "asd4FDE43GjpPD98JKwe89QWkdo-pDopDF09j3IdQp0j2F3D_-asd4FDE43GjpPD98JKwe89QWkdo_pDopDF09j3IdQp0j2F3D_ufjdhfbvoeODJDLWIDJW--jsjfjiepflaIEJDBSOQ-__ryfh-surhfhHHHDUSIAwhf-siedncjs__dhwudksoshehfuvua_-suefQ"
