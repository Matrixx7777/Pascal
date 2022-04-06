program Sprawozdanie_pierwsze_Dawid_Kocik;

Uses WinCrt;
//** Pascal - nazwa programu: Lazarus - Data wykonania pracy: 14.12.2021 **

//Tutaj deklarujemy zmienne, ktore bedziemy uzywac
var
  a,b,s,st,dx,x,a1,p,Eps,MaxI,wynik : double;
  i,n : integer;

// Tutaj definiujemy funkcje metod prostokatow,trapezow i simpsona
function f1(x : real) : real;
begin
  f1 := sin(x);
end;

function f2(x : real) : real;
begin
  f2 := sin(x);
end;

function f3(x : double) : double;
begin
  f3 := sin(x);
end;

// Tutaj definiujemy funkcje metody iteracyjnej Newtona
function metoda_Iteracyjna(liczba : double) : double;
begin
   while(i<MaxI) do
  begin
      wynik := 1/2 * (liczba + a1/liczba);
      if(abs(liczba - wynik) <= Eps) then break;
      liczba := wynik;
      i := i + 1;
  end;
   metoda_Iteracyjna := liczba;
end;

// Tutaj definiujemy funkcje metody rekurencyjnej Newtona
function metoda_Rekurencyjna(liczba : double) : double;
begin
  wynik := 1/2 * (liczba + a1/liczba);
  if((abs(liczba - wynik) <= Eps) or not (i<MaxI))
  then
      metoda_Rekurencyjna := liczba
  else
  begin
      liczba := wynik;
      i := i + 1;
      metoda_Rekurencyjna := metoda_Rekurencyjna(liczba);
  end;
end;

