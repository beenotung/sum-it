module LangUtils exposing (..)

import Char
import Html
import Html.Attributes exposing (style)
import Regex


isOk res =
    case res of
        Ok _ ->
            True

        _ ->
            False


isErr =
    isOk >> not


partitionResults : List (Result e a) -> ( List e, List a )
partitionResults =
    partitionResults_acc [] []


partitionResults_acc : List e -> List a -> List (Result e a) -> ( List e, List a )
partitionResults_acc errs oks res =
    case res of
        [] ->
            ( List.reverse errs, List.reverse oks )

        x :: xs ->
            case x of
                Ok v ->
                    partitionResults_acc errs (v :: oks) xs

                Err v ->
                    partitionResults_acc (v :: errs) oks xs


isInRange low high target =
    (low <= target) && (target <= high)


fst ( a, _ ) =
    a


snd ( _, b ) =
    b


const a _ =
    a


infixl 9 >>>
(>>>) : (a -> b) -> (b -> c) -> (c -> d) -> (a -> d)
(>>>) f1 f2 f3 =
    f1 >> f2 >> f3


startWith : List a -> List a -> Bool
startWith pattern target =
    case pattern of
        [] ->
            True

        x :: xs ->
            case target of
                [] ->
                    False

                y :: ys ->
                    if x == y then
                        startWith xs ys
                    else
                        False


notStartWith p t =
    not (startWith p t)


isEnglishChar c =
    Char.isLower c || Char.isUpper c


find : (a -> Bool) -> List a -> Maybe a
find p xs =
    List.filter p xs
        |> List.head


isSameLength : List a -> List b -> Bool
isSameLength a b =
    List.length a == List.length b


replaceString : String -> String -> String -> String
replaceString pattern output input =
    Regex.replace Regex.All (Regex.regex pattern) (\_ -> output) input


logFunction : String -> (a -> b) -> a -> b
logFunction name f a =
    a
        |> Debug.log name
        |> f


cssWidth : Int -> Html.Attribute msg
cssWidth width =
    style [ ( "width", toString width ) ]


cssHeight : Int -> Html.Attribute msg
cssHeight height =
    style [ ( "height", toString height ) ]


cssSize : Int -> Int -> Html.Attribute msg
cssSize width height =
    style
        [ ( "width", toString width ++ "px" )
        , ( "height", toString height ++ "px" )
        ]


cssPosition : Int -> Int -> Html.Attribute msg
cssPosition top left =
    style
        [ ( "left", toString left ++ "px" )
        , ( "top", toString top ++ "px" )
        ]
