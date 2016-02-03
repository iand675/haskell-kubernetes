-- Copyright (c) 2016-present, SoundCloud Ltd.
-- All rights reserved.
--
-- This source code is distributed under the terms of a BSD license,
-- found in the LICENSE file.

{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TemplateHaskell            #-}

module Kubernetes.Model.V1.PersistentVolumeClaim
    ( PersistentVolumeClaim (..)
    , kind
    , apiVersion
    , metadata
    , spec
    , status
    ) where

import           Control.Lens.TH (makeLenses)
import           Data.Aeson.TH (deriveJSON, defaultOptions, fieldLabelModifier)
import           Data.Text (Text)
import           GHC.Generics (Generic)
import           Prelude hiding (drop, error, max, min)
import qualified Prelude as P
import           Test.QuickCheck (Arbitrary, arbitrary)
import           Test.QuickCheck.Instances ()
import           Kubernetes.Model.V1.ObjectMeta (ObjectMeta)
import           Kubernetes.Model.V1.PersistentVolumeClaimSpec (PersistentVolumeClaimSpec)
import           Kubernetes.Model.V1.PersistentVolumeClaimStatus (PersistentVolumeClaimStatus)

-- | PersistentVolumeClaim is a user&#39;s request for and claim to a persistent volume
data PersistentVolumeClaim = PersistentVolumeClaim
    { _kind :: Maybe Text
    , _apiVersion :: Maybe Text
    , _metadata :: Maybe ObjectMeta
    , _spec :: Maybe PersistentVolumeClaimSpec
    , _status :: Maybe PersistentVolumeClaimStatus
    } deriving (Show, Eq, Generic)

makeLenses ''PersistentVolumeClaim

$(deriveJSON defaultOptions{fieldLabelModifier = P.drop 1} ''PersistentVolumeClaim)

instance Arbitrary PersistentVolumeClaim where
    arbitrary = PersistentVolumeClaim <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary