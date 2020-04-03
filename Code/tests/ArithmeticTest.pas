program ArithmetcTest;

var
    var1, var2, addResult, subResult, multResult, divResult : real;

begin
    var1 := 20.0;
    var2 := 20.0;
    addResult := var1 + var2;
    subResult := var1 - var2;
    multResult := var1 * var2;
    divResult := var1 / var2;
    writeln(addResult);
    writeln(subResult);
    writeln(multResult);
    writeln(divResult);
end