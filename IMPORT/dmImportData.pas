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
    qryCheckMiddleInitial: TFDQuery;
    tblHR: TFDTable;
    TestCoachConnection: TFDConnection;
    qryMember: TFDQuery;
    tblContactNum: TFDTable;
    tblRaceHistory: TFDTable;
    qryContactNum: TFDQuery;
    qryRaceHistory: TFDQuery;
    tblRaceHistorySplit: TFDTable;
    qrySplit: TFDQuery;
    qryMaxRaceHistory: TFDQuery;
  private
    { Private declarations }
    fscmConnection: TFDConnection;
    fcoachConnection: TFDConnection;
    fIsActivated: boolean;

    function InsertSplits(RaceHistoryID, EntrantID: integer): boolean;
    function HasFieldMiddleInitial: boolean;
    function Locate_scmMember(scmMemberID: integer): integer;

    // UPDATE - EXTENDED SUB-FUNCTIONS
    function uInsertRaceHistory(HRID, scmMemberID: integer): boolean;
    function uDeleteRaceHistory(RaceHistoryID: integer): boolean;

  public
    { Public declarations }
    constructor CreateWithConnection(AOwner: TComponent;
      AscmConnection, AcoachConnection: TFDConnection);

    // I N S E R T   S C M   M E M B E R .
    // rtns SCM_Coach HRID
    function InsertMember(scmMemberID: integer): integer;
    // rtns count of races added
    function InsertRaceHistory(HRID, scmMemberID: integer; ASeedDate: variant;
      DoSplit: boolean = true; DoRange: boolean = false): integer;
    // rtns count of contacts added
    function InsertContacts(HRID, scmMemberID: integer): integer;

    // U P D A T E   C O A C H   H R   S W I M M E R .
    // rtns SCM_Coach success
    function UpdateHR(scmMemberID: integer): boolean;
    // rtns count of races updated
    function UpdateRaceHistory(scmMemberID: integer; DoSplit: boolean): integer;
    // rtns count of contacts updated
    function UpdateContacts(scmMemberID: integer): integer;

    // STRING LOOKUP AND COMPARE (for use with .HY3 file type)
    function AssertUnique(scmMemberID: integer): boolean;
    // IDENTITY LOOKUP
    function MemberExistsSCM_Coach(scmMemberID: integer): boolean;
    function EntrantIDExists(HRID, EntrantID: integer): boolean;

    function MemberExistsSwimClubMeet(scmMemberID: integer): boolean;

    function ActivateDM: boolean;
    function DeActivate: boolean;
    function AssertConnection(): boolean;

    // FLAG - true if all core FireDAC tables, queries are active.
    property IsActivated: boolean read fIsActivated;

  end;

var
  ImportData: TImportData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

uses System.Variants, unitUtility;

{ TImportData }

constructor TImportData.CreateWithConnection(AOwner: TComponent;
  AscmConnection, AcoachConnection: TFDConnection);
begin
  inherited Create(AOwner);
  fscmConnection := AscmConnection;
  fcoachConnection := AcoachConnection;
end;

function TImportData.ActivateDM: boolean;
begin
  // TFDTable are the only DB components to be activated for the life
  // of this class.
  fIsActivated := false;
  if Assigned(fcoachConnection) AND fcoachConnection.Connected then
  begin
    tblHR.Connection := fcoachConnection;
    tblHR.Open;
    if tblHR.Active then
    begin
      tblContactNum.Connection := fcoachConnection;
      tblContactNum.Open;
      if tblContactNum.Active then
      begin
        tblRaceHistory.Connection := fcoachConnection;
        tblRaceHistory.Open;
        if tblRaceHistory.Active then
        begin
          tblRaceHistorySplit.Connection := fcoachConnection;
          tblRaceHistorySplit.Open;
          if tblRaceHistory.Active then
            fIsActivated := true;
        end;
      end;
    end;
  end;
  result := fIsActivated;

end;

function TImportData.AssertConnection: boolean;
begin
  result := false;
  if Assigned(fscmConnection) AND fscmConnection.Connected AND
    Assigned(fcoachConnection) AND fcoachConnection.Connected then
    result := true;
