//======= HOW TO COMPILE AND RUN =======//
Generate: cabal build (ensure you are in the directory that contains the .cabal)
Execute: cabal run tests/<testName>.pas or dist/build/Pascal/Pascal tests/<testName>.pas

//======= ASSUMPTIONS =======//
1. I am assuming that the user inputs correct information in many locations through out the pascal
    program. It is simply too difficult to account for all possible errors so there would be no
    situation, for instance, of a user input a boolean value for a real variable or something
    similar to that




//======= unable to complete =======//
1. We were unable to get the break and continue functionality to work. We inferred that in order
    to make it work we would likely have to add something to our intBlock part that would search
    for these statements and be able to handle them accordingly, but between all the recursion
    we were unable to do so


//======= test case topics =======//
AddTest:
This test simply proves that the interpreter is able to add numbers and variables that have 
numbers associated with them

ArithmeticTest:
This test proves that the interpreter is able to do all of the normal arithmetic operations like
add subtract multiply and divide

BooleanLogical:
This test proves that the interpreter is able to do relational operators, boolean operators, and
logical operators

CommentTest:
This test proves that the interpreter is able to accomadate if the user chooses to put in either
single or multiline comments

ElseTest:
This test proves that the interpreter is able to evaulate decision making code and go to the else
statement if necessary 

ForTest:
This test proves that the interpreter is able to evaulate for loops and their associated blocks of
code up to the desired value

IfTest:
This test proves that the interpreter is able to evaulate decision making code and go to the if
statement if necessary 

PrecedenceTest:
This test proves that the interpreter is able to evaulate arithmetic with apropriate order of
precedence following PEMDAS

ScopingTest:
This test proves that the interpreter is able to determine scoping based on the list of maps that
we pass around, the variable that is attempted to be printed is defined in the while loop and
therefore can only have scoping there

SimpleAdd:
This test proves that the interpreter is able to do simple adding

SimplePrintMaybeFunc:
asdfasdf

SpecialExpressions:
This test proves that the interpreter is able to do all the special functions that were requested 
in the specification including sqrt, natural log, exp, sin, and cos

WhileTest:
This test proves that the interpreter is able to evaulate while loops and their associated blocks
of code up to the desired value

Writeln:
This test proves that the interpreter is able to evaulate all different kinds of writeln's


