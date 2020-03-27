-- Look at how testing is set up in FORTH project and emulate here
-- Make sure you unit test every function you write
import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Interpret
import Data 


main :: IO ()
main = hspec $ do
  describe "uniOp1" $ do
    context "-" $ do
        it "Negates Floats Literally" $ do
            uniOp1 "-" 2.0 `shouldBe` (-2.0)
    context "sqrt" $ do
        it "Performs sqrt Literally" $ do
            uniOp1 "sqrt" 9.0 `shouldBe` 3.0
    context "natlog" $ do
        it "Performs natural log Literally" $ do
            uniOp1 "natlog" 2.718 `shouldBe` 0.999896315728952
    context "sin" $ do
        it "Performs sin Literally" $ do
            uniOp1 "sin" 1.57079633 `shouldBe` 1.0
    context "cos" $ do
        it "Performs cos Literally" $ do
            uniOp1 "cos" 3.14159265 `shouldBe` (-1.0)
    context "exp" $ do
        it "Performs exp Literally" $ do
            uniOp1 "exp" 1.0 `shouldBe` 2.7182817


  describe "biOp2" $ do
    context "+" $ do
        it "Adds Floats Literally" $ do
            biOp2 "+" 2.0 3.0 `shouldBe` 5.0
    context "-" $ do
        it "Subtracts Floats Literally" $ do
            biOp2 "-" 10.0 3.0 `shouldBe` 7.0
    context "*" $ do 
        it "Multiplies Floats Literally" $ do
            biOp2 "*" 2.0 3.0 `shouldBe` 6.0
    context "/" $ do
        it "Divides Floats Literally" $ do
            biOp2 "/" 10.0 5.0 `shouldBe` 2.0


  describe "intExp" $ do
    context "Float Literal" $ do
        it "5.0 Literal" $ do
            intExp (Real 5.0) `shouldBe` 5.0
    context "Negation" $ do
        it "Negates Floats from AST" $ do
            intExp (Op1 "-" (Real 2.0)) `shouldBe` (-2.0)
    context "sqrt" $ do
        it "Calculates sqrt from AST" $ do
            intExp (Op1 "sqrt" (Real 9.0)) `shouldBe` 3.0
    context "natlog" $ do
        it "Calculates natlog from AST" $ do
            intExp (Op1 "natlog" (Real 2.718)) `shouldBe` 0.999896315728952
    context "sin" $ do
        it "Calculates sin from AST" $ do
            intExp (Op1 "sin" (Real 1.57079633)) `shouldBe` 1.0
    context "cos" $ do
        it "Calculates cos from AST" $ do
            intExp (Op1 "cos" (Real 3.14159265)) `shouldBe` -(1.0)
    context "exp" $ do
        it "Calculates exp from AST" $ do
            intExp (Op1 "exp" (Real 1.0)) `shouldBe` 2.7182817
    context "+" $ do
        it "Adds Floats from AST" $ do
            intExp (Op2 "+" (Real 2.0) (Real 3.0)) `shouldBe` 5.0
    context "-" $ do
        it "Subtracts Floats from AST" $ do
            intExp (Op2 "-" (Real 10.0) (Real 3.0)) `shouldBe` 7.0
    context "*" $ do
        it "Multiplies Floats from AST" $ do
            intExp (Op2 "*" (Real 2.0) (Real 3.0)) `shouldBe` 6.0
    context "/" $ do
        it "Divides Floats from AST" $ do
            intExp (Op2 "/" (Real 10.0) (Real 5.0)) `shouldBe` 2.0

  
  describe "uniBoolOp1" $ do
    context "Not" $ do
        it "Negates True Literally" $ do
            uniBoolOp1 "NOT" True `shouldBe` (False)
        it "Negates False Literally" $ do
            uniBoolOp1 "NOT" False `shouldBe` (True)   

  describe "biBoolOp2" $ do
    context "AND" $ do
        it "Tests AND Literally" $ do
            biBoolOp2 "AND" True False  `shouldBe` (False)
    context "OR" $ do
        it "Tests OR Literally" $ do
            biBoolOp2 "OR" True False  `shouldBe` (True) 


  describe "relationalOp2" $ do
    context "=" $ do
        it "Tests Equality Literally" $ do
            relationalOp2 "=" 6.0 6.0  `shouldBe` (True)
    context "<" $ do
        it "Tests Less Than Literally" $ do
            relationalOp2 "<" 5.0 6.0  `shouldBe` (True)
    context ">" $ do
        it "Tests Greater Than Literally" $ do
            relationalOp2 ">" 5.0 6.0  `shouldBe` (False)  
    context "<=" $ do
        it "Tests Less Than or Equal Literally" $ do
            relationalOp2 "<=" 10.0 10.0  `shouldBe` (True) 
    context ">=" $ do
        it "Tests Greater Than or Equal Literally" $ do
            relationalOp2 ">=" 36.0 55.5  `shouldBe` (False) 


  describe "intBoolExp" $ do
    context "=" $ do
        it "Tests Equality from AST" $ do
            intBoolExp (Comp "=" (Real 3.0) (Real 3.0)) `shouldBe` True
    context "<" $ do
        it "Tests Less Than from AST" $ do
            intBoolExp (Comp "<" (Real 2.0) (Real 3.0)) `shouldBe` True
    context ">" $ do
        it "Tests Greater Than from AST" $ do
            intBoolExp (Comp ">" (Real 2.0) (Real 3.0)) `shouldBe` False
    context "<=" $ do
        it "Tests Less Than or Equal from AST" $ do
            intBoolExp (Comp "<=" (Real 3.0) (Real 3.0)) `shouldBe` True
    context ">=" $ do
        it "Tests Greater Than or Equal from AST" $ do
            intBoolExp (Comp ">=" (Real 2.0) (Real 3.0)) `shouldBe` False
    context "Not" $ do
        it "Tests Not" $ do
            intBoolExp (Not (Comp "<" (Real 2.0 ) (Real 3.0))) `shouldBe` False
            intBoolExp (Not True_C) `shouldBe` False
            intBoolExp (Not False_C) `shouldBe` True
    context "AND" $ do
        it "Tests AND" $ do
            intBoolExp (OpB "AND" True_C False_C) `shouldBe` False
            intBoolExp (OpB "AND" True_C True_C) `shouldBe` True
    context "OR" $ do
        it "Tests OR" $ do
            intBoolExp (OpB "OR" True_C False_C) `shouldBe` True
            intBoolExp (OpB "OR" False_C False_C) `shouldBe` False
            

