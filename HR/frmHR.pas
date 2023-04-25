unit frmHR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, VclTee.TeeGDIPlus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.ImageList, Vcl.ImgList,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.StdCtrls, VclTee.TeEngine,
  VclTee.TeeSpline, VclTee.Series, VclTee.TeeProcs, VclTee.Chart,
  VclTee.DBChart, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.WinXCalendars, dmHRData, SCMDefines,
  Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.VirtualImage, dmCoach;

type
  THR = class(TForm)
    Panel1: TPanel;
    lblHRCount: TLabel;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel7: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label10: TLabel;
    DBText3: TDBText;
    Label7: TLabel;
    Label12: TLabel;
    DBlblHRID: TDBText;
    Label22: TLabel;
    Label24: TLabel;
    DBlucboGender: TDBLookupComboBox;
    DBedtFirstName: TDBEdit;
    DBedtLastName: TDBEdit;
    DBedtRegisterNum: TDBEdit;
    DBchkIsActive: TDBCheckBox;
    DBEdtEmail: TDBEdit;
    DBchkIsArchived: TDBCheckBox;
    btnClearGender: TButton;
    TabSheet2: TTabSheet;
    DBGrid3: TDBGrid;
    ImageList1: TImageList;
    Label18: TLabel;
    RegistrationNum: TDBEdit;
    Label8: TLabel;
    dtpickDOB: TCalendarPicker;
    lblCount: TLabel;
    DBgridHistoryPB: TDBGrid;
    Label23: TLabel;
    Label13: TLabel;
    DBgridContactInfo: TDBGrid;
    DBContactNumNavigator: TDBNavigator;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label9: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    btnHRDetailRpt: TButton;
    btnClubHRSummaryRpt: TButton;
    btnHRHistoryRpt: TButton;
    btnClubHRDetailedRpt: TButton;
    btnClubHRListRpt: TButton;
    ActnManagerHR: TActionManager;
    MemFile_AutoEdit: TAction;
    MemFile_Exit: TAction;
    Search_GotoRegNum: TAction;
    Search_GotoSwimmerID: TAction;
    Search_FindSwimmer: TAction;
    ImageCollectHR: TImageCollection;
    VirtlImageListHR: TVirtualImageList;
    ActionToolBar1: TActionToolBar;
    Hide_Archived: TAction;
    Hide_InActive: TAction;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure About2Click(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid3ColEnter(Sender: TObject);
    procedure DBGrid3ColExit(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DrawCheckBoxes(oGrid: TObject; Rect: TRect; Column: TColumn;
      fontColor, bgColor: TColor);
    procedure dtpickDOBChange(Sender: TObject);
    procedure chkbHideInActiveClick(Sender: TObject);
    procedure chkbHideNonSwimmersClick(Sender: TObject);
    procedure DBGrid3EditButtonClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure Search_GotoIDExecute(Sender: TObject);
    procedure Search_GotoRegNumExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Onlinehelp1Click(Sender: TObject);
    procedure SCMwebsite1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure btnHRDetailRptClick(Sender: TObject);
    procedure btnHRHistoryRptClick(Sender: TObject);
    procedure btnClubHRSummaryRptClick(Sender: TObject);
    procedure btnClubHRDetailedRptClick(Sender: TObject);
    procedure btnClubHRListRptClick(Sender: TObject);
    procedure MemFile_ExitExecute(Sender: TObject);
    procedure Search_FindSwimmerExecute(Sender: TObject);
    procedure Hide_ArchivedExecute(Sender: TObject);
    procedure Hide_ArchivedUpdate(Sender: TObject);
    procedure Hide_InActiveUpdate(Sender: TObject);
    procedure Hide_InActiveExecute(Sender: TObject);

  private
    { Private declarations }
    fDoDelete: Boolean;
    fColorEditBoxFocused: TColor;
    fColorEditBoxNormal: TColor;
    fColorBgColor: TColor;
    MyConnection: TFDConnection;

    function LocateHR(HRID: Integer): Boolean;
    function AssertSCMConnection: Boolean;

    procedure ReadPreferences();
    procedure WritePreferences();

  protected
    // windows messages ....
    procedure HRAfterScroll(var Msg: TMessage); message SCM_AFTERSCROLL;
    procedure HRDataUpdate(var Msg: TMessage); message SCM_UPDATE;

  public
    { Public declarations }
    procedure Prepare(AHRTypeID, AHRID: Integer);
    procedure ClearAllFilters();

  end;

const
  INIFILE_SCM_COACHPREF = 'SCM_COACHPref.ini';
  INIFILE_SECTION = 'SCM_HR';

var
  HR: THR;

implementation

{$R *.dfm}

uses SCMUtility, dlgBasicLogin, System.IniFiles, System.UITypes, dlgAbout,
  dlgDOBPicker, dlgFindHR, dlgGotoHR, dlgGotoHRRegNum,
  System.IOUtils, Winapi.ShellAPI, dlgDeleteHR, Vcl.Themes, rptHRDetail,
  rptHRHistory, rptFullHRList, rptFullHRDetail, rptFullHRSummary;

procedure THR.About2Click(Sender: TObject);
var
  dlg: TAbout;
begin
  dlg := TAbout.Create(Self);
  dlg.ShowModal;
  FreeAndNil(dlg);
end;

function THR.AssertSCMConnection: Boolean;
begin
  result := false;
  // test datamodule construction
  if Assigned(HRData) then
  begin
    // IsActive if TFDConnection::scmConnection && FireDAC tables are active
    if HRData.CoreTablesActivated then
      result := true;
  end;
end;

procedure THR.btnClearClick(Sender: TObject);
begin
  if Assigned(HRData) and (HRData.qryHR.Active) then
  begin
    if (HRData.qryHR.State <> dsInsert) or (HRData.qryHR.State <> dsEdit) then
      HRData.qryHR.Edit();
    case TButton(Sender).Tag of
      1:
        HRData.qryHR.FieldByName('GenderID').Clear();
      // 2:
      // HRData.qryHR.FieldByName('HRTypeID').Clear();
      // 3:
      // HRData.qryHR.FieldByName('HouseID').Clear();
    end;
  end;
end;

procedure THR.btnClubHRDetailedRptClick(Sender: TObject);
var
  rpt: TFullHRDetailRPT;
begin
  if not Assigned(HRData) then
    exit;
  rpt := TFullHRDetailRPT.Create(Self);
  rpt.RunReport(MyConnection, 1);
  rpt.Free;
end;

procedure THR.btnClubHRListRptClick(Sender: TObject);
var
  rpt: TFullHRListRPT;
begin
  if not Assigned(HRData) then
    exit;
  rpt := TFullHRListRPT.Create(Self);
  rpt.RunReport(MyConnection, Integer(hrSwimmer));
  rpt.Free;
end;

procedure THR.btnClubHRSummaryRptClick(Sender: TObject);
var
  rpt: TFullHRSummaryRPT;
begin
  if not Assigned(HRData) then
    exit;
  rpt := TFullHRSummaryRPT.Create(Self);
  rpt.RunReport(MyConnection, Integer(hrSwimmer));
  rpt.Free;
end;

procedure THR.btnHRDetailRptClick(Sender: TObject);
var
  rpt: THRDetailRPT;
  HRID: Integer;
begin
  if not Assigned(HRData) then
    exit;
  HRID := HRData.dsHR.DataSet.FieldByName('HRID').AsInteger;
  rpt := THRDetailRPT.Create(Self);
  rpt.RunReport(MyConnection, Integer(hrSwimmer), HRID);
  rpt.Free;
end;

procedure THR.btnHRHistoryRptClick(Sender: TObject);
var
  rpt: THRHistoryRPT;
  HRID: Integer;
begin
  if not Assigned(HRData) then
    exit;
  HRID := HRData.dsHR.DataSet.FieldByName('HRID').AsInteger;
  rpt := THRHistoryRPT.Create(Self);
  rpt.RunReport(MyConnection, Integer(hrSwimmer), HRID);
  rpt.Free;
end;

procedure THR.chkbHideInActiveClick(Sender: TObject);
begin
  // if Assigned(HRData) then
  // HRData.UpdateHR(hrSwimmer, chkbHideArchived.Checked,
  // chkbHideInActive.Checked, true);
end;

procedure THR.chkbHideNonSwimmersClick(Sender: TObject);
begin
  // if Assigned(HRData) then
  // HRData.UpdateHR(hrSwimmer, chkbHideArchived.Checked,
  // chkbHideInActive.Checked, true);
end;

procedure THR.ClearAllFilters;
begin
  if Assigned(HRData) then
  begin
    Hide_Archived.Checked := false;
    Hide_InActive.Checked := false;
    // HRData.UpdateHR(hrSwimmer, chkbHideArchived.Checked,
    // chkbHideInActive.Checked, true);
  end;
end;

procedure THR.DBGrid3CellClick(Column: TColumn);
begin
  if Assigned(Column.Field) and (Column.Field.DataType = ftBoolean) then
  begin
    Column.Grid.DataSource.DataSet.CheckBrowseMode;
    Column.Grid.DataSource.DataSet.Edit;
    Column.Field.AsBoolean := not Column.Field.AsBoolean;
    // Column.Grid.DataSource.DataSet.Post;
  end;
  if Assigned(Column.Field) and (Column.Field.FieldKind = fkLookup) then
  begin
    Column.Grid.DataSource.DataSet.CheckBrowseMode;
    Column.Grid.DataSource.DataSet.Edit;
  end;
end;

procedure THR.DBGrid3ColEnter(Sender: TObject);
begin
  // By default, two clicks on the same cell enacts the cell editing mode.
  // The grid draws a TEditBox over the cell, killing the checkbox draw UI.
  with Sender as TDBGrid do
  begin
    if Assigned(SelectedField) and (SelectedField.DataType = ftBoolean) then
    begin
      Options := Options - [dgEditing];
    end;
  end;
end;

procedure THR.DBGrid3ColExit(Sender: TObject);
begin
  with Sender as TDBGrid do
    if Assigned(SelectedField) and (SelectedField.DataType = ftBoolean) then
      Options := Options + [dgEditing];
end;

procedure THR.DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  clFont, clBg: TColor;
begin
  // NOTE : DEFAULT DRAWING IS DISABLED ....
  if (Column.Field.FieldName = 'IsActive') or
    (Column.Field.FieldName = 'IsArchived') then
  begin
    if gdFocused in State then
      clFont := fColorEditBoxFocused
    else
      clFont := fColorEditBoxNormal;
    clBg := fColorBgColor;
    DrawCheckBoxes(Sender, Rect, Column, clFont, clBg);
    // draw 'Focused' frame  (for boolean datatype only)
    if gdFocused in State then
      TDBGrid(Sender).Canvas.DrawFocusRect(Rect);
  end
  else
  begin
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    if gdFocused in State then
      TDBGrid(Sender).Canvas.DrawFocusRect(Rect);
  end;
end;

procedure THR.DBGrid3EditButtonClick(Sender: TObject);
var
  fld: TField;
  cal: TDOBPicker;
  // point: TPoint;
  Rect: TRect;
  rtn: TModalResult;
begin
  // handle the ellipse button for the DOB - show DatePicker
  fld := TDBGrid(Sender).SelectedField;
  if fld.Name = 'DOB' then
  begin
    cal := TDOBPicker.Create(Self);
    Rect := TButton(Sender).ClientToScreen(TButton(Sender).ClientRect);
    cal.Left := Rect.Left;
    cal.Top := Rect.Top;
    cal.CalendarView1.Date := fld.AsDateTime;
    rtn := cal.ShowModal;
    if IsPositiveResult(rtn) then
    begin
      if (TDBGrid(Sender).DataSource.State <> dsEdit) or
        (TDBGrid(Sender).DataSource.State <> dsInsert) then
      begin
        // ALT: HRData.UpdateDOB(cal.CalendarView1.Date);
        TDBGrid(Sender).DataSource.Edit;
        fld.Value := cal.CalendarView1.Date;
      end;

    end;
    cal.Free;
  end;
end;

procedure THR.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  fld: TField;
begin

  With Sender as TDBGrid do
  begin
    if Assigned(SelectedField) then
    begin

      if (SelectedField.DataType = ftBoolean) then
      begin
        // If the selected field is a boolean,
        // then enable SPACE key to toggle the value.
        fld := SelectedField;
        if (Key = vkSpace) then
        begin
          if (DataSource.DataSet.State <> dsEdit) or
            (DataSource.DataSet.State <> dsInsert) then
          begin
            DataSource.DataSet.Edit();
          end;
          fld.Value := not fld.AsBoolean;
          Key := NULL;
        end;
        // Y, y, T, t
        if (Key = $59) or (Key = $79) or (Key = $54) or (Key = $74) then
        begin
          if (DataSource.DataSet.State <> dsEdit) or
            (DataSource.DataSet.State <> dsInsert) then
          begin
            DataSource.DataSet.Edit();
          end;
          fld.Value := 1;
          Key := NULL;
        end;
        // N, n, F, f
        if (Key = $4E) or (Key = $6E) or (Key = $46) or (Key = $66) then
        begin
          if (DataSource.DataSet.State <> dsEdit) or
            (DataSource.DataSet.State <> dsInsert) then
          begin
            DataSource.DataSet.Edit();
          end;
          fld.Value := 0;
          Key := NULL;
        end;
      end;

      // DROPDOWN COMBOBOX
      if (SelectedField.FieldKind = fkLookup) then
      begin
        // NullValueKey - Alt+BkSp - CLEAR
        if (Key = vkBack) and (ssAlt in Shift) then
        begin
          fld := SelectedField;
          // if (fld.FieldName = 'luGradeID') then
          // begin
          // DataSource.DataSet.Edit();
          // DataSource.DataSet.FieldByName('GradeID').Clear();
          // DataSource.DataSet.Post();
          // Key := NULL;
          // end;
          // if (fld.FieldName = 'luHRType') then
          // begin
          // DataSource.DataSet.Edit();
          // DataSource.DataSet.FieldByName('HRTypeID').Clear();
          // DataSource.DataSet.Post();
          // Key := NULL;
          // end;
          if (fld.FieldName = 'luGender') then
          begin
            DataSource.DataSet.Edit();
            DataSource.DataSet.FieldByName('GenderID').Clear();
            DataSource.DataSet.Post();
            Key := NULL;
          end;
        end;
      end;
    end;
  end;

end;

procedure THR.DBNavigator1BeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  dlg: TDeleteHR;
  FName, s: string;
  ID: Integer;
begin
  if Button = nbDelete then
  begin
    fDoDelete := false;
    dlg := TDeleteHR.Create(Self);
    // get the fullname of the HR to delete
    FName := HRData.dsHR.DataSet.FieldByName('FName').AsString;
    ID := HRData.dsHR.DataSet.FieldByName('HRID').AsInteger;
    s := IntToStr(ID);
    dlg.lblTitle.Caption := 'Delete (ID: ' + s + ') ' + FName +
      ' from the SCM_Coach database ?';
    // display the confirm delete dlg
    if IsPositiveResult(dlg.ShowModal) then
    begin
      fDoDelete := true;
      // the delete action is allowed to continue ...
    end
    else
      // raises a silent exception - cancelling the action.
      Abort;
    dlg.Free;
  end;
end;

procedure THR.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbDelete then
  begin
    // click occurs after action...
    fDoDelete := false;
  end;
end;

// ---------------------------------------------------------------------------
// Draw a very basic checkbox (ticked) - not a nice as TCheckListBox
// ---------------------------------------------------------------------------
procedure THR.DrawCheckBoxes(oGrid: TObject; Rect: TRect; Column: TColumn;
  fontColor, bgColor: TColor);
var
  MyRect: TRect;
  oField: TField;
  iPos, iFactor: Integer;
  bValue: Boolean;
  g: TDBGrid;
  points: Array [0 .. 4] of TPoint;
begin
  // ---------------------------------------------------------------------------
  // Draw a very basic checkbox (ticked) - not a nice as TCheckListBox
  // ---------------------------------------------------------------------------

  g := TDBGrid(oGrid);
  // is the cell checked?
  oField := Column.Field;
  if (oField.Value = -1) then
    bValue := true
  else
    bValue := false;

  g.Canvas.Pen.Color := fontColor; //
  g.Canvas.Brush.Color := bgColor;
  g.Canvas.Brush.Style := bsSolid;
  g.Canvas.FillRect(Rect);

  // calculate margins
  MyRect.Top := Trunc((Rect.Bottom - Rect.Top - 17) / 2) + Rect.Top;
  MyRect.Left := Trunc((Rect.Right - Rect.Left - 17) / 2) + Rect.Left;
  MyRect.Bottom := MyRect.Top + 16;
  MyRect.Right := MyRect.Left + 16;

  // USES PEN - draw the box (with cell margins)
  points[0].x := MyRect.Left;
  points[0].y := MyRect.Top;
  points[1].x := MyRect.Right;
  points[1].y := MyRect.Top;
  points[2].x := MyRect.Right;
  points[2].y := MyRect.Bottom;
  points[3].x := MyRect.Left;
  points[3].y := MyRect.Bottom;
  points[4].x := MyRect.Left;
  points[4].y := MyRect.Top;

  g.Canvas.Polyline(points);

  iPos := MyRect.Left;
  iFactor := 1;
  // USES PEN - DRAW A TICK - Cross would be nicer?
  if bValue then
  begin
    // 16x16 grid. Pen width is 1 pixel.
    // tick falls
    g.Canvas.MoveTo(iPos + (iFactor * 2), MyRect.Top + 8);
    g.Canvas.LineTo(iPos + (iFactor * 2), MyRect.Top + 11);
    g.Canvas.MoveTo(iPos + (iFactor * 3), MyRect.Top + 9);
    g.Canvas.LineTo(iPos + (iFactor * 3), MyRect.Top + 12);
    g.Canvas.MoveTo(iPos + (iFactor * 4), MyRect.Top + 10);
    g.Canvas.LineTo(iPos + (iFactor * 4), MyRect.Top + 13);
    g.Canvas.MoveTo(iPos + (iFactor * 5), MyRect.Top + 11);
    g.Canvas.LineTo(iPos + (iFactor * 5), MyRect.Top + 14);
    // bottom ... flattens
    g.Canvas.MoveTo(iPos + (iFactor * 6), MyRect.Top + 12);
    g.Canvas.LineTo(iPos + (iFactor * 6), MyRect.Top + 15);
    g.Canvas.MoveTo(iPos + (iFactor * 7), MyRect.Top + 12);
    g.Canvas.LineTo(iPos + (iFactor * 7), MyRect.Top + 15);
    // tick rises
    g.Canvas.MoveTo(iPos + (iFactor * 8), MyRect.Top + 11);
    g.Canvas.LineTo(iPos + (iFactor * 8), MyRect.Top + 14);
    g.Canvas.MoveTo(iPos + (iFactor * 9), MyRect.Top + 10);
    g.Canvas.LineTo(iPos + (iFactor * 9), MyRect.Top + 13);
    g.Canvas.MoveTo(iPos + (iFactor * 10), MyRect.Top + 9);
    g.Canvas.LineTo(iPos + (iFactor * 10), MyRect.Top + 12);
    g.Canvas.MoveTo(iPos + (iFactor * 11), MyRect.Top + 8);
    g.Canvas.LineTo(iPos + (iFactor * 11), MyRect.Top + 11);
    g.Canvas.MoveTo(iPos + (iFactor * 12), MyRect.Top + 7);
    g.Canvas.LineTo(iPos + (iFactor * 12), MyRect.Top + 10);
    g.Canvas.MoveTo(iPos + (iFactor * 13), MyRect.Top + 6);
    g.Canvas.LineTo(iPos + (iFactor * 13), MyRect.Top + 9);
    g.Canvas.MoveTo(iPos + (iFactor * 14), MyRect.Top + 5);
    g.Canvas.LineTo(iPos + (iFactor * 14), MyRect.Top + 8);
    g.Canvas.MoveTo(iPos + (iFactor * 15), MyRect.Top + 4);
    g.Canvas.LineTo(iPos + (iFactor * 15), MyRect.Top + 7);
    g.Canvas.MoveTo(iPos + (iFactor * 16), MyRect.Top + 3);
    g.Canvas.LineTo(iPos + (iFactor * 16), MyRect.Top + 6);
  end;
end;

procedure THR.dtpickDOBChange(Sender: TObject);
begin
  if Assigned(HRData) and (HRData.qryHR.Active) then
  begin
    if (HRData.qryHR.State <> dsEdit) then
      HRData.qryHR.Edit();
    HRData.qryHR.FieldByName('DOB').AsDateTime := dtpickDOB.Date;
    // User manual post - HRData.qryHR.Post();
  end;
end;

function THR.LocateHR(HRID: Integer): Boolean;
var
  b: Boolean;
  s: string;
  rtn: TModalResult;
begin
  result := false;
  b := HRData.LocateHR(HRID);
  if b then
    result := true
  else
  begin
    s := 'Filters must to be cleared to display this swimmer.' + sLineBreak +
      'Clear the filters?';
    rtn := MessageDlg(s, TMsgDlgType.mtConfirmation, mbYesNo, 0);
    if IsPositiveResult(rtn) then
    begin
      ClearAllFilters;
      b := HRData.LocateHR(HRID);
      if b then
        result := true;
    end;
  end;
end;

procedure THR.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  // Test database state
  if Assigned(HRData) and (HRData.qryHR.Active) then
  begin
    if (HRData.qryHR.State = dsEdit) or (HRData.qryHR.State = dsInsert) then
      HRData.qryHR.Post();
  end;
end;

procedure THR.FormCreate(Sender: TObject);
var
  css: TCustomStyleServices;
begin

  MyConnection := nil;
  Hide_Archived.Checked := false;
  Hide_Inactive.Checked := false;

  // For peace of mind : nothing should pass here
  // {TODO -oBSA -cGeneral : Make these exceptions}
  if not Assigned(COACH) then
    exit;
  if not COACH.coachConnection.Connected then
    exit;

  // ----------------------------------------------------
  // C R E A T E   D A T A M O D U L E   S C M .
  // ----------------------------------------------------
  try
    HRData := THRData.CreateWithConnection(Self, COACH.coachConnection);
  finally
    // with HRData created and the essential tables are open then
    // asserting the connection should be true
    if not Assigned(HRData) then
      raise Exception.Create('Manage HR''s Data Module creation error.');
  end;

  // Used to call HR dialogues...
  MyConnection := COACH.coachConnection;

  // ----------------------------------------------------
  // CHECK ACTIVATE TABLES.
  // ----------------------------------------------------
  if not HRData.CoreTablesActivated then
  begin
    MessageDlg('An error occurred during MSSQL table activation.' + sLineBreak +
      'The database''s schema may need updating.' + sLineBreak +
      'The application will terminate!', mtError, [mbOk], 0);
    raise Exception.Create('HRData - HR not active.');
  end;

  // ----------------------------------------------------
  // R E G I S T E R   W I N D O W S   M E S S A G E S  .
  // var defined in winMsgDef.pas
  // NOTE: I using a different assignment hook - code no required
  // ----------------------------------------------------
  // WM_SCMAFTERSCOLL := RegisterWindowMessage('WM_SCMAFTERSCOLL');
  // WM_SCMREQUERY := RegisterWindowMessage('WM_SCMREQUERY');
  // Application.OnMessage := HandleMessage;

  // ----------------------------------------------------
  // I N I T I A L I Z E   P A R A M S .
  // ----------------------------------------------------

  // Special color assignment - used in TDBGrid painting...
  // -------------------------------------------
  css := TStyleManager.Style[TStyleManager.ActiveStyle.Name];
  if Assigned(css) then
  begin
    fColorEditBoxFocused := css.GetStyleFontColor(sfEditBoxTextFocused);
    fColorEditBoxNormal := css.GetStyleFontColor(sfEditBoxTextNormal);
    fColorBgColor := css.GetStyleColor(scGrid);
  end
  else
  begin
    fColorEditBoxFocused := clWebTomato;
    fColorEditBoxNormal := clWindowText;
    fColorBgColor := clAppWorkSpace;
  end;

  // Display tabsheet
  PageControl1.TabIndex := 0;

end;

procedure THR.FormDestroy(Sender: TObject);
begin
  WritePreferences;

  // Clean memory allocation.
  if Assigned(HRData) then
    FreeAndNil(HRData);
end;

procedure THR.FormShow(Sender: TObject);
begin
  // ----------------------------------------------------
  // R E A D   P R E F E R E N C E S .
  // ----------------------------------------------------
  // Note: Don't read preferences OnCreate.
  // Forces requery of qryHR as checkbox states are changed.
  ReadPreferences;

  // ----------------------------------------------------
  // D I S P L A Y   F O R M   C A P T I O N   I N F O .
  // ----------------------------------------------------
  if not AssertSCMConnection then
    exit;

end;

procedure THR.Hide_ArchivedExecute(Sender: TObject);
begin
  HRData.UpdateHideAchived(TAction(Sender).Checked);
  // Modify icon in Action Bar
  if TAction(Sender).Checked then
    Hide_Archived.ImageName := 'VisibilityOff'
  else
    Hide_Archived.ImageName := 'VisibilityOn';
end;

procedure THR.Hide_ArchivedUpdate(Sender: TObject);
begin
  if Assigned(HRData) and HRData.CoreTablesActivated then
    TAction(Sender).Enabled := true
  else
    TAction(Sender).Enabled := false;
end;

procedure THR.Hide_InActiveExecute(Sender: TObject);
begin
  HRData.UpdateHideInActive(TAction(Sender).Checked);
  // Modify icon in Action Bar
  if TAction(Sender).Checked then
    Hide_InActive.ImageName := 'VisibilityOff'
  else
    Hide_InActive.ImageName := 'VisibilityOn';
end;

procedure THR.Hide_InActiveUpdate(Sender: TObject);
begin
  if Assigned(HRData) and HRData.CoreTablesActivated then
    TAction(Sender).Enabled := true
  else
    TAction(Sender).Enabled := false;
end;

procedure THR.HRAfterScroll(var Msg: TMessage);
begin
  if not AssertSCMConnection then
    exit;
  // DATE-OF-BIRTH - DATETIME PICKER INIT
  dtpickDOB.Date := HRData.qryHR.FieldByName('DOB').AsDateTime;

end;

procedure THR.HRDataUpdate(var Msg: TMessage);
begin
  if not AssertSCMConnection then
    exit;
  // UPDATE THE NUMBER OF RECORDS.
  lblCount.Caption := IntToStr(HRData.RecordCount);
end;

procedure THR.MemFile_ExitExecute(Sender: TObject);
begin
  Close();
end;

procedure THR.Onlinehelp1Click(Sender: TObject);
var
  base_URL: string;
begin
  base_URL := 'http://artanemus.github.io/manual/index.htm';
  ShellExecute(0, NIL, PChar(base_URL), NIL, NIL, SW_SHOWNORMAL);

end;

procedure THR.Prepare(AHRTypeID, AHRID: Integer);
begin
  // load user preferences
  // -----------------------------------

  // INIT
  Hide_Archived.Checked := false;
  Hide_Archived.ImageName := 'VisibilityOn';
  Hide_InActive.Checked := false;
  Hide_InActive.ImageName := 'VisibilityOn';

  if Assigned(HRData) then
  begin
    HRData.UpdateHR(Hide_Archived.Checked, Hide_InActive.Checked);
  end;

  if AHRID > 0 then
    LocateHR(AHRID); // Cue-to-HR
end;

procedure THR.ReadPreferences;
var
  ini: TIniFile;
begin
  // C:\Users\<#USERNAME#>\AppData\Roaming\Artanemus\HRData\
  ini := TIniFile.Create(GetSCMAppDataDir + INIFILE_SCM_COACHPREF);
  try
    Hide_Archived.Checked := ini.ReadBool(INIFILE_SECTION,
      'HideArchived', true);
    Hide_InActive.Checked := ini.ReadBool(INIFILE_SECTION,
      'HideInActive', false);
  finally
    ini.Free;
  end;
end;

procedure THR.SCMwebsite1Click(Sender: TObject);
var
  base_URL: string;
begin
  // compiles just fine!
  // ShellExecute(0, 0, L"http://artanemus.github.io", 0, 0, SW_SHOW);

  base_URL := 'http://artanemus.github.io';
  ShellExecute(0, 'open', PChar(base_URL), NIL, NIL, SW_SHOWNORMAL);

end;

procedure THR.Search_FindSwimmerExecute(Sender: TObject);
var
  dlg: TFindHR;
begin
  if Assigned(MyConnection) then
  begin
    dlg := TFindHR.Create(Self);
    dlg.Prepare(MyConnection, Integer(hrSwimmer));
    if IsPositiveResult(dlg.ShowModal()) then
    begin
      LocateHR(dlg.HRID)
    end;
    dlg.Free;
  end;
end;

procedure THR.Search_GotoIDExecute(Sender: TObject);
var
  dlg: TGotoHR;
  rtn: TModalResult;
begin
  if Assigned(HRData) then
  begin
    dlg := TGotoHR.Create(Self);
    dlg.Prepare(MyConnection, Integer(hrSwimmer));
    rtn := dlg.ShowModal;
    if IsPositiveResult(rtn) then
    begin
      LocateHR(dlg.HRID)
    end;
    dlg.Free;
  end;
end;

procedure THR.Search_GotoRegNumExecute(Sender: TObject);
var
  dlg: TGotoHRRegNum;
  rtn: TModalResult;
begin
  if Assigned(HRData) then
  begin
    dlg := TGotoHRRegNum.Create(Self);
    dlg.Prepare(MyConnection, Integer(hrSwimmer));
    rtn := dlg.ShowModal;
    if IsPositiveResult(rtn) then
    begin
      // NOTE: returns both RegisterNum and HRID
      LocateHR(dlg.HRID)
    end;
    dlg.Free;
  end;
end;

procedure THR.WritePreferences;
var
  ini: TIniFile;
begin
  // C:\Users\<#USERNAME#>\AppData\Roaming\Artanemus\
  ini := TIniFile.Create(GetSCMAppDataDir + INIFILE_SCM_COACHPREF);
  try
    ini.WriteBool(INIFILE_SECTION, 'HideArchived', Hide_Archived.Checked);
    ini.WriteBool(INIFILE_SECTION, 'HideInActive', Hide_InActive.Checked);
  finally
    ini.Free;
  end;
end;

end.
