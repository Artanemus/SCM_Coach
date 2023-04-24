unit dmHRData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  dmCoach, // needn't be aware of DM - uses FcoachConnection assignement
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef;

type
  THRData = class(TDataModule)
    tblContactNumType: TFDTable;
    tblContactNumTypeContactNumTypeID: TFDAutoIncField;
    tblContactNumTypeCaption: TWideStringField;
    tblStroke: TFDTable;
    tblDistance: TFDTable;
    tblHRType: TFDTable;
    dsHRType: TDataSource;
    tblGender: TFDTable;
    dsGender: TDataSource;
    dsContactNum: TDataSource;
    qryContactNum: TFDQuery;
    qryContactNumContactNumID: TFDAutoIncField;
    qryContactNumNumber: TWideStringField;
    qryContactNumContactNumTypeID: TIntegerField;
    qryContactNumlu: TStringField;
    cmdFixNullBooleans: TFDCommand;
    dsHRPB: TDataSource;
    qryHRPB: TFDQuery;
    dsHR: TDataSource;
    qryHR: TFDQuery;
    qryHRHRID: TFDAutoIncField;
    qryHRRegisterNum: TIntegerField;
    qryHRRegisterStr: TWideStringField;
    qryHRFirstName: TStringField;
    qryHRLastName: TStringField;
    qryHRDOB: TSQLTimeStampField;
    qryHRSwimmerAge: TIntegerField;
    qryHRIsActive: TBooleanField;
    qryHRIsArchived: TBooleanField;
    qryHREmail: TWideStringField;
    qryHRGenderID: TIntegerField;
    qryHRHRTypeID: TIntegerField;
    qryHRFName: TStringField;
    qryHRgradeID: TIntegerField;
    qryHRCreatedOn: TSQLTimeStampField;
    qryHRArchivedOn: TSQLTimeStampField;
    qryHRSCMMemberID: TIntegerField;
    qryHRluGender: TStringField;
    qryContactNumHRID: TIntegerField;
    qryHRPBHRID: TIntegerField;
    qryHRPBDistanceID: TIntegerField;
    qryHRPBStrokeID: TIntegerField;
    qryHRPBRaceTime: TTimeField;
    qryHRPBEventStr: TWideStringField;
    qryHRPBRaceHistoryID: TFDAutoIncField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryHRAfterScroll(DataSet: TDataSet);
    procedure qryHRAfterInsert(DataSet: TDataSet);
    procedure qryHRBeforeDelete(DataSet: TDataSet);
    procedure qryHRAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
    fCoreTablesActivated: boolean;
    fRecordCount: Integer;
    FcoachConnection: TFDConnection;
    procedure UpdateHRPersonalBest;

  public
    { Public declarations }
    constructor CreateWithConnection(AOwner: TComponent;
      AscmConnection: TFDConnection);
    procedure ActivateTable();
    procedure UpdateDOB(DOB: TDateTime);
    procedure UpdateHR(hideArchived, hideInactive, hideNonSwimmer: boolean);
    procedure FixNullBooleans();
    function LocateHR(HRID: Integer): boolean;

    // FLAG - true if all core FireDAC tables, queries are active.
    property CoreTablesActivated: boolean read fCoreTablesActivated;
    property RecordCount: Integer read fRecordCount;

  end;

const
  COACHPREF = 'COACH_Pref.ini';

var
  HRData: THRData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

uses
  System.IOUtils, IniFiles, SCMUtility, SCMDefines, Winapi.Windows,
  Winapi.Messages, vcl.Dialogs, System.UITypes, vcl.Forms;

procedure THRData.ActivateTable;
begin
  fCoreTablesActivated := false;
  if Assigned(FcoachConnection) and FcoachConnection.Connected then
  begin
    // main
    qryHR.Connection := FcoachConnection;

    // prepare lookup tables.
    tblContactNumType.Connection := FcoachConnection;
    tblContactNumType.Open;
    tblStroke.Connection := FcoachConnection;
    tblStroke.Open;
    tblDistance.Connection := FcoachConnection;
    tblDistance.Open;
    tblHRType.Connection := FcoachConnection;
    tblHRType.Open;
    tblGender.Connection := FcoachConnection;
    tblGender.Open;

    // support queries
    qryContactNum.Connection := FcoachConnection;
    qryHRPB.Connection := FcoachConnection;

    qryHR.Open;
    if qryHR.Active then
    begin
      // Lookup table used by contactnum
      qryContactNum.Open;
      if qryContactNum.Active then
      begin
        fCoreTablesActivated := True;
      end;
    end;
  end;
end;

constructor THRData.CreateWithConnection(AOwner: TComponent;
  AscmConnection: TFDConnection);
begin
  inherited Create(AOwner);
  FcoachConnection := AscmConnection;
  ActivateTable;
end;

procedure THRData.DataModuleCreate(Sender: TObject);
begin
  // NOTE: Tables are activated by owner (grmHR) after creation.
  // See routine : frmHR.Prepare
