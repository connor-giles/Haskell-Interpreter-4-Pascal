-- Look at how testing is set up in FORTH project and emulate here
-- Make sure you unit test every function you write
import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Interpret
import Data 


main :: IO ()
main = hspec $ do
  describe "biOp1" $ do
    context "-" $ do
        it "Negates Floats Literally" $ do
            biOp1 "-" 2.0 `shouldBe` (-2.0)


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
    context "+" $ do
        it "Adds Floats" $ do
            intExp (Op2 "+" (Real 2.0) (Real 3.0)) `shouldBe` 5.0