-- This file contains the data-structures for the AST
-- The role of the parser is to build the AST (Abstract Syntax Tree) 

module Data
    (
        Exp(..),
        BoolExp(..),
        Statement(..),
        VType(..),
        Definition(..),
        GenExp(..),
        Value(..),
        toFloat,
        toBool,
        toString,
        putVal,
        retrieveType,
        retrieveVal,
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
    | FunCall String [Exp]
    -- real value: e.g. Real 1.0
    | Real Float
    -- variable: e.g. Var "x"
    | Var String
    deriving (Show, Eq)

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
    deriving (Show, Eq)

data GenExp = 
    -- float expressions
    FloatExp Exp 
    -- boolean expressions
    | BExp BoolExp
    deriving (Show, Eq)

-- Data-structure for statements
data Statement = 
    -- TODO: add other statements
    -- Variable assignment
     Assign String GenExp
    -- If statement
    | If BoolExp [Statement] [Statement]
    -- Block
    | Block [Statement]
    -- While loop
    | While BoolExp [Statement]
    -- For loop
    | For String GenExp BoolExp [Statement]
    -- Write
    | Write GenExp
    -- Continue statement
    | Continue_S
    -- Break statement
    | Break_S

data VType = REAL | BOOL | STRING;

data Definition = 
    -- Variable definition, list of var, type
    VarDef [String] VType
    -- Procedures
    | Proc String [(String, VType)] Statement

-- this is a wrapper like object that contains everything our map will need
data Value = 
    -- float values
    R Float
    -- boolean values
    | B Bool
    -- String values
    | S String
    deriving (Show, Eq)

-- converts Values to Floats
toFloat :: Value -> Float
toFloat (R val) = val
toFloat (B _) = error "value not convertible to float"
toFloat (S _) = error "value not convertible to float"

-- converts Values to Booleans
toBool :: Value -> Bool
toBool (B val) = val
toBool (R _) = error "value not convertible to boolean"
toBool (S _) = error "value not convertible to boolean"

toString ::  Value -> String
toString (B val) = show(val)
toString (R val) = show(val)
toString (S val) = show(val)

-- puts new values into the map
putVal :: Map.Map String (String, Value) -> String -> (String, Value) -> Map.Map String (String, Value)
putVal mapName key (valType, val) = Map.insert key (valType, val) mapName

retrieveVal :: Map.Map String (String, Value) -> String -> Value
retrieveVal mapName key = case Map.lookup key mapName of
        Nothing -> error "Key did not have associated value"
        Just (_, val) -> val

retrieveType :: Map.Map String (String, Value) -> String -> String
retrieveType mapName key = case Map.lookup key mapName of
        Nothing -> error "No valid type"
        Just (valType, _) -> valType

-- updateVal :: Map.Map String (String, Value) -> String -> Value -> Map.Map String (String, Value)
-- updateVal mapName key val = Map.insert key val mapName 

-- Data-structure for hole program
-- TODO: add declarations and other useful stuff
-- Hint: make a tuple containing the other ingredients
type Program = [Statement]