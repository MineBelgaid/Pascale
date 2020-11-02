
Program Multiple_Programs;

Uses 
crt;
Function PrimeNum(number:longint): integer;

Var 
  x, check: longint;

Begin
  check := 0;
  x := 2 ;
  While x < sqrt(number)  Do
    Begin
      If number Mod x = 0 Then
        Begin
          check := check +1;
          break;
        End;
      x := x +1;
    End;
  If (check = 0)  Then
    PrimeNum := 0
  Else
    PrimeNum := 1
End;
Procedure Decomposition;

Var 
  x, num, check, z : Cardinal;
  key : char;
  UI : string;
  error : byte;
Begin
  Repeat

    clrscr;
    gotoxy(20,2);
    textbackground(yellow);
    textcolor(White);
    writeln('                                                        ');
    gotoxy(20,3);
    writeln('            Decomposition of a given Number.            ');
    gotoxy(20,4);
    writeln('                         By                             ');
    gotoxy(20,5);
    writeln('                     Belgaid Amine                      ');
    gotoxy(20,6);
    writeln('                                                        ');

    textbackground(black);
    Repeat
      gotoxy(10,9);
      clreol;
      textcolor(White);
      write('Enter your number: ');
      textcolor(Yellow);
      readln(UI);
      val(UI,num,error);
    Until (error = 0) And (num > 0 );
    textcolor(White);
    check := PrimeNum(num);
    gotoxy(10,11);
    If check = 0 Then
      Begin
        textcolor(red);
        writeln(num, ' is a prime number and cannot be decomposed');
      End
    Else If check = 1 Then
           Begin
             z := num;
             x := 2;
             write('The Decomposition of ',num,' Is: ');
             textcolor(Yellow);
             Repeat
               While x < (num Div 2+1) Do
                 Begin
                   If z Mod x = 0 Then
                     Begin
                       z := z Div x;
                       write(x,'x');
                     End
                   Else
                     Begin
                       x := x+1;
                     End;
                 End;
             Until z = 1;

             writeln('1');
           End;
    textcolor(White);
    gotoxy(10,13);
    write('Press Enter to Try again / Press ESC to Exit ');
    Repeat
      key := readkey;
    Until (ord(key) = 27 ) Or (ord(key) = 13);
  Until ord(key) = 27;
End;

Procedure WeekDay();

Var 
  DaysOfWeek: array[1..7] Of string = ('Sunday', 'Monday','Tuesday', 'Wednesday'
                                       ,'Thursday', 'Friday ', 'Saturday');
  Calcul, year, days, month, MonthCode, CenturyCode, Yearcode, Century, LeapYear
  , Error, Maxday : integer;
  UI: string;
  Key : char;
