unit dmSquadData;

interface

uses
  System.SysUtils, System.Classes, dmCoach, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type

  TSquadData = class(TDataModule)
    qrySelectPool: TFDQuery;
    dsSelectPool: TDataSource;
    qryTeam: TFDQuery;
    dsTeam: TDataSource;
    tblTeam: TFDTable;
  private
    { Private declarations }
    fIsActivated: boolean;
    fConnection: TFDConnection;
    function AssertConnection: boolean;
    procedure GetDefaultTeamName(var ATeamName: string; var ANickName: string);

  public
    { Public declarations }
    constructor CreateWithConnection(AOwner: TComponent;
      AConnection: TFDConnection);

    function NewTeamTemplate: integer;
    function EditTeamTemplate(TeamID: integer): boolean;
    function DeleteTeamTemplate(TeamID: integer): boolean;
    function DeleteTeamTemplateLinkHR(TeamID: integer): boolean;
    function CloneTeamTemplate(TeamID: integer): integer;
    function CloneTeamTemplateLinkHR(srcTeamID, destTeamID: integer): boolean;
    function LocateTeamTemplate(TeamID: integer): boolean;

    procedure ActivateDM(ATeamTemplateID: integer = 0);

    property IsActivated: boolean read fIsActivated;
  end;

var
  SquadData: TSquadData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TSquadData }

uses vcl.Graphics, unitUtility;

function TSquadData.AssertConnection: boolean;
begin
  result := false;
  if Assigned(fConnection) and fConnection.Connected then
    result := true;
end;

function TSquadData.NewTeamTemplate: integer;
var
  ATeamName, ANickName, aSQL: string;
  v: variant;
begin
  result := 0;
  if not AssertConnection then
    exit;
  with tblTeam do
  begin
    GetDefaultTeamName(ATeamName, ANickName);
    // NOTE: record is orphaned - not connection made to a workout.
    insert;
    FieldByname('Caption').AsString := ATeamName;
    FieldByname('NickName').AsString := ANickName;
    { TODO -oBSA -cGeneral : base color selection on current ui theme }
    FieldByname('Color').AsInteger := clWebLavender;
    FieldByname('TeamTypeID').AsInteger := 2; // Template
    FieldByname('CreatedOn').AsDateTime := Now;
    post;
    // For SQL databases, the physical location is implementation-specific.
    aSQL := 'USE SCM_Coach; SELECT IDENT_CURRENT(''[SCM_Coach].[dbo].[Team]'');';
    v := fConnection.ExecSQLScalar(aSQL);
    result := CnvVarToInt(v);
  end;
end;

function TSquadData.CloneTeamTemplate(TeamID: integer): integer;
var
  ATeamName, ANickName, aSQL: string;
  v: variant;
  recFound: boolean;
  IDENT: integer;
begin
  result := 0;
  if not AssertConnection then
    exit;
  // Assume qryTeam que-to-record or locate?
  recFound := LocateTeamTemplate(TeamID);
  if not recFound then
    exit;
  tblTeam.insert;
  tblTeam.FieldByname('Caption').AsString := 'Clone of ' +
    dsTeam.DataSet.FieldByname('Caption').AsString;
  tblTeam.FieldByname('NickName').AsString := dsTeam.DataSet.FieldByname
    ('NickName').AsString + '#';
  { TODO -oBSA -cGeneral : base color selection on current ui theme }
  tblTeam.FieldByname('Color').AsInteger := clWebLavender;
  tblTeam.FieldByname('TeamTypeID').AsInteger := 2; // Template
  tblTeam.FieldByname('CreatedOn').AsDateTime := Now;
  tblTeam.post;
  // For SQL databases, the physical location is implementation-specific.
  aSQL := 'USE SCM_Coach; SELECT IDENT_CURRENT(''[SCM_Coach].[dbo].[Team]'');';
  v := fConnection.ExecSQLScalar(aSQL);
  IDENT := CnvVarToInt(v);
  if (IDENT > 0) then
  begin
    { TODO -oBSA -cGeneral : Clone elements in Team... }
    // create clone - dbo.swimmerlink (dbo.coachlink?)
    CloneTeamTemplateLinkHR(TeamID, IDENT);
    // post message to re-build dual list elements in frmSquatT
    result := IDENT;
  end
