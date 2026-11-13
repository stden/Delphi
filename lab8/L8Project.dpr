program L8Project;

uses
  Vcl.Forms,
  L8Unit in 'L8Unit.pas' {L8Form};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TL8Form, L8Form);
  Application.Run;
end.
