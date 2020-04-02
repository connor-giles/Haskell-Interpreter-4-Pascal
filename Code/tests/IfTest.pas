program IfTest;

var
test : boolean; 
test1 : real;
test2 : real;
test3 : real;
test4 : real;

begin
    test := true;
    if(test) then
        begin
            writeln("Evaluated ifBlock");
        end
    else
        begin
            writeln("Evaluated elseBlock");
        end
end