program userinput;
var 
    sel:char;

begin
  repeat
    writeln('Make A Selection (A or B): ');
    readln(sel);
  until (sel = 'A') or (sel = 'a') or (sel = 'B') or (sel = 'b');

  case sel of
  'A','a': begin
    writeln('A Was Selected');
    end;
  'B','b': begin  
    writeln('B Was Selected');
    end;
  end;
  writeln;
  writeln;
  writeln;
  writeln('Press <Enter> To Quit');
  readln;
end.