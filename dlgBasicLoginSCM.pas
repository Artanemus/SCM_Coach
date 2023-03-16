unit dlgBasicLoginSCM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, dmSCM,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TBasicLoginSCM = class(TForm)
    chkOsAuthent: TCheckBox;
    edtPassword: TEdit;
    edtServer: TEdit;
    edtUser: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblLoginErrMsg: TLabel;
    Panel1: TPanel;
    lblMsg: TLabel;
    btnAbort: TButton;
    btnConnect: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAbortClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fAConnection: TFDConnection;
    procedure SimpleLoadSettingString(Section, Name: string; var Value: string);
    procedure SimpleMakeTemporyFDConnection(AConnection: TFDConnection;
      Server, User, Password: string; OsAuthent: boolean);
    procedure SimpleSaveSettingString(Section, Name, Value: string);

  public
    { Public declarations }
    property AConnection: TFDConnection read FAConnection write FAConnection;
  end;

var
  BasicLoginSCM: TBasicLoginSCM;

implementation

{$R *.dfm}

uses System.IOUtils, IniFiles, SCMUtility;

procedure TBasicLoginSCM.btnAbortClick(Sender: TObject);
begin
  // setting modal result will Close() the form;
  ModalResult := mrAbort;
end;

procedure TBasicLoginSCM.btnConnectClick(Sender: TObject);
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
    SimpleMakeTemporyFDConnection(fAConnection, edtServer.Text, edtUser.Text,
      edtPassword.Text, chkOsAuthent.Checked);
  finally
    begin
      lblMsg.Visible := false;
      if (fAConnection.Connected) then
      begin
        // setting modal result will Close() the form;
        ModalResult := mrOk;
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

procedure TBasicLoginSCM.FormCreate(Sender: TObject);
var
  Value, Section, Name: string;
begin
  lblLoginErrMsg.Visible := false;
  lblMsg.Visible := false;

  // Read last successful connection params and load into controls
  Section := 'MSSQL_SwimClubMeet';
  Name := 'Server';
  SimpleLoadSettingString(Section, Name, Value);
  edtServer.Text := Value;
  Name := 'User';
  SimpleLoadSettingString(Section, Name, Value);
  edtUser.Text := Value;
  Name := 'Password';
  SimpleLoadSettingString(Section, Name, Value);
  edtPassword.Text := Value;
  Name := 'OsAuthent';
  SimpleLoadSettingString(Section, Name, Value);

  if ((UpperCase(Value) = 'YES') or (UpperCase(Value) = 'TRUE')) then
    chkOsAuthent.Checked := true
  else
    chkOsAuthent.Checked := false;

end;

procedure TBasicLoginSCM.FormShow(Sender: TObject);
begin
  btnConnect.SetFocus;
end;

procedure TBasicLoginSCM.SimpleLoadSettingString(Section, Name: string;
  var Value: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(SCMUtility.GetSCM_SharedIniFile);
  try
    Value := ini.ReadString(Section, name, '');
  finally
    ini.free;
  end;

end;

procedure TBasicLoginSCM.SimpleMakeTemporyFDConnection
  (AConnection: TFDConnection; Server, User, Password: string;
  OsAuthent: boolean);
var
  Value, Section: string;
begin
  if (AConnection.Connected) then
  begin
    AConnection.Close();
  end;

  AConnection.Params.Add('Server=' + Server);
  AConnection.Params.Add('DriverID=MSSQL');
  AConnection.Params.Add('Database=SCM_Coach');
  AConnection.Params.Add('User_name=' + User);
  AConnection.Params.Add('Password=' + Password);
  if (OsAuthent) then
    Value := 'Yes'
  else
    Value := 'No';
  AConnection.Params.Add('OSAuthent=' + Value);
  AConnection.Params.Add('Mars=yes');
  AConnection.Params.Add('MetaDefSchema=dbo');
  AConnection.Params.Add('ExtendedMetadata=False');
  AConnection.Params.Add('ApplicationName=SCM_Coach');
  AConnection.Connected := true;

  // ON SUCCESS - Save connection details.
  if (AConnection.Connected) then
  begin
    Section := 'MSSQL_SwimClubMeet';
    Name := 'Server';
    SimpleSaveSettingString(Section, Name, Server);
    Name := 'User';
    SimpleSaveSettingString(Section, Name, User);
    Name := 'Password';
    SimpleSaveSettingString(Section, Name, Password);
    Name := 'OSAuthent';
    SimpleSaveSettingString(Section, Name, Value);
  end

end;

procedure TBasicLoginSCM.SimpleSaveSettingString(Section, Name, Value: string);
var
  ini: TIniFile;
begin
  // C:\Users\<#USERNAME#>\AppData\Roaming\Artanemus\SCM\
  ini := TIniFile.Create(SCMUtility.GetSCM_SharedIniFile);
  try
    ini.WriteString(Section, Name, Value);
  finally
    ini.free;
  end;
end;

end.
