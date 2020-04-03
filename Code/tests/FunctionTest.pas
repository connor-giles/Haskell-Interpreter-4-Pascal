program SimplePrint;

var
test : boolean; 

test1, tst2, test3, test4 : real;

function add (var1, var2 : real) : real;
var
   
begin
    add := var1 + var2;
end;


begin

 
    test1 := 20.0; 
    test2 := 5.0;
  

    functResult := add (test1, test2);
    writeln(functResult);

end