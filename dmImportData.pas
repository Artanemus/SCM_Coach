unit dmImportData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Comp.Client, Data.DB, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TImportData = class(TDataModule)
    TestSCMConnection: TFDConnection;
    sqlAssertDuplicity: TFDQuery;
    qryCheckMiddleInitial: TFDQuery;
    tblHR: TFDTable;
    TestCoachConnection: TFDConnection;
    qryMember: TFDQuery;
    tblContactNum: TFDTable;
    tblRaceHistory: TFDTable;
    qryContactNum: TFDQuery;
    qryRaceHistory: TFDQuery;
    tblRaceHistorySplit: TFDTable;
  private
    { Private declarations }
    scmConnection: TFDConnection;
    coachConnection: TFDConnection;
    fLastIDENT: integer;

    function GetLastIDENT: integer;
    function InsertMember(AscmMemberID: integer;
      DoPB, DoHistory: boolean): boolean;
    function AddContacts(HRID, AscmMemberID: integer): boolean;
    function AddRaceHistory(HRID, AscmMemberID: integer;
  DoPBOnly: boolean): boolean;

    function AssertConnections(): boolean;
    // STRING LOOKUP AND COMPARE (.HY3)
    function AssertUnique(AscmMemberID: integer): boolean;
    // IDENTITY LOOKUP
    function AssertDuplicity(AscmMemberID: integer): boolean;

    function HasFieldMiddleInitial: boolean;

  public
    { Public declarations }
    function ActivateDB: boolean;
    function DeActivateDB: boolean;

    constructor CreateWithConnection(AOwner: TComponent;
      AscmConnection, AcoachConnection: TFDConnection);
  end;

var
  ImportData: TImportData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TImportData }

function TImportData.InsertMember(AscmMemberID: integer;
  DoPB, DoHistory: boolean): boolean;
var
  IDENT: integer;

begin
  result := false;
  if AssertConnections then
  begin
    tblHR.Connection := coachConnection;
    tblHR.Open;

    qryMember.Connection := scmConnection;
    qryMember.ParamByName('MEMBERID').AsInteger := AscmMemberID;
    qryMember.Prepare;
    qryMember.Open;

    if qryMember.Active and tblHR.Active then
    begin
      while not qryMember.eof do
      begin
        // INSERT PROFILE
        tblHR.Insert;
        tblHR.FieldByName('scmMember').AsInteger :=
          qryMember.FieldByName('MemberID').AsInteger;
        tblHR.FieldByName('LastName').AsInteger :=
          qryMember.FieldByName('LastName').AsInteger;
        if HasFieldMiddleInitial() then
          tblHR.FieldByName('MiddleInitial').AsInteger :=
            qryMember.FieldByName('MiddleInitial').AsInteger;
        tblHR.FieldByName('FirstName').AsInteger :=
          qryMember.FieldByName('FirstName').AsInteger;
        tblHR.FieldByName('DOB').AsDateTime := qryMember.FieldByName('DOB')
          .AsDateTime;
        tblHR.FieldByName('RegisterStr').AsString :=
          qryMember.FieldByName('MembershipStr').AsString;
        tblHR.Post;

        IDENT := GetLastIDENT;
        if (IDENT <> 0) then
        begin
          if DoPB and not DoHistory then
          begin
            // INSERT PERSONAL BEST
            // only insert the personal best for each stroke swum
            // call InsertPB(ident, scmMemberID)
            ;
          end;
          if DoHistory then
          begin
            // INSERT RACE HISTORY
            // insert all racing history ... this will include PBs
            // call InsertHistory(ident, scmMemberID)
            ;
          end;
        end;

        qryMember.Next;
      end;
    end;
    qryMember.Close;
    result := true;
  end;
end;

function TImportData.ActivateDB: boolean;
begin
  result := false;
  if Assigned(coachConnection) AND coachConnection.Connected then
  begin
    tblHR.Connection := coachConnection;
    tblHR.Open;
    if tblHR.Active then
    begin
      tblContactNum.Connection := coachConnection;
      tblContactNum.Open;
      if tblContactNum.Active then
      begin
        tblRaceHistory.Connection := coachConnection;
        tblRaceHistory.Open;
        result := true;
      end;
    end;
  end;
end;

function TImportData.AddContacts(HRID, AscmMemberID: integer): boolean;
var
  fld: TField;
