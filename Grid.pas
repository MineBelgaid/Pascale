program Darrays;
uses
 crt;
var
 top :array[1..4] of string = ('1', '2', '3', '4');
 left : array[1..4] of string = ('A', 'B', 'C', 'D');
 grid : array[1..4,1..4] of string;

 x:integer;
 y:integer;
begin
    clrscr;
 for x :=1 to 4 do
    for y :=1 to 4 do
    grid[x,y] := top[x] + left[y];
clrscr;
 for x :=1 to 4 do
    begin
    gotoxy(x*4,1);
    write(top[x]);
    end;
 for y :=1 to 4 do
    for x := 1 to 4 do
        begin
          gotoxy(x*4,y*2+1);
            write(grid[x,y]);
        end; 

 for y := 1 to 4 do
    begin
    gotoxy(1,y*2+1);
    write(left[y]);
    end;
writeln;
writeln;
writeln('Press <Enter> to exit');
readln;
end.