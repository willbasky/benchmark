module Main (main) where

import Benchmark (patternMatch, patternMatchAtto, patternMatchOptimized)
import Data.Text (Text)
import Criterion
import Criterion.Main (defaultMain)

main :: IO ()
main = crit


crit :: IO ()
crit = do
  defaultMain
      [ bench "patternMatch 10" $ nf patternMatch text10
      , bench "patternMatchOptimized 10" $ nf patternMatchOptimized text10
      , bench "patternMatchAtto 10" $ nf patternMatchAtto text10
      , bench "patternMatch 50" $ nf patternMatch text50
      , bench "patternMatchOptimized 50" $ nf patternMatchOptimized text50
      , bench "patternMatchAtto 50" $ nf patternMatchAtto text50
      , bench "patternMatch 100" $ nf patternMatch text100
      , bench "patternMatchAtto 100" $ nf patternMatchAtto text100
      , bench "patternMatchOptimized 100" $ nf patternMatchOptimized text100
      ]

text10 :: Text
text10 = "asd4FDE4_G"

text50 :: Text
text50 = "asd4FDE43GjpPD_8JKwe89QWkdo3p-opDF09j3IdQp0j2F3D_-"

text100 :: Text
text100 = "asd4FDE43GjpPD98JKwe89QWkdo-pDopDF09j3IdQp0j2F3D_-asd4FDE43GjpPD98JKwe89QWkdo_pDopDF09j3IdQp0j2F3D_"
