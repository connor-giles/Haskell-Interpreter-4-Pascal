program SimplePrint;

var test1, test2, test3 : real;

begin

    test := true;
    test2 := 5.0; 
    test1 := test2 + test2;

    if( test) then
        begin
            writeln(test2);
            test2 := test2 + 27.0;
            writeln(test2);
            test2 := test2 + 25.0;
        end
    else
        begin
            writeln(test1); 
        end

    while(test) do
    begin 

        test2 := 100.0;
        test := false;

        if(test) then
        begin
            test2 := 100.0;
            test := false;
        end
        else
        begin 
            test := false;
        end
    end;
        

    writeln(test);
    writeln(test2);

end