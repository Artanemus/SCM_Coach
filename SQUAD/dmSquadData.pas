unit dmSquadData;

interface

uses
  System.SysUtils, System.Classes, dmCoach, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSquadData = class(TDataModule)
    qrySelectPool: TFDQuery;
    dsSelectPool: TDataSource;
  private
    { Private declarations }
    fIsActivated: boolean;
    fConnection: TFDConnection;
    function AssertConnection(): boolean;

  public
    { Public declarations }
    constructor CreateWithConnection(AOwner: TComponent;
      AConnection: TFDConnection);

    procedure MakeActive;

    property IsActivated: boolean read fIsActivated;
  end;

var
  SquadData: TSquadData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TSquadData }

function TSquadData.AssertConnection: boolean;
begin
  result := false;
  if Assigned(fConnection) and fConnection.Connected then
    result := true;
end;

constructor TSquadData.CreateWithConnection(AOwner: TComponent;
  AConnection: TFDConnection);
begin
  inherited Create(AOwner);
  fConnection := AConnection;
  MakeActive;
end;

procedure TSquadData.MakeActive;
begin
  fIsActivated := false;
  if AssertConnection then
  begin
    qrySelectPool.Connection := fConnection;
    // assign PARAM (filters: isswimmer,isactive,isnotarchived,etc)
    qrySelectPool.Prepare;
    qrySelectPool.Open;
    if qrySelectPool.Active then
    begin
      // open other tables ...
      fIsActivated := true;
    end;
  end;
end;

end.
