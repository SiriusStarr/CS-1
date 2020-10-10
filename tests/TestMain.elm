module TestMain exposing (suite)

import Expect
import Fuzz exposing (int)
import Main exposing (negative, square)
import Test exposing (Test, describe, fuzz, test)


suite : Test
suite =
    describe "Main"
        [ describe "square"
            [ test "2 squared" (\_ -> Expect.equal 4 <| square 2)
            , test "0 squared" (\_ -> Expect.equal 0 <| square 0)
            , test "-3 squared" (\_ -> Expect.equal 9 <| square -3)
            ]
        , describe "negative"
            [ test "2 is not negative"
                (\_ -> Expect.false "2 is not negative" <| negative 2)
            , test "-7 is negative"
                (\_ -> Expect.true "-7 is negative" <| negative -7)
            , fuzz int
                "Integers should be handled fine"
                (\i ->
                    if i >= 0 then
                        Expect.false "Positive numbers should not be negative" <|
                            negative i

                    else
                        Expect.true "Negative numbers should be negative" <|
                            negative i
                )
            ]
        ]
