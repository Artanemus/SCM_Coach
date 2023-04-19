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
  object qryIsDupSCMMember: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Connection = TestSCMConnection
    SQL.Strings = (
      'USE SCM_Coach;'
      ''
      'DECLARE @scmMemberID AS INTEGER;'
      'SET @scmMemberID = :MEMBERID;'
      ''
      'SELECT COUNT([SCMMemberID]) AS rtnValue'
      'FROM SCM_Coach.dbo.HR'
      'WHERE [scmMemberID] = @scmMemberID;')
    Left = 376
    Top = 128
    ParamData = <
      item
        Name = 'MEMBERID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryCheckMiddleInitial: TFDQuery
    ActiveStoredUsage = [auDesignTime]
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
    Top = 232
  end
  object tblHR: TFDTable
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'HRID'
    Connection = TestCoachConnection
    UpdateOptions.KeyFields = 'HRID'
    TableName = 'SCM_Coach.dbo.HR'
    Left = 376
    Top = 248
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
    ActiveStoredUsage = [auDesignTime]
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
      '     , GenderID'
      '     , Email'
      'FROM Member'
      'WHERE IsSwimmer <> 0'
      '      AND MemberID = @MemberID;')
    Left = 96
    Top = 304
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
    Top = 312
  end
  object tblRaceHistory: TFDTable
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'RaceHistoryID'
    Connection = TestCoachConnection
    UpdateOptions.KeyFields = 'RaceHistoryID'
    TableName = 'SCM_Coach.dbo.RaceHistory'
    Left = 376
    Top = 376
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
    Top = 368
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
      ',[Entrant].Lane'
      '-- PoolType'
      '-- NumOfLanes'
      '-- LenOfPool (Metres)'
      ' FROM [Session]'
      'LEFT JOIN [Event] ON [Session].[SessionID] = [Event].[SessionID]'
      'LEFT JOIN [Stroke] on [Event].StrokeID = Stroke.StrokeID'
      'LEFT JOIN [Distance] on [Event].DistanceID = Distance.DistanceID'
      
        'LEFT JOIN [HeatIndividual] ON [Event].[EventID] = [HeatIndividua' +
        'l].[EventID]'
      'LEFT JOIN [Entrant] ON HeatIndividual.HeatID = [Entrant].HeatID'
      'WHERE [Entrant].[MemberID] = @MemberID;')
    Left = 96
    Top = 440
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
    Top = 440
  end
  object qryIsDupRaceHistory: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Connection = TestSCMConnection
    SQL.Strings = (
      'USE SCM_Coach ;'
      ''
      'DECLARE @EntrantID AS INTEGER;'
      'SET @EntrantID = :ENTRANTID;'
      ''
      'SELECT COUNT(RaceHistoryID) AS rtnValue'
      'FROM RaceHistory'
      'WHERE EntrantID <> @EntrantID;')
    Left = 376
    Top = 192
    ParamData = <
      item
        Name = 'ENTRANTID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrySplit: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Connection = TestSCMConnection
    SQL.Strings = (
      'USE SwimClubMeet;'
      ''
      'DECLARE @EntrantID AS INTEGER;'
      'SET @EntrantID = :SPLITID;'
      ''
      'SELECT SplitID'
      ', SplitTime'
      'FROM dbo.Split'
      'WHERE EntrantID = @EntrantID;')
    Left = 88
    Top = 520
    ParamData = <
      item
        Name = 'SPLITID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
