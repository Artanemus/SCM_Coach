unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.PlatformDefaultStyleActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.ActnMan, Vcl.PlatformVclStylesActnCtrls,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.VirtualImage,
  dmCoach, dlgBootProgress, vcl.Themes;

type
  TMain = class(TForm)
    ActionManager1: TActionManager;
    File_Exit: TAction;
    Edit_Swimmers: TAction;
    Session_New: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    Session_Delete: TAction;
    Session_Edit: TAction;
    Edit_Coaches: TAction;
    Squad_New: TAction;
    Session_Clone: TAction;
    Squad_Edit: TAction;
    Squad_Delete: TAction;
    File_Import: TAction;
    File_Export: TAction;
    Edit_Preferences: TAction;
    ImageCollectionCoach: TImageCollection;
    virtImageListMenu: TVirtualImageList;
    File_Connect: TAction;
    Stats_Swimmer: TAction;
    Stats_Session: TAction;
    Stats_Performance: TAction;
    Programs_New: TAction;
    Tools_Pools: TAction;
    Tools_Dictionary: TAction;
    Tools_Drills: TAction;
    Tools_Intensity: TAction;
    Tools_PoolEquipment: TAction;
    Tools_Distance: TAction;
    Tools_Strokes: TAction;
    Programs_Edit: TAction;
    Programs_Delete: TAction;
    Programs_Clone: TAction;
    Tools_StopWatches: TAction;
    Tools_Timed: TAction;
    Reports_Session: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    ListView1: TListView;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
    relpnlPrgBuilderToolBar: TRelativePanel;
    RichEdit2: TRichEdit;
    VirtualImage1: TVirtualImage;
    VirtualImage2: TVirtualImage;
    Splitter1: TSplitter;
    virtImageListPrgBuilder: TVirtualImageList;
    VirtualImage3: TVirtualImage;
    Help_About: TAction;
    FlowPanel1: TFlowPanel;
    ListView2: TListView;
    ListView3: TListView;
    ListView4: TListView;
    ListView5: TListView;
    ListView6: TListView;
    VirtualImage4: TVirtualImage;
    VirtualImage5: TVirtualImage;
    VirtualImage6: TVirtualImage;
    Programs_Open: TAction;
    Programs_Save: TAction;
    Programs_SaveAs: TAction;
    Edit_Contacts: TAction;
    Tools_Inventory: TAction;
    Help_WebHelp: TAction;
    Tools_DisqualificationCodes: TAction;
    procedure FormCreate(Sender: TObject);
    procedure btnNewSessionClick(Sender: TObject);
    procedure Edit_SwimmersUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Edit_SwimmersExecute(Sender: TObject);
    procedure File_ImportUpdate(Sender: TObject);
    procedure File_ImportExecute(Sender: TObject);

  private
    { Private declarations }

    // Store vcl theme.
    fscmStyleName: String;

    // SPLASH SCREEN
    // - created in  Form.Create
    // - persistent until Form.Show
    bootprogress: TBootProgress;

    // ASSERT CONNECTION TO MSSQL DATABASE
    function AssertConnection(): boolean;
    procedure GetSCMPreferences();


  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

uses frmSessionNew, dlgBasicLogin, SCMUtility, IniFiles, frmManageSwimmers
, System.UITypes, dlgImportSelect, dlgImportSCMWizard;


function TMain.AssertConnection: boolean;
begin
  result := false;
  if Assigned(COACH) and COACH.coachConnection.Connected and COACH.CoreTablesActivated
  then
    result := true;
end;

procedure TMain.btnNewSessionClick(Sender: TObject);
var
Dlg: TSessionNew;
begin
  Dlg := TSessionNew.Create(Self);
  Dlg.ShowModal;
  Dlg.Free;
end;

procedure TMain.Edit_SwimmersExecute(Sender: TObject);
var
dlg: TManageSwimmers;
begin
  dlg := TManageSwimmers.Create(Self);
  dlg.ShowModal;
  dlg.Free;
end;

procedure TMain.Edit_SwimmersUpdate(Sender: TObject);
var
  DoEnable: boolean;
