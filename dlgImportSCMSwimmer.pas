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
    shapeLine: TShape;
    vimgLineStart: TVirtualImage;
    vimgLineEnd: TVirtualImage;
    vimgLogin: TVirtualImage;
    vimgMethod: TVirtualImage;
    vimgSelect: TVirtualImage;
    vimgOptions: TVirtualImage;
    vimgLastStep: TVirtualImage;
    ActionManager1: TActionManager;
    actnLogin: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label6: TLabel;
    TabSheet2: TTabSheet;
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
    TabSheet7: TTabSheet;
    Shape4: TShape;
    Label9: TLabel;
    rgrpMethod: TRadioGroup;
    TabSheet3: TTabSheet;
    Shape1: TShape;
    VirtualImage1: TVirtualImage;
    VirtualImage2: TVirtualImage;
    VirtualImage3: TVirtualImage;
    VirtualImage4: TVirtualImage;
    VirtualImage5: TVirtualImage;
    Label7: TLabel;
    edtSearch: TEdit;
    TabSheet4: TTabSheet;
    Shape2: TShape;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    TabSheet5: TTabSheet;
    Label4: TLabel;
    Button3: TButton;
    TabSheet6: TTabSheet;
    actnSrcToDestAll: TAction;
    actnDestToSrcAll: TAction;
    actnSrcToDestSelected: TAction;
    actnDestToSrcSelected: TAction;
    lbSrc: TListBox;
    lbDest: TListBox;
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
  private
    { Private declarations }
//    procedure SimpleLoadSettingString(ASection, AName: string;
//  var AValue: string);
//    procedure SimpleMakeTemporyFDConnection(AConnection: TFDConnection; Server, User, Password: string;
//  AOsAuthent: Boolean);
//    procedure SimpleSaveSettingString(ASection, AName,
//  AValue: string);
    scmMemberList: TObjectList;

    function MemberIsAssigned(obj: TObject; lbox: TListBox): Boolean;
    procedure BuildListBoxSource();
    procedure TransferItems(SrcListBox, DestListBox: TObject);


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
  end
  else
  begin
    // show error message - let user try again or abort
    lblLoginErrMsg.Visible := true;
    btnAbort.Visible := true;
    btnConnect.Visible := true;
  end;

  sc.Free;

end;

procedure TImportSCMSwimmer.actnLoginUpdate(Sender: TObject);
begin
  if (myConnection.Connected) then
  begin
    vimgMethod.enabled := true;
    vimgSelect.enabled := true;
    vimgOptions.enabled := true;
    vimgLastStep.enabled := true;
    vimgMethod.ImageIndex := 14;
    vimgSelect.ImageIndex := 14;
    vimgOptions.ImageIndex := 14;
    vimgLastStep.ImageIndex := 14;
  end
  else
  begin
    vimgMethod.enabled := false;
    vimgSelect.enabled := false;
    vimgOptions.enabled := false;
    vimgLastStep.enabled := false;
    vimgMethod.ImageIndex := 15;
    vimgSelect.ImageIndex := 15;
    vimgOptions.ImageIndex := 15;
    vimgLastStep.ImageIndex := 15;
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

  // list of members from SwimClubMeet
  scmMemberList := TObjectList.Create(true);

  // Populate login with last state else default values
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

  // programmatically calculate vimgWizButton margins
  // better results on round down - rather than depend on div.
  // TODO: move to update action
  m := floor((vimgLineEnd.Left - (vimgLineStart.Left +
    vimgLineStart.width)) / 10);
  vimgLogin.Margins.Left := m;
  vimgMethod.Margins.Left := m;
  vimgSelect.Margins.Left := m;
  vimgOptions.Margins.Left := m;
  vimgLastStep.Margins.Left := m;

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

procedure TImportSCMSwimmer.rgrpMethodClick(Sender: TObject);
begin
  // changes to the RadioGroup determine the contents of the ObjectList
  BuildListBoxSource;
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
