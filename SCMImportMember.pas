unit SCMImportMember;

// INSERT SCM MEMBER
// Member must be UNIQUE;
// All connection must be VALID;
interface

uses
System.Classes, FireDAC.Comp.Client;

type

TSCMMember = class(TComponent)
private
  { private declarations }
  scmConnection: TFDConnection;
  coachConnection: TFDConnection;
  fLastIDENT: integer;

  function GetLastIDENT: integer;
  function AddMember(AscmMemberID: integer): boolean;
  function AddRaceHistory(AscmMemberID: integer; DoPBOnly: boolean = false): boolean;

  function AssertConnections(): boolean;
  function AssertUnique(AscmMemberID: integer): boolean;

protected
  { protected declarations }
public
  { public declarations }
  constructor Create(AOwner: TComponent); override;
  constructor CreateWithConnection(AOwner: TComponent; AscmConnection, AcoachConnection: TFDConnection);
published
  { published declarations }
end;


implementation

{ TSCMMember }

function TSCMMember.AddMember(AscmMemberID: integer): boolean;
begin
  if Assigned(scmConnection) AND Assigned(coachConnection) then
  begin

  end;
end;

function TSCMMember.AddRaceHistory(AscmMemberID: integer;
  DoPBOnly: boolean): boolean;
begin
  if Assigned(scmConnection) AND Assigned(coachConnection) then
  begin

  end;
end;

function TSCMMember.AssertConnections: boolean;
begin
  result := false;
  if Assigned(scmConnection) AND Assigned(coachConnection) then
  result := true;
end;

function TSCMMember.AssertUnique(AscmMemberID: integer): boolean;
begin
  result := true;
  if AssertConnections then
  begin
    // extract firstname, middle initial and lastname (FNAME)
    // test for FNAME
    result := false;
  end;

end;

constructor TSCMMember.Create(AOwner: TComponent);
begin
  inherited;

end;

constructor TSCMMember.CreateWithConnection(AOwner: TComponent; AscmConnection,
  AcoachConnection: TFDConnection);
begin
  inherited;
  scmConnection := AscmConnection;
  coachConnection := AcoachConnection;
end;

function TSCMMember.GetLastIDENT: integer;
var
SQL: string;
ident: integer;
begin
  if Assigned(coachConnection) then
  begin
    SQL := 'SELECT IDENT_CURRENT(''SCM_Coach.dbo.Member'');' ;
    ident := coachConnection.ExecSQLScalar(SQL);
  end;
end;

end.
