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
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan;

type
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
    RadioGroup1: TRadioGroup;
    TabSheet3: TTabSheet;
    Shape1: TShape;
    VirtualImage1: TVirtualImage;
    VirtualImage2: TVirtualImage;
    VirtualImage3: TVirtualImage;
    VirtualImage4: TVirtualImage;
    VirtualImage5: TVirtualImage;
    Label7: TLabel;
    edtSearch: TEdit;
    ListViewA: TListView;
    ListViewB: TListView;
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
    procedure FormCreate(Sender: TObject);
    procedure ListViewADragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListViewADragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure actnLoginExecute(Sender: TObject);
    procedure actnLoginUpdate(Sender: TObject);
  private
    { Private declarations }
    procedure SimpleLoadSettingString(ASection, AName: string;
  var AValue: string);
    procedure SimpleMakeTemporyFDConnection(AConnection: TFDConnection; Server, User, Password: string;
  AOsAuthent: Boolean);
    procedure SimpleSaveSettingString(ASection, AName,
  AValue: string);
    procedure UpdateMemberListView();

  public
    { Public declarations }
  end;

var
  ImportSCMSwimmer: TImportSCMSwimmer;

implementation

{$R *.dfm}

uses (*
    dlgBasicLoginSCM,
  *) System.Math, IniFiles, SCMUtility;

// DON'T CALL HERE IF SCM NOT ISACTIVE
procedure TImportSCMSwimmer.actnLoginExecute(Sender: TObject);
begin
  // Hide the Login and abort buttons while attempting connection
  lblLoginErrMsg.Visible := false;
  btnAbort.Visible := false;
  btnConnect.Visible := false;
  lblMsg.Visible := true;
  lblMsg.Update();
  Application.ProcessMessages();

  // if tempory connection is successful ... connection params are
  // written out to document path . SCMConfig.ini
  // try connection
  try
    SimpleMakeTemporyFDConnection(myConnection, edtServer.Text, edtUser.Text,
      edtPassword.Text, chkOsAuthent.Checked);
  finally
    begin
      lblMsg.Visible := false;
      if (myConnection.Connected) then
      begin
        UpdateMemberListView;
      end
      else
      begin
        // show error message - let user try again or abort
        lblLoginErrMsg.Visible := true;
        btnAbort.Visible := true;
        btnConnect.Visible := true;
      end
    end
  end;
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

procedure TImportSCMSwimmer.FormCreate(Sender: TObject);
var
  m: Integer;
  AValue, ASection, AName: string;

begin
  // set login visual state
  lblLoginErrMsg.Visible := false;
  lblMsg.Visible := false;

  // Populate login with last state else default values
  ASection := 'MSSQL_SwimClubMeet';
  AName := 'Server';
  SimpleLoadSettingString(ASection, AName, AValue);
  edtServer.Text := AValue;
  AName := 'User';
  SimpleLoadSettingString(ASection, AName, AValue);
  edtUser.Text := AValue;
  AName := 'Password';
  SimpleLoadSettingString(ASection, AName, AValue);
  edtPassword.Text := AValue;
  AName := 'OsAuthent';
  SimpleLoadSettingString(ASection, AName, AValue);

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

procedure TImportSCMSwimmer.ListViewADragDrop(Sender, Source: TObject;
  X, Y: Integer);
var
  i: TListItem;
begin
  if (Sender is TListView) and (Source is TListItems) then
  begin
    for i in TListItems(Source) do
      ListViewA.Items.AddItem(i);
  end;
end;

procedure TImportSCMSwimmer.ListViewADragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TListView;
end;

procedure TImportSCMSwimmer.SimpleLoadSettingString(ASection, AName: string;
  var AValue: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(SCMUtility.GetSCM_SharedIniFile);
  try
    AValue := ini.ReadString(ASection, Aname, '');
  finally
    ini.free;
  end;
end;

procedure TImportSCMSwimmer.SimpleMakeTemporyFDConnection
  (AConnection: TFDConnection; Server, User, Password: string;
  AOsAuthent: Boolean);
var
  AValue, ASection, AName: string;
begin
  if (AConnection.Connected) then
  begin
    AConnection.Close();
  end;

  AConnection.Params.Add('Server=' + Server);
  AConnection.Params.Add('DriverID=MSSQL');
  AConnection.Params.Add('Database=SwimClubMeet');
  AConnection.Params.Add('User_name=' + User);
  AConnection.Params.Add('Password=' + Password);
  if (AOsAuthent) then
    AValue := 'Yes'
  else
    AValue := 'No';
  AConnection.Params.Add('OSAuthent=' + AValue);
  AConnection.Params.Add('Mars=yes');
  AConnection.Params.Add('MetaDefSchema=dbo');
  AConnection.Params.Add('ExtendedMetadata=False');
  AConnection.Params.Add('ApplicationName=SCM_Coach');
  AConnection.Connected := true;

  // ON SUCCESS - Save connection details.
  if (AConnection.Connected) then
  begin
    ASection := 'MSSQL_SwimClubMeet';
    AName := 'Server';
    SimpleSaveSettingString(ASection, AName, Server);
    AName := 'User';
    SimpleSaveSettingString(ASection, AName, User);
    AName := 'Password';
    SimpleSaveSettingString(ASection, AName, Password);
    AName := 'OSAuthent';
    SimpleSaveSettingString(ASection, AName, AValue);
  end

end;

procedure TImportSCMSwimmer.SimpleSaveSettingString(ASection, AName,
  AValue: string);
var
  ini: TIniFile;
begin
  // C:\Users\<#USERNAME#>\AppData\Roaming\Artanemus\SCM\
  ini := TIniFile.Create(SCMUtility.GetSCM_SharedIniFile);
  try
    ini.WriteString(ASection, AName, AValue);
  finally
    ini.free;
  end;
end;

procedure TImportSCMSwimmer.UpdateMemberListView;
var
  li: TListItem;
  count: integer;
begin
  // Gather ALL swimmers in SwimClubMeet
  if myConnection.Connected then
  begin
    qrySCMSwimmer.Connection := myConnection;
    qrySCMSwimmer.Open;
    if qrySCMSwimmer.Active then
    Begin
      while not qrySCMSwimmer.eof do
      begin
        // exclude from list swimmers who are already in the SCM_Coach
        count := SCM.scmConnection.ExecSQLScalar
          ('SELECT COUNT(SCMMemberID) FROM HR WHERE HR.SCMMemberID = :ID',
          [qrySCMSwimmer.FieldByName('MemberID').AsInteger]);
        if (count = 0) then
        begin
          // add to list
          li := ListViewA.Items.Add;
          li.Caption := qrySCMSwimmer.FieldByName('FName').AsString;
        end;
        qrySCMSwimmer.next;
      end;
    End;
    qrySCMSwimmer.Close;

    // Alpha Sort
    ListViewA.SortType := stText;
  end;
end;

end.