begin
  DoEnable := false;
  // MSSQL scmCoach connected and tables have been activated?
  if AssertConnection then
      DoEnable := true;
  TAction(Sender).Enabled := DoEnable;
end;

procedure TMain.File_ImportExecute(Sender: TObject);
var
  dlgA: TImportSelect;
  dlgB: TImportSCMWizard;
begin
  dlgA := TImportSelect.Create(Self);
  if IsPositiveResult(dlgA.ShowModal) then
  begin
    case dlgA.RtnValue of
      0:
        begin
          dlgB := TImportSCMWizard.Create(Self);
          // NOTE: requires COACH connection.
          dlgB.ShowModal;
          dlgB.Free;
        end;
      1,2:
        {TODO -oBSA -cGeneral : Procedures for import '.scm', '.hy3' to be written}
        ;
    end;
  end;
  dlgA.Free;
end;

procedure TMain.File_ImportUpdate(Sender: TObject);
var
  DoEnable: boolean;
begin
  DoEnable := false;
  // MSSQL scmCoach connected and core tables activated?
  if AssertConnection then
      DoEnable := true;
  TAction(Sender).Enabled := DoEnable;
end;

procedure TMain.FormCreate(Sender: TObject);
var
  aBasicLogin: TBasicLogin; // 24/04/2020 uses simple INI access
  result: TModalResult;
  passed: boolean;
  str: string;
  hf: NativeUInt;
begin

  try
    COACH := TCOACH.Create(self);
  finally
    // with SCM created and the essential tables are open then
    // asserting the connection should be true
    if not Assigned(COACH) then
    begin
      MessageDlg('The SCM connection couldn''t be created!', mtError,
        [mbOK], 0);
      Application.Terminate();
    end;
  end;

  if not Assigned(COACH) then
    exit;

  // -----------------------------------------------------------
  // 24/04/2020 Basic login using simple INI access
  // to the FireDAC connection definition file
  // -----------------------------------------------------------
  aBasicLogin := TBasicLogin.Create(self);
  aBasicLogin.DBName := 'SCM_Coach';
  aBasicLogin.DBConnection := COACH.coachConnection;
  result := aBasicLogin.ShowModal;
  aBasicLogin.Free;

  // user has aborted .
  if (result = mrAbort) or (result = mrCancel) then
  begin
    if (COACH.coachConnection.Connected) then
      COACH.coachConnection.Close;
    COACH.Free;
    COACH := nil;
    Application.Terminate;
    exit;
  end;

  bootprogress := TBootProgress.Create(self);
  bootprogress.Show;
  Application.ProcessMessages;

  bootprogress.lblProgress.Caption := 'Activating SQL Server tables.';
  bootprogress.lblProgress.Repaint;
  Application.ProcessMessages;

  // Activate COACH Tables
  COACH.ActivateTable;

  // then test 'IsActive
  if not COACH.CoreTablesActivated then
  begin
    MessageDlg('An error occurred during MSSQL table activation.' + sLineBreak +
      'The application will terminate!', mtError, [mbOK], 0);
    // play it safe and destroy this form
    FreeAndNil(bootprogress);
    // note: cleans and destroys SCM
    Application.Terminate;
    exit;
  end;

  bootprogress.lblProgress.Caption := 'Tables Activated ... OK.';
  bootprogress.lblProgress.Repaint;
  Application.ProcessMessages;

 // ---------------------------------------------------------
  // S C M   S y s t e m   I n i t i a l i z a t i o n.
  // ---------------------------------------------------------

  // Set default tab sheet page - Session
  PageControl1.TabIndex := 0;

  // store vcl.theme
  if Assigned(TStyleManager.ActiveStyle) then
    fscmStyleName := TStyleManager.ActiveStyle.Name;


  bootprogress.lblProgress.Caption := 'Checking user preferences.';
  bootprogress.lblProgress.Repaint;
  Application.ProcessMessages;

  // -----------------------------------------------------------------------
  // DO ONCE ... TEST FOR Artanemus\ in USER\APPDATA
  // -----------------------------------------------------------------------
  passed := true;
  str := GetEnvironmentVariable('APPDATA');
  str := IncludeTrailingPathDelimiter(str);
  str := str + 'Artanemus\';

  // Make sure the 'User\AppData\Roaming\Artanemus' is created!
  if not DirectoryExists(str) then
  begin
    if not CreateDir(str) then
      // FAILED! - Use alternative default document directory...
      passed := false;
  end;
  // Make sure the 'User\AppData\Roaming\Artanemus\SCM' is created!
  if (passed) then
  begin
    str := str + 'SCM\';
    if not DirectoryExists(str) then
    begin
      if not CreateDir(str) then
        // FAILED! - Use alternative default document directory...
        passed := false;
    end;
  end;
  // Make sure the 'User\AppData\Roaming\Artanemus\SCM\SCMCoachPref.ini' is created!
  // routine suits - 32bit platform.
  if (passed) then
  begin
    str := SCMUtility.GetSCMPreferenceFileName();
    if not FileExists(str) then
    begin
      hf := NativeUInt(FileCreate(str));
      // display a general message ... missing preference file.
      passed := false;
      if (NativeInt(hf) = -1) then
      begin
        // FAILED! - Use alternative default document directory...
        // critical error .... write permissions?
      end
      else
        // close of the handle.....
        FileClose(hf);
    end;
  end;

    bootprogress.lblProgress.Caption := 'Loading user preferences.';
  bootprogress.lblProgress.Repaint;
  Application.ProcessMessages;

  // ====================================================================
  // PREFERENCE - SETUP
  if (passed) then
    GetSCMPreferences();
  // ====================================================================

  // ENABLE HINTS ...
  Application.ShowHint := true;

  {
    Sort out the menubar font height - so tiny!

    The font of the MenuItemTextNormal element (or any other) in the style
    designer has no effect, this is because the Vcl Style Engine simply
    ignores the font-size and font-name, and just uses the font color defined in
    the vcl style file.

    S O L U T I O N :

    Define and register a new TActionBarStyleEx descendent and override
    the DrawText methods of the TCustomMenuItem and TCustomMenuButton
    classes, using the values of the Screen.MenuFont to draw the menu
  }

  Screen.MenuFont.Name := 'Segoe UI Semibold';
  Screen.MenuFont.Size := 12;
  ActionManager1.Style := PlatformVclStylesStyle;