end;

procedure THRData.FixNullBooleans;
begin
  if Assigned(FcoachConnection) and FcoachConnection.Connected then
  begin
    cmdFixNullBooleans.Connection := FcoachConnection;
    if FcoachConnection.Connected then
      cmdFixNullBooleans.Execute();
  end;
end;

function THRData.LocateHR(HRID: Integer): boolean;
var
  SearchOptions: TLocateOptions;
begin
  result := false;
  SearchOptions := [loPartialKey];
  try
    begin
      result := qryHR.Locate('HRID', HRID, SearchOptions);
    end
  except
    on E: Exception do
      // lblErrMsg.Caption := 'SCM DB access error.';
  end;
end;

procedure THRData.qryHRAfterDelete(DataSet: TDataSet);
begin
  // Refresh display ?
end;

procedure THRData.qryHRAfterInsert(DataSet: TDataSet);
var
  fld: TField;
begin
  fld := DataSet.FieldByName('IsArchived');
  if (fld.IsNull) then
  begin
    fld.AsBoolean := false;
  end;
  fld := DataSet.FieldByName('IsActive');
  if (fld.IsNull) then
  begin
    fld.AsBoolean := True;
  end;
  fld := DataSet.FieldByName('HRTypeID');
  if (fld.IsNull) then
  begin
    fld.AsInteger := 3;
  end;
  fld := DataSet.FieldByName('CreatedOn');
  if (fld.IsNull) then
  begin
    fld.AsDateTime := Date;
  end;

end;

procedure THRData.qryHRAfterScroll(DataSet: TDataSet);
begin
  // HR Personal Best - requery
  UpdateHRPersonalBest();
  // Post directly to parent form : TForm(Self.GetOwner).Handle;
  // Uses : Vcl.Forms
  if Owner is TForm then
    PostMessage(TForm(Owner).Handle, SCM_AFTERSCROLL, 0, 0);
end;

procedure THRData.qryHRBeforeDelete(DataSet: TDataSet);
var
  SQL: string;
  HRID, result: Integer;
begin
  // Best to finalize any editing - prior to calling execute statements.
  DataSet.CheckBrowseMode;
  // Selected HR in DataSet
  HRID := DataSet.FieldByName('HRID').AsInteger;
  if HRID <> 0 then
  begin
    qryHR.DisableControls;
    {TODO -oBSA -cGeneral : remove all the relationships in associated tables for this HR }
    {TODO -oBSA -cGeneral : remove HR }
    {
    SQL := 'DELETE FROM [SCM_Coach].[dbo].[ContactNum] WHERE HRID = ' +
      IntToStr(HRID) + ';';
    FcoachConnection.ExecSQL(SQL);
    }
    qryHR.EnableControls;
  end;
end;

procedure THRData.UpdateDOB(DOB: TDateTime);
begin
  if Assigned(qryHR.Connection) and (qryHR.Active) then
  begin
    qryHR.DisableControls;
    qryHR.Edit;
    qryHR.FieldByName('DOB').AsDateTime := DOB;
    qryHR.Post;
    qryHR.EnableControls;
  end;

end;

procedure THRData.UpdateHR(hideArchived, hideInactive, hideNonSwimmer: boolean);
begin
  if not Assigned(FcoachConnection) then
    exit;
  if not qryHR.Active then
    exit;

  qryHR.DisableControls;
  qryHR.Close;
  qryHR.ParamByName('HIDE_ARCHIVED').AsBoolean := hideArchived;
  qryHR.ParamByName('HIDE_INACTIVE').AsBoolean := hideInactive;
  qryHR.Prepare;
  qryHR.Open;
  if qryHR.Active then
  begin
    fRecordCount := qryHR.RecordCount;
    if not Assigned(qryContactNum.Connection) then
      qryContactNum.Connection := FcoachConnection;
    if not qryContactNum.Active then
      qryContactNum.Open;
  end
  else
    fRecordCount := 0;
  qryHR.EnableControls;
  // Post directly to parent form : TForm(Self.GetOwner).Handle;
  // Uses : Vcl.Forms
  if Owner is TForm then
    PostMessage(TForm(Owner).Handle, SCM_UPDATE, 0, 0);

end;

procedure THRData.UpdateHRPersonalBest;
begin
  if not Assigned(FcoachConnection) then
    exit;
  if not dsHR.DataSet.Active then
    exit;
  // to improve loading performance
  // the 'personal bests' for swimmers are loaded on demand.
  {
  qryHRPB.DisableControls;
  qryHRPB.Close();
  qryHRPB.ParamByName('HRID').AsInteger :=
    dsHR.DataSet.FieldByName('HRID').AsInteger;
  // ensures params changes are used
  qryHRPB.Prepare();
  qryHRPB.Open();
  qryHRPB.EnableControls;
  }
end;

end.
