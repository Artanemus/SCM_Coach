unit dmSCM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client;

type
  TSCM = class(TDataModule)
    scmConnection: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    fSCMActive: boolean;


  public
    { Public declarations }

    // SYSTEM - STARTUP - EXIT
    procedure ActivateTable();
    procedure DeActivateTable();


    // FLAG - true if all FireDAC tables, queries are active.
    property SCMActive: boolean read FSCMActive write FSCMActive;

  end;

const
  CUSTOMINIFILE = 'SCMCoachPref.ini';
  USEDEFAULTINIFILE = true; // NOTE: Always true. 26/09/2022
  SCMCONFIGFILENAME = 'SCMCoachConfig.ini';

var
  SCM: TSCM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
uses
  System.IOUtils, IniFiles, SCMUtility;

{ TSCM }

procedure TSCM.ActivateTable;
begin
fSCMActive := true;
end;

procedure TSCM.DataModuleCreate(Sender: TObject);
begin
  // TODO: INIT SCM datamodule
end;

procedure TSCM.DeActivateTable;
begin
fSCMActive := false;
end;


end.
