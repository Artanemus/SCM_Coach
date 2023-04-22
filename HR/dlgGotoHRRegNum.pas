unit dlgGotoHRRegNum;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.VirtualImage, Vcl.BaseImageCollection, Vcl.ImageCollection,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait;

type
  TGotoHRRegNum = class(TForm)
    Panel1: TPanel;
    btnGoto: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    lblErrMsg: TLabel;
    Edit1: TEdit;
    VirtualImage1: TVirtualImage;
    ImageCollection1: TImageCollection;
    qAssertMemberID: TFDQuery;
    FDTestConnection: TFDConnection;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnGotoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    fHRID: integer;
    fRegisterNum: integer;
    fHRTypeID: integer;
    fHRTypeStr: string;
    fConnection: TFDConnection;
    function AssertRegisterNum(ARegisterNum: integer): boolean;

  public
    { Public declarations }
    procedure Prepare(AConnection: TFDConnection;
  AHRTypeID: integer);
    property HRID: integer read fHRID write fHRID;
    property HRTypeID: integer read fHRTypeID write fHRTypeID;
    property RegisterNum: integer read fRegisterNum write fRegisterNum;
    property Connection: TFDConnection read fConnection write fConnection;
  end;

var
  GotoHRRegNum: TGotoHRRegNum;

implementation

{$R *.dfm}

uses unitUtility;

function TGotoHRRegNum.AssertRegisterNum(ARegisterNum: integer): boolean;
var
  v: variant;
  i: integer;
begin
  result := false;
  if Assigned(fConnection) then
  begin
    v := fConnection.ExecSQLScalar
      ('SELECT HRID FROM [SCM_Coach].[dbo].[HR] WHERE RegisterNum = :id',
      [ARegisterNum]);
    i := CnvVarToInt(v);
    if (i <> 0) then
      result := true;
  end;
end;

procedure TGotoHRRegNum.btnGotoClick(Sender: TObject);
begin
  if (fRegisterNum = 0) then
  begin
    Beep;
    lblErrMsg.Caption := 'Registration number is invalid.';
    exit;
  end;
  // check if valid membership number
  if AssertRegisterNum(fRegisterNum) then
    ModalResult := mrOk;
end;

procedure TGotoHRRegNum.Edit1Change(Sender: TObject);
var
  i: integer;
begin
  fHRID := 0;
  if (Length(Edit1.Text) = 0) then
  begin
    lblErrMsg.Caption := '';
    exit;
  end;
  i := StrToIntDef(Edit1.Text, 0);
  if (i = 0) then
  begin
    lblErrMsg.Caption := '';
    exit;
  end;
  if AssertRegisterNum(i) then
    lblErrMsg.Caption := 'Registration number ..OK.'
  else
    lblErrMsg.Caption := '...?';
end;

procedure TGotoHRRegNum.FormCreate(Sender: TObject);
begin
  fHRID := 0;
  fRegisterNum := 0;
  fHRTypeID := 0;
  fHRTypeStr := '';
  lblErrMsg.Caption := '';
  Edit1.Text := '';
end;

procedure TGotoHRRegNum.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    btnGotoClick(self)
  else
  begin
    if (Key = VK_ESCAPE) then
    begin
      fHRID := 0;
      fRegisterNum := 0;
      ModalResult := mrCancel;
    end;
  end;
end;

procedure TGotoHRRegNum.FormShow(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TGotoHRRegNum.Prepare(AConnection: TFDConnection;
  AHRTypeID: integer);
var
  SQL: string;
begin
  if Assigned(AConnection) then
  begin
    fConnection := AConnection;
    fHRTypeID := AHRTypeID;
    fHRTypeStr := '';
    // Get string for captions
    SQL := 'SELECT Caption FROM [SCM_Coach].[dbo].[HRType] WHERE HRTypeID = :id';
    // returns variant
    fHRTypeStr := fConnection.ExecSQLScalar(SQL, [AHRTypeID]);
  end;
end;

end.
