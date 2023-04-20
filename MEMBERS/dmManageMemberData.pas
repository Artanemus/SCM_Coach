unit dmManageMemberData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef;

type
  TManageMemberData = class(TDataModule)
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
    qryFindHR: TFDQuery;
    qryFindHRMemberID: TFDAutoIncField;
    qryFindHRMembershipNum: TIntegerField;
    qryFindHRFName: TWideStringField;
    qryFindHRdtDOB: TWideStringField;
    qryFindHRAge: TIntegerField;
    qryFindHRIsActive: TBooleanField;
    qryFindHRcGender: TWideStringField;
    qryFindHRcMembershipType: TWideStringField;
    qryFindHRFirstName: TWideStringField;
    qryFindHRLastName: TWideStringField;
    qryFindHRGenderID: TIntegerField;
    qryFindHRMemberShipTypeID: TIntegerField;
    qryFindHRIsSwimmer: TBooleanField;
    dsFindMember: TDataSource;
    qAssertMemberID: TFDQuery;
    qryEntrantDataCount: TFDQuery;
    cmdFixNullBooleans: TFDCommand;
    dsHRPB: TDataSource;
    qryHRPB: TFDQuery;
    FDTempDesignConnection: TFDConnection;
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
    procedure UpdateMembersPersonalBest;

  public
    { Public declarations }
    constructor CreateWithConnection(AOwner: TComponent;
      AscmConnection: TFDConnection);
    procedure ActivateTable();
    procedure UpdateDOB(DOB: TDateTime);
    procedure UpdateHR(hideArchived, hideInactive, hideNonSwimmer: boolean);
    procedure FixNullBooleans();
    function LocateHR(MemberID: Integer): boolean;

    // FLAG - true if all core FireDAC tables, queries are active.
    property CoreTablesActivated: boolean read fCoreTablesActivated;
    property RecordCount: Integer read fRecordCount;

  end;

const
  COACHMEMBERPREF = 'COACH_MemberPref.ini';

var
  ManageMemberData: TManageMemberData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

uses
  System.IOUtils, IniFiles, SCMUtility, SCMDefines, Winapi.Windows,
  Winapi.Messages, vcl.Dialogs, System.UITypes, vcl.Forms;

procedure TManageMemberData.ActivateTable;
begin
  fCoreTablesActivated := false;
  if Assigned(FcoachConnection) and FcoachConnection.Connected then
  begin

    qryHR.Connection := FcoachConnection;
    qryContactNum.Connection := FcoachConnection;
    qryHRPB.Connection := FcoachConnection;

    // prepare lookup tables.
    tblStroke.Connection := FcoachConnection;
    tblStroke.Open;
    tblDistance.Connection := FcoachConnection;
    tblDistance.Open;
    tblHRType.Connection := FcoachConnection;
    tblHRType.Open;
    tblGender.Connection := FcoachConnection;
    tblGender.Open;
    tblContactNumType.Connection := FcoachConnection;
    tblContactNumType.Open;

    // Lookup tables used by member
    // tblMemberType.Open;
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

constructor TManageMemberData.CreateWithConnection(AOwner: TComponent;
  AscmConnection: TFDConnection);
begin
  inherited Create(AOwner);
  FcoachConnection := AscmConnection;
end;

procedure TManageMemberData.DataModuleCreate(Sender: TObject);
begin
  // TODO:
  if Assigned(FcoachConnection) then
    ActivateTable;
end;

procedure TManageMemberData.FixNullBooleans;
begin
  if Assigned(FcoachConnection) then
  begin
    cmdFixNullBooleans.Connection := FcoachConnection;
    if FcoachConnection.Connected then
      cmdFixNullBooleans.Execute();
  end;
end;

function TManageMemberData.LocateHR(MemberID: Integer): boolean;
var
  SearchOptions: TLocateOptions;
begin
  result := false;
  SearchOptions := [loPartialKey];
  try
    begin
      result := qryHR.Locate('MemberID', MemberID, SearchOptions);
    end
  except
    on E: Exception do
      // lblErrMsg.Caption := 'SCM DB access error.';
  end;
end;

procedure TManageMemberData.qryHRAfterDelete(DataSet: TDataSet);
begin
  // Refresh display ?
end;

procedure TManageMemberData.qryHRAfterInsert(DataSet: TDataSet);
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
  fld := DataSet.FieldByName('MemberTypeID');
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