end;

function TSquadData.CloneTeamTemplateLinkHR(srcTeamID, destTeamID: integer)
  : boolean;
begin
  result := true;
  // clone team HR
  // srcTeamID-dbo.SwimmerLink >>  (insert)destTeamID-dbo.SwimmerLink
end;

constructor TSquadData.CreateWithConnection(AOwner: TComponent;
  AConnection: TFDConnection);
begin
  inherited Create(AOwner);
  fConnection := AConnection;
  ActivateDM;
end;

function TSquadData.DeleteTeamTemplate(TeamID: integer): boolean;
var
  SQL: string;
  IDENT: LongInt;
begin
  result := false;
  if not AssertConnection then
    exit;
  // delete link HR in dbo.SwimmerLink
  DeleteTeamTemplateLinkHR(TeamID);
  // Finally ..
  SQL := 'DELETE FROM SCM_Coach.dbo.Team WHERE TeamID := ' +
    IntToStr(TeamID) + ';';
  // return records deleted
  IDENT := fConnection.ExecSQL(SQL);
  if (IDENT > 0) then
    result := true;
end;

function TSquadData.DeleteTeamTemplateLinkHR(TeamID: integer): boolean;
begin
  result := true;
{TODO -oBSA -cGeneral : Delete dbo.SwimmerLink WHERE TeamID = }
end;

function TSquadData.EditTeamTemplate(TeamID: integer): boolean;
var
  SQL: string;
begin
  { TODO -oBSA -cGeneral : code editTeamTemplate }
  result := true;
  if not AssertConnection then
    exit;
  // SQL := 'UPDATE SCM_Coach.dbo.Team SET Caption = , NickName = , Color = )
  // WHERE TeamID := ' + IntToStr(TeamID) + ';';

end;

procedure TSquadData.GetDefaultTeamName(var ATeamName: string;
  var ANickName: string);
var
  c: char;
  s: string;
  SearchOptions: TLocateOptions;
  success: boolean;
begin
  { TODO -oBSA -cGeneral : default team name generator }

  for c in ['A' .. 'Z'] do
  begin
    s := 'Team ' + c;
    success := tblTeam.Locate('Caption', s, SearchOptions);
    if not success then
      break;
  end;

  ATeamName := 'Team ' + c;
  ANickName := 'Team ' + c;

end;

function TSquadData.LocateTeamTemplate(TeamID: integer): boolean;
var
  SearchOptions: TLocateOptions;
begin
  result := false;
  if not AssertConnection then
    exit;
  SearchOptions := [];
  if dsTeam.DataSet.Active then
    result := dsTeam.DataSet.Locate('TeamID', TeamID, SearchOptions);
end;

procedure TSquadData.ActivateDM(ATeamTemplateID: integer);
begin
  fIsActivated := false;
  if not AssertConnection then
    exit;
  qrySelectPool.Connection := fConnection;
  // list only active (and not archived) swimmers
  qrySelectPool.ParamByName('HRTYPEID').AsInteger := 3;
  qrySelectPool.Prepare;
  qrySelectPool.Open;
  if qrySelectPool.Active then
  begin
    // open other tables ...
    qryTeam.Connection := fConnection;
    // list only templates
    qryTeam.ParamByName('TEAMTYPEID').AsInteger := 2;
    // syc to selected template
    qryTeam.ParamByName('TEAMID').AsInteger := ATeamTemplateID;
    qryTeam.Prepare;
    qryTeam.Open;
    if qryTeam.Active then
    begin
      // used for searches and record creation and destruction?
      tblTeam.Connection := fConnection;
      tblTeam.Open;
      if tblTeam.Active then
        fIsActivated := true;
    end;
  end;
end;

end.
