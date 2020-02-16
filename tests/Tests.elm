module Tests exposing (suite)

import Expect
import Fuzz
import Test exposing (..)


suite : Test
suite =
    describe "The elm-test crash bug module"
        [ describe "elm-test crash test"
            [ fuzz intsFuzzer "lists of ints" <|
                \l1 ->
                    if List.isEmpty l1 then
                        Expect.pass

                    else
                        Expect.equalLists (Debug.log "list" l1) (l1 |> List.filter (\e -> e /= 2))
            ]
        ]


intsFuzzer : Fuzz.Fuzzer (List Int)
intsFuzzer =
    Fuzz.frequency
        [ ( 99, Fuzz.constant 1 )
        , ( 1, Fuzz.constant 2 )
        ]
        |> Fuzz.list
