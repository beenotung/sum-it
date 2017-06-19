module AppTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, list, int, string)
import Test exposing (..)


suite : Test
suite =
    describe "SumIt Test Suite"
        [ test "Default Test" <|
            \() ->
                Expect.true "Correct Test" True
        ]
