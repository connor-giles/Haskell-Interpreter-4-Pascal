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
    context "Literal" $ do
        it "5.0 Literal" $ do
            intExp (Real 5.0) `shouldBe` 5.0
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

  
  describe "biBoolOp1" $ do
    context "Not" $ do
        it "Negates True Literally" $ do
            biBoolOp1 "Not" True `shouldBe` (False)
        it "Negates False Literally" $ do
            biBoolOp1 "Not" False `shouldBe` (True)   

  describe "biBoolOp2" $ do
    context "=" $ do
        it "Tests Equality Literally" $ do
            biBoolOp2 "=" 6.0 6.0  `shouldBe` (True)
    context "<" $ do
        it "Tests Less Than Literally" $ do
            biBoolOp2 "<" 5.0 6.0  `shouldBe` (True)
    context ">" $ do
        it "Tests Greater Than Literally" $ do
            biBoolOp2 ">" 5.0 6.0  `shouldBe` (False)  
    context "<=" $ do
        it "Tests Less Than or Equal Literally" $ do
            biBoolOp2 "<=" 10.0 10.0  `shouldBe` (True) 
    context ">=" $ do
        it "Tests Greater Than or Equal Literally" $ do
            biBoolOp2 ">=" 36.0 55.5  `shouldBe` (False) 

  describe "intBoolExp" $ do
    context "=" $ do
        it "Tests Equality from AST" $ do
            intBoolExp (OpN "=" (Real 3.0) (Real 3.0)) `shouldBe` True
    context "<" $ do
        it "Tests Less Than from AST" $ do
            intBoolExp (OpN "<" (Real 2.0) (Real 3.0)) `shouldBe` True
    context ">" $ do
        it "Tests Greater Than from AST" $ do
            intBoolExp (OpN ">" (Real 2.0) (Real 3.0)) `shouldBe` False
    context "<=" $ do
        it "Tests Less Than or Equal from AST" $ do
            intBoolExp (OpN "<=" (Real 3.0) (Real 3.0)) `shouldBe` True
    context ">=" $ do
        it "Tests Greater Than or Equal from AST" $ do
            intBoolExp (OpN ">=" (Real 2.0) (Real 3.0)) `shouldBe` False
            