end;

function TImportData.AssertUnique(scmMemberID: integer): boolean;
begin
  // STRING LOOKUP AND COMPARE   (.HY3)
  result := true;
end;

function TImportData.DeActivate: boolean;
begin
  tblHR.Close;
  tblContactNum.Close;
  tblRaceHistory.Close;
  tblRaceHistorySplit.Close;
  result := true;
end;

function TImportData.HasFieldMiddleInitial: boolean;
begin
  result := false;
  if Assigned(fscmConnection) AND fscmConnection.Connected then
  begin
    // extract firstname, middle initial and lastname (FNAME)
    qryCheckMiddleInitial.Connection := fscmConnection;
    qryCheckMiddleInitial.Open;
    if qryCheckMiddleInitial.Active then
      result := qryCheckMiddleInitial.FieldByName('rtnValue').AsBoolean;
    qryCheckMiddleInitial.Close;
  end;
end;

function TImportData.InsertContacts(HRID, scmMemberID: integer): integer;
var
  fld: TField;
begin
  result := 0;
  if AssertConnection then
  begin
    qryContactNum.Connection := fscmConnection;
    qryContactNum.ParamByName('MEMBERID').AsInteger := scmMemberID;
    qryContactNum.Prepare;
    qryContactNum.Open;
    if qryContactNum.Active and tblContactNum.Active then
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

        result := result + 1;
        // iterate
        qryContactNum.Next;
      end;
    end;
  end;
end;

function TImportData.InsertMember(scmMemberID: integer): integer;
var
  SQL: string;
  v: variant;
begin
  result := 0;
  if AssertConnection then
  begin
    qryMember.Connection := fscmConnection;
    qryMember.ParamByName('MEMBERID').AsInteger := scmMemberID;
    qryMember.Prepare;
    qryMember.Open;

    if qryMember.Active and tblHR.Active then
    begin
      { TODO -oBSA -cGeneral : Assert single record? }
      if (qryMember.RecordCount > 0) then
      begin

        qryMember.First; // REDUNDANT

        // I N S E R T   P R O F I L E .
        tblHR.Insert;

        tblHR.FieldByName('scmMemberID').AsInteger :=
          qryMember.FieldByName('MemberID').AsInteger;
        tblHR.FieldByName('LastName').AsString :=
          qryMember.FieldByName('LastName').AsString;
        if HasFieldMiddleInitial() then
          tblHR.FieldByName('MiddleInitial').AsString :=
            qryMember.FieldByName('MiddleInitial').AsString;
        tblHR.FieldByName('FirstName').AsString :=
          qryMember.FieldByName('FirstName').AsString;
        tblHR.FieldByName('DOB').AsDateTime := qryMember.FieldByName('DOB')
          .AsDateTime;

        { TODO -oBSA -cGeneral : Complete all registration fields }
        // tblHR.FieldByName('RegisterNum').AsInteger :=
        // tblHR.FieldByName('RegisterStr').AsString :=
        // Tempory assignment ...
        tblHR.FieldByName('RegisterStr').AsString :=
          qryMember.FieldByName('MembershipStr').AsString;

        // WARNING : SwimClubMeet and SCM_Coach dbo.Gender tables must be clones.
        tblHR.FieldByName('GenderID').AsInteger :=
          qryMember.FieldByName('GenderID').AsInteger;

        // INIT BIT FIELDS
        tblHR.FieldByName('IsActive').AsBoolean := true;
        tblHR.FieldByName('IsArchived').AsBoolean := false;
        // TIMESTAMP
        tblHR.FieldByName('CreatedOn').AsDateTime := Now;
        // SPECIFY HR TYPE - SQUAD SWIMMER
        tblHR.FieldByName('HRTypeID').AsInteger := 3;

        { TODO -oBSA -cGeneral : Option - specify squad swimmers GradeID }
        // SPECIFY SWIMMER INITIAL GRADE ...  ???
        // tblHR.FieldByName('GradeID').AsInteger :=

        // EMAIL
        tblHR.FieldByName('Email').AsString :=
          qryMember.FieldByName('Email').AsString;

        tblHR.Post;

        // -------------------------------------------------------
        // I D E N T   N E E D E D   F O R   H R I D .
        // -------------------------------------------------------
        { TODO -oBSA -cGeneral : modify SQL to always return INT }
        SQL := 'USE SCM_Coach; SELECT IDENT_CURRENT(''[SCM_Coach].[dbo].[HR]'');';
        v := fcoachConnection.ExecSQLScalar(SQL);
        result := CnvVarToInt(v);
      end;
    end;
    qryMember.Close;
  end;
