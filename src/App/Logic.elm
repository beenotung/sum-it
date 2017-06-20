module App.Logic exposing (..)

import Parser.Core


processInput : Int -> String -> String
processInput numSentence rawString =
    if numSentence < 1 then
        "Invalid: the number of sentence should be at least 1."
    else
        rawString
            |> Parser.Core.parseToken
            |> Parser.Core.toString
