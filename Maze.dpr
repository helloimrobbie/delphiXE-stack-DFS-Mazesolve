program Maze;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  Drawfunc in 'Drawfunc.pas',
  stackfunc in 'stackfunc.pas',
  mazefunc in 'mazefunc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
