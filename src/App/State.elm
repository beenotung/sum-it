module App.State exposing (..)

import App.Types exposing (Model, Msg(Analyse))
import Port


initialModel : Model
initialModel =
    { source = "Paste the article here..."
    , output = "Press \"Process\" to analyse the article."
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Port.title "Sum It" )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Analyse ->
            let
                wordStat =
                    String.split " " model.source

                newModel =
                    { model | output = model.source }
            in
                newModel ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
