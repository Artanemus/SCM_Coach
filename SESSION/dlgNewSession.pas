unit dlgNewSession;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.DateUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXPickers, Vcl.DBCtrls, Vcl.Mask, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  scmSessionMode = (smEditSession, smNewSession, swNotGiven);

  TNewSession = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnPost: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DatePicker1: TDatePicker;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    qrySessionDlg: TFDQuery;
    dsSessionDlg: TDataSource;
    Label7: TLabel;
    TimePicker1: TTimePicker;
    procedure btnPostClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fSessionID: integer;
    fSessionMode: scmSessionMode;
    fConnection: TFDConnection;
    function LocateSession(ASessionID: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  NewSession: TNewSession;

implementation

{$R *.dfm}

procedure TNewSession.btnPostClick(Sender: TObject);
var
  dt: TDateTime;
begin
with dsSessionDlg.DataSet do begin
  // Finalise the edit.
  // Note: Defaults are assigned by COACH.NewRecord ;
  if (State = dsEdit) or (State = dsInsert) then
  begin
    dt := DatePicker1.Date + TimePicker1.Time;
    // Manually assign date - only if modified.
    if FieldByName('SessionStart').AsDateTime <> dt then
      FieldByName('SessionStart').AsDateTime := dt;
    FieldByName('SessionStatusID').AsInteger := 1;
    FieldByName('SwimClubID').AsInteger := 1;
    // finalise the changes...
    Post;
  end;
  if (State = dsEdit) then
    fSessionID := FieldByName('SessionID').AsInteger;

  ModalResult := mrOk;
end;
end;

procedure TNewSession.FormShow(Sender: TObject);
var
  dt: TDateTime;
begin
  case fSessionMode of
    smEditSession:
      begin
        if not LocateSession(fSessionID) then Close;
        Caption := 'Edit session ...';
        with dsSessionDlg.DataSet do
        begin
          dt := FieldByName('SessionStart').AsDateTime;
          DatePicker1.Date := DateOf(dt);
          TimePicker1.Time := TimeOf(dt);
          // - -   e d i t   - -
          if State <> dsEdit then
            Edit;
        end;
      end;
    smNewSession:
      begin
        Caption := 'Create new session ...';
        // - -   i n s e r t   - -
        dsSessionDlg.DataSet.Insert;
        DatePicker1.Date := Date;
        TimePicker1.Time := Time;
      end;
    swNotGiven:
      Close;
  end;
end;

function TNewSession.LocateSession(ASessionID: Integer): Boolean;
var
  SearchOptions: TLocateOptions;
begin
  result := false;
  if not qrySessionDlg.Active then exit;
  SearchOptions := [];
  result := qrySessionDlg.Locate('SessionID', ASessionID, SearchOptions);
end;

end.
