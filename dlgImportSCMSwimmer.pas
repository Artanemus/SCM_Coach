unit dlgImportSCMSwimmer;

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
  System.Contnrs;

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

  TImportSCMSwimmer = class(TForm)
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
    vimgTracker: TVirtualImage;
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
    Button1: TButton;
    Button2: TButton;
    btnAbort: TButton;
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
    Label10: TLabel;
    Label11: TLabel;
    chkbDoPB: TCheckBox;
    chkbDoHistory: TCheckBox;
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
    vimgTrack2: TVirtualImage;
    vimgTrack3: TVirtualImage;
    vimgTrack4: TVirtualImage;
    vimgTrack5: TVirtualImage;
    vimgTrack0: TVirtualImage;
    vimgTrack1: TVirtualImage;
    vimgTrack6: TVirtualImage;
    actnAbort: TAction;
    RelativePanel3: TRelativePanel;
    btnGo: TButton;
    lblGo: TLabel;
    actnTrackSelect: TAction;
    actnTrackStart: TAction;
    actnTrackLogin: TAction;
    actnTrackMethod: TAction;
    actnTrackOptions: TAction;
    actnTrackFinalStep: TAction;
    actnTrackSuccess: TAction;
    actnGo: TAction;
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
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure actnTrackMethodExecute(Sender: TObject);
    procedure actnTrackSelectExecute(Sender: TObject);
    procedure actnTrackOptionsExecute(Sender: TObject);
    procedure actnTrackFinalStepExecute(Sender: TObject);
    procedure actnTrackStartExecute(Sender: TObject);
    procedure actnTrackLoginExecute(Sender: TObject);
    procedure actnGoUpdate(Sender: TObject);
    procedure actnGoExecute(Sender: TObject);
  private
    { Private declarations }
    // procedure SimpleLoadSettingString(ASection, AName: string;
    // var AValue: string);
    // procedure SimpleMakeTemporyFDConnection(AConnection: TFDConnection; Server, User, Password: string;
    // AOsAuthent: Boolean);
    // procedure SimpleSaveSettingString(ASection, AName,
    // AValue: string);
    scmMemberList: TObjectList;
    fTrackState: integer;
    fLastMethodState: integer;

    function MemberIsAssigned(obj: TObject; lbox: TListBox): Boolean;
    procedure BuildListBoxSource();
    procedure TransferItems(SrcListBox, DestListBox: TObject);
    procedure TrackStateUpdate;
    procedure TrackStateDots;
    procedure TrackStateTracker(idx: integer);
    procedure TrackStateConnected;

  public
    { Public declarations }
  end;

var
  ImportSCMSwimmer: TImportSCMSwimmer;

implementation

{$R *.dfm}

uses (*
    dlgBasicLoginSCM,
  *) System.Math, IniFiles, SCMUtility, SCMSimpleConnect, System.StrUtils;

// DON'T CALL HERE IF SCM NOT ISACTIVE
procedure TImportSCMSwimmer.actnDestToSrcAllExecute(Sender: TObject);
begin
  lbDest.SelectAll;
  TransferItems(lbDest, lbSrc);
end;

procedure TImportSCMSwimmer.actnDestToSrcSelectedExecute(Sender: TObject);
begin
  TransferItems(lbDest, lbSrc);
end;

procedure TImportSCMSwimmer.actnExitExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TImportSCMSwimmer.actnGoExecute(Sender: TObject);
var
  i, MemberID: Integer;
  obj: TObject;
begin
  // ---------------------------------------------------------------
  // I M P O R T .
  // ---------------------------------------------------------------
  // I N T R O D U C E.
  if (rgrpMethod.ItemIndex = 1) then
  begin
    // Loop across select member IDs
    for i := 0 to lbDest.Items.Count-1	do
    begin
       obj := lbDest.Items.Objects[i];
       MemberID := TscmMember(obj).ID;
       // collect member profile data ...
       //'SELECT * FROM SwimClubMeet.dbo.Member WHERE MemberID = ' + IntToStr(MemberID);



       // INSERT THE MEMBER INTO SCM_Coach
       // create new member record
       //
    end;
  end;

