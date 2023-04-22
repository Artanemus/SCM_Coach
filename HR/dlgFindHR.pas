unit dlgFindHR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.VirtualImage, Vcl.BaseImageCollection,
  Vcl.ImageCollection, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait;

type
  TFindHR = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Panel2: TPanel;
    btnGotoHR: TButton;
    DBGrid1: TDBGrid;
    ImageCollection1: TImageCollection;
    VirtualImage1: TVirtualImage;
    lblFound: TLabel;
    qryFindHR: TFDQuery;
    dsFindHR: TDataSource;
    FDTestConnection: TFDConnection;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGotoHRClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    fHRID: integer;
    fConnection: TFDConnection;
  public
    { Public declarations }
    procedure Prepare(AConnection: TFDConnection; AHRTypeID: integer);
    property HRID: integer read fHRID write fHRID;
  end;

var
  FindHR: TFindHR;

implementation

{$R *.dfm}

procedure TFindHR.btnGotoHRClick(Sender: TObject);
begin
  if qryFindHR.Active then
  begin
    fHRID := qryFindHR.FieldByName('HRID').AsInteger;
    if (fHRID > 0) then
    begin
      ModalResult := mrOk;
    end;
  end;
end;

procedure TFindHR.DBGrid1DblClick(Sender: TObject);
begin
  btnGotoHRClick(self);
end;

procedure TFindHR.Edit1Change(Sender: TObject);
var
  LocateSuccess: boolean;
  SearchOptions: TLocateOptions;
  HRID: integer;
  fs: string;
begin

  LocateSuccess := false;
  if not qryFindHR.Active then
    exit;

  fs := '';
  qryFindHR.DisableControls();

  // LOCATE AND STORE THE CURRENT HRID
  HRID := qryFindHR.FieldByName('HRID').AsInteger;

  // ---------------------------------
  // HR'S FULLNAME ....
  // ---------------------------------
  if (Length(Edit1.Text) > 0) then
  begin
    fs := fs + '[FName] LIKE ' + QuotedStr('%' + Edit1.Text + '%');
  end;

  if (fs.IsEmpty()) then
    qryFindHR.Filtered := false
  else
  begin
    qryFindHR.Filter := fs;
    if not(qryFindHR.Filtered) then
      qryFindHR.Filtered := true;
  end;

  // DISPLAY NUMBER OF RECORDS FOUND
  qryFindHR.Last();
  lblFound.Caption := 'Found: ' + IntToStr(qryFindHR.RecordCount);
  // RE_LOCATE TO THE HRID
  if (HRID <> 0) then
  begin
    SearchOptions := [];
    try
      begin
        LocateSuccess := qryFindHR.Locate('HRID', HRID, SearchOptions);
      end;
    except
      on E: Exception do
        LocateSuccess := false;
    end;
  end;
  // IF HRID NOT FOUND ... BROWSE TO FIRST RECORD.
  if (LocateSuccess = false) then
    qryFindHR.First();

  qryFindHR.EnableControls();
end;

procedure TFindHR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryFindHR.Close;
end;

procedure TFindHR.FormCreate(Sender: TObject);
begin
  fHRID := 0;
  fConnection := nil;
end;

procedure TFindHR.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    ModalResult := mrCancel;
end;

procedure TFindHR.Prepare(AConnection: TFDConnection; AHRTypeID: integer);
var
  s, SQL: string;
begin
  if Assigned(AConnection) then
  begin
    fConnection := AConnection;
    qryFindHR.Connection := AConnection;
    qryFindHR.ParamByName('HRTypeID').AsInteger := AHRTypeID;
    qryFindHR.Open;
    // Modify caption on button
    SQL := 'SELECT Caption FROM [SCM_Coach].[dbo].[HRType] WHERE HRTypeID = :id';
    s := fConnection.ExecSQLScalar(SQL, [AHRTypeID]); // returns variant
    if (Length(s) > 0) then
      btnGotoHR.Caption := 'Goto ' + s;
  end;
  if qryFindHR.Active then
  begin
    // A s s i g n m e n t   r e q u i r e d  !
    DBGrid1.DataSource := dsFindHR;
    // Results in Edit1Change event!   (Sets up filters and record count.)
    Edit1.Text := '';
  end;
end;

end.
