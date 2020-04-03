-- Look at how testing is set up in FORTH project and emulate here
-- Make sure you unit test every function you write
import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Interpret
import Data 
import qualified Data.Map.Strict as Map


main :: IO ()
main = hspec $ do

  -- UNIT TESTS FOR intExp  
  describe "intExp" $ do
    context "Literals" $ do
        it "tests 5.0 as a literal" $ do
            intExp (Real 5.0) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R 5.0)
        it "tests -5.0 as a literal" $ do
            intExp (Real (-5.0)) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R (-5.0))
    context "Negation" $ do
        it "tests positives negated" $ do
            intExp (Op1 "-" (Real 5.0)) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R (-5.0)) 
        it "tests negatives negated" $ do
            intExp (Op1 "-" (Real (-5.0))) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R 5.0)
    context "Square Root" $ do
        it "tests square root of 9.0" $ do
            intExp (Op1 "sqrt" (Real 9.0)) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R 3.0)
    context "Natural Log" $ do
        it "tests natural log of e" $ do
            intExp (Op1 "ln" (Real 2.718)) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R 0.999896315728952)
    context "Sine" $ do
        it "tests sin of pi/2" $ do
            intExp (Op1 "sin" (Real 1.57079633)) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R 1.0)
    context "Cosine" $ do
        it "tests cos of pi" $ do
            intExp (Op1 "cos" (Real 3.14159265)) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R (-1.0))
    context "Exponential" $ do
        it "tests exponetial of 1.0" $ do
            intExp (Op1 "exp" (Real 1.0)) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R 2.7182817)
    context "Addition" $ do
        it "tests addition of two positives" $ do
            intExp (Op2 "+" (Real 1.0) (Real 1.0)) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R 2.0)
        it "tests addition of two negatives" $ do
            intExp (Op2 "+" (Real (-5.0)) (Real (-5.0))) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R (-10.0))
        it "tests addition of a positive and negative" $ do
            intExp (Op2 "+" (Real 5.0) (Real (-5.0))) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R 0.0)
    context "Subtraction" $ do
        it "tests subtraction of two positives" $ do
            intExp (Op2 "-" (Real 1.0) (Real 1.0)) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R 0.0)
        it "tests subtraction of two negatives" $ do
            intExp (Op2 "-" (Real (-5.0)) (Real (-5.0))) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R 0.0)
        it "tests subtraction of a positive and negative" $ do
            intExp (Op2 "-" (Real 5.0) (Real (-5.0))) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R 10.0)
    context "Mulitplication" $ do
        it "tests mulitplication of two positives" $ do
            intExp (Op2 "*" (Real 1.0) (Real 1.0)) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R 1.0)
        it "tests mulitplication of two negatives" $ do
            intExp (Op2 "*" (Real (-5.0)) (Real (-5.0))) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R 25.0)
        it "tests mulitplication of a positive and negative" $ do
            intExp (Op2 "*" (Real 5.0) (Real (-5.0))) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R (-25.0))
    context "Division" $ do
        it "tests division of two positives" $ do
            intExp (Op2 "/" (Real 1.0) (Real 1.0)) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R 1.0)
        it "tests division of two negatives" $ do
            intExp (Op2 "/" (Real (-5.0)) (Real (-5.0))) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R 1.0)
        it "tests division of a positive and negative" $ do
            intExp (Op2 "/" (Real 5.0) (Real (-5.0))) ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R (-1.0))
    context "Variable Interpretation" $ do
        it "tests interpretation of a variable's value" $ do
            intExp (Var "test1") ([Map.fromList [("test1", ("Real", R 1.0))]]) `shouldBe` (R 1.0)



  -- UNIT TESTS FOR intBoolExp
  describe "intBoolExp" $ do
    context "Literals" $ do
        it "tests True as a literal" $ do
            intBoolExp (True_C) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B True)
        it "tests False as a literal" $ do
            intBoolExp (False_C) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B False)
    context "Not" $ do
        it "tests negation of True" $ do
            intBoolExp (Not True_C) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B False)
        it "tests negation of False" $ do
            intBoolExp (Not False_C) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B True)
    context "And" $ do
        it "tests and on True and False" $ do
            intBoolExp (OpB "and" True_C False_C) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B False)
        it "tests and on False and False" $ do
            intBoolExp (OpB "and" False_C False_C) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B False)
        it "tests and on True and True" $ do
            intBoolExp (OpB "and" True_C True_C) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B True)
    context "Or" $ do
        it "tests or on True or False" $ do
            intBoolExp (OpB "or" True_C False_C) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B True)
        it "tests or on False or False" $ do
            intBoolExp (OpB "or" False_C False_C) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B False)
        it "tests or on True or True" $ do
            intBoolExp (OpB "or" True_C True_C) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B True)
    context "Less Than" $ do
        it "tests less than on a larger float value" $ do
            intBoolExp (Comp "<" (Real 1.0) (Real 10.0)) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B True)
        it "tests less than on a smaller float value" $ do
            intBoolExp (Comp "<" (Real 1.0) (Real 0.0)) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B False)
        it "tests less than on same float value" $ do
            intBoolExp (Comp "<" (Real 1.0) (Real 1.0)) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B False)
    context "Less Than Equal" $ do
        it "tests less than equal on a larger float value" $ do
            intBoolExp (Comp "<=" (Real 1.0) (Real 10.0)) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B True)
        it "tests less than equal on a smaller float value" $ do
            intBoolExp (Comp "<=" (Real 1.0) (Real 0.0)) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B False)
        it "tests less than equal on same float value" $ do
            intBoolExp (Comp "<=" (Real 1.0) (Real 1.0)) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B True)
    context "Greater Than" $ do
        it "tests greater than on a larger float value" $ do
            intBoolExp (Comp ">" (Real 1.0) (Real 10.0)) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B False)
        it "tests greater than on a smaller float value" $ do
            intBoolExp (Comp ">" (Real 1.0) (Real 0.0)) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B True)
        it "tests greater than on same float value" $ do
            intBoolExp (Comp ">" (Real 1.0) (Real 1.0)) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B False)
    context "Greater Than Equal" $ do
        it "tests greater than equal on a larger float value" $ do
            intBoolExp (Comp ">=" (Real 1.0) (Real 10.0)) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B False)
        it "tests greater than equal on a smaller float value" $ do
            intBoolExp (Comp ">=" (Real 1.0) (Real 0.0)) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B True)
        it "tests greater than equal on same float value" $ do
            intBoolExp (Comp ">=" (Real 1.0) (Real 1.0)) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B True)
    context "Variable Interpretation" $ do
        it "tests interpretation of a variable's value" $ do
            intBoolExp (Var_B "test1") ([Map.fromList [("test1", ("Boolean", B False))]]) `shouldBe` (B False)
            intBoolExp (Var_B "test1") ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B True)

  -- UNIT TESTS FOR intGenExpVal
  describe "intGenExpVal" $ do
    context "Float Expressions" $ do
        it "tests float expresssions" $ do
            intGenExpVal (FloatExp (Real 5.0)) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (R 5.0)
    context "Boolean Expressions" $ do
        it "tests boolean expresssions" $ do
            intGenExpVal (BExp True_C) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` (B True)


  -- UNIT TESTS FOR intGenExpType
  describe "intGenExpType" $ do
    context "Float Expressions" $ do
        it "tests float expresssions" $ do
            intGenExpType (FloatExp (Real 5.0)) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` "Real"
    context "Boolean Expressions" $ do    
        it "tests boolean expresssions" $ do
            intGenExpType (BExp True_C) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` "Boolean"


  -- UNIT TESTS FOR intDeclareVal
  describe "intDeclareVal" $ do
    context "Float Expressions" $ do
        it "tests float expresssions" $ do
            intDeclareVal (REAL) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` R 0.0
    context "Boolean Expressions" $ do
        it "tests boolean expresssions" $ do
            intDeclareVal (BOOL) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` B False
    context "String Expressions" $ do
        it "tests string expresssions" $ do
            intDeclareVal (STRING) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` S ""


  -- UNIT TESTS FOR intDeclareType
  describe "intDeclareType" $ do
    context "Float Expressions" $ do
        it "tests float expresssions" $ do
            intDeclareType (REAL) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` "Real"
    context "Boolean Expressions" $ do
        it "tests boolean expresssions" $ do
            intDeclareType (BOOL) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` "Boolean"
    context "String Expressions" $ do
        it "tests string expresssions" $ do
            intDeclareType (STRING) ([Map.fromList [("test1", ("Boolean", B True))]]) `shouldBe` "String"



  -- UNIT TESTS FOR intStatement
  describe "intStatement" $ do
    context "Float Expressions" $ do
        it "tests assignment of float" $ do
            intStatement (Assign "test2" (FloatExp (Real 10.0))) ([Map.fromList [("test1", ("Real", R 5.0))]]) `shouldBe` ("", [Map.fromList [("test1", ("Real", R 5.0)), ("test2", ("Real", R 10.0))]])
        it "tests writeln of float" $ do
            intStatement (Write (FloatExp (Real 10.0))) ([Map.fromList [("test1", ("Real", R 5.0))]]) `shouldBe` ("10.0\n", [Map.fromList [("test1", ("Real", R 5.0))]])

    context "Boolean Expressions" $ do
        it "tests assignment of boolean" $ do
            intStatement (Assign "test2" (BExp True_C)) ([Map.fromList [("test1", ("Real", R 5.0))]]) `shouldBe` ("", [Map.fromList [("test1", ("Real", R 5.0)), ("test2", ("Boolean", B True))]])
        it "tests writeln of boolean" $ do
            intStatement (Write (BExp True_C)) ([Map.fromList [("test1", ("Real", R 5.0))]]) `shouldBe` ("True\n", [Map.fromList [("test1", ("Real", R 5.0))]])
    
    context "Special Expressions" $ do
        it "tests assignment of special" $ do
            intStatement (Assign "test2" (FloatExp (Op1 "cos" (Real 3.14159265)))) ([Map.fromList [("test1", ("Real", R 5.0))]]) `shouldBe` ("", [Map.fromList [("test1", ("Real", R 5.0)), ("test2", ("Real", R (-1.0)))]])
        it "tests writeln of special" $ do    
            intStatement (Write (FloatExp (Op1 "cos" (Real 3.14159265)))) ([Map.fromList [("test1", ("Real", R 5.0))]]) `shouldBe` ("-1.0\n", [Map.fromList [("test1", ("Real", R 5.0))]])
    
    context "Literal Writeln" $ do
        it "tests writeln of literal" $ do
            intStatement (WriteLiteral "This is a test") ([Map.fromList [("test1", ("Real", R 5.0))]]) `shouldBe` ("This is a test\n", [Map.fromList [("test1", ("Real", R 5.0))]])

   