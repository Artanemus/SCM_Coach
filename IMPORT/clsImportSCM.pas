unit clsImportSCM;

// INSERT SCM MEMBER
// Member must be UNIQUE;
// All connection must be VALID;
interface

// Missing $(FrameworkType) in stand alone class
// Might be a better way to sort this out!
{$DEFINE VCL}

uses
{$IFDEF VCL}
  Classes, FireDAC.Comp.Client, dmImportData, SCMMemberObj,
  Winapi.Windows, Winapi.Messages, vcl.Forms, SCMDefines;
{$IFEND}

type

  TImportMember = class(TComponent)
  private
    { private declarations }
    scmConnection: TFDConnection;
    coachConnection: TFDConnection;
    fDoSplit, fDoContactNum, fDoRaceHistory: boolean;
    fState: integer;
  protected
    { protected declarations }
  public
    { public declarations }
    // STATS
    countHRs, countContacts, countRaces: integer;

    constructor Create(AOwner: TComponent); override;
    constructor CreateWithConnections(AOwner: TComponent;
      AscmConnection, AcoachConnection: TFDConnection);
    destructor Destroy; override;
    procedure InsertMember(list: TStrings);
    procedure UpdateMembers(list: TStrings);

    // 0 Unknown; 1 complete no errors; 2 err#
    property State: integer read fState;
    property DoContactNum: boolean read fDoContactNum write fDoContactNum;
    property DoSplit: boolean read fDoSplit write fDoSplit;
    property DoRaceHistory: boolean read fDoRaceHistory write fDoRaceHistory;

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
  fDoRaceHistory := true;
  fDoContactNum := true;
  countHRs := 0;
  countContacts := 0;
  countRaces := 0;
  fState := 0; // UNKNOWN
end;

procedure TImportMember.InsertMember(list: TStrings);
var
  i, MemberID, HRID, count: integer;
  obj: TObject;
begin
  // INIT
  countHRs := 0;
  countContacts := 0;
  countRaces := 0;
  fState := 0;

  // Loop across select IDs. (wit: SwimClubMeet member ID's)
  for i := 0 to list.count - 1 do
  begin
    obj := list.Objects[i];
    MemberID := TSCMMemberObj(obj).SCMMemberID;
    // Duplicity not allowed.
    if not ImportData.MemberExistsSCM_Coach(MemberID) then
    begin
      // C R E A T E   N E W   S Q U A D   M E M B E R .
      // insert this SCM member into the squad ....
      HRID := ImportData.InsertMember(MemberID);
      // PROGRESS BAR
      PostMessage(TForm(Owner).Handle, SCM_PROGRESSBARUPDATE, i,
        (list.count - 1));
      // Application.ProcessMessages;

      // COLLECT STATE DATA
      if (HRID <> 0) then
      begin
        countHRs := countHRs + 1;
        // C O N T A C T   N U M B E R S .
        if fDoContactNum then
        begin
          count := ImportData.InsertContacts(HRID, MemberID);
          countContacts := countContacts + count;
        end;
        // R A C E   H I S T O R Y .
        // insert swimmer's SCM race-history (exclude duplications)
        if fDoRaceHistory then
        begin
          count := ImportData.InsertRaceHistory(MemberID, HRID, fDoSplit);
          countRaces := countRaces + count;
        end;
      end;
    end;
  end;
  if (countHRs > 0) then
    fState := 1;
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
  ImportData.ActivateDM();
end;

destructor TImportMember.Destroy;
begin
  ImportData.DeActivate(); // - auto-close on destroy
  FreeAndNil(ImportData); // - auto-free on destory
  inherited;
end;

procedure TImportMember.UpdateMembers(list: TStrings);
// Update the profile and race history of the squad member.
{ TODO -oBSA -cGeneral : UpdateMember }
var
  i, SCMMemberID, HRID, count: integer;
  obj: TObject;
  success: boolean;
begin
  // INIT
  countHRs := 0;
  countContacts := 0;
  countRaces := 0;
  fState := 0;

  // Loop across select IDs. (wit: SwimClubMeet member ID's)
  for i := 0 to list.count - 1 do
  begin
    obj := list.Objects[i];
    SCMMemberID := TSCMMemberObj(obj).SCMMemberID;
    HRID := TSCMMemberObj(obj).HRID;

    // Check for member in SwimClubMeet member's table.
    // Archived, isSwimmer, isActive is ignored...
    if ImportData.MemberExistsSwimClubMeet(SCMMemberID) then
    begin
      // U P D A T E   S Q U A D   H R .
      success := ImportData.UpdateHR(HRID, SCMMemberID);
      // PROGRESS BAR
      PostMessage(TForm(Owner).Handle, SCM_PROGRESSBARUPDATE, i,
        (list.count - 1));
      // Application.ProcessMessages;

      if not success then
        Continue;

      // COLLECT STATE DATA
      countHRs := countHRs + 1;

      // C O N T A C T   N U M B E R S .
      if fDoContactNum then
      begin
        count := ImportData.UpdateContacts(HRID, SCMMemberID);
        countContacts := countContacts + count;
      end;
      // R A C E   H I S T O R Y .
      // insert swimmer's SCM race-history (exclude duplications)
      if fDoRaceHistory then
      begin
        count := ImportData.UpdateRaceHistory(HRID, SCMMemberID, fDoSplit);
        countRaces := countRaces + count;
      end;
    end;
  end;
  if (countHRs > 0) then
    fState := 1;
end;

end.
