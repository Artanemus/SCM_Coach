unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.PlatformDefaultStyleActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.ActnMan, Vcl.PlatformVclStylesActnCtrls,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls;

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
    Programs_New: TAction;
    Tools_Pools: TAction;
    Tools_Dictionary: TAction;
    Tools_Drills: TAction;
    Tools_Intensity: TAction;
    Tools_PoolEquipment: TAction;
    Tools_Distance: TAction;
    Tools_Strokes: TAction;
    Programs_Edit: TAction;
    Programs_Delete: TAction;
    Programs_Clone: TAction;
    Tools_StopWatches: TAction;
    Tools_Timed: TAction;
    Reports_Session: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    ListView1: TListView;
    btnNewSession: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    TabSheet2: TTabSheet;
    RelativePanel1: TRelativePanel;
    Splitter1: TSplitter;
    Memo2: TMemo;
    RichEdit1: TRichEdit;
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
