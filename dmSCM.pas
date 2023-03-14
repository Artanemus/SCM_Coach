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
    procedure SimpleLoadSettingString(Section, Name: string; var Value: string);
    procedure SimpleMakeTemporyFDConnection(Server, User, Password: string;
      OsAuthent: boolean);
    procedure SimpleSaveSettingString(Section, Name, Value: string);

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

procedure TSCM.SimpleLoadSettingString(Section, Name: string;
  var Value: string);
var
  ini: TIniFile;
begin
  if USEDEFAULTINIFILE then
    ini := TIniFile.Create(SCMUtility.GetSCM_SharedIniFile)
  else
    ini := TIniFile.Create(TPath.GetDocumentsPath + PathDelim + CUSTOMINIFILE);
  try
    Value := ini.ReadString(Section, name, '');
  finally
    ini.free;
  end;

end;

procedure TSCM.SimpleMakeTemporyFDConnection(Server, User, Password: string;
  OsAuthent: boolean);
var
  Value, Section: string;
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
    Value := 'Yes'
  else
    Value := 'No';
  scmConnection.Params.Add('OSAuthent=' + Value);
  scmConnection.Params.Add('Mars=yes');
  scmConnection.Params.Add('MetaDefSchema=dbo');
  scmConnection.Params.Add('ExtendedMetadata=False');
  scmConnection.Params.Add('ApplicationName=SCM_Coach');
  scmConnection.Connected := true;

  // ON SUCCESS - Save connection details.
  if (scmConnection.Connected) then
  begin
    Section := 'MSSQL_SCM_Coach';
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

procedure TSCM.SimpleSaveSettingString(Section, Name, Value: string);
var
  ini: TIniFile;
begin
  // C:\Users\<#USERNAME#>\AppData\Roaming\Artanemus\SCM\
  if USEDEFAULTINIFILE then
    ini := TIniFile.Create(SCMUtility.GetSCM_SharedIniFile)
  else
    ini := TIniFile.Create(SCMUtility.GetSCMAppDataDir + CUSTOMINIFILE);
  try
    ini.WriteString(Section, Name, Value);
  finally
    ini.free;
  end;

end;

end.
