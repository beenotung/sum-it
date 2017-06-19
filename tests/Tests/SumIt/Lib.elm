module Tests.SumIt.Lib exposing (all)

import Test exposing (Test, describe)
import Tests.LangUtils.Tests
import Tests.NonEmptyList.Tests


all : Test
all =
    describe "SumIt Library Test Suite"
        [ Tests.LangUtils.Tests.all
        , Tests.NonEmptyList.Tests.all
        ]
