{
module Parser where

import Base
import Data
import Lexer
}

--THIS IS THE ALEX FILE

%name happyParser
%tokentype { Token }


%monad { Parser } { thenP } { returnP }
%lexer { lexer } { Token _ TokenEOF }

-- TokenK is for keyword
-- TokenOp is for operator
%token
        int             { Token _ (TokenInt $$)   }
        float           { Token _ (TokenFloat $$) }
        ID              { Token _ (TokenID $$)    }
        'Program'       { Token _ (TokenK "Program")}
        'IF'            { Token _ (TokenK "IF")}
        'WHILE'         { Token _ (TokenK "WHILE")}
        'DO'            { Token _ (TokenK "DO")}
        'TO'            { Token _ (TokenK "TO")}
        'FOR'            { Token _ (TokenK "FOR")}
        'then'          { Token _ (TokenK "then")}
        '+'             { Token _ (TokenOp "+")   }
        '-'             { Token _ (TokenOp "-")   }
        '*'             { Token _ (TokenOp "*")   }
        '/'             { Token _ (TokenOp "/")   }
        '='             { Token _ (TokenOp "=")   }
        '<'             { Token _ (TokenOp "<")   }
        '>'             { Token _ (TokenOp ">")   }
        '<='            { Token _ (TokenOp "<=")  }
        '>='            { Token _ (TokenOp ">=")  }
        '('             { Token _ (TokenK  "(")   }
        ')'             { Token _ (TokenK  ")")   }
        'begin'         { Token _ (TokenK "begin")}
        'end'           { Token _ (TokenK "end")  }
        ':='            { Token _ (TokenK ":=")   }
        'true'          { Token _ (TokenK "true") }
        'false'         { Token _ (TokenK "false")}
        'sqrt'          { Token _ (TokenK "sqrt") } 
        'natlog'        { Token _ (TokenK "natlog")}
        'sin'           { Token _ (TokenK "sin")  }
        'exp'           { Token _ (TokenK "exp")  }
        'cos'           { Token _ (TokenK "false")}
        'AND'           { Token _ (TokenK "and")  }
        'OR'            { Token _ (TokenK "or")   }
        'not'           { Token _ (TokenK "not")  }
        'var'           { Token _ (TokenK "var")  }
        ':'             { Token _ (TokenK ":")    }
        'bool'          { Token _ (TokenK "bool") }
        'real'          { Token _ (TokenK "real") }
        'string'        { Token _ (TokenK "string")}
        ','             { Token _ (TokenK ",")    }
        'ID_List'       { Token _ (TokenK "ID_List") }

-- associativity of operators in reverse precedence order
%nonassoc '>' '>=' '<' '<=' '==' '!='
%left '+' '-'
%left '*' '/'
%nonassoc ':='
%%

-- Entry point
Program :: {Program}
    : 'Program' ID Defs 'begin' Statements 'end' { $5 }

Defs :: {[Definition]}
    : { [] } -- nothing; make empty list
    | Definition Defs { $1:$2 } -- put statement as first element of statements

Definition :: {Definition}
    : 'var' ID_List ':' Type { VarDef $2 $4 }  


Type :: {VType}
    : 'bool' { BOOL }
    | 'real' { REAL }
    | 'string' { STRING }

ID_List :: {[String]}
    : ID {[$1]}
    | ID ',' ID_List { $1:$3 }

-- Expressions
Exp :: {Exp}
    : '+' Exp { $2 } -- ignore Plus
    | '-' Exp { Op1 "-" $2}
    | 'sqrt' Exp  { Op1 "sqrt" $2 }
    | 'natlog' Exp  { Op1 "natlog" $2 }
    | 'sin' Exp  { Op1 "sin" $2 }
    | 'cos' Exp  { Op1 "cos" $2 }
    | 'exp' Exp  { Op1 "exp" $2 }
    | Exp '+' Exp { Op2 "+" $1 $3 }
    | Exp '*' Exp { Op2 "*" $1 $3 }
    | Exp '/' Exp { Op2 "/" $1 $3 }
    | Exp '-' Exp { Op2 "-" $1 $3 }
    | '(' Exp ')' { $2 } -- ignore brackets

BoolExp :: {BoolExp}
    : 'true' { True_C }
    | 'false' { False_C }
    | 'not' BoolExp { Not $2 }
    | Exp '<' Exp { OpN "<" $1 $3 }
    | Exp '>' Exp { OpN ">" $1 $3 }
    | Exp '<=' Exp { OpN "<=" $1 $3 }
    | Exp '>=' Exp { OpN ">=" $1 $3 }
    | BoolExp 'AND' BoolExp { OpB "AND" $1 $3 }
    | BoolExp 'OR' BoolExp { OpB "OR" $1 $3 }
    | ID { Var_B $1 }

Statements :: {[Statement]}
    : { [] } -- nothing; make empty list
    | Statement Statements { $1:$2 } -- put statement as first element of statements

GenExp :: {GenExp}
    : Exp { FloatExp $1 }
    | BoolExp { BExp $1 }

--More stuff needs to go here
Statement :: {Statement}
    : ID ':=' GenExp { Assign $1 $3 }
    | 'IF' '(' BoolExp ')'  'then' 'begin' Statements  'end' {If $3 $7}
    | 'WHILE' '(' BoolExp ')' 'DO' 'begin' Statements 'end' {While $3 $7}
    | 'FOR' ID ':=' GenExp 'TO' BoolExp 'DO' 'begin' Statements 'end' {For $2 $4 $6 $9 } 
    

{}
