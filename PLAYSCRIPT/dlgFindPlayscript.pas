unit dlgFindPlayscript;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmCoach, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.DBCtrls;

type
  TFindPlayscript = class(TForm)
    qryFindPlayscript: TFDQuery;
    dsFindPlayscript: TDataSource;
    Panel1: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel3: TPanel;
    DBListBox1: TDBListBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    DBComboBox1: TDBComboBox;
    qryPlayscriptGoal: TFDQuery;
    dsPlayscriptGoal: TDataSource;
    DBComboBox2: TDBComboBox;
    qryPlayscriptOutcomes: TFDQuery;
    dsPlayscriptOutcomes: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor CreateWithConnection(AOwner: TComponent;
      AConnection: TFDConnection);
  end;

var
  FindPlayscript: TFindPlayscript;

implementation

{$R *.dfm}
{ TFindPlayscript }

constructor TFindPlayscript.CreateWithConnection(AOwner: TComponent;
  AConnection: TFDConnection);
begin
  inherited Create(AOwner);
  qryFindPlayscript.Connection := AConnection;
  qryPlayscriptGoal.Connection := AConnection;
  qryPlayscriptOutcomes.Connection := AConnection;
  qryPlayscriptGoal.Open;
  qryPlayscriptOutcomes.Open;

  qryFindPlayscript.Open;
  if not qryFindPlayscript.Active then
    abort;
end;

end.
