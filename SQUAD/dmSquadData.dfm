object SquadData: TSquadData
  Height = 480
  Width = 640
  object qrySelectPool: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Connection = COACH.coachConnection
    SQL.Strings = (
      'USE SCM_Coach;'
      ''
      'DECLARE @SCMCoachID AS INTEGER;'
      'SET @SCMCoachID = :SCMCOACHID;'
      ''
      'SELECT '
      #9#9' [TeamTmpID]'
      #9#9',[Caption]'
      #9#9',[NickName]'
      #9#9',[Color]'
      #9#9',[SCMCoachID]'
      'FROM [SCM_Coach].[dbo].[TeamTmp] '
      'WHERE [SCMCoachID] = @SCMCoachID'
      ';')
    Left = 104
    Top = 48
    ParamData = <
      item
        Name = 'SCMCOACHID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsSelectPool: TDataSource
    DataSet = qrySelectPool
    Left = 200
    Top = 48
  end
  object qryTeamTemp: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Active = True
    IndexFieldNames = 'TeamTmpID'
    Connection = COACH.coachConnection
    UpdateOptions.UpdateTableName = 'SCM_Coach.dbo.TeamTmp'
    UpdateOptions.KeyFields = 'TeamTmpID'
    SQL.Strings = (
      'USE SCM_Coach;'
      ''
      'DECLARE @SCMCoachID AS INTEGER;'
      'SET @SCMCoachID = 1; -- :SCMCOACHID;'
      ''
      'SELECT '
      #9#9' [TeamTmpID]'
      #9#9',[Caption]'
      #9#9',[NickName]'
      #9#9',[Color]'
      #9#9',[SCMCoachID]'
      'FROM [SCM_Coach].[dbo].[TeamTmp] '
      'WHERE [SCMCoachID] = @SCMCoachID'
      ';'
      '')
    Left = 96
    Top = 128
  end
  object dsTeamTemp: TDataSource
    DataSet = qryTeamTemp
    Left = 200
    Top = 128
  end
end
