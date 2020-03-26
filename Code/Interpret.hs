module Interpret 
(
    interpret,
    biOp2,
    uniOp1,
    biBoolOp1,
    biBoolOp2,
    intExp
)
where

import Data

-- TODO: define auxiliary functions to aid interpretation
-- Feel free to put them here or in different modules
-- Hint: write separate evaluators for numeric and
-- boolean expressions and for statements

--THIS IS LIKELY WHERE YOU WILL INTERPRET THE INFO
uniOp1 :: String -> Float -> Float
uniOp1 "-" v1 = (-v1)

biOp2 :: String -> Float -> Float -> Float
biOp2 "+" v1 v2 = v1 + v2
biOp2 "-" v1 v2 = v1 - v2
biOp2 "*" v1 v2 = v1 * v2
biOp2 "/" v1 v2 = v1 / v2

intExp :: Exp -> Float
intExp (Real v1) = v1 
intExp (Op2 op e1 e2) = biOp2 op (intExp e1) (intExp e2)

biBoolOp1 :: String -> Bool -> Bool
biBoolOp1 "Not" True = False
biBoolOp1 "Not" False = True

biBoolOp2 :: String -> Float -> Float -> Bool
biBoolOp2 "<" b1 b2 = b1 < b2
biBoolOp2 ">" b1 b2 = b1 > b2
biBoolOp2 "<=" b1 b2 = b1 <= b2
biBoolOp2 ">=" b1 b2 = b1 >= b2

intBoolExp :: BoolExp -> Bool 
intBoolExp True_C = True
intBoolExp False_C = False
--intBoolExp (OpB op v1 v2) = bibOp2 op (intExp v1) (intExp v2) 

-- make sure you write test unit cases for all functions

interpret :: Program -> String
-- TODO: write the interpreter
interpret _ = "Not implemented"