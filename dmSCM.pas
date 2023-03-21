unit dmSCM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client;

type
  TSCM = class(TDataModule)
    scmConnection: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    fSCMActive: boolean;


  public
    { Public declarations }

    // SYSTEM - STARTUP - EXIT
    procedure ActivateTable();
    procedure DeActivateTable();

    // CONNECTION
    procedure SimpleLoadSettingString(ASection, AName: string; var AValue: string);
    procedure SimpleMakeTemporyFDConnection(Server, User, Password: string;
      OsAuthent: boolean);
    procedure SimpleSaveSettingString(ASection, AName, AValue: string);

    // FLAG - true if all FireDAC tables, queries are active.
    property SCMActive: boolean read FSCMActive write FSCMActive;

  end;

const
  CUSTOMINIFILE = 'SCMCoachPref.ini';
  USEDEFAULTINIFILE = true; // NOTE: Always true. 26/09/2022
  SCMCONFIGFILENAME = 'SCMCoachConfig.ini';

var
  SCM: TSCM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
uses
  System.IOUtils, IniFiles, SCMUtility;

{ TSCM }

procedure TSCM.ActivateTable;
begin
fSCMActive := true;
end;

procedure TSCM.DataModuleCreate(Sender: TObject);
begin
  // TODO: INIT SCM datamodule
end;

procedure TSCM.DeActivateTable;
begin
fSCMActive := false;
end;

procedure TSCM.SimpleLoadSettingString(ASection, AName: string;
  var AValue: string);
var
  ini: TIniFile;
begin
  if USEDEFAULTINIFILE then
    ini := TIniFile.Create(SCMUtility.GetSCM_SharedIniFile)
  else
    ini := TIniFile.Create(TPath.GetDocumentsPath + PathDelim + CUSTOMINIFILE);
  try
    AValue := ini.ReadString(ASection, AName, '');
  finally
    ini.free;
  end;

end;

procedure TSCM.SimpleMakeTemporyFDConnection(Server, User, Password: string;
  OsAuthent: boolean);
var
  AValue, ASection, AName: string;
begin
  if (scmConnection.Connected) then
  begin
    scmConnection.Close();
  end;

  scmConnection.Params.Add('Server=' + Server);
  scmConnection.Params.Add('DriverID=MSSQL');
  scmConnection.Params.Add('Database=SCM_Coach');
  scmConnection.Params.Add('User_name=' + User);
  scmConnection.Params.Add('Password=' + Password);
  if (OsAuthent) then
    AValue := 'Yes'
  else
    AValue := 'No';
  scmConnection.Params.Add('OSAuthent=' + Value);
  scmConnection.Params.Add('Mars=yes');
  scmConnection.Params.Add('MetaDefSchema=dbo');
  scmConnection.Params.Add('ExtendedMetadata=False');
  scmConnection.Params.Add('ApplicationName=SCM_Coach');
  scmConnection.Connected := true;

  // ON SUCCESS - Save connection details.
  if (scmConnection.Connected) then
  begin
    ASection := 'MSSQL_SCM_Coach';
    AName := 'Server';
    SimpleSaveSettingString(ASection, AName, Server);
    AName := 'User';
    SimpleSaveSettingString(ASection, AName, User);
    AName := 'Password';
    SimpleSaveSettingString(ASection, AName, Password);
    AName := 'OSAuthent';
    SimpleSaveSettingString(ASection, AName, Value);
  end

end;

procedure TSCM.SimpleSaveSettingString(ASection, AName, AValue: string);
var
  ini: TIniFile;
begin
  // C:\Users\<#USERNAME#>\AppData\Roaming\Artanemus\SCM\
  if USEDEFAULTINIFILE then
    ini := TIniFile.Create(SCMUtility.GetSCM_SharedIniFile)
  else
    ini := TIniFile.Create(SCMUtility.GetSCMAppDataDir + CUSTOMINIFILE);
  try
    ini.WriteString(ASection, AName, AValue);
  finally
    ini.free;
  end;

end;

end.
