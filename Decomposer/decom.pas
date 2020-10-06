
Program Decomposition;


Function PrimeNum(number:longint): integer;

Var 
  x : longint;
  check : longint;
  temp : integer;

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

Var 
  x : integer;
  num : longint;
  check : integer;
  z: longint;
Begin
  write('Enter your number: ');
  readln(Num);
  check := PrimeNum(num);
  If check = 0 Then
    writeln(num, ' is a prime number and cannot be decomposed')
  Else If check = 1 Then
         Begin
           z := num;
           x := 2;
           write('The Decomposition of ',num,' Is: ');
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

           write('1');

         End;
End.
