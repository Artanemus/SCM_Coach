unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.PlatformDefaultStyleActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.ActnMan, Vcl.PlatformVclStylesActnCtrls,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TMain = class(TForm)
    ActionManager1: TActionManager;
    File_Exit: TAction;
    File_Swimmers: TAction;
    Session_New: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    Session_Delete: TAction;
    Session_Edit: TAction;
    File_Coaches: TAction;
    Squad_New: TAction;
    Session_Clone: TAction;
    Squad_Edit: TAction;
    Squad_Delete: TAction;
    File_Import: TAction;
    File_Export: TAction;
    Edit_Preferences: TAction;
    ImageCollectionMenu: TImageCollection;
    virtImageListMenu: TVirtualImageList;
    File_Connect: TAction;
    Stats_Swimmer: TAction;
    Stats_Session: TAction;
    Stats_Performance: TAction;
    ListView1: TListView;
    Label1: TLabel;
    Programs_New: TAction;
    btnNewSession: TButton;
    Tools_Pools: TAction;
    procedure FormCreate(Sender: TObject);
    procedure btnNewSessionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

uses frmSessionNew;

procedure TMain.btnNewSessionClick(Sender: TObject);
var
Dlg: TSessionNew;
begin
  Dlg := TSessionNew.Create(Self);
  Dlg.ShowModal;
  Dlg.Free;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  {
    Sort out the menubar font height - so tiny!

    The font of the MenuItemTextNormal element (or any other) in the style
    designer has no effect, this is because the Vcl Style Engine simply
    ignores the font size and name, and just uses the font color defined in
    the vcl style file.

    S O L U T I O N :

    Define and register a new TActionBarStyleEx descendent and override
    the DrawText methods of the TCustomMenuItem and TCustomMenuButton
    classes, using the values of the Screen.MenuFont to draw the menu
  }

  Screen.MenuFont.Name := 'Segoe UI Semibold';
  Screen.MenuFont.Size := 12;
  ActionManager1.Style := PlatformVclStylesStyle;



end;

end.
