unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox10: TComboBox;
    ComboBox11: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure CheckBox5Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  Solid, Compact,Economical,Sports,Rest,Color,Price,Brand,Body,Equip,Data,i,k,j,l,p,z,check,check1,a: integer;

  Error,Error1,skip: String;
  Stroka1,Stroka2,Stroka3,Stroka4,Stroka5,Stroka6,Stroka7,Stroka8,Stroka9,StrokaCopy,StrokaCopy1:String[240];
  tabl1:textfile;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ComboBox6Change(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin

end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin

end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
   Compact:= 1;
end;



procedure TForm1.CheckBox2Change(Sender: TObject);
begin
   Economical:=  1;
end;

procedure TForm1.CheckBox3Change(Sender: TObject);
begin
   Rest:=1 ;
end;

procedure TForm1.CheckBox4Change(Sender: TObject);
begin
   Solid:=1;
end;

procedure TForm1.CheckBox5Change(Sender: TObject);
begin
  Sports:= 1 ;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin

  Solid:=0;
  Compact:=0;
  Economical:=0;
  Rest:=0;
  Sports:=0;
  for a:=1 to 10 do
     ListBox1.items[a]:='';
assignfile(tabl1,'DB.txt');
reset(tabl1);
   Error:=  'Выбраны несовместимые категории';
   Error1:=  'Автомобиля с такой конфигурацией в базе данных нет';
   skip:=' ';
   if ComboBox7.Text='Yes' then Solid:=1;
   if ComboBox8.Text='Yes' then Compact:=1;
   if ComboBox9.Text='Yes' then Economical:=1;
   if ComboBox10.Text='Yes' then Rest:=1;
   if ComboBox11.Text='Yes' then Sports:=1;
    If ((Solid = 1) and (Compact = 1)) or ((Solid = 1) and  (Economical=1))
    Then  ListBox1.items[1]:=Error;
    If ((Compact = 1) and (Sports=1)) or ((Compact = 1) and (Rest=1))
    Then  ListBox1.items[1]:=Error;
    If ((Economical=1) and (Sports=1))
    Then  ListBox1.items[1]:=Error;
    If ((Rest=1) and (Sports=1))
    Then  ListBox1.items[1]:=Error;
    If not((Solid=Compact)and(Solid=Economical)and(Solid=Sports)and(Solid=Rest))
     then
      begin
       if Solid=1 then begin Compact:=-1; Economical:=-1; ;  end;
       if Compact=1 then begin Solid:=-1; Rest:=-1; Sports:=-1;   end;
       if Economical=1 then begin Solid:=-1; Sports:=-1; ; end;
       if Rest=1 then begin Compact:=-1; Sports:=-1;   end;
       if Sports=1 then begin Compact:=-1; Rest:=-1; Economical:=-1; end;
      end;
    Stroka3:=ComboBox6.text; //цвет
    Stroka4:=ComboBox5.text; //Год
    Stroka5:=ComboBox4.text; // Компл
    Stroka6:=ComboBox3.text; // Тип
    Stroka7:=ComboBox2.text; // Марк
    Stroka8:=ComboBox1.text; // Цена


  i:=1;
  k:=1;
  j:=1;
  l:=0;
  z:=1;
  StrokaCopy1:='Any';
  Check:=0;
  if ListBox1.items[1]=''
   then begin
  while (eof(tabl1)=false) do begin
        readln(tabl1,Stroka1);
               //Edit1.text:=inttostr(Compact);
              while ord(Stroka1[i])<>32   do begin
                    For j:=1 to 3 do If Stroka7[j]=StrokaCopy1[j] then check:=1 else begin check:=0; break; end;
              If (Stroka1[i]= Stroka7[k]) or (check=1)
             then
              begin
              ListBox1.items[z]:=ListBox1.items[z]+ Stroka1[i];
              i:=i+1;
              k:=k+1;
              end
              else
              Begin
              i:=i+1;
              ListBox1.items[z]:='';
              End;
             end;
          i:=i+1;
          k:=1;
          check:=0;
          if ListBox1.items[z]<>'' then ListBox1.items[z]:=ListBox1.items[z]+skip;
          while ord(Stroka1[i])<>32 do begin
              begin
              If (ListBox1.items[z]='') Then break;

              ListBox1.items[z]:=ListBox1.items[z]+ Stroka1[i];
              i:=i+1;
              end;

         end;
         if ListBox1.items[z]<>'' then ListBox1.items[z]:=ListBox1.items[z]+skip;
         i:=i+1;
          while ord(Stroka1[i])<>32 do begin
           If ListBox1.items[z]= '' Then break;
          For j:=1 to 3 do If Stroka3[j]=StrokaCopy1[j] then check:=1 else begin check:=0; break; end;
              If (Stroka1[i]= Stroka3[k]) or (check = 1)
             then
              begin

              //ListBox1.items[1]:=ListBox1.items[1]+ Stroka1[i];
              i:=i+1;
              k:=k+1;
              end

              else
              Begin
              i:=i+1;
              ListBox1.items[z]:='';
              End;
             end;
             i:=i+1;
          k:=1;
          check:=0;
          while ord(Stroka1[i])<>32 do begin
           If ListBox1.items[z]= '' Then break;
          For j:=1 to 3 do If Stroka4[j]=StrokaCopy1[j] then check:=1 else begin check:=0; break; end;
              If (Stroka1[i]= Stroka4[k]) or (check = 1)
             then
              begin
              ListBox1.items[z]:=ListBox1.items[z]+ Stroka1[i];
              i:=i+1;
              k:=k+1;
              end

              else
              Begin
              i:=i+1;
              ListBox1.items[z]:='';
              End;
             end;
          i:=i+1;
          k:=1;
          check:=0;
          while ord(Stroka1[i])<>32 do begin
           If ListBox1.items[z]= '' Then break;
          For j:=1 to 3 do If Stroka5[j]=StrokaCopy1[j] then check:=1 else begin check:=0; break; end;
              If (Stroka1[i]= Stroka5[k]) or (check = 1)
             then
              begin
              //ListBox1.items[z]:=ListBox1.items[z]+ Stroka1[i];
              i:=i+1;
              k:=k+1;
              end

              else
              Begin
              i:=i+1;
              ListBox1.items[z]:='';
              End;
             end;
          i:=i+1;
          k:=1;
          check:=0;
          while ord(Stroka1[i])<>32 do begin
           If ListBox1.items[z]= '' Then break;
          For j:=1 to 3 do If Stroka6[j]=StrokaCopy1[j] then check:=1 else begin check:=0; break; end;
              If (Stroka1[i]= Stroka6[k]) or (check = 1)
             then
              begin
              //ListBox1.items[z]:=ListBox1.items[z]+ Stroka1[i];
              i:=i+1;
              k:=k+1;
              end

              else
              Begin
              i:=i+1;
              ListBox1.items[z]:='';
              End;
             end;
          i:=i+1;
          k:=1;
          check:=0;
          while ord(Stroka1[i])<>32 do begin
           If ListBox1.items[z]= '' Then break;
          For j:=1 to 3 do If Stroka8[j]=StrokaCopy1[j] then check:=1 else begin check:=0; break; end;
              If (Stroka1[i]= Stroka8[k]) or (check = 1)
             then
              begin
              //ListBox1.items[z]:=ListBox1.items[z]+ Stroka1[i];
              i:=i+1;
              k:=k+1;
              end

              else
              Begin
              i:=i+1;
              ListBox1.items[z]:='';
              End;
             end;
          i:=i+1;
          k:=1;
            while ord(Stroka1[i])<>32 do begin
           If ListBox1.items[z]= '' Then break;

              If ((strtoint(Stroka1[i])=1)and(Solid=-1) or ((Solid=1) and (strtoint(Stroka1[i])=0)))
             then
              Begin
              i:=i+1;
              ListBox1.items[z]:='';
              End

              else
              begin
              //ListBox1.items[z]:=ListBox1.items[z]+ Stroka1[i];
              i:=i+1;
              k:=k+1;
              end;

             end;
          i:=i+1;
          k:=1;
              while ord(Stroka1[i])<>32 do begin
           If ListBox1.items[z]= '' Then break;

              If ((strtoint(Stroka1[i])=1)and(Compact=-1)or ((Compact=1) and (strtoint(Stroka1[i])=0)))
             then
              Begin
              i:=i+1;
              ListBox1.items[z]:='';
              End

              else
              begin
              //ListBox1.items[z]:=ListBox1.items[z]+ Stroka1[i];
              i:=i+1;
              k:=k+1;
              end;

             end;
          i:=i+1;
          k:=1;
          while ord(Stroka1[i])<>32 do begin
           If ListBox1.items[z]= '' Then break;

              If ((strtoint(Stroka1[i])=1)and(Economical=-1)  or ((Economical=1) and (strtoint(Stroka1[i])=0)))
             then
              Begin
              i:=i+1;
              ListBox1.items[z]:='';
              End

              else
              begin
              //ListBox1.items[z]:=ListBox1.items[z]+ Stroka1[i];
              i:=i+1;
              k:=k+1;
              end;

             end;
          i:=i+1;
          k:=1;
          while ord(Stroka1[i])<>32 do begin
           If ListBox1.items[z]= '' Then break;

              If ((strtoint(Stroka1[i])=1)and(Rest=-1)  or ((Rest=1) and (strtoint(Stroka1[i])=0)))
             then
              Begin
              i:=i+1;
              ListBox1.items[z]:='';
              End

              else
              begin
              //ListBox1.items[z]:=ListBox1.items[z]+ Stroka1[i];
              i:=i+1;
              k:=k+1;
              end;

             end;
          i:=i+1;
          k:=1;
          while ord(Stroka1[i])<>32 do begin
           If ListBox1.items[z]= '' Then break;

              If ((strtoint(Stroka1[i])=1)and(Sports=-1)   or ((Sports=1) and (strtoint(Stroka1[i])=0)))
             then
              Begin
              i:=i+1;
              ListBox1.items[z]:='';
              End

              else
              begin
              //ListBox1.items[z]:=ListBox1.items[z]+ Stroka1[i];
              i:=i+1;
              k:=k+1;
              end;

             end;
          i:=i+1;
          k:=1;
          i:=1;
          k:=1;
          check:=0;
          if ListBox1.items[z]<>'' then z:=z+1;
   // Color,Price,Brand,Body,Equip,Data






end;
   If (ListBox1.items[1]='')
    Then     ListBox1.items[1]:=Error1;
    closefile(tabl1);

end;

end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin

end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin

end;

procedure TForm1.ComboBox4Change(Sender: TObject);
begin

end;

procedure TForm1.ComboBox5Change(Sender: TObject);
begin

end;

end.

