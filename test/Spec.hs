module Main (main) where

import Benchmark (projectName)


main :: IO ()
main = putStrLn ("Tests for " ++ projectName)
