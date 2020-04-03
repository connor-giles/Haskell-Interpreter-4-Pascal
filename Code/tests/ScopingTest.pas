program ScopingTest;

var
test1, test2 : real;

begin
    test1 := 10.0; 
    while(test1 < 20.0) do
    begin
        test2 := 35.0;
        writeln(test1);
        test1 := test1 + 1.0;
    end;

    writeln(test2);

end