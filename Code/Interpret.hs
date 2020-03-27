module Interpret 
(
    interpret,
    uniOp1,
    biOp2,
    intExp,
    uniBoolOp1,
    biBoolOp2,
    relationalOp2,
    intBoolExp
)
where

import Data

-- TODO: define auxiliary functions to aid interpretation
-- Feel free to put them here or in different modules
-- Hint: write separate evaluators for numeric and
-- boolean expressions and for statements


-- TODO
-- Test NOT from AST
-- Test AND / OR from AST


uniOp1 :: String -> Float -> Float
uniOp1 "-" v1 = (-v1)
uniOp1 "sqrt" v1 = sqrt v1
uniOp1 "natlog" v1 = log v1
uniOp1 "sin" v1 = sin v1
uniOp1 "cos" v1 = cos v1
uniOp1 "exp" v1 = exp v1

biOp2 :: String -> Float -> Float -> Float
biOp2 "+" v1 v2 = v1 + v2
biOp2 "-" v1 v2 = v1 - v2
biOp2 "*" v1 v2 = v1 * v2
biOp2 "/" v1 v2 = v1 / v2

intExp :: Exp -> Float
intExp (Real v1) = v1 
intExp (Op1 op e1) = uniOp1 op (intExp e1)
intExp (Op2 op e1 e2) = biOp2 op (intExp e1) (intExp e2)

uniBoolOp1 :: String -> Bool -> Bool
uniBoolOp1 "NOT" True = False
uniBoolOp1 "NOT" False = True

biBoolOp2 :: String -> Bool -> Bool -> Bool
biBoolOp2 "AND" b1 b2 = b1 && b2
biBoolOp2 "OR" b1 b2 = b1 || b2

relationalOp2 :: String -> Float -> Float -> Bool
relationalOp2 "=" b1 b2 = b1 == b2
relationalOp2 "<" b1 b2 = b1 < b2
relationalOp2 ">" b1 b2 = b1 > b2
relationalOp2 "<=" b1 b2 = b1 <= b2
relationalOp2 ">=" b1 b2 = b1 >= b2

intBoolExp :: BoolExp -> Bool 
intBoolExp True_C = True
intBoolExp False_C = False
--intBoolExp (Not e1) = uniBoolOp1 (intBoolExp e1) THIS WILL TEST NOT IN AST
--intBoolExp (OpB op e1 e2) = biBoolOp2 op (intBoolExp e1) (intBoolExp e2) THIS WILL TEST AND/OR IN AST
intBoolExp (OpN op e1 e2) = relationalOp2 op (intExp e1) (intExp e2) 

-- make sure you write test unit cases for all functions

interpret :: Program -> String
-- TODO: write the interpreter
interpret _ = "Not implemented"