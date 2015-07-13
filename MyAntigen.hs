
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExtendedDefaultRules #-}
module MyAntigen where

import Antigen (AntigenConfiguration (..)
              , bundle
              , antigen
              , developFromFileSystem)
import Shelly (shelly)

bundles =
  [ bundle "Tarrasch/zsh-functional"
  , bundle "Tarrasch/zsh-bd"
  , bundle "Tarrasch/zsh-colors"
  , bundle "Tarrasch/zsh-autoenv"
  , bundle "Tarrasch/zsh-mcd"
  , bundle "zsh-users/zsh-syntax-highlighting"
  , bundle "zsh-users/zsh-history-substring-search"
  ]

config = AntigenConfiguration bundles

main :: IO ()
main = shelly $ antigen config
