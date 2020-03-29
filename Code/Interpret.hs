module Interpret 
(
    interpret,
    interpretStart,
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
import qualified Data.Map.Strict as Map
import Debug.Trace
import Data.Maybe (isNothing)
import Text.Read (readMaybe)

-- TODO: define auxiliary functions to aid interpretation
-- Feel free to put them here or in different modules
-- Hint: write separate evaluators for numeric and
-- boolean expressions and for statements


uniOp1 :: String -> Float -> Float
uniOp1 "-" v1 = (-v1)
uniOp1 "sqrt" v1 = sqrt v1
uniOp1 "ln" v1 = log v1
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
-- intExp (Var s) = 
intExp (Op1 op e1) = uniOp1 op (intExp e1)
intExp (Op2 op e1 e2) = biOp2 op (intExp e1) (intExp e2)

uniBoolOp1 :: String -> Bool -> Bool
uniBoolOp1 "not" True = False
uniBoolOp1 "not" False = True

biBoolOp2 :: String -> Bool -> Bool -> Bool
biBoolOp2 "and" b1 b2 = b1 && b2
biBoolOp2 "or" b1 b2 = b1 || b2

relationalOp2 :: String -> Float -> Float -> Bool
relationalOp2 "=" b1 b2 = b1 == b2
relationalOp2 "<" b1 b2 = b1 < b2
relationalOp2 ">" b1 b2 = b1 > b2
relationalOp2 "<=" b1 b2 = b1 <= b2
relationalOp2 ">=" b1 b2 = b1 >= b2

intBoolExp :: BoolExp -> Bool 
intBoolExp True_C = True
intBoolExp False_C = False
intBoolExp (Not e1) = uniBoolOp1 "not" (intBoolExp e1) 
intBoolExp (OpB op e1 e2) = biBoolOp2 op (intBoolExp e1) (intBoolExp e2) 
intBoolExp (Comp op e1 e2) = relationalOp2 op (intExp e1) (intExp e2) 

-- intDefinition :: [String] -> VType -> String
-- intDefinition (VarDef varNames varTypes) = 

mapToExp :: Exp -> [Map.Map String (String, String)] -> String
mapToExp (Real x)  m = (show x)
mapToExp (Op2 op e1 e2) m = show(intExp (Op2 op e1 e2))
mapToExp (Var s) m = let f = (Map.lookup s (head m)) in 
                            case f of
                            Just f -> (snd f)
                            Nothing -> mapToExp (Var s) (tail m)
mapToExp (Var s) [m] = let f = (Map.lookup s m) in 
                            case f of
                            Just f -> (snd f)
                            Nothing -> error("Variable " ++ s ++ " is not in scope")

-- strToBoolExp :: String -> BoolExp
-- strToBoolExp s = case readMaybe s :: Maybe Bool of
--     Just b -> Boolean b
--     Nothing -> Var_B s

-- make sure you write test unit cases for all functions


interpret :: Program -> String
-- TODO: write the interpreter
interpret [] = "";
interpret program = interpretStart program [Map.empty]

interpretStart :: Program -> [Map.Map String (String, String)] -> String
interpretStart [] m = "";
interpretStart (program:programs) m = let current = interpretStatement program m in
    (fst current) ++ (interpretStart programs $ snd current)

-- Variable name, (variable type, variable value)
interpretStatement :: Statement -> [Map.Map String (String, String)] -> (String, [Map.Map String (String, String)]) -- current statement evaluated  plus scope
interpretStatement (Write a) m = case a of 
    FloatExp expression -> let eval = mapToExp expression m in 
        ("writeln: >> " ++ eval ++ "\n", m)

interpretStatement (Assign a b) m = case b of 
    FloatExp expression -> let eval = mapToExp expression m in 
       (a ++ " is assigned the value " ++ eval ++ "\n", Map.insert a ("Real", eval) (head m) : tail m)