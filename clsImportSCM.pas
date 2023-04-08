unit clsImportSCM;

// INSERT SCM MEMBER
// Member must be UNIQUE;
// All connection must be VALID;
interface

uses
  System.Classes, FireDAC.Comp.Client, dmImportData;

type

  TscmMember = class(TObject)
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }

    MemberID: integer;
    FName: string;
    // published
    { published declarations }
    constructor Create();
    destructor Destroy(); override;
    property ID: integer read MemberID;
  end;

  TImportMember = class(TComponent)
  private
    { private declarations }
    scmConnection: TFDConnection;
    coachConnection: TFDConnection;
    fLastIDENT: integer;

    myDM: TImportData;

  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create(AOwner: TComponent); override;
    constructor CreateWithConnection(AOwner: TComponent;
      AscmConnection, AcoachConnection: TFDConnection);

    destructor Destroy; override;

    procedure CreateMembers(list: TStrings);
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

end;

procedure TImportMember.CreateMembers(list: TStrings);
var
i, MemberID: integer;
obj: TObject;
begin
    // Loop across select member IDs
    for i := 0 to list.Count - 1 do
    begin
      obj := list.Objects[i];
      MemberID := TscmMember(obj).ID;
      // call import class ....
      //
    end;
end;

constructor TImportMember.CreateWithConnection(AOwner: TComponent;
  AscmConnection, AcoachConnection: TFDConnection);
begin
  inherited Create(AOwner);
  scmConnection := AscmConnection;
  coachConnection := AcoachConnection;
  // construct database module.
  myDM := TImportData.CreateWithConnection(Self, scmConnection, coachCOnnection);
  myDM.ActivateDB();
end;

destructor TImportMember.Destroy;
begin
  myDM.DeActivateDB(); // - auto-close on destroy
  FreeAndNil(myDM);    // - auto-free on destory
  inherited;
end;

procedure TImportMember.UpdateMembers(list: TStrings);
begin

end;



{ TscmMember }

constructor TscmMember.Create;
begin
  MemberID := 0;
  FName := '';
end;

destructor TscmMember.Destroy;
begin

  inherited;
end;

end.
