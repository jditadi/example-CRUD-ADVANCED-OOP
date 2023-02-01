program prjMain;

uses
  Vcl.Forms,
  prjBYKES in 'prjBYKES.pas' {Form21};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm21, Form21);
  Application.Run;
end.
