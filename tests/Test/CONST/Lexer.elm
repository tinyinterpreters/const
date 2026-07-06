module Test.CONST.Lexer exposing (suite)

import CONST.Lexer as L
import Expect
import Parser as P
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "CONST.Lexer"
        [ describe "digits" <|
            List.map testDigits
                [ ( "123", Just 123 )
                , ( "123 ", Just 123 )
                , ( "123  ", Just 123 )
                , ( " 123", Nothing )
                , ( "onetwothree", Nothing )
                ]
        ]


testDigits : ( String, Maybe Int ) -> Test
testDigits ( input, expectedOutput ) =
    test ("\"" ++ input ++ "\"") <|
        \_ ->
            case P.run L.digits input of
                Ok n ->
                    if expectedOutput == Just n then
                        Expect.pass

                    else
                        Expect.fail <|
                            Debug.toString
                                { expected = Debug.toString expectedOutput
                                , actual = Debug.toString n
                                }

                Err e ->
                    if expectedOutput == Nothing then
                        Expect.pass

                    else
                        Expect.fail (Debug.toString e)
