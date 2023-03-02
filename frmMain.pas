unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.PlatformDefaultStyleActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.ActnMan, Vcl.PlatformVclStylesActnCtrls,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.VirtualImage;

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
    ImageCollectionCoach: TImageCollection;
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
    TabSheet2: TTabSheet;
    Label2: TLabel;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
    relpnlPrgBuilderToolBar: TRelativePanel;
    RichEdit2: TRichEdit;
    VirtualImage1: TVirtualImage;
    VirtualImage2: TVirtualImage;
    Splitter1: TSplitter;
    virtImageListPrgBuilder: TVirtualImageList;
    VirtualImage3: TVirtualImage;
    Help_About: TAction;
    FlowPanel1: TFlowPanel;
    ListView2: TListView;
    ListView3: TListView;
    ListView4: TListView;
    ListView5: TListView;
    ListView6: TListView;
    VirtualImage4: TVirtualImage;
    VirtualImage5: TVirtualImage;
    VirtualImage6: TVirtualImage;
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
