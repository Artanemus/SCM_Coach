unit dlgImportSCMSwimmer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  Vcl.StdCtrls, Vcl.VirtualImage, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.ComCtrls, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, dmSCM, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.WinXCtrls, Vcl.ExtCtrls;

type
  TImportSCMSwimmer = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    VirtualImage1: TVirtualImage;
    VirtualImage2: TVirtualImage;
    VirtualImage3: TVirtualImage;
    VirtualImage4: TVirtualImage;
    VirtualImage5: TVirtualImage;
    ListViewA: TListView;
    ListViewB: TListView;
    edtSearch: TEdit;
    myConnection: TFDConnection;
    ImageCollection1: TImageCollection;
    qrySCMSwimmer: TFDQuery;
    qrySCMSwimmerFNAME: TWideStringField;
    qrySCMSwimmerMemberID: TFDAutoIncField;
    qrySCMSwimmerFirstName: TWideStringField;
    qrySCMSwimmerLastName: TWideStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblLoginErrMsg: TLabel;
    chkOsAuthent: TCheckBox;
    edtPassword: TEdit;
    edtServer: TEdit;
    edtUser: TEdit;
    RelativePanel1: TRelativePanel;
    btnPrev: TButton;
    VirtualImageList1: TVirtualImageList;
    btnNext: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Button3: TButton;
    Label4: TLabel;
    btnCancel: TButton;
    Label5: TLabel;
    btnFirst: TButton;
    btnLast: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    lblMsg: TLabel;
    Button1: TButton;
    Button2: TButton;
    btnAbort: TButton;
    btnConnect: TButton;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    RadioGroup1: TRadioGroup;
    Label9: TLabel;
    Shape4: TShape;
    Label10: TLabel;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListViewADragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListViewADragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImportSCMSwimmer: TImportSCMSwimmer;

implementation

{$R *.dfm}

uses dlgBasicLoginSCM;

// DON'T CALL HERE IF SCM NOT ISACTIVE
procedure TImportSCMSwimmer.FormCreate(Sender: TObject);
var
  aBasicLogin: TBasicLoginSCM; // Generic
  result: TModalResult;
begin
  // a connection to the SwimClubMeet database must be established.

  aBasicLogin := TBasicLoginSCM.Create(self);
  aBasicLogin.AConnection := myConnection;
  result := aBasicLogin.ShowModal;
  aBasicLogin.Free;

  // user has aborted .
  if (result = mrAbort) or (result = mrCancel) then
  begin
    if not myConnection.Connected then
      myConnection.Close;
    Application.Terminate;
    exit;
  end;

end;

procedure TImportSCMSwimmer.FormShow(Sender: TObject);
var
  li: TListItem;
  idx, count: integer;
begin
  // Gather ALL swimmers in SwimClubMeet
  qrySCMSwimmer.Connection := myConnection;
  qrySCMSwimmer.Open;
  if qrySCMSwimmer.Active then
  Begin
    while not qrySCMSwimmer.eof do
    begin
      // exclude from list swimmers who are already in the SCM_Coach
      count := SCM.scmConnection.ExecSQLScalar
        ('SELECT COUNT(SCMMemberID) FROM HR WHERE HR.SCMMemberID = :ID',
        [qrySCMSwimmer.FieldByName('MemberID').AsInteger]);
      if (count = 0) then
      begin
        // add to list
        li := ListViewA.Items.Add;
        li.Caption := qrySCMSwimmer.FieldByName('FName').AsString;
      end;
      qrySCMSwimmer.next;
    end;
  End;
  qrySCMSwimmer.Close;

  // Alpha Sort
  ListViewA.SortType := stText;

end;

procedure TImportSCMSwimmer.ListViewADragDrop(Sender, Source: TObject; X,
  Y: Integer);
  var
i: TListItem;
begin
  if (sender is TListView) and (Source is TListItems) then
  begin
    for i in TListItems(Source) do
      ListViewA.Items.AddItem(i);
  end;
end;

procedure TImportSCMSwimmer.ListViewADragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TListView;
end;

end.
