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
    Label7: TLabel;
    edtSearch: TEdit;
    tabOptions: TTabSheet;
    Shape2: TShape;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    tabFinalStep: TTabSheet;
    Label4: TLabel;
    Button3: TButton;
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
    procedure FormCreate(Sender: TObject);
    procedure ListBoxSrcDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBoxSrcDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure actnLoginExecute(Sender: TObject);
    procedure actnLoginUpdate(Sender: TObject);
    procedure actnSrcToDestAllExecute(Sender: TObject);
    procedure actnSrcToDestSelectedExecute(Sender: TObject);
    procedure actnDestToSrcAllExecute(Sender: TObject);
    procedure actnDestToSrcSelectedExecute(Sender: TObject);
    procedure ListBoxDestDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBoxDestDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure rgrpMethodClick(Sender: TObject);
    procedure actnExitExecute(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
  private
    { Private declarations }
//    procedure SimpleLoadSettingString(ASection, AName: string;
//  var AValue: string);
//    procedure SimpleMakeTemporyFDConnection(AConnection: TFDConnection; Server, User, Password: string;
//  AOsAuthent: Boolean);
//    procedure SimpleSaveSettingString(ASection, AName,
//  AValue: string);
    scmMemberList: TObjectList;
    fTrackState: integer;
    fLastMethodState: Integer;

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
    // Induct SwimClubMeet Members into your squad.
    // -------------------------------------------------------------------
    if (fLastMethodState = 1) then
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

        // if Method is : INTRODUCE
        // EXCLUDE from list SCM Members who are already in SCM_Coach.
        // if Method is : UPDATE.
        // INCLUDE only SCM Members who are in the squad.

        if ((count = 0) and (rgrpMethod.ItemIndex = 1) ) OR
        ((count > 0) and (rgrpMethod.ItemIndex = 0) )
        then
        begin
          // add to list
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
    // Update the profiles and stats of your swimmers in your squad.
    // -------------------------------------------------------------------
  else
  begin
      {TODO -oBSA -cGeneral : build queries for update profiles}
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
  lbSrc.clear;
  for I := 0 to scmMemberList.Count - 1 do
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
  m: Integer;
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
  edtServer.Text :=LoadSharedIniFileSetting(ASection, AName);
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
  scmMemberList.clear;
end;

procedure TImportSCMSwimmer.ListBoxDestDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  // Source - the object being dropped.
  TransferItems(Source, Sender);
end;

procedure TImportSCMSwimmer.ListBoxDestDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TListBox;
end;

procedure TImportSCMSwimmer.ListBoxSrcDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  TransferItems(Source, Sender);
end;

procedure TImportSCMSwimmer.ListBoxSrcDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
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
  for I := 0 to lbox.Count - 1 do
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
  if (TPageControl(Sender).TabIndex = 3) then
  begin
    // Is the member's list in sync with the 'Processing Method'?
    if (fLastMethodState <> rgrpMethod.ItemIndex) then
    begin
      // changes to the RadioGroup determine the contents of the ObjectList
      BuildListBoxSource;
      fLastMethodState := rgrpMethod.ItemIndex;
    end;
  end;
  if (TPageControl(Sender).TabIndex = 4) then
  begin
    if (fLastMethodState = 0) then
    // Update profiles
    Label7.Caption := 'Select the swimmers to have their profiles updated.'
    else
    // introduce club memeber
    Label7.Caption := 'Select the club members to induct into your squad.';
  end;


end;

procedure TImportSCMSwimmer.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin

  if (TPageControl(Sender).TabIndex = 3) then
  begin
    // Is the member's list in sync with the 'Processing Method'?
    if (lbDest.Items.count > 0) then
      vimgTrack3.ImageName := 'check_circle_filled'
    else
      vimgTrack3.ImageName := 'wizDotSmallFilled';
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
      for I := 0 to Items.Count - 1 do
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
