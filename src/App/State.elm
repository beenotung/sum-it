module App.State exposing (..)

import App.Logic exposing (processInput)
import App.Types exposing (Model, Msg(Analyse))
import Port


initialModel : Model
initialModel =
    { source = "Paste the article here..."
    , output = "Press \"Process\" to analyse the article."
    , numSentence = "7"
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Port.title "Sum It" )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Analyse ->
            (case String.toInt model.numSentence of
                Err reason ->
                    { model | output = reason }

                Ok numSentence ->
                    { model | output = processInput { numSentence = numSentence, rawString = model.source } }
            )
                ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
