unit Dawid_Kocik_Sprawozdanie_2;

//Dawid Kocik-150911-21/22-Informatyka-D1-sem I
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

//Tworzony obiekt listy
type
  { Lista }
  TlistAll = ^TList;
  TList = record
    number: Integer;
    nextTurn: TlistAll;
  end;

  { TFormMain }

  TFormMain = class(TForm)
    ButtonSort: TButton;                              // Przycisk sortujacy
    ButtonRandom: TButton;                            // Przycisk losujący
    LabelRandom: TLabel;                              // Etykieta losujaca
    LabelSorted: TLabel;                              // Etykieta posortowana
    ListSorted: TListBox;                             // Lista posortowana
    ListRandom: TListBox;                             // Lista losowana
    procedure ButtonRandomClick(Sender: TObject);     // Procedura dzialajaca po nacisnieciu losowania
    procedure ButtonSortClick(Sender: TObject);       // Procedura dzialajaca po nacisnieciu sortowania

  private

    randomList: TlistAll;                             //Lista
    const maxValue: Integer = 1000;                   //Maksymalna wartosc losu
    const listSize: Integer = 19;                     //Długość listy


    { Metody }

    procedure randomElements;                         //Losowanie elementow listy
    procedure sortElements();                                 //Sortowanie listy
    procedure clear;                                   //Wyczyszczenie listy z pamięci
    procedure addIt;                                //Dodanie elementu na końcu listy
    function returnLastElement: TlistAll;             //Zwracanie ostatniego element z listy
    function cutLastElement(ele: Integer): TlistAll;  //Wycinanie elementu z listy
    function returnIt(ele: Integer)    : TlistAll;     //Zwracanie wskaźnika na n element listy
    procedure insertIt(ele: Integer; item: TlistAll); //Dodawanie elementu
    procedure changeElement(elementOne: Integer; elementTwo: Integer);  //Zamiana dwóch elementów listy
    procedure showElements(listBox: TListBox);        //Pokazanie listy w tabeli
  end;

var
  FormMain: TFormMain;

implementation

procedure TFormMain.randomElements();
var
   i : Integer;
begin
   Randomize;
   new(randomList);
   randomList^.nextTurn := NIL;
   randomList^.number := Random(maxValue);
   for i:= 0 to listSize do
   begin
     addIt;
   end;
end;

procedure TFormMain.sortElements();
var
  i: Integer;
  j: Integer;
  k: TlistAll;
begin
   new(k);
   k^.nextTurn:= randomList;
   randomList:=k;
   for i:= 0 to ListSize do begin
       for j:= 0 to ListSize - i do begin
           if (returnIt(j)^.number > returnIt(j + 1)^.number) then begin
              changeElement(j, j + 1)
           end;
       end;
   end;
   randomList:=randomList^.nextTurn;
   Dispose(k);
end;

function TFormMain.returnLastElement(): TlistAll;
begin
   Result:= randomList;
   while Result^.nextTurn <> NIL do
   begin
     Result:= Result^.nextTurn;
   end;
end;

procedure TFormMain.insertIt(ele: Integer; item : TlistAll);
 var
    k: TlistAll;
begin
   if ele = 0 then
   begin
      item^.nextTurn:= randomList;
      randomList:= item;
   end else
   begin
     k := randomList;
     while (k^.nextTurn <> NIL) AND (ele > 0) do
     begin
          k:= k^.nextTurn;
          ele:= ele - 1;
     end;
     if  k^.nextTurn <> NIL then
     begin
          item^.nextTurn := k^.nextTurn;
          k^.nextTurn:= item;
     end else
     begin
          k^.nextTurn:= item;
          item^.nextTurn:= NIL;
     end;
   end;
end;

function TFormMain.cutLastElement(ele: Integer): TlistAll;
var
   i: Integer = 0;
   k: TlistAll;
begin
   if (ele < 1) then
   begin
        Result := randomList;
        randomList := Result^.nextTurn;
   end else
   begin
     k := randomList;
     while ((k^.nextTurn <> NIL) AND (i < ele - 1)) do
     begin
       k := k^.nextTurn;
       i := i + 1;
     end;
     if(k^.nextTurn^.nextTurn <> NIL) then
     begin
          Result := k^.nextTurn;
          k^.nextTurn := k^.nextTurn^.nextTurn;
     end else
     begin
          Result := NIL;
     end;
   end;
end;

function TFormMain.returnIt(ele: Integer): TlistAll;
var
   i: Integer = 0;
begin
    Result := randomList;
    while ( Result^.nextTurn <> NIL) AND (i < ele) do
    begin
      Result := Result^.nextTurn;
      i := i + 1;
    end;
end;

procedure TFormMain.changeElement(elementOne: Integer; elementTwo: Integer);
var
   k: TlistAll;
begin
     k := cutLastElement(elementOne);
     insertIt(elementTwo - 1, k);
end;

procedure TFormMain.showElements(listBox: TListBox);
var
   i: Integer = 0;
   k: ^TList;
begin
    k := randomList;
    while k^.nextTurn <> NIL do
    begin
         i := i + 1;
         listBox.Items.Add(IntToStr(i) + ': ' + IntToStr(k^.number));
         k := k^.nextTurn;
    end;
end;

procedure TFormMain.clear();
var
   k: TlistAll;
begin
   k := randomList;
   if k <> NIL then
   begin
     while k^.nextTurn <> NIL do
      begin
           k := k^.nextTurn;
      end;

     Dispose(k);
     ListRandom.Items.Clear;
     ListSorted.Items.Clear;
   end;
end;

procedure TFormMain.addIt();
var
   newNumber: TlistAll;
   lastNumber: TlistAll;
begin
     new(newNumber);
     newNumber^.number:=Random(maxValue);
     newNumber^.nextTurn:=NIL;
     lastNumber:=returnLastElement;
     lastNumber^.nextTurn:=newNumber;
end;

procedure TFormMain.ButtonRandomClick(Sender: TObject);
begin
   clear;
   randomElements;
   showElements(ListRandom);
end;

procedure TFormMain.ButtonSortClick(Sender: TObject);
begin
    ListSorted.Items.Clear;
    sortElements();
    showElements(ListSorted);
end;

{$R *.lfm}
end.
