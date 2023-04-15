object ImportData: TImportData
  Height = 634
  Width = 640
  object TestSCMConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_SwimClubMeet')
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    Left = 96
    Top = 32
  end
  object sqlAssertDuplicity: TFDQuery
    Connection = TestSCMConnection
    SQL.Strings = (
      'USE SCM_Coach;'
      ''
      'DECLARE @MemberID AS INTEGER;'
      'SET @MemberID = :MEMBERID;'
      ''
      'SELECT COUNT([scmMemberID]) AS rtnValue'
      'FROM SCM_Coach.dbo.HR'
      'WHERE [scmMemberID] = @MemberID;')
    Left = 96
    Top = 112
    ParamData = <
      item
        Name = 'MEMBERID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryCheckMiddleInitial: TFDQuery
    Connection = TestSCMConnection
    SQL.Strings = (
      'USE SwimClubMeet;'
      ''
      'DECLARE @rtn AS BIT;'
      'SET @rtn = 0;'
      ''
      'IF EXISTS'
      '('
      '    SELECT *'
      '    FROM sys.columns'
      '    WHERE (Name = N'#39'MiddleInitial'#39')'
      
        '          AND (OBJECT_ID = OBJECT_ID(N'#39'[SwimClubMeet].[dbo].[Mem' +
        'ber]'#39'))'
      ')'
      'BEGIN'
      '    SET @rtn = 1;'
      'END;'
      ''
      'SELECT @rtn AS rtnValue;')
    Left = 96
    Top = 176
  end
  object tblHR: TFDTable
    IndexFieldNames = 'HRID'
    Connection = TestCoachConnection
    UpdateOptions.KeyFields = 'HRID'
    TableName = 'SCM_Coach.dbo.HR'
    Left = 376
    Top = 168
  end
  object TestCoachConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_SCM_Coach')
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    Left = 376
    Top = 32
  end
  object qryMember: TFDQuery
    Connection = TestSCMConnection
    SQL.Strings = (
      'USE SwimClubMeet;'
      ''
      'DECLARE @MemberID AS INTEGER;'
      'SET @MemberID = :MEMBERID;'
      ''
      'SELECT MemberID'
      '     , FirstName'
      '     , LastName'
      '     , DOB'
      '     , MembershipNum'
      '     , MembershipStr'
      'FROM Member'
      'WHERE IsSwimmer <> 0'
      '      AND MemberID = @MemberID;')
    Left = 96
    Top = 248
    ParamData = <
      item
        Name = 'MEMBERID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object tblContactNum: TFDTable
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'ContactNumID'
    Connection = TestCoachConnection
    UpdateOptions.KeyFields = 'ContactNumID'
    TableName = 'SCM_Coach.dbo.ContactNum'
    Left = 376
    Top = 232
  end
  object tblRaceHistory: TFDTable
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'RaceHistoryID'
    Connection = TestCoachConnection
    UpdateOptions.KeyFields = 'RaceHistoryID'
    TableName = 'SCM_Coach.dbo.RaceHistory'
    Left = 376
    Top = 296
  end
  object qryContactNum: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Connection = TestSCMConnection
    SQL.Strings = (
      'USE SwimClubMeet;'
      ''
      'DECLARE @MemberID AS INTEGER;'
      ''
      'SET @MemberID = :MEMBERID;'
      ''
      'SELECT * FROM [dbo].[ContactNum] WHERE [MemberID] = @MemberID;')
    Left = 96
    Top = 312
    ParamData = <
      item
        Name = 'MEMBERID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryRaceHistory: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Connection = TestSCMConnection
    SQL.Strings = (
      'Use SwimClubMeet;'
      ''
      'DECLARE @MemberID AS INTEGER;'
      ''
      'SET @MemberID = :MEMBERID;'
      ''
      'SELECT SessionStart'
      ',[Session].Caption AS SessionStr'
      ', CONCAT(Distance.Caption, '#39' '#39', Stroke.Caption) as EventStr'
      ', Entrant.RaceTime'
      ', [Distance].DistanceID'
      ', [Stroke].StrokeID'
      ', [Entrant].EntrantID'
      ',[Entrant].IsDisqualified'
      ',[Entrant].IsScratched'
      ' FROM [Session]'
      'LEFT JOIN [Event] ON [Session].[SessionID] = [Event].[SessionID]'
      'LEFT JOIN [Stroke] on [Event].StrokeID = Stroke.StrokeID'
      'LEFT JOIN [Distance] on [Event].DistanceID = Distance.DistanceID'
      
        'LEFT JOIN [HeatIndividual] ON [Event].[EventID] = [HeatIndividua' +
        'l].[EventID]'
      'LEFT JOIN [Entrant] ON HeatIndividual.HeatID = [Entrant].HeatID'
      'WHERE [Entrant].[MemberID] = @MemberID;')
    Left = 96
    Top = 384
    ParamData = <
      item
        Name = 'MEMBERID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object tblRaceHistorySplit: TFDTable
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'RaceHistorySplitID'
    Connection = TestCoachConnection
    UpdateOptions.KeyFields = 'RaceHistorySplitID'
    TableName = 'SCM_Coach.dbo.RaceHistorySplit'
    Left = 376
    Top = 360
  end
end
