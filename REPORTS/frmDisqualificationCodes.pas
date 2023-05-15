unit frmDisqualificationCodes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxPreview, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxDBSet,
  frxExportBaseDialog, frxExportPDF, Vcl.ExtCtrls, dmCoach, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    frxPreview1: TfrxPreview;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    qryDisqualifyCode: TFDQuery;
    frxPDFExport1: TfrxPDFExport;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
