object HRData: THRData
  OnCreate = DataModuleCreate
  Height = 800
  Width = 1306
  object tblContactNumType: TFDTable
    ActiveStoredUsage = [auDesignTime]
    Active = True
    IndexFieldNames = 'ContactNumTypeID'
    Connection = FDTempDesignConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'SwimClubMeet..ContactNumType'
    TableName = 'SwimClubMeet..ContactNumType'
    Left = 64
    Top = 616
    object tblContactNumTypeContactNumTypeID: TFDAutoIncField
      FieldName = 'ContactNumTypeID'
      Origin = 'ContactNumTypeID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tblContactNumTypeCaption: TWideStringField
      FieldName = 'Caption'
      Origin = 'Caption'
      Size = 30
    end
  end
  object tblStroke: TFDTable
    ActiveStoredUsage = [auDesignTime]
    Active = True
    IndexFieldNames = 'StrokeID'
    Connection = FDTempDesignConnection
    UpdateOptions.UpdateTableName = 'SwimClubMeet..Stroke'
    TableName = 'SwimClubMeet..Stroke'
    Left = 64
    Top = 464
  end
  object tblDistance: TFDTable
    ActiveStoredUsage = [auDesignTime]
    Active = True
    IndexFieldNames = 'DistanceID'
    Connection = FDTempDesignConnection
    UpdateOptions.UpdateTableName = 'SwimClubMeet..Distance'
    TableName = 'SwimClubMeet..Distance'
    Left = 64
    Top = 536
  end
  object tblHRType: TFDTable
    ActiveStoredUsage = [auDesignTime]
    Active = True
    IndexFieldNames = 'HRTypeID'
    Connection = FDTempDesignConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.KeyFields = 'HRTypeID'
    TableName = 'dbo.HRType'
    Left = 64
    Top = 320
  end
  object dsHRType: TDataSource
    DataSet = tblHRType
    Left = 168
    Top = 320
  end
  object tblGender: TFDTable
    ActiveStoredUsage = [auDesignTime]
    Active = True
    IndexFieldNames = 'GenderID'
    Connection = FDTempDesignConnection
    UpdateOptions.UpdateTableName = 'SwimClubMeet..Gender'
    TableName = 'SwimClubMeet..Gender'
    Left = 64
    Top = 384
  end
  object dsGender: TDataSource
    DataSet = tblGender
    Left = 168
    Top = 384
  end
  object dsContactNum: TDataSource
    DataSet = qryContactNum
    Left = 168
    Top = 184
  end
  object qryContactNum: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Active = True
    Indexes = <
      item
        Active = True
        Selected = True
        Name = 'indx_ContactNum'
        Fields = 'HRID;ContactNumID'
        DescFields = 'ContactNumID'
      end>
    IndexName = 'indx_ContactNum'
    MasterFields = 'HRID'
    Connection = FDTempDesignConnection
    UpdateOptions.UpdateTableName = 'SCM_Coach.dbo.ContactNum'
    UpdateOptions.KeyFields = 'ContactNumID'
    SQL.Strings = (
      'USE [SCM_Coach];'
      ''
      'SELECT ContactNum.ContactNumID'
      #9',ContactNum.Number'
      #9',ContactNum.ContactNumTypeID'
      #9',ContactNum.HRID'
      'FROM ContactNum;')
    Left = 64
    Top = 184
    object qryContactNumContactNumID: TFDAutoIncField
      FieldName = 'ContactNumID'
      Origin = 'ContactNumID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryContactNumNumber: TWideStringField
      FieldName = 'Number'
      Origin = 'Number'
      Size = 30
    end
    object qryContactNumContactNumTypeID: TIntegerField
      FieldName = 'ContactNumTypeID'
      Origin = 'ContactNumTypeID'
    end
    object qryContactNumlu: TStringField
      FieldKind = fkLookup
      FieldName = 'luContactNumType'
      LookupDataSet = tblContactNumType
      LookupKeyFields = 'ContactNumTypeID'
      LookupResultField = 'Caption'
      KeyFields = 'ContactNumTypeID'
      Lookup = True
    end
    object qryContactNumHRID: TIntegerField
      FieldName = 'HRID'
      Origin = 'HRID'
      Required = True
    end
  end
  object qryFindHR: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    Filter = '(GenderID = 1 OR GenderID = 2) AND (IsActive = TRUE)'
    IndexFieldNames = 'MemberID'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT        '
      'Member.FirstName'
      ', Member.LastName'
      ', Member.MemberID'
      ', Member.GenderID'
      ', Member.MemberShipTypeID'
      ', Member.MembershipNum'
      ', FORMAT(Member.DOB, '#39'dd/MM/yyyy'#39') AS dtDOB'
      ', Member.IsActive'
      ', Member.MembershipDue'
      ', Gender.Caption AS cGender'
      '--, SwimClub.Caption AS cSwimClub'
      '--, SwimClub.NickName'
      ', MembershipType.Caption AS cMembershipType'
      ', MembershipType.IsSwimmer'
      ', CONCAT(UPPER([LastName]), '#39', '#39', Member.FirstName ) AS FName'
      ', DATEDIFF ( year , [DOB], GETDATE() ) AS Age'
      'FROM            Member '
      'LEFT OUTER JOIN'
      
        '                         MembershipType ON Member.MembershipType' +
        'ID = MembershipType.MembershipTypeID '
      'LEFT OUTER JOIN'
      
        '                         SwimClub ON Member.SwimClubID = SwimClu' +
        'b.SwimClubID '
      'LEFT OUTER JOIN'
      
        '                         Gender ON Member.GenderID = Gender.Gend' +
        'erID'
      #9#9#9#9#9'ORDER BY Member.LastName')
    Left = 616
    Top = 56
    object qryFindHRMemberID: TFDAutoIncField
      Alignment = taCenter
      DisplayLabel = '  ID'
      DisplayWidth = 5
      FieldName = 'MemberID'
      Origin = 'MemberID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      DisplayFormat = '0000'
    end
    object qryFindHRMembershipNum: TIntegerField
      DisplayLabel = 'Num#'
      DisplayWidth = 6
      FieldName = 'MembershipNum'
      Origin = 'MembershipNum'
      DisplayFormat = '##00'
    end
    object qryFindHRFName: TWideStringField
      DisplayLabel = 'Member'#39's Name'
      DisplayWidth = 160
      FieldName = 'FName'
      Origin = 'FName'
      ReadOnly = True
      Required = True
      Size = 258
    end
    object qryFindHRdtDOB: TWideStringField
      Alignment = taCenter
      DisplayLabel = '  DOB'
      DisplayWidth = 11
      FieldName = 'dtDOB'
      Origin = 'dtDOB'
      ReadOnly = True
      Size = 4000
    end
    object qryFindHRAge: TIntegerField
      Alignment = taCenter
      DisplayWidth = 3
      FieldName = 'Age'
      Origin = 'Age'
      ReadOnly = True
      DisplayFormat = '#0'
    end
    object qryFindHRIsActive: TBooleanField
      DisplayLabel = 'Active'
      DisplayWidth = 6
      FieldName = 'IsActive'
      Origin = 'IsActive'
    end
    object qryFindHRcGender: TWideStringField
      DisplayLabel = 'Gender'
      DisplayWidth = 7
      FieldName = 'cGender'
      Origin = 'cGender'
    end
    object qryFindHRcMembershipType: TWideStringField
      DisplayLabel = 'Membership Type'
      DisplayWidth = 30
      FieldName = 'cMembershipType'
      Origin = 'cMembershipType'
      Size = 64
    end
    object qryFindHRFirstName: TWideStringField
      FieldName = 'FirstName'
      Origin = 'FirstName'
      Visible = False
      Size = 128
    end
    object qryFindHRLastName: TWideStringField
      FieldName = 'LastName'
      Origin = 'LastName'
      Visible = False
      Size = 128
    end
    object qryFindHRGenderID: TIntegerField
      FieldName = 'GenderID'
      Origin = 'GenderID'
      Visible = False
    end
    object qryFindHRMemberShipTypeID: TIntegerField
      FieldName = 'MemberShipTypeID'
      Origin = 'MemberShipTypeID'
      Visible = False
    end
    object qryFindHRIsSwimmer: TBooleanField
      FieldName = 'IsSwimmer'
      Origin = 'IsSwimmer'
      Visible = False
    end
  end
  object dsFindMember: TDataSource
    DataSet = qryFindHR
    Left = 718
    Top = 56
  end
  object qAssertMemberID: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'MemberID'
    SQL.Strings = (
      'USE SwimClubMeet;'
      ''
      'SELECT MemberID, MembershipNum FROM Member WHERE SwimClubID = 1')
    Left = 696
    Top = 184
  end
  object qryEntrantDataCount: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'USE SwimClubMeet;'
      ''
      'DECLARE @MemberID as INTEGER;'
      'SET @MemberID = :MEMBERID; -- 57;'
      ''
      'SELECT Count(EntrantID) as TOT FROM Entrant WHERE'
      
        'MemberID = @MemberID AND (RaceTime IS NOT NULL OR (dbo.SwimTimeT' +
        'oMilliseconds(RaceTime) > 0));')
    Left = 696
    Top = 248
    ParamData = <
      item
        Name = 'MEMBERID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 57
      end>
  end
  object cmdFixNullBooleans: TFDCommand
    CommandText.Strings = (
      'USE SwimClubMeet;'
      ''
      'UPDATE [SwimClubMeet].[dbo].[Member]'
      'SET IsActive = CASE'
      '                   WHEN IsActive IS NULL THEN'
      '                       1'
      '                   ELSE'
      '                       IsActive'
      '               END'
      '  , [IsArchived] = CASE'
      '                       WHEN IsArchived IS NULL THEN'
      '                           0'
      '                       ELSE'
      '                           IsArchived'
      '                   END'
      '  , [IsSwimmer] = CASE'
      '                      WHEN IsSwimmer IS NULL THEN'
      '                          1'
      '                      ELSE'
      '                          IsSwimmer'
      '                  END'
      'WHERE IsArchived IS NULL'
      '      OR IsActive IS NULL'
      '      OR IsSwimmer IS NULL'
      ''
      ';')
    Left = 696
    Top = 336
  end
  object dsHRPB: TDataSource
    DataSet = qryHRPB
    Left = 737
    Top = 448
  end
  object qryHRPB: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'HRID'
    Connection = FDTempDesignConnection
    FormatOptions.AssignedValues = [fvFmtDisplayTime]
    FormatOptions.FmtDisplayTime = 'nn:ss.zzz'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'SwimClubMeet..Member'
    UpdateOptions.KeyFields = 'HRID'
    SQL.Strings = (
      'USE SCM_Coach'
      ';'
      ''
      'DECLARE @HRID AS INT'
      'SET @HRID = :HRID'
      ''
      'SELECT '
      '       RaceHistory.HRID'
      '     , RaceHistory.DistanceID'
      '     , RaceHistory.StrokeID'
      '     , RaceTime'
      
        '     , (CONCAT(distance.caption, '#39' '#39', stroke.caption)) AS EventS' +
        'tr'
      'FROM RaceHistory'
      '    INNER JOIN stroke'
      '        ON RaceHistory.strokeID = stroke.strokeID'
      '    INNER JOIN distance'
      '        ON RaceHistory.distanceID = distance.distanceID'
      'WHERE RaceHistory.HRID = @HRID'
      '      AND RaceTime IS NOT NULL'
      'ORDER BY HRID'
      '       , DistanceID'
      '       , StrokeID'
      '       , RaceTime ASC;')
    Left = 649
    Top = 448
    ParamData = <
      item
        Name = 'HRID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryHRPBHRID: TIntegerField
      FieldName = 'HRID'
      Origin = 'HRID'
      Required = True
    end
    object qryHRPBDistanceID: TIntegerField
      FieldName = 'DistanceID'
      Origin = 'DistanceID'
      Required = True
    end
    object qryHRPBStrokeID: TIntegerField
      FieldName = 'StrokeID'
      Origin = 'StrokeID'
      Required = True
    end
    object qryHRPBRaceTime: TTimeField
      FieldName = 'RaceTime'
      Origin = 'RaceTime'
      DisplayFormat = 'nn:ss.zzz'
    end
    object qryHRPBEventStr: TWideStringField
      FieldName = 'EventStr'
      Origin = 'EventStr'
      ReadOnly = True
      Required = True
      Size = 257
    end
  end
  object FDTempDesignConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_SCM_Coach')
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    Left = 112
    Top = 32
  end
  object dsHR: TDataSource
    DataSet = qryHR
    Left = 168
    Top = 120
  end
  object qryHR: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Active = True
    AfterInsert = qryHRAfterInsert
    BeforeDelete = qryHRBeforeDelete
    AfterDelete = qryHRAfterDelete
    AfterScroll = qryHRAfterScroll
    IndexFieldNames = 'HRID'
    DetailFields = 'SwimClubID'
    Connection = FDTempDesignConnection
    UpdateOptions.UpdateTableName = 'SCM_Coach..Member'
    UpdateOptions.KeyFields = 'HRID'
    SQL.Strings = (
      'USE SCM_Coach;'
      ''
      'DECLARE @HideInActive BIT;'
      'DECLARE @HideArchived BIT;'
      '-- DECLARE @HideNonSwimmers BIT;'
      ''
      'SET @HideInActive = :HIDE_INACTIVE;'
      'SET @HideArchived = :HIDE_ARCHIVED;'
      ''
      'SELECT [HRID]'
      '     , [RegisterNum]'
      '     , [RegisterStr]'
      '     , [FirstName]'
      '     , [LastName]'
      '     , [DOB]'
      '     , dbo.SwimmerAge(GETDATE(), [DOB]) AS SwimmerAge'
      '     , [IsActive]'
      '     , IsArchived'
      '     , [Email]'
      '     , [GenderID]'
      '     , [HRTypeID]'
      '     , CONCAT(HR.FirstName, '#39' '#39', UPPER(HR.LastName)) AS FName'
      '     , gradeID'
      '     , CreatedOn'
      '     , ArchivedOn'
      '     , SCMMemberID'
      'FROM [dbo].[HR]'
      'WHERE HRTypeID = 1'
      '      AND'
      '      ('
      '          (IsActive >= CASE'
      '                           WHEN @HideInActive = 1 THEN'
      '                               1'
      '                           ELSE'
      '                               0'
      '                       END'
      '          )'
      '          AND (IsArchived <= CASE'
      '                                 WHEN @HideArchived = 1 THEN'
      '                                     0'
      '                                 ELSE'
      '                                     1'
      '                             END'
      '              )'
      ''
      '          -- mitigates NULL booleans'
      '          OR'
      '          ('
      '              IsArchived IS NULL'
      '              AND @HideArchived = 0'
      '          )'
      '          OR'
      '          ('
      '              IsActive IS NULL'
      '              AND @HideInActive = 0'
      '          )'
      '      );'
      ''
      ''
      ''
      '')
    Left = 64
    Top = 120
    ParamData = <
      item
        Name = 'HIDE_INACTIVE'
        DataType = ftBoolean
        ParamType = ptInput
        Value = False
      end
      item
        Name = 'HIDE_ARCHIVED'
        DataType = ftBoolean
        ParamType = ptInput
        Value = False
      end>
    object qryHRHRID: TFDAutoIncField
      FieldName = 'HRID'
      Origin = 'HRID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryHRRegisterNum: TIntegerField
      FieldName = 'RegisterNum'
      Origin = 'RegisterNum'
    end
    object qryHRRegisterStr: TWideStringField
      FieldName = 'RegisterStr'
      Origin = 'RegisterStr'
      Size = 24
    end
    object qryHRFirstName: TStringField
      FieldName = 'FirstName'
      Origin = 'FirstName'
      FixedChar = True
      Size = 64
    end
    object qryHRLastName: TStringField
      FieldName = 'LastName'
      Origin = 'LastName'
      FixedChar = True
      Size = 64
    end
    object qryHRDOB: TSQLTimeStampField
      FieldName = 'DOB'
      Origin = 'DOB'
    end
    object qryHRSwimmerAge: TIntegerField
      FieldName = 'SwimmerAge'
      Origin = 'SwimmerAge'
      ReadOnly = True
    end
    object qryHRIsActive: TBooleanField
      FieldName = 'IsActive'
      Origin = 'IsActive'
    end
    object qryHRIsArchived: TBooleanField
      FieldName = 'IsArchived'
      Origin = 'IsArchived'
    end
    object qryHREmail: TWideStringField
      FieldName = 'Email'
      Origin = 'Email'
      Size = 256
    end
    object qryHRGenderID: TIntegerField
      FieldName = 'GenderID'
      Origin = 'GenderID'
      Required = True
    end
    object qryHRHRTypeID: TIntegerField
      FieldName = 'HRTypeID'
      Origin = 'HRTypeID'
      Required = True
    end
    object qryHRFName: TStringField
      FieldName = 'FName'
      Origin = 'FName'
      ReadOnly = True
      Required = True
      Size = 129
    end
    object qryHRgradeID: TIntegerField
      FieldName = 'gradeID'
      Origin = 'gradeID'
    end
    object qryHRCreatedOn: TSQLTimeStampField
      FieldName = 'CreatedOn'
      Origin = 'CreatedOn'
    end
    object qryHRArchivedOn: TSQLTimeStampField
      FieldName = 'ArchivedOn'
      Origin = 'ArchivedOn'
    end
    object qryHRSCMMemberID: TIntegerField
      FieldName = 'SCMMemberID'
      Origin = 'SCMMemberID'
    end
    object qryHRluGender: TStringField
      FieldKind = fkLookup
      FieldName = 'luGender'
      LookupDataSet = tblGender
      LookupKeyFields = 'GenderID'
      LookupResultField = 'Caption'
      KeyFields = 'GenderID'
      Lookup = True
    end
  end
end
