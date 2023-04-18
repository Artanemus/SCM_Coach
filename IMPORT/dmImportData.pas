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
    qryIsDupMembers: TFDQuery;
    qryIsDupRaceHistory: TFDQuery;
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
  private
    { Private declarations }
    scmConnection: TFDConnection;
    coachConnection: TFDConnection;
    fCoreTablesActivated: boolean;

    function AddSplits(RaceHistoryID, EntrantID: integer): boolean;
    function HasFieldMiddleInitial: boolean;

  public
    { Public declarations }
    constructor CreateWithConnection(AOwner: TComponent;
      AscmConnection, AcoachConnection: TFDConnection);
    // rtns SCM_Coach HRID
    function InsertMember(scmMemberID: integer): integer;
    // rtns count of races added
    function InsertRaceHistory(scmMemberID, HRID: integer;
      DoSplit: boolean): integer;
    // rtns count of contacts added
    function InsertContacts(HRID, scmMemberID: integer): integer;

    // STRING LOOKUP AND COMPARE (for use with .HY3 file type)
    function AssertUnique(scmMemberID: integer): boolean;
    // IDENTITY LOOKUP
    function IsDupMember(scmMemberID: integer): boolean;
    function IsDupRaceHistory(EntrantID: integer): boolean;

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

uses System.Variants;

{ TImportData }

constructor TImportData.CreateWithConnection(AOwner: TComponent;
  AscmConnection, AcoachConnection: TFDConnection);
begin
  inherited Create(AOwner);
  scmConnection := AscmConnection;
  coachConnection := AcoachConnection;
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
        if tblRaceHistory.Active then
        begin
          tblRaceHistorySplit.Connection := coachConnection;
          tblRaceHistorySplit.Open;
          if tblRaceHistory.Active then
            fCoreTablesActivated := true;
        end;
      end;
    end;
  end;
  result := fCoreTablesActivated;

end;

function TImportData.AddSplits(RaceHistoryID, EntrantID: integer): boolean;
begin
  result := false;
  if AssertConnections then
  begin
    qrySplit.Connection := scmConnection;
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

        tblRaceHistorySplit.FieldByName('RaceTime').AsDateTime :=
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

function TImportData.AssertConnections: boolean;
begin
  result := false;
  if Assigned(scmConnection) AND scmConnection.Connected AND
    Assigned(coachConnection) AND coachConnection.Connected then
    result := true;
end;

function TImportData.AssertUnique(scmMemberID: integer): boolean;
begin
  // STRING LOOKUP AND COMPARE   (.HY3)
  result := true;
end;

function TImportData.DeActivateTable: boolean;
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

function TImportData.InsertContacts(HRID, scmMemberID: integer): integer;
var
  fld: TField;
begin
  result := 0;
  if AssertConnections then
  begin
    qryContactNum.Connection := scmConnection;
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
  IDENT: integer;
  SQL: string;
  v: variant;
begin
  result := 0;
  if AssertConnections then
  begin
    qryMember.Connection := scmConnection;
    qryMember.ParamByName('MEMBERID').AsInteger := scmMemberID;
    qryMember.Prepare;
    qryMember.Open;

    if qryMember.Active and tblHR.Active then
    begin
      { TODO -oBSA -cGeneral : Assert single record? }
      while not qryMember.eof do
      begin
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

        {TODO -oBSA -cGeneral : Complete all registration fields}
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
        tblHR.FieldByName('HRTypeID').AsInteger := 1;

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
        {TODO -oBSA -cGeneral : modify SQL to always return INT}
        // Exception class EVariantTypeCastError with message
        // 'Could not convert variant of type (Null) into type (Integer)'.
        SQL := 'USE SCM_Coach; SELECT IDENT_CURRENT(''[SCM_Coach].[dbo].[HR]'');';
        v := coachConnection.ExecSQLScalar(SQL);
        if VarIsNull(v) then
          IDENT := 0
        else
        begin
          if VarIsNumeric(v) then
            IDENT := integer(v)
          else
            IDENT := 0;
        end;

        // iterate
        qryMember.Next;
      end;
    end;
    qryMember.Close;
    tblHR.Close;
  end;
end;

function TImportData.InsertRaceHistory(scmMemberID, HRID: integer;
  DoSplit: boolean): integer;
var
  IDENT, EntrantID: integer;
  SQL: string;
  v: variant;
begin
  { insert the SwimClubMeet member's race history into
    the SCM_coach RaceHistory table. }
  result := 0; // records inserted
  // Pull race history from SwimClubMeet
  qryRaceHistory.Connection := scmConnection;
  qryRaceHistory.ParamByName('MEMBERID').AsInteger := scmMemberID;
  qryRaceHistory.Prepare;
  qryRaceHistory.Open;

  if qryRaceHistory.Active and tblRaceHistory.Active then
  begin
    while not qryRaceHistory.eof do
    begin
      // test for duplicity ... (using EntrantID)
      EntrantID := qryRaceHistory.FieldByName('EntrantID').AsInteger;
      if (EntrantID <> 0) AND (not IsDupRaceHistory(EntrantID)) then
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

        // EntrantID - specific to SCM ONLY
        tblRaceHistory.FieldByName('EntrantID').AsInteger :=
          qryRaceHistory.FieldByName('EntrantID').AsInteger;

        tblRaceHistory.FieldByName('Lane').AsInteger :=
          qryRaceHistory.FieldByName('Lane').AsInteger;

        { TODO -oBSA -cGeneral : Additional pool data }
        // tblRaceHistory.FieldByName('NumOfLanes').AsInteger :=
        // tblRaceHistory.FieldByName('LenOfPool').AsInteger :=
        // tblRaceHistory.FieldByName('PoolTypeID').AsInteger :=

        tblRaceHistory.FieldByName('IsScratch').AsBoolean :=
          qryRaceHistory.FieldByName('IsScratch').AsBoolean;

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
        {TODO -oBSA -cGeneral : modify SQL to always return INT}
        SQL := 'USE SCM_Coach; SELECT IDENT_CURRENT(''[SCM_Coach].[dbo].[RaceHistory]'');';
        v := coachConnection.ExecSQLScalar(SQL);
        if VarIsNull(v) then
          IDENT := 0
        else
        begin
          if VarIsNumeric(v) then
            IDENT := integer(v)
          else
            IDENT := 0;
        end;

        if DoSplit and (IDENT <> 0) then
        begin
          AddSplits(IDENT, EntrantID);
        end;
        // iterate
        qryRaceHistory.Next;
      end;
    end;
  end;

  qryRaceHistory.Close;
  tblRaceHistory.Close;

end;

function TImportData.IsDupMember(scmMemberID: integer): boolean;
begin
  // IDENTITY LOOKUP
  result := true;
  if Assigned(coachConnection) AND coachConnection.Connected then
  begin
    qryIsDupMembers.Connection := coachConnection;
    qryIsDupMembers.ParamByName('MEMBERID').AsInteger := scmMemberID;
    qryIsDupMembers.Prepare;
    qryIsDupMembers.Open;
    if qryIsDupMembers.Active then
    begin
      if (qryIsDupMembers.FieldByName('rtnValue').AsInteger = 0) then
        result := false;
    end;
    qryIsDupMembers.Close;
  end;
end;

function TImportData.IsDupRaceHistory(EntrantID: integer): boolean;
begin
  result := true;
  if Assigned(coachConnection) AND coachConnection.Connected then
  begin
    qryIsDupRaceHistory.Connection := coachConnection;
    qryIsDupRaceHistory.ParamByName('ENTRANTID').AsInteger := EntrantID;
    qryIsDupRaceHistory.Prepare;
    qryIsDupRaceHistory.Open;
    if qryIsDupRaceHistory.Active then
    begin
      if (qryIsDupRaceHistory.FieldByName('rtnValue').AsInteger = 0) then
        result := false;
    end;
    qryIsDupRaceHistory.Close;
  end;

end;

end.
