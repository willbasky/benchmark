module PackOverhead
    (
      Status (..)
    , showStatus
    ) where

import Data.Text (Text)
import qualified Data.Text as T
import           GHC.Generics (Generic)
import           Test.QuickCheck (Arbitrary (arbitrary))
import           Test.QuickCheck.Arbitrary.Generic (genericArbitrary)

data Status
  = Gone
  | Arrived
  | Pending
  | Frozen
  | Hanging
  | Observing
  | Register
  deriving stock Generic

instance Show Status where
  show = \case
    Gone -> "GONE"
    Arrived -> "ARRIVED"
    Pending -> "PENDING"
    Frozen -> "FROZEN"
    Hanging -> "HANGING"
    Observing -> "OBSERVING"
    Register -> "REGISTER"

instance Arbitrary Status where
  arbitrary = genericArbitrary

showStatus :: Status -> String
showStatus = T.unpack . statusToText

statusToText :: Status -> Text
statusToText = \case
  Gone -> "GONE"
  Arrived -> "ARRIVED"
  Pending -> "PENDING"
  Frozen -> "FROZEN"
  Hanging -> "HANGING"
  Observing -> "OBSERVING"
  Register -> "REGISTER"
