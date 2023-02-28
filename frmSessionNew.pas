unit frmSessionNew;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.WinXPickers, Vcl.DBCtrls;

type
  TSessionNew = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DatePicker1: TDatePicker;
    DBComboBox1: TDBComboBox;
    TimePicker1: TTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    ListView1: TListView;
    Label7: TLabel;
    TimePicker2: TTimePicker;
    Label8: TLabel;
    ListView2: TListView;
    Label9: TLabel;
    ListView3: TListView;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SessionNew: TSessionNew;

implementation

{$R *.dfm}

procedure TSessionNew.FormCreate(Sender: TObject);
begin
  // init
end;

end.
