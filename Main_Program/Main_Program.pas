
Program Multiple_Programs;

Uses 
crt;
Procedure EquationSolver;

Var 
  a, b, c : integer;
  Delta, Squar : real;
  UI : string;
  key : char;
  error : byte;
Begin
  Repeat
    Clrscr;
    gotoxy(20,3);
    textbackground(red);
    textcolor(white);
    writeln('                                                                  '
    );
    gotoxy(20,4);
    writeln('                 Second Degree Equation Solver.                   '
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
    gotoxy(10,10);
    writeln('Enter the value of a , b , c : ');
    Repeat
      gotoxy(10,12);
      clreol;
      write('a = ');
      textcolor(red);
      readln(UI);
      val(UI,a,error);
      textcolor(white);
    Until error = 0 ;
    Repeat
      gotoxy(10,13);
      clreol;
      write('b = ');
      textcolor(red);
      readln(UI);
      val(UI,b,error);
      textcolor(white);
    Until error = 0 ;
    Repeat
      gotoxy(10,14);
      clreol;
      write('c = ');
      textcolor(red);
      readln(UI);
      val(UI,c,error);
      textcolor(white);
    Until error = 0 ;

    Delta := (b*b - 4*a*c);
    If Delta = 0 Then
      Begin
        gotoxy(10,15);
        Squar := Sqrt(Delta);
        write('The solution is : ');
        textcolor(red);
        writeln((-b-Squar): 0: 2);
        textcolor(white);
      End
    Else If Delta < 0 Then
           Begin
             gotoxy(10,15);
             Squar := Sqrt(abs(Delta));
             write('The  first solution is : ');
             textcolor(red);
             write(((-b)/(2*a)): 0: 2, ' ', ((-Squar)/(2*a)): 0: 2,'i');
             textcolor(white);
             gotoxy(10,17);
             write('The  Second solution is : ');
             textcolor(red);
             write(((-b)/(2*a)): 0: 2, ' + ', ((+Squar)/(2*a)): 0: 2,'i');
             textcolor(white);
           End
    Else
      Begin
        Squar := Sqrt(Delta);
        gotoxy(10,16);
        write('The  first solution is : ');
        textcolor(red);
        write(((-b-Squar)/2): 0: 2);
        textcolor(white);
        gotoxy(10,18);
        write('The second solution is : ');
        textcolor(red);
        write(((-b+Squar)/2): 0: 2);
      End;
    gotoxy(15,20);
    textcolor(white);
    write('Press Enter to continue / Press ESC to Exit ');
    Repeat
      key := readkey;
    Until (ord(key) = 27 ) Or (ord(key) = 13);

  Until ord(key) = 27;

End;


Procedure GuessMyNumber;

Var 
  answer, guess, count: integer;
  game,key: char;
  UI: string;
  error: byte;

Begin
  Repeat
    count := 0;
    Repeat
      clrscr;
      gotoxy(20,3);
      textbackground(Green);
      textcolor(White);
      writeln('                                                        ');
      gotoxy(20,4);
      writeln('                Guess My Number Game .                  ');
      gotoxy(20,5);
      writeln('                         By                             ');
      gotoxy(20,6);
      writeln('                     Belgaid Amine                      ');
      gotoxy(20,7);
      writeln('                                                        ');
      textbackground(black);
      gotoxy(10,10);
      writeln('Games Avaliable:  ');
      gotoxy(13,12);
      writeln('A) 1-10');
      gotoxy(13,13);
      writeln('B) 1-100');
      gotoxy(13,14);
      writeln('C) 1-1000');
      gotoxy(10,16);
      write('Enter the game : ');
      textcolor(Green);
      readln(game);
      textcolor(White);

    Until (game = 'a') Or (game = 'A') Or (game = 'B') Or (game = 'b') Or (
          game
          = 'c') Or (game = 'C');
    clrscr;
    gotoxy(20,3);
    textbackground(Green);
    textcolor(White);
    writeln('                                                        ');
    gotoxy(20,4);
    writeln('                Guess My Number Game .                  ');
    gotoxy(20,5);
    writeln('                         By                             ');
    gotoxy(20,6);
    writeln('                     Belgaid Amine                      ');
    gotoxy(20,7);
    writeln('                                                        ');
    textbackground(black);
    randomize;
    Case game Of 
      'a','A' :
                Begin
                  answer := random(10)+1;
                  gotoxy(10,10);
                  clreol;
                  writeln(' Try to Guess the number between 1 and 10.');
                End;
      'b','B' :
                Begin
                  answer := random(100)+1;
                  gotoxy(10,10);
                  clreol;
                  writeln('Try to Guess the number between 1 and 100.');
                End;
      'c','C' :
                Begin
                  answer := random(1000)+1;
                  gotoxy(10,10);
                  clreol;
                  writeln(' Try to Guess the number between 1 and 1000. ');
                End;
    End;
    Repeat
      Repeat
        gotoxy(13,12);
        clreol;
        write('Enter your guess: ');
        textcolor(Green);
        readln(UI);
        textcolor(White);
        val(UI,guess,error);
        If error <> 0 Then
          Begin
            gotoxy(15,14);
            clreol;
            gotoxy(13,14);
            clreol;
            textcolor(Red);
            writeln('Incorrect input try again');
            textcolor(White);
          End;
      Until error = 0;

      count := count+1;

      If guess < answer Then
        Begin
          gotoxy(15,14);
          clreol;
          textcolor(Red);
          writeln('Too low, Try again!');
          textcolor(White);
        End
      Else If guess > answer Then
             Begin
               gotoxy(15,14);
               clreol;
               textcolor(Red);
               writeln('Too high, Try again!');
               textcolor(White);
             End
    Until guess = answer;
    Begin
      gotoxy(15,14);
      clreol;
      gotoxy(10,10);
      clreol;
      gotoxy(13,12);
      clreol;
      textcolor(LightGreen);
      write('       Congratulations! You guessed my number my number in: ');
      textcolor(Red);
      write(count);
      textcolor(LightGreen);
      If count = 1 Then
        writeln(' Guess!')
      Else If count > 1 Then
             writeln(' Guesses!');
      textcolor(white);
    End;
    gotoxy(13,16);
    write('             Press Enter to Try again / Press ESC to Exit ');
    Repeat
      key := readkey;
    Until (ord(key) = 27 ) Or (ord(key) = 13);
  Until ord(key) = 27;


End;




Function PrimeNum(number:longint): integer;

Var 
  x, check: longint;

Begin
  check := 0;
  x := 2 ;
  While x <= sqrt(number)  Do
    Begin
      If number Mod x = 0 Then
        Begin
          check := check +1;
          break;
        End
      Else If (number = 4 ) Or (number = 9) Then
             Begin
               check := check + 1;
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
    textbackground(5);
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
      textcolor(5);
      readln(UI);
      textcolor(white);
      val(UI,year,error);
    Until error = 0;
    Repeat
      gotoxy(10,12);
      clreol;
      write('Enter the Month:  ');
      textcolor(5);
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
      textcolor(5);
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
    textcolor(5);
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
    line[2] := '   [1] : Second Degree Equation Solver.';
    line[3] := '   [2] : Decomposition of a number.';
    line[4] := '   [3] : Guess My Number Game.';
    line[5] := '   [4] : Day Of The Week. ';
    line[6] := ' ';
    line[7] := '   [5] : Exit the program.';
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
        EquationSolver;
        clrscr;
      End
    Else If (y = 3 ) And (keypressed = #13 ) Then
           Begin
             clrscr;
             cursoron;
             Decomposition;
             clrscr;
           End
    Else If (y = 4 ) And (keypressed = #13 ) Then
           Begin
             clrscr;
             cursoron;
             GuessMyNumber;
             clrscr;
           End

    Else If (y =  5) And (keypressed = #13 ) Then
           Begin
             clrscr;
             cursoron;
             WeekDay;
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
