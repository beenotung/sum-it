module Parser.Types exposing (..)

import Dict exposing (Dict)


type alias ArticleType =
    List ParagraphType


type alias ParagraphType =
    List SentenceType


type alias SentenceType =
    List WordType


type alias WordType =
    String


type Token
    = Word String
    | Symbol String
    | NewLine
