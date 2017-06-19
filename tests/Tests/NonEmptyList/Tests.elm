module Tests.NonEmptyList.Tests exposing (all)

import Expect
import LangUtils
import NonEmptyList
import Test exposing (describe, test)


all =
    describe "NonEmptyList Test Suite"
        [ test "LangUtils.startWith" <|
            \() ->
                Expect.equal { head = 1, tail = [] }
                    (NonEmptyList.singleton 1)
        ]
