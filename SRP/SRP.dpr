program SRP;

uses
  System.StartUpCopy,
  FMX.Forms,
  SRP.View.Principal in 'SRP.View.Principal.pas' {frmPrincipal},
  uErrado in 'uErrado.pas',
  uUser in 'uUser.pas',
  uLogin in 'uLogin.pas',
  uAPIService in 'uAPIService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
