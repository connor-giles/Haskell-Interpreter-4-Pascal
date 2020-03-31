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
  describe "intExp" $ do
    context "Literals" $ do
        it "tests 5.0 as a literal" $ do
            intExp (Real 5.0) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R 5.0)
        it "tests -5.0 as a literal" $ do
            intExp (Real (-5.0)) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R (-5.0))
    context "Negation" $ do
        it "tests positives negated" $ do
            intExp (Op1 "-" (Real 5.0)) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R (-5.0)) 
        it "tests negatives negated" $ do
            intExp (Op1 "-" (Real (-5.0))) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R 5.0)
    context "Square Root" $ do
        it "tests square root of 9.0" $ do
            intExp (Op1 "sqrt" (Real 9.0)) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R 3.0)
    context "Natural Log" $ do
        it "tests natural log of e" $ do
            intExp (Op1 "ln" (Real 2.718)) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R 0.999896315728952)
    context "Sine" $ do
        it "tests sin of pi/2" $ do
            intExp (Op1 "sin" (Real 1.57079633)) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R 1.0)
    context "Cosine" $ do
        it "tests cos of pi" $ do
            intExp (Op1 "cos" (Real 3.14159265)) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R (-1.0))
    context "Exponential" $ do
        it "tests exponetial of 1.0" $ do
            intExp (Op1 "exp" (Real 1.0)) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R 2.7182817)
    context "Addition" $ do
        it "tests addition of two positives" $ do
            intExp (Op2 "+" (Real 1.0) (Real 1.0)) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R 2.0)
        it "tests addition of two negatives" $ do
            intExp (Op2 "+" (Real (-5.0)) (Real (-5.0))) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R (-10.0))
        it "tests addition of a positive and negative" $ do
            intExp (Op2 "+" (Real 5.0) (Real (-5.0))) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R 0.0)
    context "Subtraction" $ do
        it "tests subtraction of two positives" $ do
            intExp (Op2 "-" (Real 1.0) (Real 1.0)) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R 0.0)
        it "tests subtraction of two negatives" $ do
            intExp (Op2 "-" (Real (-5.0)) (Real (-5.0))) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R 0.0)
        it "tests subtraction of a positive and negative" $ do
            intExp (Op2 "-" (Real 5.0) (Real (-5.0))) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R 10.0)
    context "Mulitplication" $ do
        it "tests mulitplication of two positives" $ do
            intExp (Op2 "*" (Real 1.0) (Real 1.0)) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R 1.0)
        it "tests mulitplication of two negatives" $ do
            intExp (Op2 "*" (Real (-5.0)) (Real (-5.0))) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R 25.0)
        it "tests mulitplication of a positive and negative" $ do
            intExp (Op2 "*" (Real 5.0) (Real (-5.0))) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R (-25.0))
    context "Division" $ do
        it "tests division of two positives" $ do
            intExp (Op2 "/" (Real 1.0) (Real 1.0)) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R 1.0)
        it "tests division of two negatives" $ do
            intExp (Op2 "/" (Real (-5.0)) (Real (-5.0))) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R 1.0)
        it "tests division of a positive and negative" $ do
            intExp (Op2 "/" (Real 5.0) (Real (-5.0))) (Map.fromList [("test1", R 1.0)]) `shouldBe` (R (-1.0))
    context "Variable Interpretation" $ do
        it "tests interpretation of a variable's value" $ do
            intExp (Var "test1") (Map.fromList [("test1", R 1.0)]) `shouldBe` (R 1.0)