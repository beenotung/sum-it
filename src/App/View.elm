module App.View exposing (..)

import Html exposing (..)
import App.Types exposing (Model, Msg)


view : Model -> Html Msg
view model =
    (node "App") [] [ text "App is working." ]
