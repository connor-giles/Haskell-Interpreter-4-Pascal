program SimplePrint;

var
test : boolean; 
test1 : real;
test2 : real;
test3 : real;
test4 : real;

begin

function add (var1, var2 : real;) : real;
var
    foo : real;
begin
    foo := 5.0;
    add := foo + var1;
end;
     
    test1 := 10.0; 
    while(test1 < 20.0) do
    begin
        writeln(test1);
        test1 := test1 + 1.0;
    end;

end