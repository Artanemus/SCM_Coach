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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
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
    fRtnValue := rgrpSelectImport.ItemIndex;
  if rgrpSelectImport.ItemIndex >= 0 then
    ModalResult := mrOk
  else
    ModalResult := mrCancel;
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
