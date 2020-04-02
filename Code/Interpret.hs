module Interpret 
(
    interpret,
    intExp,
    intBoolExp,
    intGenExpVal,
    intGenExpType,
    intStatement
)
where

import Data


import qualified Data.Map.Strict as Map

-- TODO: define auxiliary functions to aid interpretation
-- Feel free to put them here or in different modules
-- Hint: write separate evaluators for numeric and
-- boolean expressions and for statements

-- Pascal: Prelude.head: empty list likely means the variable name is wrong in test file

intExp :: Exp -> [Map.Map String (String, Value)] -> Value
intExp (Real e1) _ = (R e1)
intExp (Var v1) m = (retrieveVal m v1)
intExp (Op1 "-" e1) m = (R (-(toFloat(intExp e1 m))))
intExp (Op1 "sqrt" e1) m = (R (sqrt (toFloat(intExp e1 m))))
intExp (Op1 "ln" e1) m = (R (log (toFloat(intExp e1 m))))
intExp (Op1 "sin" e1) m = (R (sin (toFloat(intExp e1 m))))
intExp (Op1 "cos" e1) m = (R (cos (toFloat(intExp e1 m))))
intExp (Op1 "exp" e1) m = (R (exp (toFloat(intExp e1 m))))
intExp (Op2 "+" e1 e2) m = (R (toFloat(intExp e1 m) + toFloat(intExp e2 m) ))
intExp (Op2 "-" e1 e2) m = (R (toFloat(intExp e1 m) - toFloat(intExp e2 m) ))
intExp (Op2 "*" e1 e2) m = (R (toFloat(intExp e1 m) * toFloat(intExp e2 m) ))
intExp (Op2 "/" _ (Real 0.0)) _ = error "Cannot divide by zero"
intExp (Op2 "/" e1 e2) m = (R (toFloat(intExp e1 m) / toFloat(intExp e2 m) ))
intExp _ _ = error "Invalid intExp"

intBoolExp :: BoolExp -> [Map.Map String (String, Value)] -> Value
intBoolExp (True_C) _ = (B True)
intBoolExp (False_C) _ = (B False)
intBoolExp (Var_B v1) m = (retrieveVal m v1)
intBoolExp (Not e1) m = (B (not (toBool(intBoolExp e1 m))))
intBoolExp (OpB "and" e1 e2) m = (B ((toBool(intBoolExp e1 m)) && (toBool(intBoolExp e2 m))))
intBoolExp (OpB "or" e1 e2) m = (B ((toBool(intBoolExp e1 m)) || (toBool(intBoolExp e2 m))))
intBoolExp (Comp ">" e1 e2) m = (B ((toFloat(intExp e1 m)) > (toFloat(intExp e2 m))))
intBoolExp (Comp ">=" e1 e2) m = (B ((toFloat(intExp e1 m)) >= (toFloat(intExp e2 m))))
intBoolExp (Comp "<" e1 e2) m = (B ((toFloat(intExp e1 m)) < (toFloat(intExp e2 m))))
intBoolExp (Comp "<=" e1 e2) m = (B ((toFloat(intExp e1 m)) <= (toFloat(intExp e2 m))))
intBoolExp _ _ = error "Invalid intBoolExp"

intGenExpVal :: GenExp -> [Map.Map String (String, Value)] -> Value
intGenExpVal (FloatExp e1) m = (intExp e1 m)
intGenExpVal (BExp e1) m = (intBoolExp e1 m)
intGenExpVal (VarExp varName) m = (retrieveVal m varName)

intGenExpType :: GenExp -> [Map.Map String (String, Value)] -> String
intGenExpType (FloatExp _) _ = "Real"
intGenExpType (BExp _) _ = "Boolean" 
intGenExpType (VarExp varName) m = (retrieveType m varName)

intStart :: Program -> [Map.Map String (String, Value)] -> String
intStart ([],[]) _ = ""
intStart(_,x:xs) mapName = let curr = intStatement x mapName in
    (fst curr) ++ (intStart ([], xs) $ snd curr)

intStatement :: Statement -> [Map.Map String (String, Value)] -> (String, [Map.Map String (String, Value)])
intStatement (Assign varName value) m = (varName ++ " is assigned a value\n", putVal m varName ((intGenExpType value m),(intGenExpVal value m)))
intStatement (Write value) m = (toString(intGenExpVal value m) ++ "\n", m)
intStatement (WriteLiteral value) m = (value ++ "\n", m)

-- intWriteln :: Statement -> [Map.Map String (String, Value)] -> String
-- intStatement (Write value) m = toString(intGenExpVal value m)
-- intWriteln _ _ = error "Invalid Writeln"

-- intDefinitions :: ([Definition], [Statement]) ->  Map.Map String (String, Value) -> Map.Map String (String, Value)
-- intDefinitions (x, y) m = 


interpret :: Program -> String
interpret ([],[]) = "";
interpret x = intStart x [Map.empty]

    


-- =======TODO=======
-- Get variable declarations/definitions working
-- Get Decision Making to work
-- Get while-do and for-do loops to work
-- Get break and continue keywords to work
-- Get user defined procedures and functions to work
-- Implement Scoping