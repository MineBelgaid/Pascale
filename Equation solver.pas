program eqsl;
var 
    a : integer;
    b : integer;
    c : integer;
    Delta : real;
    Squar : real;

begin 
    writeln('Enter the value of a , b , c : ');
    write('a = ');
    readln(a);
    write('b = ');
    readln(b);
    write('c = ');
    readln(c);
    Delta := (b*b - 4*a*c);
    if Delta = 0 then
    begin
        Squar := Sqrt(Delta);
        writeln('The solution is : ', (-b-Squar):0:2);
    end
    else if Delta < 0 then
    begin
        Squar := Sqrt(abs(Delta));
        writeln('The  first solution is : ', ((-b)/(2*a)):0:2, ' ', ((- Squar)/(2*a)):0:2, 'i');
        writeln('The  first solution is : ', ((-b)/(2*a)):0:2, ' + ', ((+Squar)/(2*a)):0:2, 'i');

    end
    else  
    begin
        Squar := Sqrt(Delta);
        writeln('The  first solution is : ', (-b-Squar):0:2);
        writeln('The second solution is : ', (-b+Squar):0:2);       
    end;
end.