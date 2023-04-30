object SquadData: TSquadData
  Height = 480
  Width = 640
  object qrySelectPool: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Connection = COACH.coachConnection
    SQL.Strings = (
      'USE SCM_Coach;'
      ''
      'DECLARE @HRTypeID AS INTEGER;'
      'SET @HRTypeID = :HRYPEID;'
      ''
      'SELECT '
      #9#9' [HRID]'
      
        #9#9',CONCAT(TRIM([FirstName]), '#39' '#39', TRIM([MiddleInitial]), '#39' '#39' ,TR' +
        'IM([LastName])) AS FName'
      'FROM [SCM_Coach].[dbo].[HR] '
      
        'WHERE  [HRTypeID] = @HRTypeID AND IsActive = 1 AND IsArchived <>' +
        ' 1;'
      '')
    Left = 104
    Top = 48
    ParamData = <
      item
        Name = 'HRYPEID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 3
      end>
  end
  object dsSelectPool: TDataSource
    DataSet = qrySelectPool
    Left = 200
    Top = 48
  end
  object qryTeam: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'TeamTmpID'
    Connection = COACH.coachConnection
    UpdateOptions.UpdateTableName = 'SCM_Coach.dbo.TeamTmp'
    UpdateOptions.KeyFields = 'TeamTmpID'
    SQL.Strings = (
      'USE SCM_Coach;'
      ''
      'DECLARE @TeamTypeID AS INTEGER;'
      'SET @TeamTypeID = :TEAMTYPEID;'
      'DECLARE @TeamID AS INTEGER;'
      'SET @TeamID = :TEAMID;'
      ''
      'SELECT '
      #9#9' [TeamID]'
      #9#9',[Caption]'
      #9#9',[NickName]'
      #9#9',[Color]'
      'FROM [SCM_Coach].[dbo].[Team] '
      'WHERE [TeamTypeID] = @TeamTypeID  AND TeamID = @TeamID;'
      '')
    Left = 96
    Top = 128
    ParamData = <
      item
        Name = 'TEAMTYPEID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TEAMID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsTeam: TDataSource
    DataSet = qryTeam
    Left = 200
    Top = 128
  end
end
