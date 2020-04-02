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


    writeln(test);
    writeln(test2);


    writeln(20.0 < 15.0); //false
    writeln(20.0 <= 15.0); //fales
    writeln(20.0 > 15.0); //true
    writeln(20.0 >= 20.0); //true
    writeln(true and false); //false
    writeln(cos(3.14159265)); //true

end