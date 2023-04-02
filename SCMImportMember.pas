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

  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create(AOwner: TComponent); override;
    constructor CreateWithConnection(AOwner: TComponent;
      AscmConnection, AcoachConnection: TFDConnection);
  published
    { published declarations }
  end;

implementation

{ TSCMMember }

uses System.SysUtils;

constructor TSCMMember.Create(AOwner: TComponent);
begin
  inherited;

end;

constructor TSCMMember.CreateWithConnection(AOwner: TComponent;
  AscmConnection, AcoachConnection: TFDConnection);
begin
  inherited;
  scmConnection := AscmConnection;
  coachConnection := AcoachConnection;
end;

end.
