
Program day;

Var 
  DaysOfWeek: array[1..7] Of string = ('Sunday', 'Monday','Tuesday', 'Wednesday'
                                       ,'Thursday', 'Friday ', 'Saturday');
  Calcul: integer;
  year: integer;
  days: integer;
  month: integer;
  MonthCode: integer;
  CenturyCode: integer;
  Yearcode : integer;
  Century: integer;
  LeapYear: integer;
  Error: integer;
  UI: string;
  Maxday: integer;

Begin
  Repeat
    write('Enter the year :  ');
    readln(UI);
    val(UI,year,error);
  Until error = 0;
  Repeat
    write('Enter the Month:  ');
    readln(UI);
    val(UI,month,error);
  Until (error = 0) And (month <= 12 ) And (month > 0) ;
  If (year Mod 4 = 0) And (( year Mod 100 <> 0) Or (year Mod 400 = 0)) Then
    LeapYear := 1
  Else
    LeapYear := 0;
  If month > 2 Then
    LeapYear := 0;
  If (LeapYear = 1) and (month = 2 ) Then
    Maxday := 29
  Else if (LeapYear = 0) and (month = 2 ) then 
    Maxday := 28
  else if (month = 1 ) or (month = 3 ) or (month = 5 ) or (month = 7 ) or (month = 8 ) or(month = 10 ) or (month = 12 ) then
    Maxday := 31
  else  if (month = 4 ) or(month = 5 ) or(month = 6 ) or(month = 9 ) or (month = 11 ) then
    Maxday := 30;
  Repeat
    write('Enter the Day:  ');
    readln(UI);
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
  writeln(year, '\', Month,'\',days,' is a ',DaysOfWeek[Calcul+1]);
End.
