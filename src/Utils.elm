module Utils exposing (..)

import Char


isAlphabet : Char -> Bool
isAlphabet c =
    Char.isUpper c || Char.isLower c
