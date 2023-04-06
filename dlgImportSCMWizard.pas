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
  FireDAC.DApt, FireDAC.Comp.DataSet, dmSCM, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.WinXCtrls, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  System.Contnrs, Vcl.Buttons;

type
  TscmMember = class(TObject)
  private
    { private declarations }
    MemberID: integer;
    FName: string;
  protected
    { protected declarations }
  public
    { public declarations }

    // published
    { published declarations }
    constructor Create();
    destructor Destroy(); override;
    property ID: integer read MemberID;
  end;

  TImportSCMWizard = class(TForm)
    myConnection: TFDConnection;
    ImageCollection1: TImageCollection;
    qrySCMSwimmer: TFDQuery;
    qrySCMSwimmerFNAME: TWideStringField;
    qrySCMSwimmerMemberID: TFDAutoIncField;
    qrySCMSwimmerFirstName: TWideStringField;
    qrySCMSwimmerLastName: TWideStringField;
    RelativePanel1: TRelativePanel;
    btnPrev: TButton;
    VirtualImageList1: TVirtualImageList;
    btnNext: TButton;
    btnCancel: TButton;
    btnFirst: TButton;
    btnLast: TButton;
    RelativePanel2: TRelativePanel;
    vimgTackDisplay: TVirtualImage;
    ActionManager1: TActionManager;
    actnLogin: TAction;
    PageControl1: TPageControl;
    tabStart: TTabSheet;
    Label6: TLabel;
    tabLogin: TTabSheet;
    Shape3: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblLoginErrMsg: TLabel;
    Label5: TLabel;
    lblMsg: TLabel;
    chkOsAuthent: TCheckBox;
    edtPassword: TEdit;
    edtServer: TEdit;
    edtUser: TEdit;
    btnDisconnect: TButton;
    btnLogin: TButton;
    btnConnect: TButton;
    tabMethod: TTabSheet;
    Shape4: TShape;
    Label9: TLabel;
    rgrpMethod: TRadioGroup;
    tabSelect: TTabSheet;
    Shape1: TShape;
    VirtualImage1: TVirtualImage;
    VirtualImage2: TVirtualImage;
    VirtualImage3: TVirtualImage;
    VirtualImage4: TVirtualImage;
    VirtualImage5: TVirtualImage;
    lblSelect: TLabel;
    edtSearch: TEdit;
    tabOptions: TTabSheet;
    Shape2: TShape;
    Label8: TLabel;
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
    Memo1: TMemo;
    actnExit: TAction;
    actnFirst: TAction;
    actnLast: TAction;
    actnPrev: TAction;
    actnNext: TAction;
    actnDisconnect: TAction;
    RelativePanel3: TRelativePanel;
    btnGo: TButton;
    lblGo: TLabel;
    actnGo: TAction;
    rgrpOptionsData: TRadioGroup;
    VirtualImage6: TVirtualImage;
    sbtnMethod: TSpeedButton;
    sbtnLogin: TSpeedButton;
    sbtnStart: TSpeedButton;
    sbtnSelect: TSpeedButton;
    sbtnOptions: TSpeedButton;
    sbtnFinalStep: TSpeedButton;
    sbtnSuccess: TSpeedButton;
    WizardCollection: TImageCollection;
    WizardImageList: TVirtualImageList;
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
    procedure PageControl1Change(Sender: TObject);
    procedure actnGoUpdate(Sender: TObject);
    procedure actnGoExecute(Sender: TObject);
    procedure actnDisconnectUpdate(Sender: TObject);
    procedure actnDisconnectExecute(Sender: TObject);
    procedure sbtnGenericClick(Sender: TObject);
  private
    { Private declarations }

    scmMemberList: TObjectList;
    fTrackState: integer;
    fLastMethodState: integer;

  var
    fImportDone: Boolean;

    function MemberIsAssigned(obj: TObject; lbox: TListBox): Boolean;
    procedure BuildListBoxSource();
    procedure TransferItems(SrcListBox, DestListBox: TObject);
    procedure TrackStateSync;
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
  myConnection.Close;
  TrackStateInit;
end;

procedure TImportSCMWizard.actnDisconnectUpdate(Sender: TObject);
begin
  if (Assigned(myConnection) and myConnection.Connected) then
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
  i, MemberID: integer;
  obj: TObject;
begin
  // ---------------------------------------------------------------
  // I M P O R T .
  // ---------------------------------------------------------------

  // construct import class ...

  // I N T R O D U C E.
  if (rgrpMethod.ItemIndex = 1) then
  begin
    // Loop across select member IDs
    for i := 0 to lbDest.Items.Count - 1 do
    begin
      obj := lbDest.Items.Objects[i];
      MemberID := TscmMember(obj).ID;
      // call import class ....
      //
    end;
  end;

end;

procedure TImportSCMWizard.actnGoUpdate(Sender: TObject);
begin
  if (rgrpMethod.ItemIndex <> -1) and (lbDest.Items.Count > 0) and
    (chkbDoProfile.Checked or (rgrpOptionsData.ItemIndex <> -1)) then
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
  lblLoginErrMsg.Visible := false;
  btnConnect.Visible := true;
  lblMsg.Visible := true;
  lblMsg.Update();
  Application.ProcessMessages();

  sc := TSimpleConnect.CreateWithConnection(Self, myConnection);
  // default : SwimClubMeet : change to connect to other databases.
  // sc.DatabaseName := 'SwimClubMeet';
  sc.SimpleMakeTemporyConnection(edtServer.Text, edtUser.Text, edtPassword.Text,
    chkOsAuthent.Checked);

  lblMsg.Visible := false;
  if (myConnection.Connected) then
  begin
    BuildListBoxSource;
    fTrackState := 2;
    TrackStateUpdate;
    // move to the 'Method' tab-sheet.
    PageControl1.SelectNextPage(true, true);
  end
  else
  begin
    // show error message - let user try again or abort
    lblLoginErrMsg.Visible := true;
    fTrackState := 1;
    TrackStateUpdate;
  end;

  sc.Free;

