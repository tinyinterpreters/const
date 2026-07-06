module Test.CONST.Parser exposing (suite)

import CONST.AST as AST exposing (..)
import CONST.Parser as P
import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "CONST.Parser"
        [ describe "parse" <|
            List.map testParse
                [ ( "123", Just (Program (Const 123)) )
                , ( "123 ", Just (Program (Const 123)) )
                , ( "123  ", Just (Program (Const 123)) )
                , ( " 123", Just (Program (Const 123)) )
                , ( "  123", Just (Program (Const 123)) )
                , ( "onetwothree", Nothing )
                ]
        ]


testParse : ( String, Maybe AST.Program ) -> Test
testParse ( input, expectedOutput ) =
    test ("\"" ++ input ++ "\"") <|
        \_ ->
            case P.parse input of
                Ok program ->
                    if expectedOutput == Just program then
                        Expect.pass

                    else
                        Expect.fail <|
                            Debug.toString
                                { expected = Debug.toString expectedOutput
                                , actual = Debug.toString program
                                }

                Err e ->
                    if expectedOutput == Nothing then
                        Expect.pass

                    else
                        Expect.fail (Debug.toString e)
