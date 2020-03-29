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

intExpVar :: String -> [Map.Map String (String, String)] -> Float
intExpVar s m = let f = (Map.lookup s (head m)) in
                        case f of
                        Just f -> (read(snd f))
                        Nothing -> intExpVar s (tail m)

intBoolExpVar :: String -> [Map.Map String (String, String)] -> Bool
intBoolExpVar s m = let f = (Map.lookup s (head m)) in
                        case f of
                        Just f -> (read(snd f))
                        Nothing -> intBoolExpVar s (tail m)

intExp :: Exp -> [Map.Map String (String, String)] -> Float
intExp (Real v1) m = v1
intExp (Var s) m = intExpVar s m
intExp (Op1 op e1) m = uniOp1 op (intExp e1 m)
intExp (Op2 op e1 e2) m = biOp2 op (intExp e1 m) (intExp e2 m)


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

intBoolExp :: Exp -> [Map.Map String (String, String)] -> Bool 
intBoolExp True_C m = True
intBoolExp False_C m = False
intBoolExp (Var s) m = intBoolExpVar s m
intBoolExp (Not e1) m = uniBoolOp1 "not" (intBoolExp e1 m) 
intBoolExp (Op2 op e1 e2) m = biBoolOp2 op (intBoolExp e1 m) (intBoolExp e2 m) 
intBoolExp (Op2 op e1 e2) m = relationalOp2 op (intExp e1 m) (intExp e2 m) 

-- intDefinition :: [String] -> VType -> String
-- intDefinition (VarDef varNames varTypes) = 

mapToExp :: Exp -> [Map.Map String (String, String)] -> String
mapToExp (Real x)  m = (show x)
mapToExp (Op2 op e1 e2) m = (show(intExp (Op2 op e1 e2) m))
mapToExp (Var s) m = let f = (Map.lookup s (head m)) in 
                            case f of
                            Just f -> (snd f)
                            Nothing -> mapToExp (Var s) (tail m)
mapToExp (Var s) [m] = let f = (Map.lookup s m) in 
                            case f of
                            Just f -> (snd f)
                            Nothing -> error("Variable " ++ s ++ " is not in scope")



-- make sure you write test unit cases for all functions


interpret :: Program -> String
-- TODO: write the interpreter
interpret [] = "";
interpret program = interpretStart program [Map.empty]

interpretStart :: Program -> [Map.Map String (String, String)] -> String
interpretStart [] m = ""
interpretStart (program:programs) m = let current = interpretStatement program m in
    (fst current) ++ (interpretStart programs $ snd current)

-- Variable name, (variable type, variable value)
interpretStatement :: Statement -> [Map.Map String (String, String)] -> (String, [Map.Map String (String, String)]) -- current statement evaluated  plus scope
interpretStatement (Write a) m = case a of 
    GExp expression -> let eval = mapToExp expression m in
            ("writeln: >> " ++ eval ++ "\n", m)

interpretStatement (Assign a b) m = case b of 
    GExp expression -> let eval = mapToExp expression m in 
       (a ++ " is assigned the value " ++ eval ++ "\n", Map.insert a ("Real", eval) (head m) : tail m)
       