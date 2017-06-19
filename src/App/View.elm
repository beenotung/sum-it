module App.View exposing (..)

import Html exposing (..)
import App.Types exposing (Model, Msg(Analyse))
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Style exposing (..)


appLayout : List Style
appLayout =
    [ display "block", padding "16px" ]


fillWidthLayout : List Style
fillWidthLayout =
    [ width "100%"
    ]


view : Model -> Html Msg
view model =
    (node "App") [ style appLayout ]
        [ label [] [ text "Source Article" ]
        , br [] []
        , textarea [ style fillWidthLayout ] [ text model.source ]
        , br [] []
        , label [] [ text "Number of sentence for summary:" ]
        , input [] []
        , button
            [ style
                [ marginLeft "5px"
                ]
            , onClick Analyse
            ]
            [ text "Process" ]
        , hr [] []
        , label [] [ text "Summary" ]
        , br [] []
        , p [] [ text model.output ]
        ]
