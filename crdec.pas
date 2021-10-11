unit crdec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// обязательно смените ключи до использования
const
 StartKey = 471;  // Start default key
 MultKey = 62142; // Mult default
 AddKey = 11719;  // Add default key

function Encrypt(const InString:string; StartKey,MultKey,AddKey:Integer): string;
var
 i: Byte;
 // Если поменять тип переменной i на integer,
 // то будет возможно шифрование текста длиной более 255 символов
begin
 Result:='';
 for i:=1 to Length(InString) do
  begin
   Result:=Result+Char(Byte(InString[i]) xor (StartKey shr 8));
   StartKey:=(Byte(Result[i])+StartKey)*MultKey+AddKey;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 s: string;
begin
 if Edit2.Text<>''
 then
  begin
   Button1.Enabled:=false;
   Button2.Enabled:=true;
   s:=Encrypt(Edit2.Text, StartKey, MultKey, AddKey);
   ShowMessage('Расшифрованный текст: "'+s+'"');
  end;
end;

function Decrypt(const InString:string; StartKey,MultKey,AddKey:Integer): string;
var
 i: Byte;
 // Если поменять тип переменной i на integer,
 // то будет возможно шифрование текста длиной более 255 символов
begin
 Result:='';
 for i:=1 to Length(InString) do
  begin
   Result:=Result+Char(Byte(InString[i]) xor (StartKey shr 8));
   StartKey:=(Byte(InString[i])+StartKey)*MultKey+AddKey;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 if Edit1.Text<>''
 then
  begin
   Edit2.Text:=Decrypt(Edit1.Text, StartKey, MultKey, AddKey);
   Button1.Enabled:=true;
   Button2.Enabled:=false;   
  end;
end;

end.
