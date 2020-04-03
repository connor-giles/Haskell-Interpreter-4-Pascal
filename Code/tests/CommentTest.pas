program CommentTest;

var 
test1 : real;
test2 : real;
test3 : real;

begin
    writeln(true); //can print booleans
    writeln(20.0); //can print floats
    writeln(20.0 > 15.0); //can print print relational expressions
    writeln(5.0 + 5.0); //can print any arithmetic
    writeln("Literals also work here"); //can even print string literals if inside quotes
    writeln(true or false); //can print logical expressions

    // writeln("This line should not be written");

    
    {*writeln("This line should not be written");
    writeln("This line should not be written");*}
    

end