end;

procedure TImportSCMSwimmer.actnGoUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := false;

  if (fTrackState = 3) then
  begin
    if (rgrpMethod.ItemIndex <> -1) and (lbDest.Items.count > 0) and
    (chkbDoProfile.Checked or chkbDoPB.Checked or chkbDoHistory.Checked)
    then
      TAction(Sender).Enabled := true;
  end;
end;

procedure TImportSCMSwimmer.actnLoginExecute(Sender: TObject);
var
  sc: TSimpleConnect;
begin
  // Hide the Login and abort buttons while attempting connection
  lblLoginErrMsg.Visible := false;
  btnAbort.Visible := false;
  btnConnect.Visible := false;
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
    // Dots and base graphic
    TrackStateDots;
    // connection circle_checked_fill
    TrackStateConnected;
    // move tracker to next tabsheet
    PageControl1.SelectNextPage(true, true);
    TrackStateTracker(PageControl1.TabIndex);
  end
  else
  begin
    // show error message - let user try again or abort
    lblLoginErrMsg.Visible := true;
    btnAbort.Visible := true;
    btnConnect.Visible := true;
    fTrackState := 1;
    TrackStateUpdate;
  end;

  sc.Free;

end;

procedure TImportSCMSwimmer.actnLoginUpdate(Sender: TObject);
begin
  // only update display if the TrackState is not syncronized.
  if (myConnection.Connected) and (fTrackState = 1) then
  begin
    fTrackState := 2;
    TrackStateUpdate;
  end;
  // only revert state if the TrackState is not syncronized.
  if (not myConnection.Connected) AND (fTrackState > 1) then
  begin
    // page index out-of-range for the current TrackState
    if (PageControl1.TabIndex > 1) then
      PageControl1.TabIndex := 1;
    fTrackState := 1;
    TrackStateUpdate;
  end;
end;

procedure TImportSCMSwimmer.actnSrcToDestAllExecute(Sender: TObject);
begin
  lbSrc.SelectAll;
  TransferItems(lbSrc, lbDest);
end;

procedure TImportSCMSwimmer.actnSrcToDestSelectedExecute(Sender: TObject);
begin
  TransferItems(lbSrc, lbDest);
end;

