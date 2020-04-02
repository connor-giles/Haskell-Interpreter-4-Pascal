program AddTest;

var
    val1 : real;
    val2 : real;
    result : real;
begin
    val1 := 5.0;
    val2 := 2.0;
    val1 := val1 + 1.0;
    result := val1 + val2;
    writeln(result);
end
//Should return 7.0