end;

function TImportData.InsertRaceHistory(HRID, scmMemberID: integer;
  ASeedDate: variant; DoSplit: boolean = true;
  DoRange: boolean = false): integer;
var
  IDENT, scmEntrantID: integer;
  SQL: string;
  v: variant;
begin
  { insert the SwimClubMeet member's race history into
    the SCM_coach RaceHistory table. }
  result := 0; // records inserted
  // Pull race history from SwimClubMeet
  qryRaceHistory.Connection := fscmConnection;
  qryRaceHistory.ParamByName('MEMBERID').AsInteger := scmMemberID;

  // query will use defaults and ignore select after seed-date.
  if DoRange then
  begin
    qryRaceHistory.ParamByName('SEEDATE').AsDateTime := TDateTime(ASeedDate);
    qryRaceHistory.ParamByName('DORANGE').AsBoolean := DoRange;
  end;

  qryRaceHistory.Prepare;
  qryRaceHistory.Open;

  if qryRaceHistory.Active and tblRaceHistory.Active then
  begin
    while not qryRaceHistory.eof do
    begin
      // test for duplicity ... (using EntrantID)
      scmEntrantID := qryRaceHistory.FieldByName('EntrantID').AsInteger;
      // does the entrant ID (swimming race) already exists
      if (scmEntrantID <> 0) AND (not EntrantIDExists(HRID, scmEntrantID)) then
      begin
        tblRaceHistory.Insert;
        tblRaceHistory.FieldByName('HRID').AsInteger := HRID;

        { TODO -oBSA -cGeneral : Improve all caption strings for RaceHistory }
        // Caption: ClubName ...
        tblRaceHistory.FieldByName('Caption').AsString :=
          qryRaceHistory.FieldByName('SessionStr').AsString;

        // Caption: Event String ??? ClubName ?? PoolName ... weather condition, temperature, ???
        tblRaceHistory.FieldByName('LongCaption').AsString :=
          qryRaceHistory.FieldByName('EventStr').AsString;

        tblRaceHistory.FieldByName('RaceTime').AsDateTime :=
          qryRaceHistory.FieldByName('RaceTime').AsDateTime;
        tblRaceHistory.FieldByName('CreatedOn').AsDateTime :=
          qryRaceHistory.FieldByName('SessionStart').AsDateTime;

        // NOTE: distance and stroke ID's common across databases
        tblRaceHistory.FieldByName('DistanceID').AsInteger :=
          qryRaceHistory.FieldByName('DistanceID').AsInteger;
        tblRaceHistory.FieldByName('StrokeID').AsInteger :=
          qryRaceHistory.FieldByName('StrokeID').AsInteger;

        // SCM EntrantID - specific to SCM IMPORT
        // Used to test for duplications
        tblRaceHistory.FieldByName('EntrantID').AsInteger := scmEntrantID;

        tblRaceHistory.FieldByName('Lane').AsInteger :=
          qryRaceHistory.FieldByName('Lane').AsInteger;

        { TODO -oBSA -cGeneral : Extended pool data }
        // tblRaceHistory.FieldByName('NumOfLanes').AsInteger :=
        // tblRaceHistory.FieldByName('LenOfPool').AsInteger :=
        // tblRaceHistory.FieldByName('PoolTypeID').AsInteger :=
        // tblRaceHistory.FieldByName('PoolName').AsInteger :=

        tblRaceHistory.FieldByName('IsScratched').AsBoolean :=
          qryRaceHistory.FieldByName('IsScratched').AsBoolean;

        tblRaceHistory.FieldByName('IsDisqualified').AsBoolean :=
          qryRaceHistory.FieldByName('IsDisqualified').AsBoolean;

        { TODO -oBSA -cGeneral : Qualification data }
        // tblRaceHistory.FieldByName('DisqualifiedID').AsInteger :=

        // 1.club night, clubs bash, carnival, regional meet, state meet, etc...
        tblRaceHistory.FieldByName('RaceHistoryTypeID').AsInteger := 1;

        tblRaceHistory.Post;

        // -------------------------------------------------------
        // I D E N T   N E E D E D   F O R   S P L I T   T I M E S  ....
        // -------------------------------------------------------
        { TODO -oBSA -cGeneral : modify SQL to always return INT }
        SQL := 'USE SCM_Coach; SELECT IDENT_CURRENT(''[SCM_Coach].[dbo].[RaceHistory]'');';
        v := fcoachConnection.ExecSQLScalar(SQL);
        IDENT := CnvVarToInt(v);
        if DoSplit and (IDENT <> 0) then
        begin
          InsertSplits(IDENT, scmEntrantID);
        end;

      end;
      // iterate
      qryRaceHistory.Next;
    end;
  end;

  qryRaceHistory.Close;