procedure TImportSCMSwimmer.actnTrackFinalStepExecute(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 5;
end;

procedure TImportSCMSwimmer.actnTrackLoginExecute(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
end;

procedure TImportSCMSwimmer.actnTrackMethodExecute(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 2;
end;

procedure TImportSCMSwimmer.actnTrackOptionsExecute(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 4;
end;

procedure TImportSCMSwimmer.actnTrackSelectExecute(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 3;
end;

procedure TImportSCMSwimmer.actnTrackStartExecute(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TImportSCMSwimmer.BuildListBoxSource;
var
  count: integer;
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
          count := SCM.scmConnection.ExecSQLScalar
            ('SELECT COUNT(SCMMemberID) FROM HR WHERE HR.SCMMemberID = :ID',
            [qrySCMSwimmer.FieldByName('MemberID').AsInteger]);

          if ((count = 0) and (rgrpMethod.ItemIndex = 1)) OR
            ((count > 0) and (rgrpMethod.ItemIndex = 0)) then
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

procedure TImportSCMSwimmer.edtSearchChange(Sender: TObject);
var
  I: integer;
  obj: TscmMember;
  s: string;
begin
  // Rebuild SOURCE LISTBOX using the objectlist.
  lbSrc.Clear;
  for I := 0 to scmMemberList.count - 1 do
  begin
    obj := (scmMemberList.Items[I] as TscmMember);
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

procedure TImportSCMSwimmer.FormCreate(Sender: TObject);
var
  m: integer;
  AValue, ASection, AName: string;

begin
  // set login visual state
  lblLoginErrMsg.Visible := false;
  lblMsg.Visible := false;

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
  fLastMethodState := -1;
  // TrackState WELCOME
  fTrackState := 1;
  // INIT wizard tracker display
  TrackStateUpdate;

end;

procedure TImportSCMSwimmer.FormDestroy(Sender: TObject);
begin
  scmMemberList.Clear;
end;

procedure TImportSCMSwimmer.ListBoxDestDragDrop(Sender, Source: TObject;
  X, Y: integer);
begin
  // Source - the object being dropped.
  TransferItems(Source, Sender);
end;

procedure TImportSCMSwimmer.ListBoxDestDragOver(Sender, Source: TObject;
  X, Y: integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TListBox;
end;

procedure TImportSCMSwimmer.ListBoxSrcDragDrop(Sender, Source: TObject;
  X, Y: integer);
begin
  TransferItems(Source, Sender);
end;

procedure TImportSCMSwimmer.ListBoxSrcDragOver(Sender, Source: TObject;
  X, Y: integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TListBox;
end;

function TImportSCMSwimmer.MemberIsAssigned(obj: TObject;
  lbox: TListBox): Boolean;
var
  I: integer;
begin
  // check if obj is used by to lboxView
  result := false;
  for I := 0 to lbox.count - 1 do
  begin
    if (obj = lbox.Items.Objects[I]) then
    begin
      result := true;
      break;
    end;
  end;
end;

procedure TImportSCMSwimmer.PageControl1Change(Sender: TObject);
begin
  TrackStateUpdate;
  case TPageControl(Sender).TabIndex of
    3: // TABSHEET SELECT
      begin
        // Is the member's list in sync with the 'Processing Method'?
        if (fLastMethodState <> rgrpMethod.ItemIndex) then
        begin
          // changes to the RadioGroup determine the contents of the ObjectList
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
        if (rgrpMethod.ItemIndex = 0) then
        begin
          // UPDATE
          chkbDoProfile.Caption := 'Update squad swimmer''s profiles.';
          chkbDoProfile.Enabled := true;
          chkbDoPB.Caption := 'Update Personal Best (PB) race-data,';
          chkbDoHistory.Caption := 'Update swimming history.';
        end
        else
        begin
          // INTRODUCE
          chkbDoProfile.Caption := 'Import club member''s profiles.';
          chkbDoProfile.Enabled := false;
          chkbDoProfile.Checked := true;
          chkbDoPB.Caption := 'Import Personal Best (PB) race-data,';
          chkbDoHistory.Caption := 'Import ALL swimming history.';
        end;
      end;
    5: // TABSHEET GO
      begin
        if (rgrpMethod.ItemIndex = 0) then
          lblGo.Caption := 'Click to update your squad swimmer''s data.'
        else
          lblGo.Caption :=
            'Click to induct selected SCM members into your squad.';
      end;
  end;

end;

procedure TImportSCMSwimmer.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin

  if (TPageControl(Sender).TabIndex = 3) then // TABSHEET SELECT
  begin
    // Is the member's list in sync with the 'Processing Method'?
    if (lbDest.Items.count > 0) then
      vimgTrack3.ImageName := 'check_circle_filled'
    else
      vimgTrack3.ImageName := 'wizDotSmallFilled';
  end;

  if (TPageControl(Sender).TabIndex = 4) then // TABSHEET OPTION
  begin
    if chkbDoProfile.Checked or chkbDoPB.Checked or chkbDoHistory.Checked then
      vimgTrack4.ImageName := 'check_circle_filled'
    else
      vimgTrack4.ImageName := 'wizDotSmallFilled';
  end;

  if (TPageControl(Sender).TabIndex = 5) then // TABSHEET GO
  begin
    if (rgrpMethod.ItemIndex <> -1) and (lbDest.Items.count > 0) and
    (chkbDoProfile.Checked or chkbDoPB.Checked or chkbDoHistory.Checked)
    then
    begin
      btnGo.Enabled := true;
      lblGo.Enabled := true;
    end
    else
    begin
      btnGo.Enabled := false;
      lblGo.Enabled := false;
    end;
  end;

  AllowChange := true;
end;

procedure TImportSCMSwimmer.rgrpMethodClick(Sender: TObject);
begin
  // Move to next tab-sheet
  if (fTrackState <> 3) then
  begin
    fTrackState := 3;
    TrackStateUpdate;
    // move to the 'Select' tab-sheet.
    PageControl1.SelectNextPage(true, true);
  end;

  if (rgrpMethod.ItemIndex <> -1) then
    vimgTrack2.ImageName := 'check_circle_filled'
  else
    vimgTrack2.ImageName := 'wizDotSmallFilled';

end;

procedure TImportSCMSwimmer.TransferItems(SrcListBox, DestListBox: TObject);
var
  I: integer;
begin
  with (SrcListBox AS TListBox) do
  begin
    try
      for I := 0 to Items.count - 1 do
      begin
        if Selected[I] then
          // NOTE: destination MemberList is assigned source object.
          (DestListBox AS TListBox).Items.AddObject(Items[I], Items.Objects[I]);
      end;
    finally
      // NOTE: Source's assigned objects are not freed (in use).
      DeleteSelected;
    end;
  end;
end;

procedure TImportSCMSwimmer.TrackStateConnected;
begin
  if myConnection.Connected then
  begin
    vimgTrack1.ImageName := 'check_circle_filled';
  end
  else
  begin
    vimgTrack1.ImageName := 'wizDotSmallFilled';
  end;
end;

procedure TImportSCMSwimmer.TrackStateDots;
begin
  case fTrackState of
    1:
      begin
        vimgTackDisplay.ImageName := 'WizardNodeBgrd5Grey';
        tabMethod.TabVisible := false;
        tabSelect.TabVisible := false;
        tabOptions.TabVisible := false;
        tabFinalStep.TabVisible := false;
        tabSuccess.TabVisible := false;
        vimgTrack2.Visible := false;
        vimgTrack3.Visible := false;
        vimgTrack4.Visible := false;
        vimgTrack5.Visible := false;
        vimgTrack6.Visible := false;
      end;
    2:
      begin
        vimgTackDisplay.ImageName := 'WizardNodeBgrd4Grey';
        tabMethod.TabVisible := true;
        tabSelect.TabVisible := false;
        tabOptions.TabVisible := false;
        tabFinalStep.TabVisible := false;
        tabSuccess.TabVisible := false;
        vimgTrack2.Visible := true;
        vimgTrack3.Visible := false;
        vimgTrack4.Visible := false;
        vimgTrack5.Visible := false;
        vimgTrack6.Visible := false;
      end;
    3:
      begin
        vimgTackDisplay.ImageName := 'WizardNodeBgrd';
        tabMethod.TabVisible := true;
        tabSelect.TabVisible := true;
        tabOptions.TabVisible := true;
        tabFinalStep.TabVisible := true;
        tabSuccess.TabVisible := false;
        vimgTrack2.Visible := true;
        vimgTrack3.Visible := true;
        vimgTrack4.Visible := true;
        vimgTrack5.Visible := true;
        vimgTrack6.Visible := false;
      end;
  end;
end;

procedure TImportSCMSwimmer.TrackStateTracker(idx: integer);
begin
  case idx of
    0:
      // Move TrackCircle
      vimgTracker.Margins.Left := 0;
    1:
      vimgTracker.Margins.Left := 111;
    2:
      vimgTracker.Margins.Left := 212;
    3:
      vimgTracker.Margins.Left := 314;
    4:
      vimgTracker.Margins.Left := 416;
    5:
      vimgTracker.Margins.Left := 518;
    6:
      vimgTracker.Margins.Left := 628;
  end;
end;

procedure TImportSCMSwimmer.TrackStateUpdate;
begin
  // Dots and base graphic
  TrackStateDots;
  // connection circle_checked_fill
  TrackStateConnected;
  // Tracker
  TrackStateTracker(PageControl1.TabIndex);
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
