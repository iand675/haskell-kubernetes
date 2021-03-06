-- Copyright (c) 2016-present, SoundCloud Ltd.
-- All rights reserved.
--
-- This source code is distributed under the terms of a MIT license,
-- found in the LICENSE file.

{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TemplateHaskell            #-}

module Kubernetes.Model.V1.TCPSocketAction
    ( TCPSocketAction (..)
    , port
    , mkTCPSocketAction
    ) where

import           Control.Lens.TH           (makeLenses)
import           Data.Aeson.TH             (defaultOptions, deriveJSON,
                                            fieldLabelModifier)
import           GHC.Generics              (Generic)
import           Kubernetes.Utils          (IntegerOrText)
import           Prelude                   hiding (drop, error, max, min)
import qualified Prelude                   as P
import           Test.QuickCheck           (Arbitrary, arbitrary)
import           Test.QuickCheck.Instances ()

-- | TCPSocketAction describes an action based on opening a socket
data TCPSocketAction = TCPSocketAction
    { _port :: !(IntegerOrText)
    } deriving (Show, Eq, Generic)

makeLenses ''TCPSocketAction

$(deriveJSON defaultOptions{fieldLabelModifier = (\n -> if n == "_type_" then "type" else P.drop 1 n)} ''TCPSocketAction)

instance Arbitrary TCPSocketAction where
    arbitrary = TCPSocketAction <$> arbitrary

-- | Use this method to build a TCPSocketAction
mkTCPSocketAction :: IntegerOrText -> TCPSocketAction
mkTCPSocketAction xportx = TCPSocketAction xportx
