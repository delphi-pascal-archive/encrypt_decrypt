program Cr_decr;

uses
  Forms,
  crdec in 'crdec.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
