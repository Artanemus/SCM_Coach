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
  dlgDeleteMember in 'MEMBERS\dlgDeleteMember.pas' {DeleteMember},
  dlgFindMember in 'MEMBERS\dlgFindMember.pas' {FindMember},
  dlgGotoMember in 'MEMBERS\dlgGotoMember.pas' {GotoMember},
  dlgGotoMembership in 'MEMBERS\dlgGotoMembership.pas' {GotoMembership},
  dmManageMemberData in 'MEMBERS\dmManageMemberData.pas' {ManageMemberData: TDataModule},
  frmManageSwimmers in 'MEMBERS\frmManageSwimmers.pas' {ManageSwimmers},
  rptMemberDetail in 'MEMBERS\rptMemberDetail.pas' {MemberDetail: TDataModule},
  rptMemberHistory in 'MEMBERS\rptMemberHistory.pas' {MemberHistory: TDataModule},
  rptMembersDetail in 'MEMBERS\rptMembersDetail.pas' {MembersDetail: TDataModule},
  rptMembersList in 'MEMBERS\rptMembersList.pas' {MembersList: TDataModule},
  rptMembersSummary in 'MEMBERS\rptMembersSummary.pas' {MembersSummary: TDataModule},
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
  SCMMemberObj in '..\SCM_SHARED\SCMMemberObj.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
