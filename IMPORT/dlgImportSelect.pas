unit dlgImportSelect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TImportSelect = class(TForm)
    rgrpSelectImport: TRadioGroup;
    btnCancel: TButton;
    btnOk: TButton;
    rbtnSCMServer: TRadioButton;
    rbtnSCMFile: TRadioButton;
    rbtnHyTek: TRadioButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fRtnValue: integer;
  public
    { Public declarations }
    property RtnValue: integer read fRtnValue write fRtnValue;
  end;

var
  ImportSelect: TImportSelect;

implementation

{$R *.dfm}

procedure TImportSelect.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TImportSelect.btnOkClick(Sender: TObject);
begin
  // Note: individual TRadioButtons used ... gives access to 'Enabled'
  fRtnValue := -1;
  if rbtnSCMServer.Checked then
  begin
    fRtnValue := rbtnSCMServer.Tag;
    ModalResult := mrOk
  end
  {TODO -oBSA -cGeneral : Import SCM filetype '.scm'}
  else if rbtnSCMFile.Checked then
  begin
    fRtnValue := rbtnSCMFile.Tag;
    ModalResult := mrOk
  end
  {TODO -oBSA -cGeneral : Import HyTek filetype '.hy3'}
  else if rbtnHyTek.Checked then
  begin
    fRtnValue := rbtnHyTek.Tag;
    ModalResult := mrOk
  end
  else
    ModalResult := mrCancel;
end;

procedure TImportSelect.FormCreate(Sender: TObject);
begin
  // INIT
  fRtnValue := -1;
  rbtnSCMServer.Checked := true;
  rbtnSCMFile.Checked := false;
  rbtnHyTek.Checked := false;
end;

procedure TImportSelect.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
  begin
    ModalResult := mrCancel;
  end;
end;

end.
