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
  public
    { Public declarations }
  end;

var
  SquadData: TSquadData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
