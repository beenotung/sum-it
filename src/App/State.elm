module App.State exposing (..)

import App.Logic exposing (processInput)
import App.Types exposing (Model, Msg(Analyse, SetNumSentence))
import Port


initialModel : Model
initialModel =
    { source = "Paste the article here..."
    , output = "Press \"Process\" to analyse the article."
    , numSentenceStr = "7"
    , numSentence = Just 7
    , hint = ""
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Port.title "Sum It" )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetNumSentence text ->
            (case String.toInt text of
                Err reason ->
                    { model
                        | hint = reason
                        , numSentence = Nothing
                        , numSentenceStr = text
                    }

                Ok num ->
                    { model
                        | numSentence = Just num
                        , hint = ""
                        , numSentenceStr = text
                    }
            )
                ! []

        Analyse ->
            (case model.numSentence of
                Nothing ->
                    model

                Just num ->
                    { model | output = processInput num model.source }
            )
                ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
