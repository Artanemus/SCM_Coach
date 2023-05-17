unit dlgSwimmingPools;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmCoach, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.DBCGrids;

type
  TSwimmingPools = class(TForm)
    Panel1: TPanel;
    btnClose: TButton;
    qryPool: TFDQuery;
    tblPoolType: TFDTable;
    dsPool: TDataSource;
    qryPoolPoolID: TFDAutoIncField;
    qryPoolPoolStr: TWideStringField;
    qryPoolLanes: TStringField;
    qryPoolPoolTypeID: TIntegerField;
    qryPoolluPoolType: TStringField;
    DBNavigator1: TDBNavigator;
    DBCtrlGrid1: TDBCtrlGrid;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    dsPoolType: TDataSource;
    DBComboBox1: TDBComboBox;
    DBCheckBox1: TDBCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor CreateWithConnection(AOwner: TComponent;
      AConnection: TFDConnection);
  end;

var
  SwimmingPools: TSwimmingPools;

implementation

{$R *.dfm}

{ TSwimmingPools }

constructor TSwimmingPools.CreateWithConnection(AOwner: TComponent;
  AConnection: TFDConnection);
begin
  inherited Create(AOwner);
  qryPool.Connection := AConnection;
  tblPoolType.Connection := AConnection;
  tblPoolType.Open;
  qryPool.Open;
  if qryPool.Active then
    ; // ...
end;

end.
