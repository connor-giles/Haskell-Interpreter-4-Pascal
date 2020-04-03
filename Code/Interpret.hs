module Interpret 
(
    interpret,
    intStart,
    intExp,
    intBoolExp,
    intGenExpVal,
    intGenExpType,
    intStatement,
    intDeclareVal,
    intDeclareType
)
where

import Data


import qualified Data.Map.Strict as Map

-- TODO: define auxiliary functions to aid interpretation
-- Feel free to put them here or in different modules
-- Hint: write separate evaluators for numeric and
-- boolean expressions and for statements

-- Pascal: Prelude.head: empty list likely means the variable name is wrong in test file

multiAssign :: [String] -> [String] -> [Map.Map String (String, Value)] -> [Map.Map String (String, Value)]
multiAssign (x:xs) (y:ys) m = 
    let (_, newMap) = intStatement (Assign x (valToGenExp (retrieveVal m y ))) m in
        (multiAssign xs ys newMap)

multiAssign _ _ m = m


intExp :: Exp -> [Map.Map String (String, Value)] -> Value

intExp (FunCall name exps) m = 
        let stack = retrieveVal m name in
            let newMap = multiAssign (fst (toStatements stack)) exps m in
                let (_, updatedMap) = intBlock (snd (toStatements stack)) newMap in  
                    (retrieveVal updatedMap name)

            
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


intDeclareVal :: VType -> [Map.Map String (String, Value)] -> Value
intDeclareVal (REAL) _ = R 0.0
intDeclareVal (BOOL) _ = B False
intDeclareVal (STRING) _ = S ""


intDeclareType :: VType -> [Map.Map String (String, Value)] -> String
intDeclareType (REAL) _ = "Real"
intDeclareType (BOOL) _ = "Boolean"
intDeclareType (STRING) _ = "String"


intBlock :: [Statement] -> [Map.Map String (String, Value)] -> (String, [Map.Map String (String, Value)])
intBlock [] [] = ("" , [Map.empty])
intBlock [] m = ("" , m)

intBlock (s:ss) m = 
    let curr = intStatement s m in
        (fst curr ++ fst (intBlock ss (snd curr)), snd(intBlock ss (snd curr)))  
       


intStart :: Program -> [Map.Map String (String, Value)] -> String
intStart ([]) _ = "" 

intStart(x:xs) mapName = let curr = intStatement x mapName in
    (fst curr) ++ (intStart (xs) $ snd curr)


intStatement :: Statement -> [Map.Map String (String, Value)] -> (String, [Map.Map String (String, Value)])


intStatement (Write value) m = (toString(intGenExpVal value m) ++ "\n", m)
intStatement (WriteLiteral value) m = (value ++ "\n", m)

intStatement (VarDef [] _) _ = ("", [Map.empty]) 
intStatement (VarDef (s:ss) varType) m = 
    let curr = putVal m s ((intDeclareType varType m),(intDeclareVal varType m)) in
        (intStatement (VarDef ss varType) curr)


intStatement (Assign varName value) m = ("" , putVal m varName ((intGenExpType value m),(intGenExpVal value m)))

intStatement (If b ifStatement elseStatment) m = do  
    if(toBool(intBoolExp b m))
        then intBlock ifStatement m
        else intBlock elseStatment m

intStatement (Block s) m = (intBlock s m)

intStatement (While b s) m = do
    if (toBool(intBoolExp b m))
        then 
            let (output, newMap) = intBlock s m in 
                let update = intStatement (While b s) newMap in
                    (output ++ fst update, m)
    else ("" , m)

intStatement (For varName startVal endVal s) m = 
    let (_, newMap) = intStatement (Assign varName startVal) m in 
            if (toBool (intBoolExp(Comp "<="  (Var varName) endVal) newMap)) then 
                let (output, updatedMap) = intBlock s newMap in
                    let nextValue = intExp(Op2 "+" (genExpToExp startVal updatedMap) (Real 1.0)) updatedMap in
                        let update = intStatement (For varName (valToGenExp nextValue) endVal s) updatedMap in
                            (output ++ fst update, m)
            else ("" , m)


--[Map.Map String (String, Value)] -> String -> (String, Value) 


intStatement (Function fName decs _ ft fs) m = ("", putVal m fName ((intDeclareType ft m), (F (decs, fs)) )) -- returns a map with the Fucntion and its list of statements

    --let ( _, newMap) = intStatement (VarDef decs dect) m in
       -- ("", putVal m fName ((intDeclareType ft m), (F (decs, fs)) )) -- returns a map with the Fucntion and its list of statements






interpret :: Program -> String
interpret [] = "";
interpret x = intStart x [Map.empty]

    


-- =======TODO=======
-- Get break and continue keywords to work
-- Get user defined procedures and functions to work