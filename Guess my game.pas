program randomiz;
uses
  crt;
var
  answer:integer;
  guess:integer;
  count:integer;
  game:char;
  UI:string;
  error:integer;

begin 
  repeat
    count :=0;
    repeat
    clrscr;
    writeln('Select a game : ');
    writeln;
    writeln('A) 1-10');
    writeln('B) 1-100');
    writeln('C) 1-1000');
    writeln;
    writeln('Enter the game ; ');
    readln(game);

    until (game = 'a') or (game = 'A') or (game = 'B') or (game = 'b') or (game = 'c') or (game = 'C');
  clrscr;
  randomize;
  case game of
  'a','A' : begin
                answer:=random(10)+1;
                writeln('Game 1-10');
            end;
  'b','B' : begin
                answer:=random(100)+1;
                writeln('Game 1-100');
            end;
  'c','C' : begin
                answer:=random(1000)+1;
                writeln('Game 1-1000');
            end;
  end;
    repeat
    
      repeat
      writeln('Enter your guess: ');
      readln(UI);
      val(UI,guess,error);
      if error <> 0 then
        writeln('Incorrect input try again');
      until error = 0; 

    count := count+1;

    if guess < answer then
        writeln('Too low, Try again')
  
    else if guess > answer then
        writeln('Too high, Try again')
    else 
      writeln('You guessed my number my number in: ',count, ' Guesses!' );
  
    until guess = answer;
    repeat
    write('Do you want to play again? Y/N ');
    readln(game);
    until (game = 'Y') or (game = 'y') or (game = 'N') or (game = 'n');


  until (game = 'N') or (game = 'n');


writeln();
writeln();
writeln('Press <Enter> to exit');
readln();

end.