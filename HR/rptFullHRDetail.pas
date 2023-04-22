unit rptFullHRDetail;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxExportMail, frxExportXLS,
  frxExportPDF, frxClass, frxExportBaseDialog, frxExportHTML, frxDBSet;

type
  TFullHRDetailRPT = class(TDataModule)
    frxReport1: TfrxReport;
    frxDSReport: TfrxDBDataset;
    frxHTMLExport1: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxMailExport1: TfrxMailExport;
    qryReport: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RunReport(AConnection: TFDConnection; ASwimClubID: integer);

  end;

var
  FullHRDetailRPT: TFullHRDetailRPT;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TMembersDetailRpt }

procedure TFullHRDetailRPT.RunReport(AConnection: TFDConnection; ASwimClubID: integer);
begin
	qryReport.Connection := AConnection;
	qryReport.ParamByName('SWIMCLUBID').AsInteger := aSwimClubID;
	qryReport.Prepare;
	qryReport.Open;
	if qryReport.Active then
		frxReport1.ShowReport();
	qryReport.Close;
end;

end.
