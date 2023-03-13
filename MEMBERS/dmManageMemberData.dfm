object ManageMemberData: TManageMemberData
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
    Top = 552
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
    Top = 400
  end
  object tblDistance: TFDTable
    ActiveStoredUsage = [auDesignTime]
    Active = True
    IndexFieldNames = 'DistanceID'
    Connection = FDTempDesignConnection
    UpdateOptions.UpdateTableName = 'SwimClubMeet..Distance'
    TableName = 'SwimClubMeet..Distance'
    Left = 64
    Top = 472
  end
  object tblMemberType: TFDTable
    ActiveStoredUsage = [auDesignTime]
    Active = True
    IndexFieldNames = 'MemberTypeID'
    Connection = FDTempDesignConnection
    TableName = 'SCM_Coach..MemberType'
    Left = 64
    Top = 256
  end
  object dsMemberType: TDataSource
    DataSet = tblMemberType
    Left = 168
    Top = 256
  end
  object tblGender: TFDTable
    ActiveStoredUsage = [auDesignTime]
    Active = True
    IndexFieldNames = 'GenderID'
    Connection = FDTempDesignConnection
    UpdateOptions.UpdateTableName = 'SwimClubMeet..Gender'
    TableName = 'SwimClubMeet..Gender'
    Left = 64
    Top = 320
  end
  object dsGender: TDataSource
    DataSet = tblGender
    Left = 168
    Top = 320
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
        Name = 'mcMember_ContactNum'
        Fields = 'MemberID;ContactNumID'
        DescFields = 'ContactNumID'
      end>
    IndexName = 'mcMember_ContactNum'
    MasterFields = 'MemberID'
    DetailFields = 'MemberID'
    Connection = FDTempDesignConnection
    UpdateOptions.UpdateTableName = 'SwimClubMeet..ContactNum'
    UpdateOptions.KeyFields = 'ContactNumID'
    SQL.Strings = (
      'USE [SCM_Coach];'
      ''
      'SELECT ContactNum.ContactNumID'
      #9',ContactNum.Number'
      #9',ContactNum.ContactNumTypeID'
      #9',ContactNum.MemberID'
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
    object qryContactNumMemberID: TIntegerField
      FieldName = 'MemberID'
      Origin = 'MemberID'
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
  end
  object qryFindMember: TFDQuery
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
    Left = 696
    Top = 96
    object qryFindMemberMemberID: TFDAutoIncField
      Alignment = taCenter
      DisplayLabel = '  ID'
      DisplayWidth = 5
      FieldName = 'MemberID'
      Origin = 'MemberID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      DisplayFormat = '0000'
    end
    object qryFindMemberMembershipNum: TIntegerField
      DisplayLabel = 'Num#'
      DisplayWidth = 6
      FieldName = 'MembershipNum'
      Origin = 'MembershipNum'
      DisplayFormat = '##00'
    end
    object qryFindMemberFName: TWideStringField
      DisplayLabel = 'Member'#39's Name'
      DisplayWidth = 160
      FieldName = 'FName'
      Origin = 'FName'
      ReadOnly = True
      Required = True
      Size = 258
    end
    object qryFindMemberdtDOB: TWideStringField
      Alignment = taCenter
      DisplayLabel = '  DOB'
      DisplayWidth = 11
      FieldName = 'dtDOB'
      Origin = 'dtDOB'
      ReadOnly = True
      Size = 4000
    end
    object qryFindMemberAge: TIntegerField
      Alignment = taCenter
      DisplayWidth = 3
      FieldName = 'Age'
      Origin = 'Age'
      ReadOnly = True
      DisplayFormat = '#0'
    end
    object qryFindMemberIsActive: TBooleanField
      DisplayLabel = 'Active'
      DisplayWidth = 6
      FieldName = 'IsActive'
      Origin = 'IsActive'
    end
    object qryFindMembercGender: TWideStringField
      DisplayLabel = 'Gender'
      DisplayWidth = 7
      FieldName = 'cGender'
      Origin = 'cGender'
    end
    object qryFindMembercMembershipType: TWideStringField
      DisplayLabel = 'Membership Type'
      DisplayWidth = 30
      FieldName = 'cMembershipType'
      Origin = 'cMembershipType'
      Size = 64
    end
    object qryFindMemberFirstName: TWideStringField
      FieldName = 'FirstName'
      Origin = 'FirstName'
      Visible = False
      Size = 128
    end
    object qryFindMemberLastName: TWideStringField
      FieldName = 'LastName'
      Origin = 'LastName'
      Visible = False
      Size = 128
    end
    object qryFindMemberGenderID: TIntegerField
      FieldName = 'GenderID'
      Origin = 'GenderID'
      Visible = False
    end
    object qryFindMemberMemberShipTypeID: TIntegerField
      FieldName = 'MemberShipTypeID'
      Origin = 'MemberShipTypeID'
      Visible = False
    end
    object qryFindMemberIsSwimmer: TBooleanField
      FieldName = 'IsSwimmer'
      Origin = 'IsSwimmer'
      Visible = False
    end
  end
  object dsFindMember: TDataSource
    DataSet = qryFindMember
    Left = 782
    Top = 96
  end
  object qAssertMemberID: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'MemberID'
    SQL.Strings = (
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
  object dsMemberPB: TDataSource
    DataSet = qryMemberPB
    Left = 737
    Top = 448
  end
  object qryMemberPB: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'MemberID'
    FormatOptions.AssignedValues = [fvFmtDisplayTime]
    FormatOptions.FmtDisplayTime = 'nn:ss.zzz'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'SwimClubMeet..Member'
    UpdateOptions.KeyFields = 'MemberID'
    SQL.Strings = (
      'USE SwimClubMeet'
      ';'
      ''
      'DECLARE @memberid as int'
      'SET @memberid = :MEMBERID'
      ''
      'SELECT DISTINCT Member.MemberID'
      #9',Distance.DistanceID'
      #9',Stroke.StrokeID'
      
        #9',dbo.PersonalBest(MemberID, DistanceID, StrokeID, GETDATE()) AS' +
        ' PB'
      #9',('
      #9#9'CONCAT ('
      #9#9#9'distance.caption'
      #9#9#9','#39' '#39
      #9#9#9',stroke.caption'
      #9#9#9')'
      #9#9') AS EventStr'
      'FROM Distance'
      'CROSS JOIN Stroke'
      'CROSS JOIN Member'
      
        'WHERE Member.MemberID = @memberid AND dbo.PersonalBest(MemberID,' +
        ' DistanceID, StrokeID, GETDATE()) IS NOT NULL'
      'ORDER BY MemberID'
      #9',DistanceID'
      #9',StrokeID'
      #9',PB ASC'
      ';')
    Left = 649
    Top = 448
    ParamData = <
      item
        Name = 'MEMBERID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryMemberPBEventStr: TWideStringField
      FieldName = 'EventStr'
      Origin = 'EventStr'
      ReadOnly = True
      Required = True
      Size = 257
    end
    object qryMemberPBPB: TTimeField
      FieldName = 'PB'
      Origin = 'PB'
      ReadOnly = True
      DisplayFormat = 'nn:ss.zzz'
    end
    object qryMemberPBMemberID: TFDAutoIncField
      FieldName = 'MemberID'
      Origin = 'MemberID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object qryMemberPBDistanceID: TFDAutoIncField
      FieldName = 'DistanceID'
      Origin = 'DistanceID'
      ReadOnly = True
      Visible = False
    end
    object qryMemberPBStrokeID: TFDAutoIncField
      FieldName = 'StrokeID'
      Origin = 'StrokeID'
      ReadOnly = True
      Visible = False
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
  object dsMember: TDataSource
    DataSet = qryMember
    Left = 168
    Top = 120
  end
  object qryMember: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Active = True
    AfterInsert = qryMemberAfterInsert
    BeforeDelete = qryMemberBeforeDelete
    AfterDelete = qryMemberAfterDelete
    AfterScroll = qryMemberAfterScroll
    IndexFieldNames = 'MemberID'
    DetailFields = 'SwimClubID'
    Connection = FDTempDesignConnection
    UpdateOptions.UpdateTableName = 'SCM_Coach..Member'
    UpdateOptions.KeyFields = 'MemberID'
    SQL.Strings = (
      'USE SCM_Coach;'
      ''
      'DECLARE @HideInActive BIT;'
      'DECLARE @HideArchived BIT;'
      'DECLARE @HideNonSwimmers BIT;'
      ''
      'SET @HideInActive = :HIDE_INACTIVE;'
      'SET @HideArchived = :HIDE_ARCHIVED;'
      ''
      'SELECT [MemberID],'
      '       [RegisterNum],'
      '       [RegisterStr],'
      '       [FirstName],'
      '       [LastName],'
      '       [DOB],'
      '       dbo.SwimmerAge(GETDATE(), [DOB]) AS SwimmerAge,'
      '       [IsActive],'
      '       IsArchived,'
      '       [Email],'
      '       [GenderID],'
      '       [MemberTypeID],'
      
        '       CONCAT(Member.FirstName, '#39' '#39', UPPER(Member.LastName)) AS ' +
        'FName,'
      '       gradeID,'
      '       CreatedOn,'
      '       ArchivedOn'
      'FROM [dbo].[Member]'
      'WHERE (IsActive >= CASE'
      '                       WHEN @HideInActive = 1 THEN'
      '                           1'
      '                       ELSE'
      '                           0'
      '                   END'
      '      )'
      '      AND (IsArchived <= CASE'
      '                             WHEN @HideArchived = 1 THEN'
      '                                 0'
      '                             ELSE'
      '                                 1'
      '                         END'
      '          )'
      '       '
      '-- mitigates NULL booleans'
      '      OR'
      '      ('
      '          IsArchived IS NULL'
      '          AND @HideArchived = 0'
      '      )'
      '      OR'
      '      ('
      '          IsActive IS NULL'
      '          AND @HideInActive = 0'
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
    object qryMemberMemberID: TFDAutoIncField
      FieldName = 'MemberID'
      Origin = 'MemberID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryMemberRegisterNum: TIntegerField
      FieldName = 'RegisterNum'
      Origin = 'RegisterNum'
    end
    object qryMemberRegisterStr: TWideStringField
      FieldName = 'RegisterStr'
      Origin = 'RegisterStr'
      Size = 24
    end
    object qryMemberFirstName: TStringField
      FieldName = 'FirstName'
      Origin = 'FirstName'
      FixedChar = True
      Size = 64
    end
    object qryMemberLastName: TStringField
      FieldName = 'LastName'
      Origin = 'LastName'
      FixedChar = True
      Size = 64
    end
    object qryMemberDOB: TSQLTimeStampField
      FieldName = 'DOB'
      Origin = 'DOB'
    end
    object qryMemberSwimmerAge: TIntegerField
      FieldName = 'SwimmerAge'
      Origin = 'SwimmerAge'
      ReadOnly = True
    end
    object qryMemberIsActive: TBooleanField
      FieldName = 'IsActive'
      Origin = 'IsActive'
    end
    object qryMemberIsArchived: TBooleanField
      FieldName = 'IsArchived'
      Origin = 'IsArchived'
    end
    object qryMemberEmail: TWideStringField
      FieldName = 'Email'
      Origin = 'Email'
      Size = 256
    end
    object qryMemberGenderID: TIntegerField
      FieldName = 'GenderID'
      Origin = 'GenderID'
      Required = True
    end
    object qryMemberMemberTypeID: TIntegerField
      FieldName = 'MemberTypeID'
      Origin = 'MemberTypeID'
    end
    object qryMemberFName: TStringField
      FieldName = 'FName'
      Origin = 'FName'
      ReadOnly = True
      Required = True
      Size = 129
    end
    object qryMembergradeID: TIntegerField
      FieldName = 'gradeID'
      Origin = 'gradeID'
      Required = True
    end
    object qryMemberCreatedOn: TSQLTimeStampField
      FieldName = 'CreatedOn'
      Origin = 'CreatedOn'
    end
    object qryMemberArchivedOn: TSQLTimeStampField
      FieldName = 'ArchivedOn'
      Origin = 'ArchivedOn'
    end
    object qryMemberlugender: TStringField
      FieldKind = fkLookup
      FieldName = 'lugender'
      LookupDataSet = tblGender
      LookupKeyFields = 'GenderID'
      LookupResultField = 'Caption'
      KeyFields = 'GenderID'
      Size = 0
      Lookup = True
    end
  end
end
