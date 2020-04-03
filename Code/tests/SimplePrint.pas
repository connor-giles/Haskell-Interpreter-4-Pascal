program SimplePrint;

var
test : boolean; 

test1, tst2, test3, test4 : real;

function add (var1, va2 : real) : real;
var
    foo : real;
begin
    var1 := 20.0;
    foo := 5.0;
    add := foo + var1;
end;



begin

     
    test1 := 20.0; 
    test2 := 30.0;
    
    functResult := add (test1, test2);

    writeln(functResult);

end