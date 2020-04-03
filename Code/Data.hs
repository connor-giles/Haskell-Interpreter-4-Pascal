-- This file contains the data-structures for the AST
-- The role of the parser is to build the AST (Abstract Syntax Tree) 

module Data
    (
        Exp(..),
        BoolExp(..),
        Statement(..),
        VType(..),
        --Definition(..),
        GenExp(..),
        Value(..),
        toFloat,
        toBool,
        toString,
        putVal,
        retrieveType,
        retrieveVal,
        valToExp,
        genExpToExp,
        toStatements,
        valToGenExp,
        Program
        
    ) where

import qualified Data.Map.Strict as Map

-- Data-structure for  numeric expressions
data Exp = 
    -- unary operator: Op name expression
    Op1 String Exp
    -- binary operator: Op name leftExpression rightExpression
    | Op2 String Exp Exp 
    -- function call: FunctionCall name ListArguments
    | FunCall String [String]
    -- real value: e.g. Real 1.0
    | Real Float
    -- variable: e.g. Var "x"
    | Var String
    -- convert to GenExpToExp
    | Val Value

    --deriving (Show, Eq)

-- Data-structure for boolean expressions
data BoolExp = 
    -- binary operator on boolean expressions
    OpB String BoolExp BoolExp  
    -- negation, the only unary operator
    | Not BoolExp
    -- comparison operator: Comp name expression expression
    | Comp String Exp Exp
    -- true and false constants
    | True_C
    | False_C
    -- not sure what this does rn
    | Var_B String

    | BoolToExpr Bool
    --deriving (Show, Eq)

data GenExp = 
    -- float expressions
    FloatExp Exp 
    -- boolean expressions
    | BExp BoolExp

    -- VARNAME 

    | VarExp String
    --deriving (Show, Eq)

-- Data-structure for statements
data Statement = 
    -- TODO: add other statements
    -- Variable assignment
     Assign String GenExp
    --Block 
    | Block [Statement]
    -- If statement
    | If BoolExp [Statement] [Statement]
    -- While loop
    | While BoolExp [Statement]
    -- For loop
    | For String GenExp Exp [Statement]
    -- Write
    | Write GenExp
    -- Write String Literals
    | WriteLiteral String
    -- Continue statement
    | Continue_S
    -- Break statement
    | Break_S
    -- Variable definition, list of var, type
    | VarDef [String] VType
    -- Functions
    | Function String [String] VType VType [Statement]

data VType = REAL | BOOL | STRING

-- this is a wrapper like object that contains everything our map will need
data Value = 
    -- float values
    R Float
    -- boolean values
    | B Bool
    -- String values
    | S String
   
    | F ([String], [Statement])
    -- deriving (Show, Eq)

-- converts Values to Floats
toFloat :: Value -> Float
toFloat (R val) = val
toFloat (B _) = error "value not convertible to float"
toFloat (S _) = error "value not convertible to float"
toFloat (F _) = error "value not convertible to float"

-- converts Values to Booleans
toBool :: Value -> Bool
toBool (B val) = val
toBool (R _) = error "value not convertible to boolean"
toBool (S _) = error "value not convertible to boolean"
toBool (F _) = error "value not convertible to boolean"

toString ::  Value -> String
toString (B val) = show(val)
toString (R val) = show(val)
toString (S val) = show(val)
toString (F _) = error "value not convertible to boolean"

toStatements :: Value -> ([String], [Statement])
toStatements (F (strs, val)) = (strs, val)
toStatements (R _) = error "value not convertible to [statement]"
toStatements (S _) = error "value not convertible to [statement]"
toStatements (B _) = error "value not convertible to [statement]"

genExpToExp :: GenExp -> [Map.Map String (String, Value)] -> Exp
genExpToExp (FloatExp e1) _ = e1
genExpToExp (BExp _) _ = error "Cannot convert to Exp"
genExpToExp (VarExp _) _ = error "Cannot convert to Exp"


valToExp :: Value -> [Map.Map String (String, Value)] -> Exp
valToExp (R e1) _  =  Real e1 
valToExp (B _) _ = error "Cannot convert to Exp"
valToExp (S _) _ = error "Cannot convert to Exp"
valToExp (F _) _ = error "Cannot convert to Exp"

valToGenExp :: Value -> GenExp
valToGenExp (R r) = FloatExp (Real r)
valToGenExp (B _) = error "Cannot convert to GenExp"
valToGenExp (S _) = error "Cannot convert to GenExp"
valToGenExp (F _) = error "Cannot convert to GenExp"

-- puts new values into the map

putVal :: [Map.Map String (String, Value)] -> String -> (String, Value) -> ([Map.Map String (String, Value)] )
putVal mapName key (valType, val) = [Map.insert key (valType, val) (head mapName)]


retrieveVal :: [Map.Map String (String, Value)] -> String -> Value
retrieveVal [mapName] key = case (Map.lookup key mapName) of
        Just (_, val) -> val
        Nothing -> error("Variable " ++ key ++ " is not in scope") 
retrieveVal mapName key = case (Map.lookup key (head mapName)) of
        Just (_, val) -> val
        Nothing -> retrieveVal (tail mapName) key
        
retrieveType :: [Map.Map String (String, Value)] -> String -> String
retrieveType [mapName] key = case (Map.lookup key mapName) of
        Just (valType, _) -> valType 
        Nothing -> error("Variable " ++ key ++ " is not in scope") 
retrieveType mapName key = case (Map.lookup key (head mapName)) of
        Just (valType, _) -> valType 
        Nothing -> retrieveType (tail mapName) key

-- Data-structure for hole program
-- TODO: add declarations and other useful stuff
-- Hint: make a tuple containing the other ingredients
type Program = [Statement]
