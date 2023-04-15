unit clsImportSCM;

// INSERT SCM MEMBER
// Member must be UNIQUE;
// All connection must be VALID;
interface

uses
  System.Classes, FireDAC.Comp.Client, dmImportData, SCMMemberObj;

type


  TImportMember = class(TComponent)
  private
    { private declarations }
    scmConnection: TFDConnection;
    coachConnection: TFDConnection;
    fLastIDENT: integer;
    fDoSplit: boolean;
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create(AOwner: TComponent); override;
    constructor CreateWithConnections(AOwner: TComponent;
      AscmConnection, AcoachConnection: TFDConnection);
    destructor Destroy; override;
    procedure InsertMember(list: TStrings; DoRaceHistory: boolean);
    procedure UpdateMembers(list: TStrings);

  published
    { published declarations }
  end;


implementation

{ TSCMMember }

uses System.SysUtils;

constructor TImportMember.Create(AOwner: TComponent);
begin
  inherited;
  { TODO -oBSa -cGeneral : Expose DoSplit }
  fDoSplit := true;
end;

procedure TImportMember.InsertMember(list: TStrings; DoRaceHistory: boolean);
var
  i, MemberID, HRID, recCount: integer;
  obj: TObject;
begin
  fDoSplit := true;
  // Loop across select member IDs wit: SwimClubMeet member ID's
  for i := 0 to list.Count - 1 do
  begin
    obj := list.Objects[i];
    MemberID := TSCMMemberObj(obj).ID; // A SwimClubMeet Member's ID
    // Test for duplicity ...
    // LookUp - SCM_coach.dbo.HR Field 'scmMemberID';
    if not ImportData.AssertDuplicity(MemberID) then
    begin
      // insert this SCM member into the squad ....
      HRID := ImportData.InsertMember(MemberID);
      if DoRaceHistory then
      begin
        recCount := ImportData.InsertRaceHistory(MemberID, HRID, fDoSplit);
      end;
    end;
  end;
end;

constructor TImportMember.CreateWithConnections(AOwner: TComponent;
  AscmConnection, AcoachConnection: TFDConnection);
begin
  inherited Create(AOwner);
  scmConnection := AscmConnection;
  coachConnection := AcoachConnection;
  // construct database module.
  ImportData := TImportData.CreateWithConnection(Self, scmConnection,
    coachConnection);
  ImportData.ActivateTable();
end;

destructor TImportMember.Destroy;
begin
  ImportData.DeActivateTable(); // - auto-close on destroy
  FreeAndNil(ImportData); // - auto-free on destory
  inherited;
end;

procedure TImportMember.UpdateMembers(list: TStrings);
begin

end;


end.
