module Main (main) where

import Criterion
import Criterion.Main (defaultMain)
import PackOverhead (Status(..), showStatus)

main :: IO ()
main = packOverhead

packOverhead :: IO ()
packOverhead = do
  defaultMain
      [ bench "Generic show: Status Register" $ nf show Register
      , bench "Unpack from Text to String: Status Register" $ nf showStatus Register
      , bench "Generic show: Status Observing" $ nf show Observing
      , bench "Unpack from Text to String: Status Observing" $ nf showStatus Observing
      ]

