unit frmSquadT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.VirtualImage, Vcl.StdCtrls,
  Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  TSquadT = class(TForm)
    lbSrc: TListBox;
    lbDest: TListBox;
    UICollection: TImageCollection;
    imgArrowRight: TVirtualImage;
    imgArrowRightDbl: TVirtualImage;
    imgArrowLeft: TVirtualImage;
    imgArrowLeftDbl: TVirtualImage;
    ListBox1: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label13: TLabel;
    UICollectionEx: TImageCollection;
    VirtualImage1: TVirtualImage;
    VirtualImage2: TVirtualImage;
    VirtualImage3: TVirtualImage;
    VirtualImage4: TVirtualImage;
    VirtualImage5: TVirtualImage;
    VirtualImage6: TVirtualImage;
    VirtualImage7: TVirtualImage;
    VirtualImage8: TVirtualImage;
    VirtualImage9: TVirtualImage;
    VirtualImage10: TVirtualImage;
    VirtualImage11: TVirtualImage;
    VirtualImage12: TVirtualImage;
    Label4: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Prepare();
  end;

var
  SquadT: TSquadT;

implementation

{$R *.dfm}

{ TSquadT }

procedure TSquadT.Prepare;
begin
  // {TODO -oBSA -cGeneral : Prepare Squad Template...}
end;

end.