end;

function TImportData.InsertSplits(RaceHistoryID, EntrantID: integer): boolean;
begin
  result := false;
  if AssertConnection then
  begin
    qrySplit.Connection := fscmConnection;
    qrySplit.ParamByName('ENTRANTID').AsInteger := EntrantID;
    qrySplit.Prepare;
    qrySplit.Open;
    if qrySplit.Active then
    begin
      while not qrySplit.eof do
      begin
        // -------------------------------------------------------
        // S P L I T   T I M E S  ....
        // -------------------------------------------------------
        tblRaceHistorySplit.Insert;

        tblRaceHistorySplit.FieldByName('SplitTime').AsDateTime :=
          qrySplit.FieldByName('SplitTime').AsDateTime;
        tblRaceHistorySplit.FieldByName('Lap').AsInteger :=
          qrySplit.FieldByName('Lap').AsInteger;
        // IDENT for join
        tblRaceHistorySplit.FieldByName('RaceHistoryID').AsInteger :=
          RaceHistoryID;

        tblRaceHistorySplit.Post;
        // iterate
        qrySplit.Next;
      end;

      result := true;
    end;
  end;
end;

function TImportData.MemberExistsSCM_Coach(scmMemberID: integer): boolean;
var
  Count: integer;
begin
  result := false;
  // Check for member in SwimClubMeet member's table.
  // Archived, isSwimmer, isActive is ignored...
  Count := fcoachConnection.ExecSQLScalar
    ('SELECT COUNT(SCMMemberID) FROM SCM_Coach.dbo.HR WHERE scmMemberID = :ID',
    [scmMemberID]);
  if (Count > 0) then
    result := true;
end;

function TImportData.MemberExistsSwimClubMeet(scmMemberID: integer): boolean;
var
  Count: integer;
begin
  result := false;
  // Check for member in SwimClubMeet member's table.
  // Archived, isSwimmer, isActive is ignored...
  Count := fscmConnection.ExecSQLScalar
    ('SELECT COUNT(MemberID) FROM SwimClubMeet.dbo.Member WHERE MemberID = :ID',
    [scmMemberID]);
  if (Count > 0) then
    result := true;
end;

function TImportData.uDeleteRaceHistory(RaceHistoryID: integer): boolean;
begin

end;

function TImportData.uInsertRaceHistory(HRID, scmMemberID: integer): boolean;
begin

end;

function TImportData.UpdateContacts(scmMemberID: integer): integer;
var
  HRID: integer;
  SQL: TStrings; // for code readability
