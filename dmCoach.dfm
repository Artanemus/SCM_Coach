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
    Left = 224
    Top = 56
  end
  object qrySession: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'SessionID'
    Connection = coachConnection
    UpdateOptions.UpdateTableName = 'SCM_Coach.dbo.Session'
    UpdateOptions.KeyFields = 'SessionID'
    SQL.Strings = (
      'USE SCM_Coach;'
      'SELECT * FROM dbo.Session;')
    Left = 192
    Top = 160
  end
  object qryWorkOut: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'WorkOutID'
    MasterSource = dsSession
    MasterFields = 'SessionID'
    DetailFields = 'SessionID'
    Connection = coachConnection
    UpdateOptions.UpdateTableName = 'SCM_Coach.dbo.WorkOut'
    UpdateOptions.KeyFields = 'WorkOutID'
    SQL.Strings = (
      'USE SCM_Coach;'
      ''
      'SELECT * FROM WorkOut;')
    Left = 192
    Top = 232
  end
  object dsSession: TDataSource
    DataSet = qrySession
    Left = 264
    Top = 160
  end
  object dsWorkOut: TDataSource
    DataSet = qryWorkOut
    Left = 272
    Top = 232
  end
  object qrySwimmerLink: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'SwimmerLinkID'
    MasterSource = dsWorkOut
    MasterFields = 'WorkOutID'
    DetailFields = 'WorkOutID'
    Connection = coachConnection
    UpdateOptions.UpdateTableName = 'SCM_Coach.dbo.SwimmerLink'
    SQL.Strings = (
      'USE SCM_Coach;'
      'SELECT SwimmerLink.*, HR.FirstName, HR.LastName '
      'FROM dbo.SwimmerLink'
      'INNER JOIN dbo.HR ON dbo.SwimmerLink.HRID = dbo.HR.HRID;')
    Left = 64
    Top = 360
  end
  object qryCoachLink: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'CoachLinkID'
    MasterSource = dsWorkOut
    MasterFields = 'WorkOutID'
    DetailFields = 'WorkOutID'
    Connection = coachConnection
    UpdateOptions.UpdateTableName = 'SCM_Coach.dbo.CoachLink'
    SQL.Strings = (
      'USE SCM_Coach;'
      'SELECT CoachLink.*, HR.FirstName, HR.LastName '
      'FROM dbo.CoachLink'
      'INNER JOIN dbo.HR ON dbo.CoachLink.HRID = dbo.HR.HRID;')
    Left = 320
    Top = 360
  end
  object dsSwimmerLink: TDataSource
    DataSet = qrySwimmerLink
    Left = 136
    Top = 360
  end
  object dsCoachLink: TDataSource
    DataSet = qryCoachLink
    Left = 392
    Top = 360
  end
end
