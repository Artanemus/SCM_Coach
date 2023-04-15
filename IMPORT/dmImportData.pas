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
    fCoreTablesActivated: boolean;

    function GetLastIDENT: integer;
    function AddContacts(HRID, AscmMemberID: integer): boolean;
    function AddRaceHistory(HRID, AscmMemberID: integer): boolean;
    function HasFieldMiddleInitial: boolean;

  public
    { Public declarations }
    constructor CreateWithConnection(AOwner: TComponent;
      AscmConnection, AcoachConnection: TFDConnection);
    // rtns SCM_Coach HRID
    function InsertMember(AscmMemberID: integer): integer;
    // rtns record count
    function InsertRaceHistory(AscmMemberID, AHRID: integer;
  DoSplit: boolean): integer;

    // STRING LOOKUP AND COMPARE (for use with .HY3 file type)
    function AssertUnique(AscmMemberID: integer): boolean;
    // IDENTITY LOOKUP
    function AssertDuplicity(AscmMemberID: integer): boolean;

    function ActivateTable: boolean;
    function DeActivateTable: boolean;
    function AssertConnections(): boolean;

    // FLAG - true if all core FireDAC tables, queries are active.
    property CoreTablesActivated: boolean read fCoreTablesActivated;

  end;

var
  ImportData: TImportData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TImportData }

function TImportData.InsertMember(AscmMemberID: integer): integer;
var
  IDENT: integer;

begin
  result := 0;
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
      { TODO -oBSA -cGeneral : Assert single record? }
      while not qryMember.eof do
      begin
        // I N S E R T   P R O F I L E .
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
        // INIT BIT FIELDS
        tblHR.FieldByName('IsActive').AsBoolean := true;
        tblHR.FieldByName('IsArchived').AsBoolean := true;
        // TIMESTAMP
        tblHR.FieldByName('CreatedOn').AsDateTime := Now;

        tblHR.Post;

        IDENT := GetLastIDENT; // ID of last SCM_Coach HR
        if (IDENT <> 0) then
          result := IDENT;
      end;
    end;
    qryMember.Close;
    tblHR.Close;
  end;
end;

function TImportData.InsertRaceHistory(AscmMemberID, AHRID: integer;
  DoSplit: boolean): integer;
begin
  { insert the SwimClubMeet member's race history into
    the SCM_coach RaceHistory table. }
  result := 0; // records inserted
  // Pull race history from SwimClubMeet
  qryRaceHistory.Connection := scmConnection;
  qryRaceHistory.ParamByName('MEMBERID').AsInteger := AscmMemberID;
  qryRaceHistory.Prepare;
  qryRaceHistory.Open;

  // insert into RaceHistory
  tblRaceHistory.Connection := coachConnection;
  tblRaceHistory.Open;

  if qryRaceHistory.Active and tblRaceHistory.Active then
  begin
    while not qryRaceHistory.eof do
    begin
      // test for duplicity ... (using EntrantID)
      // LOOKUP RACEHISTORY.ENTRANTID

      // INSERT
    end;
  end;

  qryRaceHistory.Close;
  tblRaceHistory.Close;

end;

function TImportData.ActivateTable: boolean;
begin
  fCoreTablesActivated := false;
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
        fCoreTablesActivated := true;
      end;
    end;
  end;
  result := fCoreTablesActivated;

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
        { TODO -oBSA -cGeneral : Test ContactNumTypeID bounds? }
        tblContactNum.FieldByName('ContactNumTypeID').AsInteger :=
          qryContactNum.FieldByName('ContactNumTypeID').AsInteger;

        tblContactNum.Post;

        qryContactNum.Next;
      end;
      result := true;
    end;
  end;
end;

function TImportData.AddRaceHistory(HRID, AscmMemberID: integer): boolean;
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

        {
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
        }

        tblRaceHistory.Post;

        // -------------------------------------------------------
        // S P L I T   T I M E S  ....
        // -------------------------------------------------------
        SQL := 'USE SCM_Coach; SELECT IDENT_CURRENT(''[SCM_Coach].[dbo].[RaceHistory]'');';
        IDENT := coachConnection.ExecSQLScalar(SQL);
        { TODO -oBSA -cGeneral : Add split time to RaceHistory }

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

function TImportData.DeActivateTable: boolean;
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