Begin
  Repeat
    Clrscr;
    gotoxy(20,3);
    textbackground(blue);
    textcolor(white);
    writeln('                                                                  '
    );
    gotoxy(20,4);
    writeln('                 Finding The Day of the Week.                     '
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

    Repeat
      gotoxy(10,10);
      clreol;
      write('Enter the year :  ');
      textcolor(Cyan);
      readln(UI);
      textcolor(white);
      val(UI,year,error);
    Until error = 0;
    Repeat
      gotoxy(10,12);
      clreol;
      write('Enter the Month:  ');
      textcolor(Cyan);
      readln(UI);
      textcolor(white);
      val(UI,month,error);
    Until (error = 0) And (month <= 12 ) And (month > 0) ;
    If (year Mod 4 = 0) And (( year Mod 100 <> 0) Or (year Mod 400 = 0)) Then
      LeapYear := 1
    Else
      LeapYear := 0;
    If month > 2 Then
      LeapYear := 0;
    If (LeapYear = 1) And (month = 2 ) Then
      Maxday := 29
    Else If (LeapYear = 0) And (month = 2 ) Then
           Maxday := 28
    Else If (month = 1 ) Or (month = 3 ) Or (month = 5 ) Or (month = 7 ) Or (
            month
            = 8 ) Or(month = 10 ) Or (month = 12 ) Then
           Maxday := 31
    Else  If (month = 4 ) Or(month = 5 ) Or(month = 6 ) Or(month = 9 ) Or (month
             =
             11 ) Then
            Maxday := 30;
    Repeat
      gotoxy(10,14);
      clreol;
      write('Enter the Day:  ');
      textcolor(Cyan);
      readln(UI);
      textcolor(white);
      val(UI,days,error);
    Until (error = 0) And (Days > 0) And (days <=  Maxday);
    Yearcode := (year Mod 100 + (year Mod 100) Div 4) Mod 7 ;
    Case (month) Of 
      1, 10 : MonthCode := 0;
      5 : MonthCode := 1;
      8 : MonthCode := 2;
      2, 3, 11 : MonthCode := 3;
      6 : MonthCode := 4;
      9, 12 : MonthCode := 5;
      4, 7 : MonthCode := 6;
    End;
    Century := (year Div 100) * 100;
    If Century Mod 400 = 0 Then
      CenturyCode := 6
    Else If (Century - 100) Mod 400 = 0 Then
           CenturyCode := 4
    Else If (Century - 200) Mod 400 = 0 Then
           CenturyCode := 2
    Else If (Century - 300) Mod 400 = 0 Then
           CenturyCode := 0;
    Calcul := (Yearcode + MonthCode + CenturyCode + days - LeapYear) Mod 7 ;
    gotoxy(10,18);
    write(year, '\', Month,'\',days,' is a : ');
    textcolor(Cyan);
    writeln(DaysOfWeek[Calcul+1]);
    writeln;
    gotoxy(10,20);
    textcolor(white);
    write('Press Enter to continue / Press ESC to Exit ');
    Repeat
      key := readkey;
    Until (ord(key) = 27 ) Or (ord(key) = 13);

  Until ord(key) = 27;




End;

Var 
  KeyPressed,keypressed2 : char;
  y,p : integer;
  line : array[1..8] Of string;

Begin

  Repeat
    cursoroff;
    y := 2 ;
    line[1] := 'Menu:';
    line[2] := '   [1] : Day Of The Week ';
    line[3] := '   [2] : Decomposition of a number ';
    line[4] := '   [3] : This is line number 3';
    line[5] := '   [4] : This is line number Four';
    line[6] := ' ';
    line[7] := '   [5] : Exit the program';
    clrscr;
    gotoxy(20,3);
    textbackground(blue);
    textcolor(white);
    writeln('                                                                  '
    );
    gotoxy(20,4);
    writeln('               Programs Made While Learning Pascal.               '
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
    textcolor(white);

    For p := 1 To 7  Do
      Begin
        gotoxy(10,p+9);
        writeln(line[p]);
      End;
    Repeat
      cursoroff;
      gotoxy(10, y+9);
      textcolor(Green);
      Write(line[y]);
      gotoxy(10, y+9);
      textcolor(White);

      keypressed := readkey;
      Case keypressed Of 
        #72 :
              Begin
                Write(line[y]);
                y := y -1  ;
                If y < 2 Then
                  y := 7
                Else If y = 6 Then
                       y := 5;

              End;
        #80 :

              Begin
                Write(line[y]);
                y := y +1 ;
                If y > 7 Then
                  y := 2
                Else If y = 6 Then
                       y := 7;
              End;

      End;
    Until (ord(keypressed) = 13) Or (ord(keypressed) = 27);
    If (y = 2 ) And (keypressed = #13 ) Then
      Begin
        clrscr;
        cursoron;
        WeekDay;
        clrscr;
      End
    Else If (y = 3 ) And (keypressed = #13 ) Then
           Begin
             clrscr;
             cursoron;
             Decomposition;
             clrscr;
           End
    Else If (y = 7 ) And (keypressed = #13 ) Then
           Begin
             Repeat
               Gotoxy(12,18);
               write('Are you sure you want to exit? Y\N : ');
               keypressed2 := readkey;
             Until (UpCase(keypressed2) = 'Y') Or (UpCase(keypressed2) = 'N');
             If UpCase(keypressed2) = 'Y' Then
               break;
           End;

  Until ord(keypressed) = 27;
  clrscr;
End.
