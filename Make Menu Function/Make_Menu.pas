
Program Menu;

Uses crt;

Function Make_Menu(Options : Array Of String;Exit: boolean): integer;

Var 
  y : integer;
  Keypressed : char;
  MaxOptions,MaxNumbers : integer;
Begin
  clrscr;
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
    If exit Then
      MaxNumbers := MaxOptions + 48
    Else
      MaxNumbers := MaxOptions + 49;
    If (ord(Keypressed) <= MaxNumbers ) And (Keypressed > #48) Then
      Begin
        If exit And (ord(Keypressed) = MaxNumbers) Then
          Begin
            If exit And (y  = MaxOptions) Then
              Begin
                write('[', y , '] ','Exit The Program. ');
              End
            Else
              Begin
                write('[', y + 1, '] ',Options[y]);
                y := MaxOptions;
              End;
          End
        Else
          Begin
            If exit And (y  = MaxOptions) Then
              Begin
                write('[', y , '] ','Exit The Program. ');
              End
            Else
              write('[', y + 1, '] ',Options[y]);
            y := ord(Keypressed) - 49 ;
            gotoxy(10,10);
            writeln(y);
            writeln(MaxOptions);
            writeln(ord(Keypressed));
          End;
      End
    Else
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
                    If y > MaxOptions   Then
                      y :=  0
                    Else If (y > MaxOptions + 2) And exit  Then
                           y :=  0
                    Else If exit And (y = MaxOptions - 1 ) Then
                           y := MaxOptions ;
                  End;
              End;
      End;

  Until (Keypressed = #27) Or (Keypressed = #13) ;
  If exit And (y = MaxOptions) Then
    Make_Menu := -1
  Else
    Make_Menu := y + 1 ;


End;
