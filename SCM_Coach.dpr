program SCM_Coach;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Main},
  Vcl.PlatformVclStylesActnCtrls in 'Vcl.PlatformVclStylesActnCtrls.pas',
  Vcl.Themes,
  Vcl.Styles,
  frmSessionNew in 'frmSessionNew.pas' {SessionNew};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
