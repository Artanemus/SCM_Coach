program SCM_Coach;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Main},
  Vcl.PlatformVclStylesActnCtrls in 'Vcl.PlatformVclStylesActnCtrls.pas',
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
  frmManageMember in 'MEMBERS\frmManageMember.pas' {ManageMember},
  rptMemberDetail in 'MEMBERS\rptMemberDetail.pas' {MemberDetail: TDataModule},
  rptMemberHistory in 'MEMBERS\rptMemberHistory.pas' {MemberHistory: TDataModule},
  rptMembersDetail in 'MEMBERS\rptMembersDetail.pas' {MembersDetail: TDataModule},
  rptMembersList in 'MEMBERS\rptMembersList.pas' {MembersList: TDataModule},
  rptMembersSummary in 'MEMBERS\rptMembersSummary.pas' {MembersSummary: TDataModule},
  dmSCM in 'dmSCM.pas' {SCM: TDataModule},
  dlgBasicLogin in 'dlgBasicLogin.pas' {BasicLogin},
  dlgBootProgress in 'dlgBootProgress.pas' {BootProgress},
  SCMUtility in 'SCMUtility.pas',
  SCMDefines in 'SCMDefines.pas',
  dlgAbout in 'dlgAbout.pas' {About},
  exeinfo in 'exeinfo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
