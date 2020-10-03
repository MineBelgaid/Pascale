program HighNLow;
uses
 crt;
var
 Numbers :array[1..7] of integer;
 x : integer;
 high : integer;
 low : integer;
 UI : string;
 error : integer;

begin
    for x := 1 to 7 do
    begin
        repeat
           writeln('Enter your numbers');
           readln(UI);
           val(UI,numbers[x],error); 
        until error = 0;
    end;
    clrscr;
    high := Numbers[1];
    low := numbers[1];
    for x := 2 to 7 do
        if numbers[x] > high then
        high := numbers[x];
    for x:= 2 to 7 do

        if numbers[x] < low then
        low := numbers[x];
    writeln('The Highest number is : ',high);
    writeln('The loweset number is : ',low);  

writeln;
writeln;
writeln('Press <Enter> to exit. ');
readln;
end.