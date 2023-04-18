unit dlgImportSCMWizard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  Vcl.StdCtrls, Vcl.VirtualImage, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.ComCtrls, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, dmCOACH, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.WinXCtrls, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  System.Contnrs, Vcl.Buttons, clsImportSCM, SCMMemberObj;

type

  TImportSCMWizard = class(TForm)
    wizSCMConnection: TFDConnection;
    UICollection: TImageCollection;
    qrySCMSwimmer: TFDQuery;
    qrySCMSwimmerFNAME: TWideStringField;
    qrySCMSwimmerMemberID: TFDAutoIncField;
    qrySCMSwimmerFirstName: TWideStringField;
    qrySCMSwimmerLastName: TWideStringField;
    pnlFooter: TRelativePanel;
    btnPrev: TButton;
    UIImageList: TVirtualImageList;
    btnNext: TButton;
    btnCancel: TButton;
    pnlHeader: TRelativePanel;
    imgTackBkgrd: TVirtualImage;
    actnManager: TActionManager;
    actnLogin: TAction;
    pageCNTRL: TPageControl;
    tabStart: TTabSheet;
    lblMsgStartInfo: TLabel;
    tabLogin: TTabSheet;
    Shape3: TShape;
    lblServer: TLabel;
    lblUserName: TLabel;
    lblPassword: TLabel;
    lblMsgLoginErr: TLabel;
    lblMsgLoginInfo: TLabel;
    lblMsgLogin: TLabel;
    chkOsAuthent: TCheckBox;
    edtPassword: TEdit;
    edtServer: TEdit;
    edtUser: TEdit;
    btnDisconnect: TButton;
    btnLogin: TButton;
    btnConnect: TButton;
    tabMethod: TTabSheet;
    Shape4: TShape;
    lblMsgMethodInfo: TLabel;
    rgrpMethod: TRadioGroup;
    tabSelect: TTabSheet;
    Shape1: TShape;
    imgArrowRight: TVirtualImage;
    imgArrowLeft: TVirtualImage;
    imgArrowRightDbl: TVirtualImage;
    imgArrowLeftDbl: TVirtualImage;
    imgSearch: TVirtualImage;
    lblMsgSelectInfo: TLabel;
    edtSearch: TEdit;
    tabOptions: TTabSheet;
    Shape2: TShape;
    lblMsgOptionsInfo: TLabel;
    lblOptionProfileInfo: TLabel;
    chkbDoProfile: TCheckBox;
    tabFinalStep: TTabSheet;
    tabSuccess: TTabSheet;
    actnSrcToDestAll: TAction;
    actnDestToSrcAll: TAction;
    actnSrcToDestSelected: TAction;
    actnDestToSrcSelected: TAction;
    lbSrc: TListBox;
    lbDest: TListBox;
    memoStart: TMemo;
    actnExit: TAction;
    actnPrev: TAction;
    actnNext: TAction;
    actnDisconnect: TAction;
    pnlFinalStep: TRelativePanel;
    btnGo: TButton;
    lblGo: TLabel;
    actnGo: TAction;
    imgStartBanner: TVirtualImage;
    sbtnMethod: TSpeedButton;
    sbtnLogin: TSpeedButton;
    sbtnStart: TSpeedButton;
    sbtnSelect: TSpeedButton;
    sbtnOptions: TSpeedButton;
    sbtnFinalStep: TSpeedButton;
    sbtnSuccess: TSpeedButton;
    WizardCollection: TImageCollection;
    WizardImageList: TVirtualImageList;
    lblLoginDBver: TLabel;
    chkbDoRaceHistory: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ListBoxSrcDragOver(Sender, Source: TObject; X, Y: integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBoxSrcDragDrop(Sender, Source: TObject; X, Y: integer);
    procedure actnLoginExecute(Sender: TObject);
    procedure actnLoginUpdate(Sender: TObject);
    procedure actnSrcToDestAllExecute(Sender: TObject);
    procedure actnSrcToDestSelectedExecute(Sender: TObject);
    procedure actnDestToSrcAllExecute(Sender: TObject);
    procedure actnDestToSrcSelectedExecute(Sender: TObject);
    procedure ListBoxDestDragDrop(Sender, Source: TObject; X, Y: integer);
    procedure ListBoxDestDragOver(Sender, Source: TObject; X, Y: integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure rgrpMethodClick(Sender: TObject);
    procedure actnExitExecute(Sender: TObject);
    procedure pageCNTRLChange(Sender: TObject);
    procedure actnGoUpdate(Sender: TObject);
    procedure actnGoExecute(Sender: TObject);
    procedure actnDisconnectUpdate(Sender: TObject);
    procedure actnDisconnectExecute(Sender: TObject);
    procedure sbtnGenericClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure actnNextUpdate(Sender: TObject);
    procedure actnNextExecute(Sender: TObject);
    procedure actnPrevUpdate(Sender: TObject);
    procedure actnPrevExecute(Sender: TObject);

  private
    { Private declarations }
    scmMemberList: TObjectList;
    fTrackState: integer;
    fLastMethodState: integer;
    fImportDone: Boolean;

    function AssertAllConnections: Boolean;
    function MemberIsAssigned(obj: TObject; lbox: TListBox): Boolean;
    procedure BuildListBoxSource();
    procedure TransferItems(SrcListBox, DestListBox: TObject);

    procedure NavButtonState; // improves UI declared but never used (DNY).

    // WIZARD TRACK BAR
    procedure TrackStateSync; // DNY
    procedure TrackStateInit;
    procedure TrackStateUpdate;
    procedure TrackStateBkgrdTabs;
    procedure TrackStateConnected;
    procedure TrackStateTick;
    procedure TrackStateButtons;
    procedure TrackStateTabs;

  public
    { Public declarations }

  end;

var
  ImportSCMWizard: TImportSCMWizard;

implementation

{$R *.dfm}

uses (*
    dlgBasicLoginSCM,
  *) System.Math, IniFiles, SCMUtility, SCMSimpleConnect, System.StrUtils;

// DON'T CALL HERE IF SCM NOT ISACTIVE
procedure TImportSCMWizard.actnDisconnectExecute(Sender: TObject);
begin
  wizSCMConnection.Close;
  TrackStateInit;
end;

procedure TImportSCMWizard.actnDisconnectUpdate(Sender: TObject);
begin
  if (Assigned(wizSCMConnection) and wizSCMConnection.Connected) then
    btnDisconnect.Enabled := true
  else
    btnDisconnect.Enabled := false;
end;

procedure TImportSCMWizard.actnDestToSrcAllExecute(Sender: TObject);
begin
  lbDest.SelectAll;
  TransferItems(lbDest, lbSrc);
end;

procedure TImportSCMWizard.actnDestToSrcSelectedExecute(Sender: TObject);
begin
  TransferItems(lbDest, lbSrc);
end;

procedure TImportSCMWizard.actnExitExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TImportSCMWizard.actnGoExecute(Sender: TObject);
var
  cls: TImportMember;
begin
  // ---------------------------------------------------------------
  // I M P O R T .
  // ---------------------------------------------------------------
  // Note: Connections and import state asserted in TAction.Update.
  // To remove clutter from the wizards dialogue and improve code readability
  // a SCM import class is constructed ...
  cls := TImportMember.CreateWithConnections(Self, wizSCMConnection,
    COACH.coachConnection);

  // I N T R O D U C E  N E W   M E M B E R (S)  T O   S QU A D .
  if (rgrpMethod.ItemIndex = 1) then
  begin
    cls.InsertMember(lbDest.Items, chkbDoRaceHistory.Checked);
  end;
  // U P D A T E   P R O F I L E A N D   R A C E   H I S T O R Y .
  if (rgrpMethod.ItemIndex = 0) then
  begin
    cls.UpdateMembers(lbDest.Items);
  end;

  cls.Free;

end;

procedure TImportSCMWizard.actnGoUpdate(Sender: TObject);
begin
  if AssertAllConnections and (rgrpMethod.ItemIndex <> -1) and
    (lbDest.Items.Count > 0) and
    (chkbDoProfile.Checked or chkbDoRaceHistory.Checked) then
  begin
    if not TAction(Sender).Enabled then
    begin
      { TODO -oBSA -cGeneral : Assign disabled button image on }
      TAction(Sender).Enabled := true;
      lblGo.Enabled := true;
    end;
  end
  else
  begin
    if TAction(Sender).Enabled then
    begin
      TAction(Sender).Enabled := false;
      lblGo.Enabled := false;
    end;
  end;
end;

procedure TImportSCMWizard.actnLoginExecute(Sender: TObject);
var
  sc: TSimpleConnect;
begin
  // Hide the Login and abort buttons while attempting connection
  lblMsgLoginErr.Visible := false;
  btnConnect.Visible := true;
  lblMsgLogin.Visible := true;
  lblMsgLogin.Update();
  Application.ProcessMessages();

  sc := TSimpleConnect.CreateWithConnection(Self, wizSCMConnection);
  // OMITTED - The default database used by TSimpleConnect is SwimClubMeet.
  // sc.DatabaseName := 'SwimClubMeet';
  sc.SimpleMakeTemporyConnection(edtServer.Text, edtUser.Text, edtPassword.Text,
    chkOsAuthent.Checked);

  lblMsgLogin.Visible := false;
  if (wizSCMConnection.Connected) then
  begin
    BuildListBoxSource;
    fTrackState := 2;
    TrackStateUpdate;
    // move to the 'Method' tab-sheet.
    pageCNTRL.SelectNextPage(true, true);
  end
  else
  begin
    // show error message - let user try again or abort
    lblMsgLoginErr.Visible := true;
    fTrackState := 1;
    TrackStateUpdate;
  end;

  sc.Free;

end;

procedure TImportSCMWizard.actnLoginUpdate(Sender: TObject);
begin
  if (Assigned(wizSCMConnection) and wizSCMConnection.Connected) then
    btnLogin.Enabled := false
  else
    btnLogin.Enabled := true;
end;

procedure TImportSCMWizard.actnNextExecute(Sender: TObject);
begin
  pageCNTRL.SelectNextPage(true, true);
end;

procedure TImportSCMWizard.actnNextUpdate(Sender: TObject);
var
  Page: TTabSheet;
begin
  Page := pageCNTRL.FindNextPage(pageCNTRL.ActivePage, true, true);
  if (Page <> nil) then
    TAction(Sender).Enabled := true
  else
    TAction(Sender).Enabled := false;
end;

procedure TImportSCMWizard.actnPrevExecute(Sender: TObject);
begin
  pageCNTRL.SelectNextPage(false, true);
end;

procedure TImportSCMWizard.actnPrevUpdate(Sender: TObject);
var
  Page: TTabSheet;
begin
  Page := pageCNTRL.FindNextPage(pageCNTRL.ActivePage, false, true);
  if (Page <> nil) then
    TAction(Sender).Enabled := true
  else
    TAction(Sender).Enabled := false;
end;

procedure TImportSCMWizard.actnSrcToDestAllExecute(Sender: TObject);
begin
  lbSrc.SelectAll;
  TransferItems(lbSrc, lbDest);
end;

procedure TImportSCMWizard.actnSrcToDestSelectedExecute(Sender: TObject);
begin
  TransferItems(lbSrc, lbDest);
end;

function TImportSCMWizard.AssertAllConnections: Boolean;
begin
  result := false;
  if Assigned(COACH) and COACH.coachConnection.Connected and Assigned(wizSCMConnection)
    and wizSCMConnection.Connected then
    result := true;
end;

procedure TImportSCMWizard.btnNextClick(Sender: TObject);
begin
  pageCNTRL.SelectNextPage(true, true);
end;

procedure TImportSCMWizard.BuildListBoxSource;
var
  Count: integer;
  s: string;
  obj: TscmMemberObj;
  j: integer;

begin
  // reset SOURCE AND DESTINATION ListBoxes AND ObjectList state.
  lbSrc.Clear;
  lbDest.Clear;
  scmMemberList.Clear;

  // Gather ALL swimmers in SwimClubMeet
  if wizSCMConnection.Connected then
  begin
    // -------------------------------------------------------------------
    // Method  : INTRODUCE
    // Induct SwimClubMeet Members into your squad.
    // EXCLUDE from list SCM Members who are already in SCM_Coach.
    // -------------------------------------------------------------------
    if (rgrpMethod.ItemIndex = 1) then
    begin
      qrySCMSwimmer.Connection := wizSCMConnection;
      qrySCMSwimmer.Open;
      if qrySCMSwimmer.Active then
      Begin
        while not qrySCMSwimmer.eof do
        begin
          Count := COACH.coachConnection.ExecSQLScalar
            ('SELECT COUNT(SCMMemberID) FROM HR WHERE HR.SCMMemberID = :ID',
            [qrySCMSwimmer.FieldByName('MemberID').AsInteger]);

          if ((Count = 0) and (rgrpMethod.ItemIndex = 1)) OR
            ((Count > 0) and (rgrpMethod.ItemIndex = 0)) then
          begin
            obj := TscmMemberObj.Create;
            obj.ID := qrySCMSwimmer.FieldByName('MemberID').AsInteger;
            obj.Name := qrySCMSwimmer.FieldByName('FName').AsString;
            j := scmMemberList.Add(obj);
            s := qrySCMSwimmer.FieldByName('FName').AsString;
            lbSrc.Items.AddObject(s, scmMemberList.Items[j]);
          end;
          qrySCMSwimmer.next;
        end;
      End;
      qrySCMSwimmer.Close;
    end
    // -------------------------------------------------------------------
    // Method : UPDATE.
    // Update the profiles and stats of your swimmers in your squad.
    // INCLUDE only SCM Members who are in the squad.
    // -------------------------------------------------------------------
    else
    begin
      { TODO -oBSA -cGeneral : build queries for update profiles }
    end;
  end;
end;

procedure TImportSCMWizard.edtSearchChange(Sender: TObject);
var
  i: integer;
  obj: TscmMemberObj;
  s: string;
begin
  // Rebuild SOURCE LISTBOX using the objectlist.
  lbSrc.Clear;
  for i := 0 to scmMemberList.Count - 1 do
  begin
    obj := (scmMemberList.Items[i] as TscmMemberObj);
    // Already assigned to right-listbox.
    if MemberIsAssigned(obj, lbDest) then
      continue;
    s := obj.Name;
    // DO ALL
    if (length(edtSearch.Text) = 0) then
      lbSrc.Items.AddObject(s, obj)
    else
    begin
      // FILTER - test for sub-string
      if ContainsText(s, edtSearch.Text) then
        lbSrc.Items.AddObject(s, obj);
    end;
  end;
end;

procedure TImportSCMWizard.FormCreate(Sender: TObject);
var
  AValue, ASection, AName: string;

begin
  // set login visual state
  lblMsgLoginErr.Visible := false;
  lblMsgLogin.Visible := false;

  // assert initial connection state.
  wizSCMConnection.Connected := false;

  // CREATE list of members from SwimClubMeet
  scmMemberList := TObjectList.Create(true);

  // Populate login with 'SCM core' last state else default values
  ASection := 'MSSQL_SwimClubMeet';
  AName := 'Server';
  edtServer.Text := LoadSharedIniFileSetting(ASection, AName);
  AName := 'User';
  edtUser.Text := LoadSharedIniFileSetting(ASection, AName);
  AName := 'Password';
  edtPassword.Text := LoadSharedIniFileSetting(ASection, AName);
  AName := 'OsAuthent';
  AValue := LoadSharedIniFileSetting(ASection, AName);

  if ((UpperCase(AValue) = 'YES') or (UpperCase(AValue) = 'TRUE')) then
    chkOsAuthent.Checked := true
  else
    chkOsAuthent.Checked := false;

  // Select first tab-sheet
  pageCNTRL.TabIndex := 0;
  // Method UNKNOWN
  rgrpMethod.ItemIndex := -1;
  chkbDoProfile.Checked := true;
  chkbDoRaceHistory.Checked := true;
  fLastMethodState := -1;
  // TrackState WELCOME
  fTrackState := 0;
  // INIT wizard tracker display
  sbtnStart.Down := true;
  TrackStateInit;
  fImportDone := false;

end;

procedure TImportSCMWizard.FormDestroy(Sender: TObject);
begin
  scmMemberList.Clear;
end;

procedure TImportSCMWizard.ListBoxDestDragDrop(Sender, Source: TObject;
  X, Y: integer);
begin
  // Source - the object being dropped.
  TransferItems(Source, Sender);
end;

procedure TImportSCMWizard.ListBoxDestDragOver(Sender, Source: TObject;
  X, Y: integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TListBox;
end;

procedure TImportSCMWizard.ListBoxSrcDragDrop(Sender, Source: TObject;
  X, Y: integer);
begin
  TransferItems(Source, Sender);
end;

procedure TImportSCMWizard.ListBoxSrcDragOver(Sender, Source: TObject;
  X, Y: integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TListBox;
end;

function TImportSCMWizard.MemberIsAssigned(obj: TObject;
  lbox: TListBox): Boolean;
var
  i: integer;
begin
  // check if obj is used by to lboxView
  result := false;
  for i := 0 to lbox.Count - 1 do
  begin
    if (obj = lbox.Items.Objects[i]) then
    begin
      result := true;
      break;
    end;
  end;
end;

procedure TImportSCMWizard.pageCNTRLChange(Sender: TObject);
begin

  // place a call to TrackState ticks
  TrackStateTick;
  // NavButtonState;
  // ------------------------------------------------------
  // TABSHEET - data and UI, checks and updates
  // ------------------------------------------------------
  case TPageControl(Sender).TabIndex of
    0: // START - INTRO
      if not sbtnStart.Down then
        sbtnStart.Down := true;
    1: // TABSHEET LOGIN
      if not sbtnLogin.Down then
        sbtnLogin.Down := true;
    2: // TABSHEET METHOD
      begin
        if not sbtnMethod.Down then
          sbtnMethod.Down := true;
        // method assigned - but not in sync
        if (rgrpMethod.ItemIndex <> -1) and (fTrackState < 3) then
        begin
          fTrackState := 3;
          TrackStateUpdate;
        end;
      end;
    3: // TABSHEET SELECT
      begin
        if not sbtnSelect.Down then
          sbtnSelect.Down := true;
        // Is the member's list in sync with the 'Processing Method'?
        if (fLastMethodState <> rgrpMethod.ItemIndex) then
        begin
          // B U I L D   M E M B E R ' S   L I S T .
          BuildListBoxSource;
          fLastMethodState := rgrpMethod.ItemIndex;
        end;

        if (rgrpMethod.ItemIndex = 0) then
          // Update profiles
          lblMsgSelectInfo.Caption :=
            'Select the swimmers to have their profiles updated.'
        else
          // Introduce club memeber
          lblMsgSelectInfo.Caption :=
            'Select the club members to induct into your squad.';
      end;
    4: // TABSHEET OPTIONS
      begin
        if not sbtnOptions.Down then
          sbtnOptions.Down := true;
        if (rgrpMethod.ItemIndex = 0) then
        begin
          // UPDATE
          chkbDoProfile.Caption := 'Update squad swimmer''s profiles.';
          chkbDoProfile.Enabled := true;
          // Description
          lblOptionProfileInfo.Caption :=
            'Enable this option to have your swimmer''s profiles updated.';
          // Option race-history
          chkbDoRaceHistory.Caption := 'Update swimming history.';
        end
        else
        begin
          // INTRODUCE
          chkbDoProfile.Caption := 'Import club member''s profiles.';
          chkbDoProfile.Enabled := false;
          chkbDoProfile.Checked := true;
          // Description
          lblOptionProfileInfo.Caption :=
            'This option is always checked when introducing new SCM swimmers to your squad.';
          // Option race-history
          chkbDoRaceHistory.Caption := 'Import swimming history.';
        end;
      end;
    5: // TABSHEET GO
      begin
        if not sbtnFinalStep.Down then
          sbtnFinalStep.Down := true;
        if (rgrpMethod.ItemIndex = 0) then
          lblGo.Caption := 'Click to update your squad swimmer''s data.'
        else
          lblGo.Caption :=
            'Click to introduce selected SCM members into your squad.';
      end;
  end;

  // place a call to TrackState ticks
  TrackStateTick;
  // NavButtonState;
end;

procedure TImportSCMWizard.rgrpMethodClick(Sender: TObject);
begin
  // User picks data method
  if (fTrackState <> 3) then
  begin
    fTrackState := 3;
    TrackStateUpdate;
    // move to the 'Select' tab-sheet.
    pageCNTRL.SelectNextPage(true, true);
  end;
end;

procedure TImportSCMWizard.sbtnGenericClick(Sender: TObject);
var
  pageIndx: integer;
begin
  pageIndx := TSpeedButton(Sender).Tag;
  if (pageCNTRL.TabIndex <> pageIndx) then
    pageCNTRL.TabIndex := pageIndx;
  if not TSpeedButton(Sender).Down then
    TSpeedButton(Sender).Down := true;
end;

procedure TImportSCMWizard.TransferItems(SrcListBox, DestListBox: TObject);
var
  i: integer;
begin
  with (SrcListBox AS TListBox) do
  begin
    try
      for i := 0 to Items.Count - 1 do
      begin
        if Selected[i] then
          // NOTE: destination MemberList is assigned source object.
          (DestListBox AS TListBox).Items.AddObject(Items[i], Items.Objects[i]);
      end;
    finally
      // NOTE: Source's assigned objects are not freed (in use).
      DeleteSelected;
    end;
  end;
end;

procedure TImportSCMWizard.TrackStateConnected;
begin
  if Assigned(wizSCMConnection) and wizSCMConnection.Connected then
  begin
    if (sbtnLogin.ImageName <> 'wizImageTick') then
      sbtnLogin.ImageName := 'wizImageTick';
  end
  else
  begin
    if (sbtnLogin.ImageName <> 'wizImage') then
      sbtnLogin.ImageName := 'wizImage';
  end;
end;

procedure TImportSCMWizard.TrackStateInit;
begin
  fTrackState := 1;
  pageCNTRL.TabIndex := 0;
  chkbDoProfile.Checked := true;
  chkbDoRaceHistory.Checked := true;
  lbSrc.Clear;
  lbDest.Clear;
  scmMemberList.Clear;
  TrackStateUpdate;
end;

procedure TImportSCMWizard.NavButtonState;
begin
  case pageCNTRL.TabIndex of
    0:
      begin
        btnPrev.Enabled := false
      end;
    1:
      begin
        btnPrev.Enabled := true;
        if Assigned(wizSCMConnection) and wizSCMConnection.Connected then
          btnNext.Enabled := true
        else
          btnNext.Enabled := false;
      end;
    2:
      begin
        btnPrev.Enabled := true;
        if (rgrpMethod.ItemIndex <> -1) then
          btnNext.Enabled := true
        else
          btnNext.Enabled := false;
      end;
    3:
      begin
        btnPrev.Enabled := true;
        if (lbDest.Items.Count > 0) then
          btnNext.Enabled := true
        else
          btnNext.Enabled := false;
      end;
    4, 5:
      begin
        btnPrev.Enabled := true;
        btnNext.Enabled := true;
      end;
    6:
      begin
        btnPrev.Enabled := true;
        btnNext.Enabled := false;
      end;
  end;
end;

procedure TImportSCMWizard.TrackStateSync;

begin
  fTrackState := 1;
  if Assigned(wizSCMConnection) and wizSCMConnection.Connected then
    fTrackState := 2; // Method enabled
  if (rgrpMethod.ItemIndex <> -1) then
    fTrackState := 3; // Select enabled
  if (lbDest.Items.Count > 0) then
    fTrackState := 4; // ALL - tabsheet 'Success'

  // if (chkbDoProfile.Checked or (rgrpOptionsData.ItemIndex <> -1)) then

  if fImportDone then
    fTrackState := 5; // ALL
end;

procedure TImportSCMWizard.TrackStateTabs;
begin
  case fTrackState of
    1:
      begin
        tabMethod.TabVisible := false;
        tabSelect.TabVisible := false;
        tabOptions.TabVisible := false;
        tabFinalStep.TabVisible := false;
        tabSuccess.TabVisible := false;
      end;
    2:
      begin
        tabMethod.TabVisible := true;
        tabSelect.TabVisible := false;
        tabOptions.TabVisible := false;
        tabFinalStep.TabVisible := false;
        tabSuccess.TabVisible := false;
      end;
    3:
      begin
        tabMethod.TabVisible := true;
        tabSelect.TabVisible := true;
        tabOptions.TabVisible := true;
        tabFinalStep.TabVisible := true;
        tabSuccess.TabVisible := false;
      end;
    4:
      begin
        tabMethod.TabVisible := true;
        tabSelect.TabVisible := true;
        tabOptions.TabVisible := true;
        tabFinalStep.TabVisible := true;
        tabSuccess.TabVisible := true;
      end;
  end;
end;

procedure TImportSCMWizard.TrackStateTick;
begin
  // LOGIN
  TrackStateConnected;
  // METHOD
  if (fTrackState >= 2) and (rgrpMethod.ItemIndex <> -1) then
  begin
    sbtnMethod.ImageName := 'wizImageTick';
    sbtnMethod.SelectedImageName := 'wizImageSelectedTick'
  end
  else
  begin
    sbtnMethod.ImageName := 'wizImage';
    sbtnMethod.SelectedImageName := 'wizImageSelected';
  end;
  // SELECT
  if (fTrackState >= 3) and (lbDest.Items.Count > 0) then
  begin
    sbtnSelect.ImageName := 'wizImageTick';
    sbtnSelect.SelectedImageName := 'wizImageSelectedTick';
  end
  else
  begin
    sbtnSelect.ImageName := 'wizImage';
    sbtnSelect.ImageName := 'wizImageSelected';
  end;
  // OPTION
  if (fTrackState >= 3) and (chkbDoProfile.Checked or chkbDoRaceHistory.Checked)
  then
  begin
    sbtnOptions.ImageName := 'wizImageTick';
    sbtnOptions.SelectedImageName := 'wizImageSelectedTick';
  end
  else
  begin
    sbtnOptions.ImageName := 'wizImage';
    sbtnOptions.SelectedImageName := 'wizImageSelected';
  end;

end;

procedure TImportSCMWizard.TrackStateButtons;
begin
  case fTrackState of
    1:
      begin
        sbtnStart.Enabled := true;
        sbtnLogin.Enabled := true;
        sbtnMethod.Enabled := false;
        sbtnSelect.Enabled := false;
        sbtnOptions.Enabled := false;
        sbtnFinalStep.Enabled := false;
        sbtnSuccess.Enabled := false;
      end;
    2:
      begin
        sbtnStart.Enabled := true;
        sbtnLogin.Enabled := true;
        sbtnMethod.Enabled := true;
        sbtnSelect.Enabled := false;
        sbtnOptions.Enabled := false;
        sbtnFinalStep.Enabled := false;
        sbtnSuccess.Enabled := false;
      end;
    3:
      begin
        sbtnStart.Enabled := true;
        sbtnLogin.Enabled := true;
        sbtnMethod.Enabled := true;
        sbtnSelect.Enabled := true;
        sbtnOptions.Enabled := true;
        sbtnFinalStep.Enabled := true;
        sbtnSuccess.Enabled := false;
      end;
    4:
      begin
        sbtnStart.Enabled := true;
        sbtnLogin.Enabled := true;
        sbtnMethod.Enabled := true;
        sbtnSelect.Enabled := true;
        sbtnOptions.Enabled := true;
        sbtnFinalStep.Enabled := true;
        sbtnSuccess.Enabled := true;
      end;
  end;
end;

procedure TImportSCMWizard.TrackStateBkgrdTabs;
begin
  case fTrackState of
    1:
      imgTackBkgrd.ImageName := 'wizTrackState1';
    2:
      imgTackBkgrd.ImageName := 'wizTrackState2';
    3:
      imgTackBkgrd.ImageName := 'wizTrackState3';
    4:
      imgTackBkgrd.ImageName := 'wizTrackState4';
  end;
end;

procedure TImportSCMWizard.TrackStateUpdate;
begin
  // Dots and base graphic
  TrackStateBkgrdTabs;
  // Buttons
  TrackStateButtons;
  // Tick Icons
  TrackStateTick;
  // Tabsheets
  TrackStateTabs;
end;

end.
