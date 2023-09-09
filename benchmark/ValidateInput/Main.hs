module Main (main) where

import Criterion
import Criterion.Main (defaultMain)
import Data.String (IsString, fromString)
import ValidateInput
import qualified Data.ByteString.Char8 as BS
import Data.ByteString.Char8 (ByteString)
import qualified Text.RE.TDFA.ByteString as Re
import qualified Text.Regex.PCRE.Light as Light


main :: IO ()
main = do
  -- benchTextAttoSimple
  -- benchRegexSimple
  benchRegexUrl

benchTextAttoSimple :: IO ()
benchTextAttoSimple = do
  defaultMain
    [
      bgroup "Text and Attoparsec on simple text"
      [
        bench "Elem text 10" $ nf validateInput text10
      , bench "Optimized2 10" $ nf validateInputOptimized2 text10
      , bench "Attoparsec 10" $ nf validateInputAtto text10

      , bench "Elem text 50" $ nf validateInput text50
      , bench "Optimized2 50" $ nf validateInputOptimized2 text50
      , bench "Attoparsec 50" $ nf validateInputAtto text50

      , bench "Elem text 100" $ nf validateInput text100
      , bench "Optimized2 100" $ nf validateInputOptimized2 text100
      , bench "Attoparsec 100" $ nf validateInputAtto text100

      , bench "Elem text 200" $ nf validateInput text200
      , bench "Optimized2 200" $ nf validateInputOptimized2 text200
      , bench "Attoparsec 200" $ nf validateInputAtto text200
      ]
    ]

benchRegexSimple :: IO ()
benchRegexSimple = do
  reText <- Re.compileRegex $ BS.unpack rText
  let re = Light.compile rText []
  defaultMain
    [ bgroup "Regex libraries on simple text"
      [
        bench "Regex 10" $ nf (regex reText) text10
      , bench "regex-posix 10" $ nf (regexPosix rText) text10
      , bench "regex-pcre 10" $ nf (regexPcre rText) text10
      , bench "regex-tdfa 10" $ nf (regexTdfa rText) text10
      , bench "regex-light 10" $ nf (regexLight re) text10

      , bench "regex 50" $ nf (regex reText) text50
      , bench "regex-posix 50" $ nf (regexPosix rText) text50
      , bench "regex-pcre 50" $ nf (regexPcre rText) text50
      , bench "regex-tdfa 50" $ nf (regexTdfa rText) text50
      , bench "regex-light 50" $ nf (regexLight re) text50

      , bench "regex 100" $ nf (regex reText) text100
      , bench "regex-posix 100" $ nf (regexPosix rText) text100
      , bench "regex-pcre 100" $ nf (regexPcre rText) text100
      , bench "regex-tdfa 100" $ nf (regexTdfa rText) text100
      , bench "regex-light 100" $ nf (regexLight re) text100

      , bench "regex 200" $ nf (regex reText) text200
      , bench "regex-posix 200" $ nf (regexPosix rText) text200
      , bench "regex-pcre 200" $ nf (regexPcre rText) text200
      , bench "regex-tdfa 200" $ nf (regexTdfa rText) text200
      , bench "regex-light 200" $ nf (regexLight re) text200
      ]
    ]

rText :: ByteString
rText = "^[a-zA-Z0-9][a-zA-Z0-9_-]+$"

text10 :: IsString a => a
text10 = "asd4FDE4_G"

text50 :: IsString a => a
text50 = "asd4FDE43GjpPD_8JKwe89QWkdo3p-opDF09j3IdQp0j2F3D_-"

text100 :: IsString a => a
text100 = "asd4FDE43GjpPD98JKwe89QWkdo-pDopDF09j3IdQp0j2F3D_-asd4FDE43GjpPD98JKwe89QWkdo_pDopDF09j3IdQp0j2F3D_"

text200 :: IsString a => a
text200 = "asd4FDE43GjpPD98JKwe89QWkdo-pDopDF09j3IdQp0j2F3D_-asd4FDE43GjpPD98JKwe89QWkdo_pDopDF09j3IdQp0j2F3D_ufjdhfbvoeODJDLWIDJW--jsjfjiepflaIEJDBSOQ-__ryfh-surhfhHHHDUSIAwhf-siedncjs__dhwudksoshehfuvua_-suefQ"

benchRegexUrl :: IO ()
benchRegexUrl = do
  let re = Light.compile rUrl []

  defaultMain
    [ bgroup "Regex libraries on URL"
      [
        bench "regex-pcre 10" $ nf (regexPcre rUrl) url10
      , bench "regex-light 10" $ nf (regexLight re) url10

      , bench "regex-pcre 50" $ nf (regexPcre rUrl) url50
      , bench "regex-light 50" $ nf (regexLight re) url50

      , bench "regex-pcre 100" $ nf (regexPcre rUrl) url100
      , bench "regex-light 100" $ nf (regexLight re) url100

      ]
    ]

url10 :: ByteString
url10 = "http://google.com"

url50 :: ByteString
url50 = "https://benfrain.com/enduring-css-writing-style-sheets-rapidly-changing-long-lived-projects/"

url100 :: ByteString
url100 = "https://accounts.google.com/info/sessionexpired?continue=https%3A%2F%2Fmail.google.com&flowEntry=SignUp&flowName=GlifWebSignIn&hl=en-GB&service=mail&theme=glif"



-------------------------------------------------------------------------------
-- Parse URL
-- Just regex
-- https://wiki.haskell.org/Regular_expressions
-------------------------------------------------------------------------------


-- Taken from https://gist.github.com/dperini/729294
-- JS version
-- /^(?:(?:(?:https?|ftp):)?\/\/)(?:\S+(?::\S*)?@)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z0-9\u00a1-\uffff][a-z0-9\u00a1-\uffff_-]{0,62})?[a-z0-9\u00a1-\uffff]\.)+(?:[a-z\u00a1-\uffff]{2,}\.?))(?::\d{2,5})?(?:[/?#]\S*)?$/i

-- PHP version
-- %^(?:(?:(?:https?|ftp):)?\/\/)(?:\S+(?::\S*)?@)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z0-9\x{00a1}-\x{ffff}][a-z0-9\x{00a1}-\x{ffff}_-]{0,62})?[a-z0-9\x{00a1}-\x{ffff}]\.)+(?:[a-z\x{00a1}-\x{ffff}]{2,}\.?))(?::\d{2,5})?(?:[/?#]\S*)?$%iuS

-- Taken from https://mathiasbynens.be/demo/url-regex
-- PHP version
rUrl :: ByteString
rUrl = "^(?:(?:(?:https?|ftp):)?//)(?:\\S+(?::\\S*)?@)?(?:(?!(?:10|127)(?:\\.\\d{1,3}){3})(?!(?:169\\.254|192\\.168)(?:\\.\\d{1,3}){2})(?!172\\.(?:1[6-9]|2\\d|3[0-1])(?:\\.\\d{1,3}){2})(?:[1-9]\\d?|1\\d\\d|2[01]\\d|22[0-3])(?:\\.(?:1?\\d{1,2}|2[0-4]\\d|25[0-5])){2}(?:\\.(?:[1-9]\\d?|1\\d\\d|2[0-4]\\d|25[0-4]))|(?:(?:[a-z0-9\\x00a1-\\xffff][a-z0-9\\x00a1-\\xffff_-]{0,62})?[a-z0-9\\x00a1-\\xffff]\\.)+(?:[a-z\\x00a1-\\xffff]{2,}\\.?))(?::\\d{2,5})?(?:[/?#]\\S*)?$"