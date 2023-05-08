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
    qryHRPBHRID: TFDAutoIncField;
    qryHRPBDistanceID: TFDAutoIncField;
    qryHRPBStrokeID: TFDAutoIncField;
    qryHRPBPB: TTimeField;
    qryHRPBEventStr: TWideStringField;
    procedure qryHRAfterScroll(DataSet: TDataSet);
    procedure qryHRAfterInsert(DataSet: TDataSet);
    procedure qryHRBeforeDelete(DataSet: TDataSet);
    procedure qryHRAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
    fIsActivated: boolean;
    fRecordCount: Integer;
    fConnection: TFDConnection;
    procedure UpdateHRPersonalBest;
    function AssertConnection: boolean;

  public
    { Public declarations }
    constructor CreateWithConnection(AOwner: TComponent;
      AConnection: TFDConnection);
    procedure ActivateDM();

    procedure UpdateHR(hideArchived, hideInActive: boolean);
    procedure UpdateDOB(DOB: TDateTime);
    procedure UpdateHideAchived(DoFilter: boolean);
    procedure UpdateHideInActive(DoFilter: boolean);
    procedure FixNullBooleans;

    function LocateHR(HRID: Integer): boolean;

    // FLAG - true if all core FireDAC tables, queries are active.
    property IsActivated: boolean read fIsActivated;
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

procedure THRData.ActivateDM;
begin
  fIsActivated := false;
  if AssertConnection then
  begin
    // main
    qryHR.Connection := fConnection;

    // prepare lookup tables.
    tblContactNumType.Connection := fConnection;
    tblContactNumType.Open;
    tblStroke.Connection := fConnection;
    tblStroke.Open;
    tblDistance.Connection := fConnection;
    tblDistance.Open;
    tblHRType.Connection := fConnection;
    tblHRType.Open;
    tblGender.Connection := fConnection;
    tblGender.Open;

    // support queries
    qryContactNum.Connection := fConnection;
    qryHRPB.Connection := fConnection;
    // default - display all records
    qryHR.ParamByName('HIDE_ARCHIVED').AsBoolean := false;
    qryHR.ParamByName('HIDE_INACTIVE').AsBoolean := false;
    qryHR.Prepare;
    qryHR.Open;
    if qryHR.Active then
    begin
      // Lookup table used by contactnum
      qryContactNum.Open;
      if qryContactNum.Active then
      begin
        fIsActivated := True;
      end;
    end;
  end;
end;

function THRData.AssertConnection: boolean;
begin
  result := false;
  if Assigned(fConnection) and fConnection.Connected then
    result := true;
end;

constructor THRData.CreateWithConnection(AOwner: TComponent;
      AConnection: TFDConnection);
begin
  inherited Create(AOwner);
  fConnection := AConnection;
  ActivateDM;
end;

procedure THRData.FixNullBooleans;
begin
  if AssertConnection then
  begin
    cmdFixNullBooleans.Connection := fConnection;
    if fConnection.Connected then
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
    { TODO -oBSA -cGeneral : remove all the relationships in associated tables for this HR }
    { TODO -oBSA -cGeneral : remove HR }
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
  if AssertConnection then
  begin
    qryHR.DisableControls;
    qryHR.Edit;
    qryHR.FieldByName('DOB').AsDateTime := DOB;
    qryHR.Post;
    qryHR.EnableControls;
  end;

end;

procedure THRData.UpdateHideAchived(DoFilter: boolean);
var
  LastInActiveState: boolean;
begin
  if not qryHR.Active then
    LastInActiveState := false
  else
    LastInActiveState := qryHR.ParamByName('HIDE_INACTIVE').AsBoolean;
  UpdateHR(DoFilter, LastInActiveState);
end;

procedure THRData.UpdateHideInActive(DoFilter: boolean);
var
  LastArchivedState: boolean;
begin
  if not qryHR.Active then
    LastArchivedState := false
  else
    LastArchivedState := qryHR.ParamByName('HIDE_ARCHIVED').AsBoolean;
  UpdateHR(LastArchivedState, DoFilter);
end;

procedure THRData.UpdateHR(hideArchived, hideInActive: boolean);
begin
  if not Assigned(fConnection) then
    exit;
  if not qryHR.Active then
    exit;

  qryHR.DisableControls;
  qryHR.Close;
  qryHR.ParamByName('HIDE_ARCHIVED').AsBoolean := hideArchived;
  qryHR.ParamByName('HIDE_INACTIVE').AsBoolean := hideInActive;
  qryHR.Prepare;
  qryHR.Open;
  if qryHR.Active then
  begin
    fRecordCount := qryHR.RecordCount;
    if not Assigned(qryContactNum.Connection) then
      qryContactNum.Connection := fConnection;
    if not qryContactNum.Active then
      qryContactNum.Open;
  end
  else
    fRecordCount := 0;
  qryHR.EnableControls;
  // Post directly to parent form : TForm(Self.GetOwner).Handle; - Vcl.Forms
  if Owner is TForm then
    PostMessage(TForm(Owner).Handle, SCM_UPDATE, 0, 0);

end;

procedure THRData.UpdateHRPersonalBest;
begin
  if not Assigned(fConnection) then
    exit;
  if not dsHR.DataSet.Active then
    exit;
  // to improve loading performance
  // the 'personal bests' for swimmers are loaded on demand.

    qryHRPB.DisableControls;
    qryHRPB.Close();
    qryHRPB.ParamByName('HRID').AsInteger :=
    dsHR.DataSet.FieldByName('HRID').AsInteger;
    // ensures params changes are used
    qryHRPB.Prepare();
    qryHRPB.Open();
    qryHRPB.EnableControls;

end;

end.
