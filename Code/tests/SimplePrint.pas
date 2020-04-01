program SimplePrint;

var test1, test2, test3 : real;

begin
    test := true;
    a := 20.0 + 15.0;
    b := 100.0;
    c := a < b;
    z := true and false;
    zz := true or false;

    if (c)
    then
        d := 20.0;
    else
        e := 20.0;

    while(c) do 
    begin
        b := a + 1.0;
    end;

    for i := 1.0 to 10.0 do
    begin
        writeln(a)
    end;

    w := 20.0;

    while(c) do 
    begin
        if (w > 20.0)
        then
            Break;
        else
            w := w + 1.0;
    end;

    while(c) do 
    begin
        if (w < 20.0)
        then
            Continue;
        else
            w := w + 1.0;
    end;

end