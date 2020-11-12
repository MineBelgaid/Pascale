
Program Bulls_And_Cows;

Uses crt,math;
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



Function Duplicates(Lists:Array Of integer): boolean;

Var 
  x,y: integer;
Begin
  Duplicates := False;
  For x := 0 To length(Lists) Do
    For y := 1 To length(lists) Do
      If x = y Then
        break
      Else If lists[x] = lists[y] Then
             Duplicates := True;

End;





Var 
  guess,x,y,Attempt,count,line,GameMode : integer;
  DecomposedGuess,DecomposedAttempt : Array[1..4] Of integer;
  GameModes : Array[1..2] Of string = ('Non Repeatable Digits',
                                       'Repeatable Digits');
  UI : string;
  C,B,error: byte;
  keypressed : char;

Begin
  Repeat
    gotoxy(20,3);
    textbackground(magenta);
    textcolor(white);
    writeln('                                                                  '
    );
    gotoxy(20,4);
    writeln('                Welcome To Bulls and Cows Game                    '
    );
    gotoxy(20,5);
    writeln('                              By                                  '
    );
    gotoxy(20,6);
    writeln('                         Belgaid Amine                            '
    );
    gotoxy(20,7);
    writeln('                                                                  '
    );
    textbackground(black);
    GameMode := Make_Menu(GameModes,True);
    randomize;
    Window(1,1,100,25);
    If GameMode = 1 Then
      Begin
        Repeat
          guess := random(9999) ;
          For x := 1 To 4 Do
            DecomposedGuess[x] := (guess Mod (10**x) Div (10**(x+1)));

          If Duplicates(DecomposedGuess) Then
            error := 1
          Else If Not Duplicates(DecomposedGuess) Then
                 error := 0;
        Until error = 0 ;
      End

    Else
      Begin
        guess := random(9999) ;
        For x := 1 To 4 Do
          DecomposedGuess[x] := (guess Mod (10**x) Div (10**(x+1)));
      End;

    If gamemode = (-1) Then
      Begin
        writeln('Exiting the program');
        break;
      End

    Else If gamemode <> (-1) Then
           Begin
             clrscr;
             gotoxy(20,3);
             textbackground(magenta);
             textcolor(white);
             writeln(
            '                                                                  '
             );
             gotoxy(20,4);
             writeln(
            '                Welcome To Bulls and Cows Game                    '
             );
             gotoxy(20,5);
             writeln(
            '                              By                                  '
             );
             gotoxy(20,6);
             writeln(
            '                         Belgaid Amine                            '
             );
             gotoxy(20,7);
             writeln(
            '                                                                  '
             );
             gotoxy(25,15);
             writeln(guess);
             count := 0;
             line := 10;
             gotoxy(38,8);
             textbackground(black);
             textcolor(magenta);
             writeln('   +---------+---------+');
             textcolor(magenta);
             gotoxy(41,line-1);
             write('|');
             gotoxy(51,line-1);
             write('|');
             gotoxy(61,line-1);
             write('|');
             gotoxy(44,line-1);
             textcolor(Blue);
             write('Guess');
             gotoxy(54,line+1);
             write('Result');
             Repeat
               B := 0;
               C := 0;
               textcolor(magenta);
               gotoxy(41,line);
               write('|');
               gotoxy(51,line);
               write('|');
               gotoxy(61,line);
               write('|');
               textcolor(Green);

               Repeat
                 gotoxy(44,line);
                 read(UI);
                 val(UI,Attempt,error);

               Until error = 0 ;
               For x := 1 To 4 Do

                 Begin
                   DecomposedAttempt[x] := (Attempt Mod (10**x) Div (10**(x+1)))
                   ;
                   If DecomposedAttempt[x] = DecomposedGuess[x] Then
                     B := B + 1
                   Else
                     For y := 1 To 4 Do
                       If DecomposedAttempt[x] = DecomposedGuess[y] Then
                         C := C + 1;
                 End;
               gotoxy(54,line);
               textcolor(Green);
               write(B) ;
               textcolor(red);
               write('B ');
               textcolor(Green);
               write(C);
               textcolor(red);
               write('C');
               count := count +1;
               line := line + 1;
               readln;

             Until B = 4;
             gotoxy(38,line);
             textcolor(magenta);
             writeln('   +---------+---------+');
             textcolor(Cyan);
             gotoxy(29,line+4);
             textcolor(Cyan);
             write('Congratulation you guessed the number in ');
             textcolor(red);
             write(count);
             textcolor(Cyan);
             write(' Guesse(s)!');
           End;
    gotoxy(30,20);
    textcolor(red);
    write('Press Enter to play again  / Press ESC to Exit ');
    Repeat
      keypressed := readkey;
    Until (ord(keypressed) = 27 ) Or (ord(keypressed) = 13);

  Until ord(keypressed) = 27;



End.