//********************
//** Program główny **
//********************

  begin
  writeln('SPRAWOZDANIE PIERWSZE - w Pascalu w programie Lazarus');
  writeln('Dawid Kocik - numer indeksu: 150911 - ROK: 2021');
  writeln('Kierunek: Informatyka niestacjonarna - Grupa: D1 - Semestr pierwszy');
  writeln;
  writeln('Obliczanie  calki oznaczonej');
  writeln('za pomoca metody prostokatow, trapezow i simpsona');
  writeln('----------------------------');
  writeln('Dawid Kocik');
  writeln;
  writeln('f(x) = sin(x)');
  writeln;
  writeln('Podaj poczatek przedzialu calkowania - Calka musi byc w przedziale <0,PI>');
  writeln;
  write('a = '); readln(a);
  writeln;
  while (a<0) do
   begin
     writeln;
     writeln('Zla liczba, wpisz liczbe wieksza od 0 i mniejsza od PI');
     writeln;
     write('a = '); readln (a);
     while (a>Pi) do
      begin
       writeln;
       writeln('Zla liczba, wpisz liczbe wieksza od 0 i mniejsza od PI');
       writeln;
       write('a = '); readln (a);
      end;
   end;
  writeln;
  while (a>Pi) do
   begin
     writeln;
     writeln('Zla liczba, wpisz liczbe wieksza od 0 i mniejsza od PI');
     writeln;
     write('a = '); readln (a);
       while (a<0) do
        begin
         writeln('Zla liczba, wpisz liczbe wieksza od 0 i mniejsza od PI');
         writeln;
         write('a = '); readln (a);
         writeln;
        end;
    end;

  writeln('Podaj koniec przedzialu calkowania - Calka musi byc w przedziale <0,PI>');
  writeln('oraz wieksza od a');
  writeln;
  write('b = '); readln(b);
  writeln;

  while (b<0) do
   begin
     writeln;
     writeln('Zla liczba, liczba musi byc wieksza od 0, mniejsza od PI');
     writeln('oraz wieksza od a');
     writeln;
     write('b = '); readln (b);

      while (b>Pi) do
       begin
        writeln;
        writeln('Zla liczba, liczba musi byc wieksza od 0, mniejsza od PI');
        writeln('oraz wieksza od a');
        writeln;
        write('b = '); readln (b);
         while (b<a) do
          begin
           writeln;
           writeln('Zla liczba, liczba musi byc wieksza od 0, mniejsza od PI');
           writeln('oraz wieksza od a');
           writeln;
           write('b = '); readln (b);
          end;
        end;
   end;

  while (b>Pi) do
   begin
     writeln;
     writeln('Zla liczba, liczba musi byc wieksza od 0, mniejsza od PI');
     writeln('oraz wieksza od a');
     writeln;
     write('b = '); readln (b);
     writeln;
      while (b< 0) do
       begin
        writeln;
        writeln('Zla liczba, liczba musi byc wieksza od 0, mniejsza od PI');
        writeln('oraz wieksza od a');
        writeln;
        write('b = '); readln (b);
         while (b<a) do
          begin
           writeln;
           writeln('Zla liczba, liczba musi byc wieksza od 0, mniejsza od PI');
           writeln('oraz wieksza od a');
           writeln;
           write('b = '); readln (b);
          end;
        end;
   end;

  while (b<a) do
   begin
    writeln;
    writeln('Zla liczba, liczba musi byc wieksza od 0, mniejsza od PI');
    writeln('oraz wieksza od a');
    writeln;
    write('b = '); readln (b);
    writeln;
     while (b>Pi) do
      begin
       writeln;
       writeln('Zla liczba, liczba musi byc wieksza od 0, mniejsza od PI');
       writeln('oraz wieksza od a');
       writeln;
       write('b = '); readln (b);
        while (b<0) do
         begin
          writeln;
          writeln('Zla liczba, liczba musi byc wieksza od 0, mniejsza od PI');
          writeln('oraz wieksza od a');
          writeln;
          write('b = '); readln (b);
         end;
       end;
   end;

  writeln;
  writeln('Podaj n jako liczbe podzialow');
  writeln;
  write('n = '); readln(n);
  writeln;

  //Metoda prostokatow
  s  := 0;
  dx := (b - a) / n;
  for i := 1 to n do s := s + f1(a + i * dx);
  s := s * dx;
  writeln('Wartosc calki metody prostokatow wynosi : ',s:8:3);
  writeln;

  //Metoda trapezow
  s  := 0;
  dx := (b - a) / N;
  for i := 1 to n - 1 do s := s + f2(a + i * dx);
  s := (s + (f2(a) + f2(b)) / 2)* dx;
  writeln('Wartosc calki metody trapezow wynosi : ',s:8:3);
  writeln;

  //Metoda simpsona
  s  := 0; st := 0;
  dx := (b - a) / n;
  for i := 1 to n do
  begin
    x  := a + i * dx;
    st := st + f3(x - dx / 2);
    if i < n then s := s + f3(x);
  end;
  s := dx / 6 * (f3(a) + f3(b) + 2 * s + 4 * st);
  writeln('Wartosc calki metody simpsona wynosi : ',s:8:3);
  writeln;

  writeln('Liczba podzialow wynosi :  ', n);
  writeln;
  writeln('Wartosci krancowe odcinka sa : ');
  writeln;
  writeln(' Od ', a,' Do ', b);
  writeln;
  writeln;

  begin
  writeln('********** Metoda Newtona - iteracja i rekurencja**********');
  writeln('-----------------------------------------------------------');
  writeln('Podaj wartosc liczby rzeczywistej dla a1');
  writeln;
  write('a1 = '); readln(a1);
  writeln;
  writeln('Podaj wartosc pierwszego przyblizenia dla p');
  writeln;
  write('p = '); readln(p);
  writeln;
  writeln('Podaj dokladnosc Eps');
  writeln;
  write('Eps = '); readln(eps);
  writeln;
  writeln('Podaj maksymalną liczbę iteracji dla MaxI');
  writeln;
  write('MaxI = '); readln(MaxI);
  writeln;
  writeln('Wynik metody iteracyjnej wynosi ', metoda_Iteracyjna(a1));
  writeln;
  writeln('Wynik metody rekurencyjnej wynosi ', metoda_Rekurencyjna(a1));
  writeln;

  writeln('Nacisnij klawisz Enter...');
  readln;
  end;
end.
