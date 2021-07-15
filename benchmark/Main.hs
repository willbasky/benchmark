module Main (main) where

import Benchmark (projectName)


main :: IO ()
main = putStrLn ("Benchmarks for " ++ projectName)
