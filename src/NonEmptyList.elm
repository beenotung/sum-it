module NonEmptyList exposing (..)

import LangUtils exposing (isOk, isErr)


type alias NonEmptyList a =
    { head : a
    , tail : List a
    }


singleton a =
    { head = a, tail = [] }


toList a =
    (a.head :: a.tail)


wrap x xs =
    { head = x, tail = xs }


isSingle a =
    a.tail == []


toMaybeSingle a =
    if isSingle a then
        Just a.head
    else
        Nothing


(++) : NonEmptyList a -> NonEmptyList a -> NonEmptyList a
(++) xs ys =
    { head = xs.head
    , tail = List.append xs.tail (ys.head :: ys.tail)
    }


append =
    (++)


concat : NonEmptyList (NonEmptyList a) -> NonEmptyList a
concat =
    reduce append


concatList : NonEmptyList (List a) -> Maybe (NonEmptyList a)
concatList list =
    list
        |> toList
        |> List.concat
        |> fromList


{-| f :: acc -> current -> res
-}
reduce : (a -> a -> a) -> NonEmptyList a -> a
reduce f list =
    reduce_acc list.head f list.tail


reduce_acc : a -> (a -> a -> a) -> List a -> a
reduce_acc acc f list =
    case list of
        [] ->
            acc

        x :: xs ->
            reduce_acc (f acc x) f xs


fromList : List a -> Maybe (NonEmptyList a)
fromList list =
    case list of
        [] ->
            Nothing

        x :: xs ->
            Just (wrap x xs)


map : (a -> b) -> NonEmptyList a -> NonEmptyList b
map f list =
    wrap
        (f list.head)
        (List.map f list.tail)


concatMap : (a -> NonEmptyList b) -> NonEmptyList a -> NonEmptyList b
concatMap f list =
    map f list
        |> concat


partitionToList : (a -> Bool) -> NonEmptyList a -> ( List a, List a )
partitionToList p list =
    let
        ( xs, ys ) =
            List.partition p list.tail
    in
        if p list.head then
            ( list.head :: xs, ys )
        else
            ( xs, list.head :: ys )


partition : (a -> Bool) -> NonEmptyList a -> Result ( List a, NonEmptyList a ) ( NonEmptyList a, List a )
partition p list =
    let
        ( xs, ys ) =
            List.partition p list.tail
    in
        if p list.head then
            Ok ( wrap list.head xs, ys )
        else
            Err ( xs, wrap list.head ys )


filter : (a -> Bool) -> NonEmptyList a -> List a
filter p list =
    toList list |> List.filter p


partitionResults : NonEmptyList (Result e a) -> Result ( NonEmptyList e, List a ) ( List e, NonEmptyList a )
partitionResults list =
    let
        ( errs, oks ) =
            LangUtils.partitionResults list.tail
    in
        case list.head of
            Ok v ->
                Ok ( errs, wrap v oks )

            Err v ->
                Err ( wrap v errs, oks )
