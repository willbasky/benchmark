module Main (main) where

import Criterion
import Criterion.Main (defaultMain)
import Data.Text (Text)
import ValidateInput (validateInput, validateInputAtto,
                      validateInputOptimized2, validateInputRegex)

main :: IO ()
main = validateInputBenchmark

validateInputBenchmark :: IO ()
validateInputBenchmark = do
  defaultMain
      [ bench "Elem text 10" $ nf validateInput text10
      , bench "Optimized2 10" $ nf validateInputOptimized2 text10
      , bench "Attoparsec 10" $ nf validateInputAtto text10
      , bench "Regex imerative 10" $ nf validateInputRegex text10
      , bench "Elem text 50" $ nf validateInput text50
      , bench "Optimized2 50" $ nf validateInputOptimized2 text50
      , bench "Attoparsec 50" $ nf validateInputAtto text50
      , bench "Regex imerative 50" $ nf validateInputRegex text50
      , bench "Elem text 100" $ nf validateInput text100
      , bench "Optimized2 100" $ nf validateInputOptimized2 text100
      , bench "Attoparsec 100" $ nf validateInputAtto text100
      , bench "Regex imerative 100" $ nf validateInputRegex text100
      , bench "Elem text 200" $ nf validateInput text200
      , bench "Optimized2 200" $ nf validateInputOptimized2 text200
      , bench "Attoparsec 200" $ nf validateInputAtto text200
      , bench "Regex imerative 200" $ nf validateInputRegex text200
      ]

text10 :: Text
text10 = "asd4FDE4_G"

text50 :: Text
text50 = "asd4FDE43GjpPD_8JKwe89QWkdo3p-opDF09j3IdQp0j2F3D_-"

text100 :: Text
text100 = "asd4FDE43GjpPD98JKwe89QWkdo-pDopDF09j3IdQp0j2F3D_-asd4FDE43GjpPD98JKwe89QWkdo_pDopDF09j3IdQp0j2F3D_"

text200 :: Text
text200 = "asd4FDE43GjpPD98JKwe89QWkdo-pDopDF09j3IdQp0j2F3D_-asd4FDE43GjpPD98JKwe89QWkdo_pDopDF09j3IdQp0j2F3D_ufjdhfbvoeODJDLWIDJW--jsjfjiepflaIEJDBSOQ-__ryfh-surhfhHHHDUSIAwhf-siedncjs__dhwudksoshehfuvua_-suefQ"
