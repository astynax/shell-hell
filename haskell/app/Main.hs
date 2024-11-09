{-# LANGUAGE GHC2024 #-}

module Main where

import Options.Applicative
import Shelly

wordP :: Parser String
wordP = strArgument $ metavar "PREFIX"

main :: IO ()
main = do
  word <- execParser (info wordP mempty)
  shelly $
    cmd "grep" ("^" <> word) "/usr/share/dict/words"
      -|- cmd "wc" "-l"
