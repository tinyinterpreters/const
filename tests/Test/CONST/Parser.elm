module Test.CONST.Parser exposing (suite)

import CONST.AST as AST exposing (..)
import CONST.Parser as P
import Test exposing (Test, describe)
import Test.Lib exposing (testValue)


suite : Test
suite =
    describe "CONST.Parser"
        [ describe "parse" <|
            List.map (testValue P.parse)
                [ ( "123", Just (Program (Const 123)) )
                , ( "123 ", Just (Program (Const 123)) )
                , ( "123  ", Just (Program (Const 123)) )
                , ( " 123", Just (Program (Const 123)) )
                , ( "  123", Just (Program (Const 123)) )
                , ( "onetwothree", Nothing )
                ]
        ]
