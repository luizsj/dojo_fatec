program Dojo_Fatec;

uses
  Forms,
  frmPrincipal_Unit in 'frmPrincipal_Unit.pas' {frmPrincipal},
  dojo_turmas in 'dojo_turmas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
