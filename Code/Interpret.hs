module Interpret 
(
    interpret,
    intExp,
    intBoolExp,
    intGenExp,
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

intExp :: Exp -> Map.Map String Value -> Value
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

intBoolExp :: BoolExp -> Map.Map String Value -> Value
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

intGenExp :: GenExp -> Map.Map String Value -> Value
intGenExp (FloatExp e1) m = (intExp e1 m)
intGenExp (BExp e1) m = (intBoolExp e1 m)

intStatement :: Statement -> Map.Map String Value -> Map.Map String Value
intStatement (Assign varName value) m = (putVal m varName (intGenExp value m))
-- intStatement (Block innerCode) m = interpret innerCode
-- intStatement (If conditional code) m = do
--     if(toBool(intBoolExp(conditional m)))
--         then interpret 

intWriteln:: Statement -> Map.Map String Value -> String
intWriteln (Write value) m = toString(intGenExp value m)
intWriteln _ _ = error "Invalid Writeln"


interpret :: Program -> String
interpret [x] = ""
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
    