end;

procedure TImportSCMWizard.actnLoginUpdate(Sender: TObject);
begin
  if (Assigned(myConnection) and myConnection.Connected) then
    btnLogin.Enabled := false
  else
    btnLogin.Enabled := true;
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

procedure TImportSCMWizard.BuildListBoxSource;
var
  Count: integer;
  s: string;
  obj: TscmMember;
  j: integer;

begin
  // reset SOURCE AND DESTINATION ListBoxes AND ObjectList state.
  lbSrc.Clear;
  lbDest.Clear;
  scmMemberList.Clear;

  // Gather ALL swimmers in SwimClubMeet
  if myConnection.Connected then
  begin
    // -------------------------------------------------------------------
    // Method  : INTRODUCE
    // Induct SwimClubMeet Members into your squad.
    // EXCLUDE from list SCM Members who are already in SCM_Coach.
    // -------------------------------------------------------------------
    if (rgrpMethod.ItemIndex = 1) then
    begin
      qrySCMSwimmer.Connection := myConnection;
      qrySCMSwimmer.Open;
      if qrySCMSwimmer.Active then
      Begin
        while not qrySCMSwimmer.eof do
        begin
          Count := SCM.scmConnection.ExecSQLScalar
            ('SELECT COUNT(SCMMemberID) FROM HR WHERE HR.SCMMemberID = :ID',
            [qrySCMSwimmer.FieldByName('MemberID').AsInteger]);

          if ((Count = 0) and (rgrpMethod.ItemIndex = 1)) OR
            ((Count > 0) and (rgrpMethod.ItemIndex = 0)) then
          begin
            obj := TscmMember.Create;
            obj.MemberID := qrySCMSwimmer.FieldByName('MemberID').AsInteger;
            obj.FName := qrySCMSwimmer.FieldByName('FName').AsString;
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
  obj: TscmMember;
  s: string;
begin
  // Rebuild SOURCE LISTBOX using the objectlist.
  lbSrc.Clear;
  for i := 0 to scmMemberList.Count - 1 do
  begin
    obj := (scmMemberList.Items[i] as TscmMember);
    // Already assigned to right-listbox.
    if MemberIsAssigned(obj, lbDest) then
      continue;
    s := obj.FName;
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
  lblLoginErrMsg.Visible := false;
  lblMsg.Visible := false;

  // assert initial connection state.
  myConnection.Connected := false;

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
  PageControl1.TabIndex := 0;
  // Method UNKNOWN
  rgrpMethod.ItemIndex := -1;
  rgrpOptionsData.ItemIndex := -1;
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

procedure TImportSCMWizard.PageControl1Change(Sender: TObject);
begin

  // place a call to TrackState ticks
  TrackStateTick;

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
          lblSelect.Caption :=
            'Select the swimmers to have their profiles updated.'
        else
          // Introduce club memeber
          lblSelect.Caption :=
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
          // Option Select Data to UPDATE
          rgrpOptionsData.Items.Strings[0] :=
            'Update Personal Best (PB) race-data,';
          rgrpOptionsData.Items.Strings[1] := 'Update swimming history.';
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
          // Option Select Data to IMPORT
          rgrpOptionsData.Items.Strings[0] :=
            'Import Personal Best (PB) race-data,';
          rgrpOptionsData.Items.Strings[1] := 'Import ALL swimming history.';
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

end;

procedure TImportSCMWizard.rgrpMethodClick(Sender: TObject);
begin
  // User picks data method
  if (fTrackState <> 3) then
  begin
    fTrackState := 3;
    TrackStateUpdate;
    // move to the 'Select' tab-sheet.
    PageControl1.SelectNextPage(true, true);
  end;
end;

procedure TImportSCMWizard.sbtnGenericClick(Sender: TObject);
var
  pageIndx: integer;
begin
  pageIndx := TSpeedButton(Sender).Tag;
  if (PageControl1.TabIndex <> pageIndx) then
    PageControl1.TabIndex := pageIndx;
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
  if Assigned(myConnection) and myConnection.Connected then
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
  PageControl1.TabIndex := 0;
  chkbDoProfile.Checked := false;
  rgrpOptionsData.ItemIndex := -1;
  lbSrc.Clear;
  lbDest.Clear;
  scmMemberList.Clear;
  TrackStateUpdate;
end;

procedure TImportSCMWizard.TrackStateSync;

begin
  fTrackState := 1;
  if Assigned(myConnection) and myConnection.Connected then
    fTrackState := 2; // Method enabled
  if (chkbDoProfile.Checked or (rgrpOptionsData.ItemIndex <> -1)) then
    fTrackState := 3; // Select enabled
  if (lbDest.Items.Count > 0) then
    fTrackState := 4; // ALL - except Success tab
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
  if (fTrackState >= 3) and
    (chkbDoProfile.Checked or (rgrpOptionsData.ItemIndex <> -1)) then
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
      vimgTackDisplay.ImageName := 'wizTrackState1';
    2:
      vimgTackDisplay.ImageName := 'wizTrackState2';
    3:
      vimgTackDisplay.ImageName := 'wizTrackState3';
    4:
      vimgTackDisplay.ImageName := 'wizTrackState4';
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

{ TscmMember }

constructor TscmMember.Create;
begin
  MemberID := 0;
  FName := '';
end;

destructor TscmMember.Destroy;
begin

  inherited;
end;

end.
