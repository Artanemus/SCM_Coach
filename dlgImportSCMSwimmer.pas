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
  FireDAC.DApt, FireDAC.Comp.DataSet, dmSCM;

type
  TImportSCMSwimmer = class(TForm)
    myConnection: TFDConnection;
    ListViewA: TListView;
    ListViewB: TListView;
    ImageCollection1: TImageCollection;
    VirtualImage1: TVirtualImage;
    VirtualImage2: TVirtualImage;
    VirtualImage3: TVirtualImage;
    VirtualImage4: TVirtualImage;
    Button1: TButton;
    Button2: TButton;
    qrySCMSwimmer: TFDQuery;
    FDCommand1: TFDCommand;
    edtSearch: TEdit;
    VirtualImage5: TVirtualImage;
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
      // exclude duplicates in SCM_Coach
      count := SCM.scmConnection.ExecSQLScalar
        ('COUNT([SCMMemberID]) FROM HR WHERE HR.SCMMemberID := :ID',
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
