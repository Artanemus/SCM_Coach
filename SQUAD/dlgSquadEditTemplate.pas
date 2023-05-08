unit dlgSquadEditTemplate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.VirtualImage, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TSquadEditTemplate = class(TForm)
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    ColorBox1: TColorBox;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    DBText1: TDBText;
    Label5: TLabel;
    VirtualImage1: TVirtualImage;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SquadEditTemplate: TSquadEditTemplate;

implementation

{$R *.dfm}

end.
