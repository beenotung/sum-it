module Analysis.Types exposing (..)

import Dict exposing (Dict)


type alias ArticleStats =
    List ParagraphStats


type alias ParagraphStats =
    List SentenceStats


type alias SentenceStats =
    List
        { rawString : String
        , score : Int
        }


type alias WordCounts =
    Dict String Int
