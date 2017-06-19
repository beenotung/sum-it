module Main exposing (..)

import App.State exposing (init, subscriptions, update)
import App.Types exposing (Model, Msg)
import App.View exposing (view)
import Html


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
