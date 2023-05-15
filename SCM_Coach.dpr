program SCM_Coach;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Main},
  Vcl.Themes,
  Vcl.Styles,
  frmSessionNew in 'frmSessionNew.pas' {SessionNew},
  dlgSquadNew in 'dlgSquadNew.pas' {SquadNew},
  Lexer in 'LINTER\Lexer.pas',
  SimpleLexer in 'LINTER\SimpleLexer.pas',
  dmCoach in 'dmCoach.pas' {COACH: TDataModule},
  dlgBootProgress in 'dlgBootProgress.pas' {BootProgress},
  dlgDOBPicker in 'dlgDOBPicker.pas' {DOBPicker},
  exeinfo in '..\SCM_SHARED\exeinfo.pas',
  SCMSimpleConnect in '..\SCM_SHARED\SCMSimpleConnect.pas',
  dlgBasicLogin in '..\SCM_SHARED\dlgBasicLogin.pas' {BasicLogin},
  SCMDefines in '..\SCM_SHARED\SCMDefines.pas',
  SCMUtility in '..\SCM_SHARED\SCMUtility.pas',
  Vcl.PlatformVclStylesActnCtrls in '..\SCM_SHARED\Vcl.PlatformVclStylesActnCtrls.pas',
  dlgAbout in '..\SCM_SHARED\dlgAbout.pas' {About},
  clsImportSCM in 'IMPORT\clsImportSCM.pas',
  dlgImportSCMWizard in 'IMPORT\dlgImportSCMWizard.pas' {ImportSCMWizard},
  dlgImportSelect in 'IMPORT\dlgImportSelect.pas' {ImportSelect},
  dmImportData in 'IMPORT\dmImportData.pas' {ImportData: TDataModule},
  SCMMemberObj in '..\SCM_SHARED\SCMMemberObj.pas',
  dlgDeleteHR in 'HR\dlgDeleteHR.pas' {DeleteHR},
  dlgFindHR in 'HR\dlgFindHR.pas' {FindHR},
  dlgGotoHR in 'HR\dlgGotoHR.pas' {GotoHR},
  dlgGotoHRRegNum in 'HR\dlgGotoHRRegNum.pas' {GotoHRRegNum},
  dmHRData in 'HR\dmHRData.pas' {HRData: TDataModule},
  frmHR in 'HR\frmHR.pas' {HR},
  rptFullHRDetail in 'HR\rptFullHRDetail.pas' {FullHRDetailRPT: TDataModule},
  rptFullHRList in 'HR\rptFullHRList.pas' {FullHRListRPT: TDataModule},
  rptFullHRSummary in 'HR\rptFullHRSummary.pas' {FullHRSummaryRPT: TDataModule},
  rptHRDetail in 'HR\rptHRDetail.pas' {HRDetailRPT: TDataModule},
  rptHRHistory in 'HR\rptHRHistory.pas' {HRHistoryRPT: TDataModule},
  unitUtility in 'unitUtility.pas',
  frmSquadT in 'SQUAD\frmSquadT.pas' {SquadT},
  dmSquadData in 'SQUAD\dmSquadData.pas' {SquadData: TDataModule},
  dlgSquadEditTemplate in 'SQUAD\dlgSquadEditTemplate.pas' {SquadEditTemplate},
  dlgNewSession in 'SESSION\dlgNewSession.pas' {NewSession},
  frmDisqualificationCodes in 'REPORTS\frmDisqualificationCodes.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
