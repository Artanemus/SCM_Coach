unit dlgPreferences;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, dmCoach,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtDlgs;

type
  TPreferences = class(TForm)
    Panel1: TPanel;
    btnClose: TButton;
    qrySCMCoach: TFDQuery;
    dsSCMCoach: TDataSource;
    DBBusinessName: TDBLabeledEdit;
    DBNickName: TDBLabeledEdit;
    DBEmail: TDBLabeledEdit;
    DBContactNum: TDBLabeledEdit;
    DBWesite: TDBLabeledEdit;
    LogoImage: TImage;
    Label1: TLabel;
    btnLoadHouseLogo: TButton;
    Label7: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    qrySCMCoachSCMCoachID: TFDAutoIncField;
    qrySCMCoachBusinessName: TWideStringField;
    qrySCMCoachNickName: TWideStringField;
    qrySCMCoachCaption: TWideStringField;
    qrySCMCoachEmail: TWideStringField;
    qrySCMCoachContactNum: TWideStringField;
    qrySCMCoachWebSite: TWideStringField;
    qrySCMCoachCreatedOn: TSQLTimeStampField;
    qrySCMCoachArchivedOn: TSQLTimeStampField;
    qrySCMCoachLogoDir: TMemoField;
    qrySCMCoachLogoImg: TBlobField;
    qrySCMCoachLogoType: TWideStringField;
    qrySCMCoachDictionaryState: TIntegerField;
    qrySCMCoachdefSessionDir: TWideMemoField;
    qrySCMCoachdefProgramDir: TWideMemoField;
    qrySCMCoachdefExportDir: TWideMemoField;
    qrySCMCoachdefImportDir: TWideMemoField;
    procedure btnCloseClick(Sender: TObject);
    procedure btnLoadHouseLogoClick(Sender: TObject);
    procedure qrySCMCoachAfterScroll(DataSet: TDataSet);
    procedure qrySCMCoachLogoDirGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    fConnection: TFDCOnnection;
    procedure AssignHouseLogo(DataSet: TDataSet);

  public
    constructor CreateWithConnection(AOwner: TComponent;
      AConnection: TFDCOnnection);
    { Public declarations }
  end;

var
  Preferences: TPreferences;

implementation

{$R *.dfm}

uses Imaging.jpeg, Imaging.pngimage;

constructor TPreferences.CreateWithConnection(AOwner: TComponent;
  AConnection: TFDCOnnection);
begin
  inherited Create(AOwner);
  qrySCMCoach.Connection := AConnection;
  fConnection := AConnection;
  qrySCMCoach.Open;
  if not qrySCMCoach.Active then
    abort
  else
    fConnection := AConnection;
end;

procedure TPreferences.qrySCMCoachAfterScroll(DataSet: TDataSet);
begin
  // Display house logo and color in the UI.
  AssignHouseLogo(DataSet);
end;

procedure TPreferences.qrySCMCoachLogoDirGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  // DisplayText is true if the field's value is to be used for display only;
  // false if the string is to be used for editing the field's value.
  // if (DisplayText) then
  // Text := Sender.AsString
  // else
  Text := Sender.AsString;
end;

procedure TPreferences.AssignHouseLogo(DataSet: TDataSet);
var
  Stream: TStream;
  aJpgImage: TJPEGImage;
  aPngImage: TPngImage;
  fn, s: String;
begin
  if not(DataSet.FieldByName('LogoDir').IsNull) then
  begin
    // INITIALIZE
    Stream := nil;
    aJpgImage := nil;
    aPngImage := nil;

    fn := DataSet.FieldByName('LogoDir').AsString;

    if not(fn.IsEmpty()) then
    begin
      s := ExtractFileExt(fn);
      s := LowerCase(s);
      if ((s = '.jpg') or (s = '.jpeg')) then
      begin
        try
          begin
            aJpgImage := TJPEGImage.Create;
            Stream := DataSet.CreateBlobStream
              (DataSet.FieldByName('LogoImg'), bmRead);
            // Stream.Position :=0;
            Stream.Seek(0, 0);
            aJpgImage.LoadFromStream(Stream);
            LogoImage.Picture.Assign(aJpgImage);
          end;
        finally
          begin
            aJpgImage.free;
            Stream.free;
          end;
        end;
      end
      else if (s = '.png') then
      begin
        try
          begin
            aPngImage := TPngImage.Create;
            Stream := DataSet.CreateBlobStream
              (DataSet.FieldByName('LogoImg'), bmRead);
            // Stream.Position :=0;
            Stream.Seek(0, 0);
            aPngImage.LoadFromStream(Stream);
            LogoImage.Picture.Assign(aPngImage);
          end;
        finally
          begin
            aPngImage.free;
            Stream.free;
          end;
        end;
      end
      else if (s = '.bmp') then
      begin
        try
          begin
            Stream := DataSet.CreateBlobStream
              (DataSet.FieldByName('LogoImg'), bmRead);
            // Stream.Position :=0;
            Stream.Seek(0, 0);
            // works because Bitmap type is registered with TImage
            LogoImage.Picture.Graphic.LoadFromStream(Stream);
          end;
        finally
          begin
            Stream.free;
          end;
        end;
      end
      else
      begin
        //
        LogoImage.Picture.Assign(nil);
      end;
    end;
  end;

end;

procedure TPreferences.btnCloseClick(Sender: TObject);
begin
  qrySCMCoach.CheckBrowseMode;
  modalresult := mrok;
end;

procedure TPreferences.btnLoadHouseLogoClick(Sender: TObject);
begin
  if Assigned(fConnection) then
  begin
    if (qrySCMCoach.Active) then
    begin
      // Execute an open picture dialog.
      if (OpenPictureDialog1.Execute()) then
      begin
        // First check if the file exists.
        if (FileExists(OpenPictureDialog1.FileName)) then
        begin
          qrySCMCoach.Edit;
          // the filename is used to identify the graphic type.
          qrySCMCoach.FieldByName('LogoDir').AsString :=
            OpenPictureDialog1.FileName;
          (qrySCMCoach.FieldByName('LogoImg') as TBlobField)
            .LoadFromFile(OpenPictureDialog1.FileName);
          qrySCMCoach.Post;
          // Display the new logo into the UI
          AssignHouseLogo(qrySCMCoach);
        end
        else
        begin
          // Otherwise, raise an exception.
          raise Exception.Create('File does not exist.')
            at@TPreferences.btnLoadHouseLogoClick;
        end;
      end;
    end
    else
      Beep;
  end;
end;

end.
