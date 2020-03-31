module Interpret 
(
    interpret,
    intExp
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
intExp (Var e1) m = (retrieveVal m e1)
intExp (Op1 "sqrt" e1) m = (R (sqrt (toFloat(intExp e1 m))))
intExp (Op1 "ln" e1) m = (R (log (toFloat(intExp e1 m))))
intExp (Op1 "sin" e1) m = (R (sin (toFloat(intExp e1 m))))
intExp (Op1 "cos" e1) m = (R (cos (toFloat(intExp e1 m))))
intExp (Op1 "exp" e1) m = (R (exp (toFloat(intExp e1 m))))
intExp (Op2 "+" e1 e2) m = (R (toFloat(intExp e1 m) + toFloat(intExp e2 m) ))
intExp (Op2 "_" e1 e2) m = (R (toFloat(intExp e1 m) - toFloat(intExp e2 m) ))
intExp (Op2 "*" e1 e2) m = (R (toFloat(intExp e1 m) * toFloat(intExp e2 m) ))
intExp (Op2 "/" e1 e2) m = (R (toFloat(intExp e1 m) / toFloat(intExp e2 m) ))
intExp _ _ = error "Not Valid intExp"


interpret :: Program -> String
-- TODO: write the interpreter
interpret [] = ""
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
    