
Program Menu;

Uses crt;

Function Make_Menu(Options : Array Of String;Exit: boolean): integer;

Var 
  y : integer;
  Keypressed : char;
  MaxOptions : integer;
Begin
  textcolor(white);
  writeln('Menu:');
  For y := 0 To high(Options)  Do
    Begin
      writeln('   [', y + 1, '] ',Options[y]);
    End;
  If Exit Then
    Begin
      MaxOptions := high(Options) + 2;
      writeln;
      writeln('   [', MaxOptions , '] ', 'Exit The Program.')
    End
  Else
    MaxOptions := high(Options);
  y := 0;
  Repeat
    gotoxy(4,y+2);
    clreol;
    textcolor(Green);
    If exit And (y  = MaxOptions) Then
      Begin
        write('[', y , '] ','Exit The Program. ');
      End
    Else
      Begin
        write('[', y + 1, '] ',Options[y]);
      End;
    gotoxy(4,y+2);
    textcolor(white);
    Keypressed := readkey;
    Case Keypressed Of 
      #72 :
            Begin
              clreol;
              If exit And (y = MaxOptions) Then
                Begin
                  write('[', y , '] ','Exit The Program.');
                  y := MaxOptions - 2 ;
                End
              Else
                Begin
                  write('[', y + 1, '] ', Options[y]);
                  y := y - 1;
                  If (y < 0) Then
                    y := MaxOptions
                  Else If (y = MaxOptions ) And exit  Then
                         y := MaxOptions - 2 ;
                End;
            End;
      #80 :
            Begin
              clreol;
              If exit And (y = MaxOptions) Then
                Begin
                  write('[', y , '] ','Exit The Program.');
                  y := 0;
                End
              Else
                Begin
                  write('[', y + 1, '] ',Options[y]);
                  y := y + 1;
                  If y > MaxOptions + 2  Then
                    y :=  0
                  Else If exit And (y = MaxOptions - 1 ) Then
                         y := MaxOptions ;
                End;


            End;
    End;

  Until (Keypressed = #27) or (Keypressed = #13) ;
   if exit and (y = MaxOptions) then 
   Make_Menu := -1
   else 
   Make_Menu := y;


End;