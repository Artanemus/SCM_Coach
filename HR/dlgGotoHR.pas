unit dlgGotoHR;

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
  TGotoHR = class(TForm)
    Panel1: TPanel;
    btnGoto: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    lblErrMsg: TLabel;
    Edit1: TEdit;
    ImageCollection1: TImageCollection;
    VirtualImage1: TVirtualImage;
    FDTestConnection: TFDConnection;
    procedure FormCreate(Sender: TObject);
    procedure btnGotoClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fHRID: integer;
    fHRTypeStr: string;
    MyConnection: TFDConnection;
    function AssertHRID(AHRID: integer): boolean;
  public
    { Public declarations }
    procedure Prepare(AConnection: TFDConnection; AHRTypeID: integer);
    property HRID: integer read fHRID write fHRID;
  end;

var
  GotoHR: TGotoHR;

implementation

{$R *.dfm}

uses unitUtility;

function TGotoHR.AssertHRID(AHRID: integer): boolean;
var
  v: variant;
  i: integer;
begin
  result := false;
  if Assigned(MyConnection) then
  begin
    v := MyConnection.ExecSQLScalar
      ('SELECT HRID FROM [SCM_Coach].[dbo].[HR] WHERE HRID = :id', [AHRID]);
    i := CnvVarToInt(v);
    if (i <> 0) then
      result := true;
  end;
end;

procedure TGotoHR.btnCancelClick(Sender: TObject);
begin
  fHRID := 0;
  ModalResult := mrCancel;
end;

procedure TGotoHR.btnGotoClick(Sender: TObject);
begin
  if (fHRID = 0) then
  begin
    Beep;
    if (Length(fHRTypeStr) > 0) then
      lblErrMsg.Caption := 'The ' + fHRTypeStr + '''s ID doesn''t exist.'
    else
      lblErrMsg.Caption := 'HR''s ID invalid.';
    exit;
  end;
  // Assert state of local-fMemberID
  if AssertHRID(fHRID) then
    ModalResult := mrOk;
end;

procedure TGotoHR.Edit1Change(Sender: TObject);
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
  if AssertHRID(i) then
  begin
    fHRID := i;
    if (Length(fHRTypeStr) > 0) then
      lblErrMsg.Caption := 'The ' + fHRTypeStr + '''s ID ..OK'
    else
      lblErrMsg.Caption := 'HR''s ID ..OK';
    exit;
  end
  else
  begin
    lblErrMsg.Caption := '...?';
    exit;
  end;
end;

procedure TGotoHR.FormCreate(Sender: TObject);
begin
  fHRID := 0;
  fHRTypeStr := '';
  lblErrMsg.Caption := '';
  Edit1.Text := '';
  MyConnection := nil;
end;

procedure TGotoHR.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    btnGotoClick(self)
  else
  begin
    if (Key = VK_ESCAPE) then
      btnCancelClick(self);
  end;
end;

procedure TGotoHR.FormShow(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TGotoHR.Prepare(AConnection: TFDConnection; AHRTypeID: integer);
var
  SQL: string;
begin
  if Assigned(AConnection) and AConnection.Connected then
  begin
    MyConnection := AConnection;
    // Get string for captions
    SQL := 'SELECT Caption FROM [SCM_Coach].[dbo].[HRType] WHERE HRTypeID = :id';
    // returns variant
    fHRTypeStr := MyConnection.ExecSQLScalar(SQL, [AHRTypeID]);
    // assign captions else leave as designed
    if (Length(fHRTypeStr) > 0) then
    begin
      Label1.Caption := 'Enter ' + fHRTypeStr + '''s ID';
      // eg. Enter swimmer's ID
      btnGoto.Caption := 'Goto ' + fHRTypeStr + '''s ID';
      Self.Caption := 'Goto ' + fHRTypeStr + '''s ID';
    end;
  end;
end;

end.