begin
  if not AssertConnection then
    exit;
  HRID := Locate_scmMember(scmMemberID);
  // QUICK TRASH AND BURN ...
  // Only SwimClubMeet contacts will be deleted. User defined contacts remain.
  if (HRID > 0) then
  Begin
    SQL := TStrings.Create;
    SQL.Add('USE  SCM_Coach;');
    SQL.Add('DELETE FROM SCM_Coach.dbo.tblContactNum ');
    SQL.Add('INNER JOIN dbo.HR ON ContactNum.HRID = HR.HRID ');
    SQL.Add('WHERE ContactNum.HRID = :ID AND HR.SCMMmberID IS NOT NULL;');
    fcoachConnection.ExecSQL(SQL.Text, [HRID]);
    // insert SwimClubMeet contact details for the given MemberID.
    result := InsertContacts(HRID, scmMemberID);
    SQL.Free;
  End;
end;

function TImportData.UpdateHR(scmMemberID: integer): boolean;
begin
  result := false;
  if not AssertConnection then
    exit;
  if (Locate_scmMember(scmMemberID) = 0) then
    exit;
  qryMember.Connection := fscmConnection;
  qryMember.ParamByName('MEMBERID').AsInteger := scmMemberID;
  qryMember.Prepare;
  qryMember.Open;
  if qryMember.Active and (qryMember.RecordCount > 0) then
  begin
    tblHR.Edit;
    // Update subset...
    { TODO -oBSA -cGeneral : Complete all registration fields }
    // tblHR.FieldByName('RegisterNum').AsInteger :=
    tblHR.FieldByName('ModifiedOn').AsDateTime := Now;
    tblHR.FieldByName('RegisterStr').AsString :=
      qryMember.FieldByName('MembershipStr').AsString;
    tblHR.FieldByName('Email').AsString :=
      qryMember.FieldByName('Email').AsString;
    tblHR.Post;
    result := true;
  end;
end;

function TImportData.UpdateRaceHistory(scmMemberID: integer;
  DoSplit: boolean): integer;
var
  HRID, EntrantID: integer;
  CreatedOn: TDateTime;
begin
  result := 0;
  if not AssertConnection then
    exit;
  HRID := Locate_scmMember(scmMemberID);
  if (HRID = 0) then
    exit;
  // Retrieve the most recent event data for the HR (held in COACH).
  qryMaxRaceHistory.Connection := fcoachConnection;
  qryMaxRaceHistory.ParamByName('HRID').AsInteger := HRID;
  qryMaxRaceHistory.Prepare;
  qryMaxRaceHistory.Open;
  if not qryMaxRaceHistory.Active or qryMaxRaceHistory.IsEmpty then
    exit;
  CreatedOn := qryMaxRaceHistory.FieldByName('CreatedOn').AsDateTime;
  qryMaxRaceHistory.Close;
  // DUPLICATE ENTRANTID's are asserted in Procedure.
  // Insert any race-history swum after seed-date.
  InsertRaceHistory(HRID, scmMemberID, CreatedOn, true, true);
end;

function TImportData.EntrantIDExists(HRID, EntrantID: integer): boolean;
var
  SQL: TStrings; // for code readability
  v: Variant;
begin
  result := false;
  if Assigned(fcoachConnection) AND fcoachConnection.Connected then
  begin
    SQL := TStrings.Create;
    SQL.Add('USE  SCM_Coach;');
    SQL.Add('SELECT COUNT(dbo.RaceHistory.RaceHistoryID) ');
    SQL.Add('FROM dbo.RaceHistory ');
    SQL.Add('WHERE EntrantID = :EntrantID AND HRID = :HRID;');
    v := fcoachConnection.ExecSQLScalar(SQL.Text, [EntrantID, HRID]);
    if (CnvVarToInt(v) > 0) then
      result := true;
    SQL.Free;
  end;
end;

function TImportData.Locate_scmMember(scmMemberID: integer): integer;
var
  LocateSuccess: boolean;
  SearchOptions: TLocateOptions;
begin
  LocateSuccess := false;
  result := 0;
  SearchOptions := [];
  try
    begin
      LocateSuccess := tblHR.Locate('scmMemberID', scmMemberID, SearchOptions);
    end;
  except
    on E: Exception do
      LocateSuccess := false;
  end;
  if LocateSuccess then
    result := tblHR.FieldByName('HRID').AsInteger;
end;

end.
