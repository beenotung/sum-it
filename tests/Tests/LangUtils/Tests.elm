module Tests.LangUtils.Tests exposing (all)

import Expect
import LangUtils
import Test exposing (describe, test)


all =
    describe "LangUtils Test Suite"
        [ test "LangUtils.startWith" <|
            \() ->
                Expect.true "the pattern should be matched"
                    (LangUtils.startWith [ 1, 2, 3 ] [ 1, 2, 3 ])
        , test "LangUtils.startWith" <|
            \() ->
                Expect.true "the pattern should be matched"
                    (LangUtils.startWith [ 1, 2, 3 ] [ 1, 2, 3, 4 ])
        , test "LangUtils.startWith" <|
            \() ->
                Expect.false "the pattern should not be matched"
                    (LangUtils.startWith [ 1, 3 ] [ 1, 2, 3 ])
        ]
