-- Look at how testing is set up in FORTH project and emulate here
-- Make sure you unit test every function you write
import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Interpret
import Data 


main :: IO ()
main = hspec $ do
  describe "biOp2" $ do
    context "+" $ do
        it "Adds Floats" $ do
            biOp2 "+" 2.0 3.0 `shouldBe` 5.0
  describe "intExp" $ do
    context "+" $ do
        it "Adds Floats" $ do
            intExp (Op2 "+" (Real 2.0) (Real 3.0)) `shouldBe` 5.0