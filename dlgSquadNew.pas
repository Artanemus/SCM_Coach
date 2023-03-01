unit dlgSquadNew;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.VirtualImage, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  TSquadNew = class(TForm)
    ListView1: TListView;
    ListView2: TListView;
    Label1: TLabel;
    Label2: TLabel;
    Button5: TButton;
    Button6: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    Button7: TButton;
    Button8: TButton;
    ImageCollectionSquad: TImageCollection;
    VirtImageListBtn: TVirtualImageList;
    VirtualImage1: TVirtualImage;
    VirtualImage2: TVirtualImage;
    VirtualImage3: TVirtualImage;
    VirtualImage4: TVirtualImage;
    VirtualImage5: TVirtualImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SquadNew: TSquadNew;

implementation

{$R *.dfm}

end.