begin
  result := false;
  if AssertConnections then
  begin
    qryContactNum.Connection := scmConnection;
    qryContactNum.ParamByName('MEMBERID').AsInteger := AscmMemberID;
    qryContactNum.Prepare;
    qryContactNum.Open;
    if qryContactNum.Active then
    begin
      while not qryContactNum.eof do
      begin
        tblContactNum.Insert;

        // INDENTIFIER HRID
        tblContactNum.FieldByName('HRID').AsInteger := HRID;
        // 128 nvarchar
        tblContactNum.FieldByName('Number').AsString :=
          qryContactNum.FieldByName('Number').AsString;
        // All contact numbers are transfered - including expired.
        tblContactNum.FieldByName('IsArchived').AsBoolean :=
          qryContactNum.FieldByName('IsArchived').AsBoolean;
        // SCM field not implemented version 1.5.2.0
        fld := qryContactNum.FindField('CreatedOn');
        if (fld <> nil) then
          tblContactNum.FieldByName('CreatedOn').AsDateTime :=
            qryContactNum.FieldByName('CreatedOn').AsDateTime
        else
          tblContactNum.FieldByName('CreatedOn').AsDateTime := Now;

        // ContactNumType ID's common across databases
        {TODO -oBSA -cGeneral : Test ContactNumTypeID bounds?}
        tblContactNum.FieldByName('ContactNumTypeID').AsInteger :=
          qryContactNum.FieldByName('ContactNumTypeID').AsInteger;

        tblContactNum.Post;

        qryContactNum.Next;
      end;
      result := true;
    end;
  end;
end;

function TImportData.AddRaceHistory(HRID, AscmMemberID: integer;
  DoPBOnly: boolean): boolean;
var
  fld: TField;
  IDENT: integer;
    SQL: string;
begin
  result := false;
  if AssertConnections then
  begin
    qryRaceHistory.Connection := scmConnection;
    qryRaceHistory.ParamByName('MEMBERID').AsInteger := AscmMemberID;
    qryRaceHistory.Prepare;
    qryRaceHistory.Open;
    if qryRaceHistory.Active then
    begin
      while not qryRaceHistory.eof do
      begin
        tblRaceHistory.Insert;
        // INDENTIFIER HRID
        tblRaceHistory.FieldByName('HRID').AsInteger := HRID;
        // Caption: ClubName ...
        tblRaceHistory.FieldByName('Caption').AsString;
        // Caption: PoolName ... weather condition, temperature, ???
        tblRaceHistory.FieldByName('LongCaption').AsString;

        tblRaceHistory.FieldByName('RaceTime').AsDateTime;
        tblRaceHistory.FieldByName('CreatedOn').AsDateTime;

        // distance and stroke ID's common across databases
        tblRaceHistory.FieldByName('DistanceID').AsInteger;
        tblRaceHistory.FieldByName('StrokeID').AsInteger;
        // club night, clubs bash, carnival, regional meet, state meet, etc...
        tblRaceHistory.FieldByName('RaceHistoryTypeID').AsInteger;

        tblRaceHistory.Post;

        // -------------------------------------------------------
        // SPLIT TIMES ....
        SQL := 'USE SCM_Coach; SELECT IDENT_CURRENT(''[SCM_Coach].[dbo].[RaceHistory]'');';
        IDENT := coachConnection.ExecSQLScalar(SQL);
        {TODO -oBSA -cGeneral : Add split time to RaceHistory}

        qryContactNum.Next;
      end;
        result := true;
    end;
  end;
end;

function TImportData.AssertConnections: boolean;
begin
  result := false;
  if Assigned(scmConnection) AND scmConnection.Connected AND
    Assigned(coachConnection) AND coachConnection.Connected then
    result := true;
end;

function TImportData.HasFieldMiddleInitial: boolean;
begin
  result := false;
  if Assigned(scmConnection) AND scmConnection.Connected then
  begin
    // extract firstname, middle initial and lastname (FNAME)
    qryCheckMiddleInitial.Connection := scmConnection;
    qryCheckMiddleInitial.Open;
    if qryCheckMiddleInitial.Active then
      result := qryCheckMiddleInitial.FieldByName('rtnValue').AsBoolean;
    qryCheckMiddleInitial.Close;
  end;
end;

function TImportData.AssertDuplicity(AscmMemberID: integer): boolean;
begin
  // IDENTITY LOOKUP
  result := true;
  if Assigned(coachConnection) AND coachConnection.Connected then
  begin
    sqlAssertDuplicity.Connection := coachConnection;
    sqlAssertDuplicity.ParamByName('MEMBERID').AsInteger := AscmMemberID;
    sqlAssertDuplicity.Prepare;
    sqlAssertDuplicity.Open;
    if sqlAssertDuplicity.Active then
    begin
      result := sqlAssertDuplicity.FieldByName('rtnValue').AsBoolean;
    end;
    sqlAssertDuplicity.Close;
  end;
end;

function TImportData.AssertUnique(AscmMemberID: integer): boolean;
begin
  // STRING LOOKUP AND COMPARE   (.HY3)
  result := true;
end;

constructor TImportData.CreateWithConnection(AOwner: TComponent;
  AscmConnection, AcoachConnection: TFDConnection);
begin
  inherited Create(AOwner);
  scmConnection := AscmConnection;
  coachConnection := AcoachConnection;
end;

function TImportData.DeActivateDB: boolean;
begin
  tblHR.Close;
  tblContactNum.Close;
  tblRaceHistory.Close;
  result := true;
end;

function TImportData.GetLastIDENT: integer;
var
  SQL: string;
begin
  result := 0;
  if Assigned(coachConnection) then
  begin
    SQL := 'USE SCM_Coach; SELECT IDENT_CURRENT(''[SCM_Coach].[dbo].[Member]'');';
    result := coachConnection.ExecSQLScalar(SQL);
  end;
end;

end.
