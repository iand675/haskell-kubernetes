-- Copyright (c) 2016-present, SoundCloud Ltd.
-- All rights reserved.
--
-- This source code is distributed under the terms of a BSD license,
-- found in the LICENSE file.

{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TemplateHaskell            #-}

module Kubernetes.Model.V1.Handler
    ( Handler (..)
    , exec
    , httpGet
    , tcpSocket
    ) where

import           Control.Lens.TH (makeLenses)
import           Data.Aeson.TH (deriveJSON, defaultOptions, fieldLabelModifier)
import           GHC.Generics (Generic)
import           Prelude hiding (drop, error, max, min)
import qualified Prelude as P
import           Test.QuickCheck (Arbitrary, arbitrary)
import           Test.QuickCheck.Instances ()
import           Kubernetes.Model.V1.ExecAction (ExecAction)
import           Kubernetes.Model.V1.HTTPGetAction (HTTPGetAction)
import           Kubernetes.Model.V1.TCPSocketAction (TCPSocketAction)

-- | Handler defines a specific action that should be taken
data Handler = Handler
    { _exec :: Maybe ExecAction
    , _httpGet :: Maybe HTTPGetAction
    , _tcpSocket :: Maybe TCPSocketAction
    } deriving (Show, Eq, Generic)

makeLenses ''Handler

$(deriveJSON defaultOptions{fieldLabelModifier = P.drop 1} ''Handler)

instance Arbitrary Handler where
    arbitrary = Handler <$> arbitrary <*> arbitrary <*> arbitrary