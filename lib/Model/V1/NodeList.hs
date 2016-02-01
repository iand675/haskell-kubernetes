{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeOperators              #-}

module Model.V1.NodeList
    ( NodeList (..)
    ) where

import Control.Lens.TH (makeLenses)
import Data.Aeson
import Data.Text (Text)
import GHC.Generics
import Test.QuickCheck
import Test.QuickCheck.Instances ()
import Model.V1.Node
import Model.Unversioned.ListMeta


data NodeList = NodeList
    { _kind :: Text
    , _apiVersion :: Text
    , _metadata :: Unversioned.ListMeta
    , _items :: [Node]
    } deriving (Show, Eq, Generic)
makeLenses ''NodeList

instance FromJSON NodeList
instance ToJSON NodeList
instance Arbitrary NodeList where
    arbitrary = NodeList <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary