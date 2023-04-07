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
  private
    { Private declarations }
    scmConnection: TFDConnection;
    coachConnection: TFDConnection;
    fLastIDENT: integer;

    function GetLastIDENT: integer;
    function InsertMember(AscmMemberID: integer;
      DoPB, DoHistory: boolean): boolean;
    function AddContacts(AscmMemberID: integer): boolean;
    function AddRaceHistory(AscmMemberID: integer;
      DoPBOnly: boolean = false): boolean;

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
  ident: integer;

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

        ident := GetLastIDENT;
        if (ident <> 0) then
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

function TImportData.AddContacts(AscmMemberID: integer): boolean;
begin
  result := false;
  if AssertConnections then
  begin
    result := true;
  end;
end;

function TImportData.AddRaceHistory(AscmMemberID: integer;
  DoPBOnly: boolean): boolean;
begin
  result := false;
  if AssertConnections then
  begin
    result := true;
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
      result := qryCheckMiddleInitial.FieldByName('rtnValue')
        .AsBoolean;
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
  inherited;
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
