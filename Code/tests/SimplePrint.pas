program SimplePrint;

var 
test1 : real;
test2 : real;
test3 : real;
test4 : real;

begin

    writeln(test1);
    writeln(test2);
    writeln(test3);
    writeln(test4); 


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