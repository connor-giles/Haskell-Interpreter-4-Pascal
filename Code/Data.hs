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
        Program
    ) where

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

data GenExp = 
    -- float expressions
    FloatExp Exp 
    -- boolean expressions
    | BExp BoolExp

-- Data-structure for statements
data Statement = 
    -- TODO: add other statements
    -- Variable assignment
     Assign String GenExp
    -- If statement
    | If BoolExp [Statement]
    -- Block
    | Block [Statement]
    -- While loop
    | While BoolExp [Statement]
    -- For loop
    | For String GenExp BoolExp [Statement]
    -- Write
    | Write GenExp

data VType = REAL | BOOL | STRING;

data Definition = 
    -- Variable definition, list of var, type
    VarDef [String] VType
    -- Procedures
    | Proc String [(String, VType)] Statement


 
-- Data-structure for hole program
-- TODO: add declarations and other useful stuff
-- Hint: make a tuple containing the other ingredients
type Program = [Statement]