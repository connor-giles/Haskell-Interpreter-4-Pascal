module Interpret 
(
    interpret,
    intExp,
    intBoolExp,
    intGenExpVal,
    intGenExpType,
    intStatement,
    intWriteln
)
where

import Data


import qualified Data.Map.Strict as Map
--import Data.Maybe()
--import Text.Read()

-- TODO: define auxiliary functions to aid interpretation
-- Feel free to put them here or in different modules
-- Hint: write separate evaluators for numeric and
-- boolean expressions and for statements

-- Pascal: Prelude.head: empty list likely means the variable name is wrong in test file

intExp :: Exp -> Map.Map String (String, Value) -> Value
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

intBoolExp :: BoolExp -> Map.Map String (String, Value) -> Value
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

intGenExpVal :: GenExp -> Map.Map String (String, Value) -> Value
intGenExpVal (FloatExp e1) m = (intExp e1 m)
intGenExpVal (BExp e1) m = (intBoolExp e1 m)

intGenExpType :: GenExp -> Map.Map String (String, Value) -> String
intGenExpType (FloatExp _) _ = "Real"
intGenExpType (BExp _) _ = "Boolean"

intStatement :: Statement -> Map.Map String (String, Value) -> Map.Map String (String, Value)
intStatement (Assign varName value) m = (putVal m varName ((intGenExpType value m),(intGenExpVal value m)))
-- intStatement (Block innerCode) m = interpret innerCode
-- intStatement (If conditional code) m = do
--     if(toBool(intBoolExp(conditional m)))
--         then interpret 

intWriteln:: Statement -> Map.Map String (String, Value) -> String
intWriteln (Write value) m = toString(intGenExpVal value m)
intWriteln _ _ = error "Invalid Writeln"


-- interpretStart :: [Statement] -> Map.Map String Value -> String
-- interpretStart (x:xs) m = let current = intStatement x m in
--     (fst current) ++ (interpretStart xs (snd current))


interpret :: Program -> String
-- interpret x = interpretStart x Map.empty
interpret _ = error "Invalid Program"
--interpret program = interpretStart program [Map.empty]

    


-- =======TODO=======
-- Either parse the program name and print what program is running or just ignore it like you are currently doing
-- Get variable declarations/definitions working
-- Get Boolean/Logical Expressions to work
-- Get Decision Making to work
-- Get special expressions to evauluate
-- Get while-do and for-do loops to work
-- Get break and continue keywords to work
-- Get user defined procedures and functions to work
-- Implement Scoping
    