module Test.CONST.Lexer exposing (suite)

import CONST.Lexer as L
import Parser as P
import Test exposing (Test, describe)
import Test.Lib exposing (testValue)


suite : Test
suite =
    describe "CONST.Lexer"
        [ describe "digits" <|
            List.map (testValue <| P.run L.digits)
                [ ( "123", Just 123 )
                , ( "123 ", Just 123 )
                , ( "123  ", Just 123 )
                , ( " 123", Nothing )
                , ( "onetwothree", Nothing )
                ]
        ]
