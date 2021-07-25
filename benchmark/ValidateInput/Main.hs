module Main (main) where

import Criterion
import Criterion.Main (defaultMain)
import Data.Text (Text)
import ValidateInput (validateInput, validateInputAtto, validateInputOptimized,
                      validateInputOptimized2)

main :: IO ()
main = validateInputBenchmark

validateInputBenchmark :: IO ()
validateInputBenchmark = do
  defaultMain
      [ bench "validateInput 10" $ nf validateInput text10
      , bench "validateInputOptimized 10" $ nf validateInputOptimized text10
      , bench "validateInputOptimized2 10" $ nf validateInputOptimized2 text10
      , bench "validateInputAtto 10" $ nf validateInputAtto text10
      , bench "validateInput 50" $ nf validateInput text50
      , bench "validateInputOptimized 50" $ nf validateInputOptimized text50
      , bench "validateInputOptimized2 50" $ nf validateInputOptimized2 text50
      , bench "validateInputAtto 50" $ nf validateInputAtto text50
      , bench "validateInput 100" $ nf validateInput text100
      , bench "validateInputOptimized 100" $ nf validateInputOptimized text100
      , bench "validateInputOptimized2 100" $ nf validateInputOptimized2 text100
      , bench "validateInputAtto 100" $ nf validateInputAtto text100
      ]

text10 :: Text
text10 = "asd4FDE4_G"

text50 :: Text
text50 = "asd4FDE43GjpPD_8JKwe89QWkdo3p-opDF09j3IdQp0j2F3D_-"

text100 :: Text
text100 = "asd4FDE43GjpPD98JKwe89QWkdo-pDopDF09j3IdQp0j2F3D_-asd4FDE43GjpPD98JKwe89QWkdo_pDopDF09j3IdQp0j2F3D_"
