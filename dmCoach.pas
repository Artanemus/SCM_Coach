unit dmCoach;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef;

type
  TCOACH = class(TDataModule)
    coachConnection: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    fCoreTablesActivated: boolean;

  public
    { Public declarations }

    // SYSTEM - STARTUP - EXIT
    procedure ActivateTable();
    procedure DeActivateTable();

    // FLAG - true if all core FireDAC tables, queries are active.
    property CoreTablesActivated: boolean read fCoreTablesActivated;

  end;

const
  CUSTOMINIFILE = 'SCMCoachPref.ini';
  USEDEFAULTINIFILE = true; // NOTE: Always true. 26/09/2022
  SCMCONFIGFILENAME = 'SCMCoachConfig.ini';

var
  COACH: TCOACH;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

uses
  System.IOUtils, IniFiles, SCMUtility;

{ TSCM }

procedure TCOACH.ActivateTable;
begin
  fCoreTablesActivated := true;
end;

procedure TCOACH.DataModuleCreate(Sender: TObject);
begin
  // TODO: INIT SCM datamodule
end;

procedure TCOACH.DeActivateTable;
begin
  fCoreTablesActivated := false;
end;

end.
