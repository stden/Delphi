program L9Project;

uses
  Vcl.Forms,
  L9Unit in 'L9Unit.pas' {L9Form};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TL9Form, L9Form);
  Application.Run;
end.
