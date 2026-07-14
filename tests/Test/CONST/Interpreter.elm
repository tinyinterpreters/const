module Test.CONST.Interpreter exposing (suite)

import CONST.Interpreter as I exposing (Value(..))
import Test exposing (Test, describe)
import Test.Lib exposing (testValue)


suite : Test
suite =
    describe "CONST.Interpreter"
        [ describe "run" <|
            List.map (testValue I.run)
                [ ( "123", Just (VNumber 123) )
                , ( "123 ", Just (VNumber 123) )
                , ( "123  ", Just (VNumber 123) )
                , ( " 123", Just (VNumber 123) )
                , ( "  123", Just (VNumber 123) )
                , ( "123abc", Nothing )
                , ( "onetwothree", Nothing )
                ]
        ]
