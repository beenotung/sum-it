module App.Types exposing (..)

import Dict exposing (Dict)


type alias Model =
    { source : String
    , output : String
    , numSentence : String
    }


type Msg
    = Analyse


type alias Param =
    { numSentence : Int
    , rawString : String
    }


type alias WordCounts =
    Dict String Int


type Word
    = String Int


type alias Sentence =
    { rawString : String
    , words : List Word
    , score : Int
    }


type alias Paragraph =
    List Sentence


type alias Article =
    List Paragraph
