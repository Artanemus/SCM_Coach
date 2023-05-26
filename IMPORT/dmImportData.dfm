object ImportData: TImportData
  Height = 541
  Width = 564
  object TestSCMConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_SwimClubMeet')
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    Left = 96
    Top = 32
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
    Top = 112
  end
  object tblHR: TFDTable
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'HRID'
    Connection = TestCoachConnection
    UpdateOptions.KeyFields = 'HRID'
    TableName = 'SCM_Coach.dbo.HR'
    Left = 376
    Top = 280
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
    IndexFieldNames = 'MemberID'
    Connection = TestSCMConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
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
    Top = 160
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
    Top = 336
  end
  object tblRaceHistory: TFDTable
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'RaceHistoryID'
    Connection = TestCoachConnection
    UpdateOptions.KeyFields = 'RaceHistoryID'
    TableName = 'SCM_Coach.dbo.RaceHistory'
    Left = 376
    Top = 392
  end
  object qryContactNum: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'ContactNumID'
    Connection = TestSCMConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'USE SwimClubMeet;'
      ''
      'DECLARE @MemberID AS INTEGER;'
      ''
      'SET @MemberID = :MEMBERID;'
      ''
      'SELECT * FROM [dbo].[ContactNum] WHERE [MemberID] = @MemberID;')
    Left = 96
    Top = 208
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
    IndexFieldNames = 'EntrantID'
    Connection = TestSCMConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'USE SwimClubMeet;'
      ''
      'DECLARE @MemberID AS INTEGER;'
      'DECLARE @SeedDate AS DATETIME;'
      'DECLARE @DoRange AS BIT = 0;'
      ''
      'SET @MemberID = :MEMBERID;'
      'SET @SeedDate = :SEEDDATE;'
      'SET @DoRange = :DORANGE;'
      ''
      'IF (@SeedDate IS NULL)'
      '    SET @SeedDate = GETDATE();'
      ''
      ''
      'SELECT SessionStart'
      '     , [Session].Caption AS SessionStr'
      '     , CONCAT(Distance.Caption, '#39' '#39', Stroke.Caption) AS EventStr'
      '     , Entrant.RaceTime'
      '     , [Distance].DistanceID'
      '     , [Stroke].StrokeID'
      '     , [Entrant].EntrantID'
      '     , [Entrant].IsDisqualified'
      '     , [Entrant].IsScratched'
      '     , [Entrant].Lane'
      '-- PoolType'
      '-- NumOfLanes'
      '-- LenOfPool (Metres)'
      'FROM [Session]'
      '    LEFT JOIN [Event]'
      '        ON [Session].[SessionID] = [Event].[SessionID]'
      '    LEFT JOIN [Stroke]'
      '        ON [Event].StrokeID = Stroke.StrokeID'
      '    LEFT JOIN [Distance]'
      '        ON [Event].DistanceID = Distance.DistanceID'
      '    LEFT JOIN [HeatIndividual]'
      '        ON [Event].[EventID] = [HeatIndividual].[EventID]'
      '    LEFT JOIN [Entrant]'
      '        ON HeatIndividual.HeatID = [Entrant].HeatID'
      'WHERE [Entrant].[MemberID] = @MemberID'
      '      AND'
      '      ('
      '          ('
      '              @DoRange = 1'
      '              AND SessionStart > @SeedDate'
      '          )'
      '          OR'
      '          ('
      '              @DoRange = 0'
      '              AND SessionStart > 0'
      '          )'
      '      );'
      ''
      ''
      '')
    Left = 96
    Top = 256
    ParamData = <
      item
        Name = 'MEMBERID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SEEDDATE'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DORANGE'
        DataType = ftBoolean
        ParamType = ptInput
        Value = False
      end>
  end
  object tblRaceHistorySplit: TFDTable
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'RaceHistorySplitID'
    Connection = TestCoachConnection
    UpdateOptions.KeyFields = 'RaceHistorySplitID'
    TableName = 'SCM_Coach.dbo.RaceHistorySplit'
    Left = 376
    Top = 448
  end
  object qrySplit: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'SplitID'
    Connection = TestSCMConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'USE SwimClubMeet;'
      ''
      'DECLARE @EntrantID AS INTEGER;'
      'SET @EntrantID = :ENTRANTID;'
      ''
      'SELECT SplitID'
      ', SplitTime'
      'FROM dbo.Split'
      'WHERE EntrantID = @EntrantID;')
    Left = 96
    Top = 304
    ParamData = <
      item
        Name = 'ENTRANTID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryMaxRaceHistory: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'EntrantID'
    Connection = TestSCMConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'USE SCM_Coach;'
      ''
      'DECLARE @HRID AS INTEGER;'
      'SET @HRID = :HRID '
      ''
      'SELECT TOP 1'
      '       EntrantID'
      '     , CreatedOn'
      'FROM [SCM_Coach].[dbo].[RaceHistory]'
      'WHERE HRID = @HRID'
      'ORDER BY EntrantID DESC'
      '       , CreatedOn DESC')
    Left = 376
    Top = 96
    ParamData = <
      item
        Name = 'HRID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
