object ImportData: TImportData
  Height = 480
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
    Top = 104
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
    Top = 184
  end
  object tblHR: TFDTable
    IndexFieldNames = 'HRID'
    Connection = TestCoachConnection
    UpdateOptions.KeyFields = 'HRID'
    TableName = 'SCM_Coach.dbo.HR'
    Left = 376
    Top = 104
  end
  object TestCoachConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_SCM_Coach')
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    Left = 376
    Top = 24
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
    Top = 272
    ParamData = <
      item
        Name = 'MEMBERID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
