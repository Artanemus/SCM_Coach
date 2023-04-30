unit frmSquadT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.StrUtils, System.Contnrs, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.VirtualImage, Vcl.StdCtrls,
  Vcl.BaseImageCollection, Vcl.ImageCollection, FireDAC.Comp.Client,
  dmSquadData,  SCMMemberObj, dmCoach, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.ControlList, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Vcl.ControlList;

type
  TSquadT = class(TForm)
    lbSrc: TListBox;
    lbDest: TListBox;
    UICollection: TImageCollection;
    imgArrowRight: TVirtualImage;
    imgArrowRightDbl: TVirtualImage;
    imgArrowLeft: TVirtualImage;
    imgArrowLeftDbl: TVirtualImage;
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
    imgSearch: TVirtualImage;
    edtSearch: TEdit;
    listTeam: TControlList;
    lblTeamName: TLabel;
    VirtualImage13: TVirtualImage;
    lblNickName: TLabel;
    ControlListButton1: TControlListButton;
    ControlListButton2: TControlListButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    procedure edtSearchChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure imgArrowRightClick(Sender: TObject);
    procedure imgArrowRightDblClick(Sender: TObject);
    procedure imgArrowLeftClick(Sender: TObject);
    procedure imgArrowLeftDblClick(Sender: TObject);
    procedure lbDestDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbDestDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbSrcDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbSrcDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    { Private declarations }
    scmMemberList: TObjectList;
    function AssertDataModule: boolean;
    function MemberIsAssigned(obj: TObject; lbox: TListBox): boolean;
    procedure BuildListBoxSource;
  procedure TransferItems(SrcListBox, DestListBox: TObject);

  public
    { Public declarations }
  end;

var
  SquadT: TSquadT;

implementation

{$R *.dfm}

{ TSquadT }
function TSquadT.AssertDataModule: boolean;
begin
  result := false;
  if Assigned(SquadData) and SquadData.IsActivated then
    result := true;
end;

procedure TSquadT.BuildListBoxSource;
var
  Count: integer;
  s: string;
  obj: TscmMemberObj;
  j: integer;

begin
  lbSrc.Clear;
  lbDest.Clear;
  scmMemberList.Clear;
  if AssertDataModule then
  begin
    // -------------------------------------------------------------------
    // populate the selection pool
    // -------------------------------------------------------------------
    with SquadData.qrySelectPool do
    begin
      Open;
      if Active then
      Begin
        while not eof do
        begin
          obj := TscmMemberObj.Create;
          obj.ID := FieldByName('MemberID').AsInteger;
          obj.Name := FieldByName('FName').AsString;
          j := scmMemberList.Add(obj);
          s := FieldByName('FName').AsString;
          lbSrc.Items.AddObject(s, scmMemberList.Items[j]);
          next;
        end;
      End;
      Close;
    end;
  end;
end;

procedure TSquadT.edtSearchChange(Sender: TObject);
var
  i: integer;
  obj: TscmMemberObj;
  s: string;
begin
  // Rebuild SOURCE LISTBOX using the objectlist.
  lbSrc.Clear;
  for i := 0 to scmMemberList.Count - 1 do
  begin
    obj := (scmMemberList.Items[i] as TscmMemberObj);
    // Already assigned to right-listbox.
    if MemberIsAssigned(obj, lbDest) then
      continue;
    s := obj.Name;
    // DO ALL
    if (length(edtSearch.Text) = 0) then
      lbSrc.Items.AddObject(s, obj)
    else
    begin
      // FILTER - test for sub-string
      if ContainsText(s, edtSearch.Text) then
        lbSrc.Items.AddObject(s, obj);
    end;
  end;
end;

procedure TSquadT.FormCreate(Sender: TObject);
begin
  // CREATE Obj list
  scmMemberList := TObjectList.Create(true);
  // CREATE using dmCoach.pas - COACH + Activate core tables
  SquadData := TSquadData.CreateWithCOnnection(Self, COACH.coachConnection);
  // After assignment - Assert binding
  BindSourceDB1.DataSet := SquadData.qryTeam;
  if not BindSourceDB1.DataSet.Active then
    BindSourceDB1.DataSet.Active := true;

  // Misc display INIT
  // ----------------------------------
  // select current team template?

end;

procedure TSquadT.FormDestroy(Sender: TObject);
begin
  scmMemberList.Clear;
  SquadData.Free;
end;

procedure TSquadT.imgArrowLeftClick(Sender: TObject);
begin
  TransferItems(lbDest, lbSrc);
end;

procedure TSquadT.imgArrowLeftDblClick(Sender: TObject);
begin
  lbDest.SelectAll;
  TransferItems(lbDest, lbSrc);
end;

procedure TSquadT.imgArrowRightClick(Sender: TObject);
begin
  TransferItems(lbSrc, lbDest);
end;

procedure TSquadT.imgArrowRightDblClick(Sender: TObject);
begin
  lbSrc.SelectAll;
  TransferItems(lbSrc, lbDest);
end;

procedure TSquadT.lbDestDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  TransferItems(Source, Sender);
end;

procedure TSquadT.lbDestDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TListBox;
end;

procedure TSquadT.lbSrcDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  TransferItems(Source, Sender);
end;

procedure TSquadT.lbSrcDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TListBox;
end;

function TSquadT.MemberIsAssigned(obj: TObject; lbox: TListBox): boolean;
var
  i: integer;
begin
  // check if obj is used by to lboxView
  result := false;
  for i := 0 to lbox.Count - 1 do
  begin
    if (obj = lbox.Items.Objects[i]) then
    begin
      result := true;
      break;
    end;
  end;
end;

procedure TSquadT.TransferItems(SrcListBox, DestListBox: TObject);
var
  i: integer;
begin
  with (SrcListBox AS TListBox) do
  begin
    try
      for i := 0 to Items.Count - 1 do
      begin
        if Selected[i] then
          // NOTE: Assigned source object.
          (DestListBox AS TListBox).Items.AddObject(Items[i], Items.Objects[i]);
      end;
    finally
      // NOTE: Source's assigned objects are not freed (in use).
      DeleteSelected;
    end;
  end;
end;

end.
