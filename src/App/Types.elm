module App.Types exposing (..)


type alias Model =
    { source : String
    , output : String
    }


type Msg
    = Analyse


type alias WordStat =
    { value : String, count : Int }
