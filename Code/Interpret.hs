module Interpret 
(
    interpret,
    biOp2,
    biOp1,
    intExp
)
where

import Data

-- TODO: define auxiliary functions to aid interpretation
-- Feel free to put them here or in different modules
-- Hint: write separate evaluators for numeric and
-- boolean expressions and for statements

--THIS IS LIKELY WHERE YOU WILL INTERPRET THE INFO
biOp1 :: String -> Float -> Float
biOp1 "-" v1 = (-v1)

biOp2 :: String -> Float -> Float -> Float
biOp2 "+" v1 v2 = v1 + v2
biOp2 "-" v1 v2 = v1 - v2
biOp2 "*" v1 v2 = v1 * v2
biOp2 "/" v1 v2 = v1 / v2

intExp :: Exp -> Float
intExp (Real v1) = v1 
intExp (Op2 op e1 e2) = biOp2 op (intExp e1) (intExp e2)

-- make sure you write test unit cases for all functions

interpret :: Program -> String
-- TODO: write the interpreter
interpret _ = "Not implemented"