end;


procedure TMain.FormDestroy(Sender: TObject);
begin
  // ASSERT - Kill splash screen.
  if Assigned(bootprogress) then
  begin
    bootprogress.Close;
    bootprogress.Free;
  end;

  // KILL DATA MODULE
  if Assigned(COACH) then
  begin
    if COACH.coachConnection.Connected then
      COACH.coachConnection.Close;
    COACH.Free;
  end;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  // ASSERT - Kill splash screen.
  if Assigned(bootprogress) then
  begin
    bootprogress.Close;
    bootprogress.Free;
    bootprogress := nil;
  end;
end;

procedure TMain.GetSCMPreferences;
var
  iniFileName: String;
  iFile: TIniFile;
  i: integer;
begin
  // ---------------------------------------------------------
  // A S S I G N   P R E F E R E N C E S ...
  // Note AA: Need to wrangle the return state on some preferences
  // as they refer to the state of a RAD checkbox.
  // A RAD checkbox may have three states -1, 0, 1.
  // ---------------------------------------------------------
  iniFileName := SCMUtility.GetSCMPreferenceFileName;
  if not FileExists(iniFileName) then
    exit;
  iFile := TIniFile.Create(iniFileName);

  // Switch to the default windows scheme else use stored fscmStyleName.
  // -------------------------------------------
  i := iFile.ReadInteger('Preferences', 'UseWindowsDefTheme',
    integer(cbUnchecked));
  if (i = integer(cbChecked)) then
  begin
    if (TStyleManager.ActiveStyle.Name <> 'Windows') then
      TStyleManager.TrySetStyle('Windows');
  end
  else if (TStyleManager.ActiveStyle.Name <> fscmStyleName) then
    TStyleManager.TrySetStyle(fscmStyleName);

  iFile.Free;

end;

end.
