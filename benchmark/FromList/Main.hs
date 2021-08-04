module Main (main) where

import Criterion
import Criterion.Main (defaultMain)
import Data.String (IsString)
import FromList (alphaNumSpecial, alphaNumSpecialSet)

main :: IO ()
main = validateSetBenchmark

validateSetBenchmark :: IO ()
validateSetBenchmark = do
  defaultMain
      [ bench "Text 10" $ nf alphaNumSpecial text10
      , bench "FromList Text 10" $ nf alphaNumSpecialSet text10

      , bench "Text 50" $ nf alphaNumSpecial text50
      , bench "FromList Text 50" $ nf alphaNumSpecialSet text50

      , bench "Text 100" $ nf alphaNumSpecial text100
      , bench "FromList Text 100" $ nf alphaNumSpecialSet text100

      , bench "Text 200" $ nf alphaNumSpecial text200
      , bench "FromList Text 200" $ nf alphaNumSpecialSet text200

      , bench "Text not similar" $ nf alphaNumSpecial textNotSimilar
      , bench "FromList. Text not similar" $ nf alphaNumSpecialSet textNotSimilar

      , bench "Text similar" $ nf alphaNumSpecial textSimilar
      , bench "FromList. Text similar" $ nf alphaNumSpecialSet textSimilar
      ]

text10 :: IsString a => a
text10 = "asd4FDE4_G"

text50 :: IsString a => a
text50 = "asd4FDE43GjpPD_8JKwe89QWkdo3p-opDF09j3IdQp0j2F3D_-"

text100 :: IsString a => a
text100 = "asd4FDE43GjpPD98JKwe89QWkdo-pDopDF09j3IdQp0j2F3D_-asd4FDE43GjpPD98JKwe89QWkdo_pDopDF09j3IdQp0j2F3D_"

text200 :: IsString a => a
text200 = "asd4FDE43GjpPD98JKwe89QWkdo-pDopDF09j3IdQp0j2F3D_-asd4FDE43GjpPD98JKwe89QWkdo_pDopDF09j3IdQp0j2F3D_ufjdhfbvoeODJDLWIDJW--jsjfjiepflaIEJDBSOQ-__ryfh-surhfhHHHDUSIAwhf-siedncjs__dhwudksoshehfuvua_-suefQ"


textNotSimilar :: IsString a => a
textNotSimilar = "1234567890_-qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLMNBVCXZ"

textSimilar :: IsString a => a
textSimilar =
  "dfhlskdfhlkjsdfhlkshfdlksjhfslkjhfslkjfhslkjhfslkjhfslkjhfdskjlhfslkjhflkjshfsljkdhfslkjhfsdlkjhfslkjdhfsdjhfsdlkjhfslkjdhf"

