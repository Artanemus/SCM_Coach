unit dlgSquadNewTemplate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.VirtualImage, Vcl.Mask;

type
  TSquadNewTemplate = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    ColorBox1: TColorBox;
    Label3: TLabel;
    Label4: TLabel;
    VirtualImage1: TVirtualImage;
    Label5: TLabel;
    DBText1: TDBText;
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SquadNewTemplate: TSquadNewTemplate;

implementation

{$R *.dfm}

end.
