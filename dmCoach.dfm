object COACH: TCOACH
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object coachConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_SCM_Coach')
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    Left = 88
    Top = 56
  end
end