procedure TManageMemberData.qryHRAfterScroll(DataSet: TDataSet);
begin
  // Display Members Personal Best
  UpdateMembersPersonalBest();
  // Post directly to parent form : TForm(Self.GetOwner).Handle;
  // Uses : Vcl.Forms
  if Owner is TForm then
    PostMessage(TForm(Owner).Handle, SCM_AFTERSCROLL, 0, 0);
end;

procedure TManageMemberData.qryHRBeforeDelete(DataSet: TDataSet);
var
  SQL: string;
  MemberID, result: Integer;
begin
  // Best to finalize any editing - prior to calling execute statements.
  DataSet.CheckBrowseMode;
  MemberID := DataSet.FieldByName('MemberID').AsInteger;
  if MemberID <> 0 then
  begin
    // second chance to abort delete - but only displayed if there is entrant data with race-times
    // Alternative - SCMConnection.ExecScalar(SQL, [MemberID]).
    qryEntrantDataCount.Connection := FcoachConnection;
    // FYI - assignment of connection typically sets DS state to closed.
    qryEntrantDataCount.Close;
    qryEntrantDataCount.ParamByName('MEMBERID').AsInteger := MemberID;
    qryEntrantDataCount.Prepare;
    qryEntrantDataCount.Open;
    if qryEntrantDataCount.Active then
    begin
      if qryEntrantDataCount.FieldByName('TOT').AsInteger > 0 then
      begin
        result := MessageDlg('This member has race-time data!' + sLineBreak +
          'Are you sure you want to delete the member?',
          TMsgDlgType.mtConfirmation, [mbYes, mbNo], 0, mbNo);
        if IsNegativeResult(result) then
        begin
          qryEntrantDataCount.Close; // tidy up...?
          Abort;
        end;
      end;
      qryEntrantDataCount.Close;
    end;
    qryHR.DisableControls; // will it stop refresh of contact table?
    // remove all the relationships in associated tables for this member
    SQL := 'DELETE FROM [SwimClubMeet].[dbo].[ContactNum] WHERE MemberID = ' +
      IntToStr(MemberID) + ';';
    FcoachConnection.ExecSQL(SQL);
    { TODO -oBen -cGeneral : db.Split and dbo.TeamSplit need to be handled prior to cleaning dbo.Entrant. }
    SQL := 'UPDATE [SwimClubMeet].[dbo].[Entrant] SET [MemberID] = NULL, ' +
      '[RaceTime] = NULL, [TimeToBeat] = NULL, [PersonalBest] = NULL, ' +
      '[IsDisqualified] = 0,[IsScratched] = 0 WHERE MemberID = ' +
      IntToStr(MemberID) + ';';
    FcoachConnection.ExecSQL(SQL);
    { TODO -oBen -cGeneral : TeamEntrant table design incomplete. Additional fields needed. }
    SQL := 'UPDATE [SwimClubMeet].[dbo].[TeamEntrant] SET [MemberID] = NULL,  [RaceTime] = NULL WHERE MemberID = '
      + IntToStr(MemberID) + ';';
    FcoachConnection.ExecSQL(SQL);
    { TODO -oBen -cGeneral : DELETE from TeamNominee - remove all member's nominations to relay events. }
    SQL := 'DELETE FROM [SwimClubMeet].[dbo].[Nominee] WHERE MemberID = ' +
      IntToStr(MemberID) + ';';
    FcoachConnection.ExecSQL(SQL);

    { TODO -oBen -cGeneral : Remove link }
    (*
      SQL := 'DELETE FROM [SwimClubMeet].[dbo].[lnkSwimClubMember] WHERE MemberID = '
      + IntToStr(MemberID) + ' AND SwimClubID = ' +
      IntToStr(qrySwimClub.FieldByName('SwimClubID').AsInteger) + ';';
      FConnection.ExecSQL(SQL);
    *)

    qryHR.EnableControls;
  end;
end;

procedure TManageMemberData.UpdateDOB(DOB: TDateTime);
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

procedure TManageMemberData.UpdateHR(hideArchived, hideInactive, hideNonSwimmer: boolean);
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

procedure TManageMemberData.UpdateMembersPersonalBest;
begin
  if not Assigned(FcoachConnection) then
    exit;
  if not dsHR.DataSet.Active then
    exit;
  // to improve loading performance of the Member's Dialogue
  // the 'personal bests' for a member are loaded on demand.
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
