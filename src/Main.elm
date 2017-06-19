module Main exposing (main)

import Html exposing (Html, body)


type alias Model =
    {}


type alias Msg =
    {}


init : Model
init =
    {}


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    model ! []


subscriptions : model -> Sub msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    body [] []


main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
