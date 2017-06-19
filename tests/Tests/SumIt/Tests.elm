module Tests.SumIt.Tests exposing (all)

import Test exposing (Test, describe)
import Tests.SumIt.Core
import Tests.SumIt.Lib


all : Test
all =
    describe "SumIt Test Suite"
        [ Tests.SumIt.Lib.all
        , Tests.SumIt.Core.all
        ]
