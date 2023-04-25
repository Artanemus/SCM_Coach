object HRData: THRData
  OnCreate = DataModuleCreate
  Height = 718
  Width = 603
  object tblContactNumType: TFDTable
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'ContactNumTypeID'
    Connection = COACH.coachConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'SCM_Coach..ContactNumType'
    TableName = 'SCM_Coach..ContactNumType'
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
    IndexFieldNames = 'StrokeID'
    Connection = COACH.coachConnection
    UpdateOptions.UpdateTableName = 'SCM_Coach..Stroke'
    TableName = 'SCM_Coach..Stroke'
    Left = 64
    Top = 464
  end
  object tblDistance: TFDTable
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'DistanceID'
    Connection = COACH.coachConnection
    UpdateOptions.UpdateTableName = 'SCM_Coach..Distance'
    TableName = 'SCM_Coach..Distance'
    Left = 64
    Top = 536
  end
  object tblHRType: TFDTable
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'HRTypeID'
    Connection = COACH.coachConnection
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
    IndexFieldNames = 'GenderID'
    Connection = COACH.coachConnection
    UpdateOptions.UpdateTableName = 'SCM_Coach..Gender'
    TableName = 'SCM_Coach..Gender'
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
    Indexes = <
      item
        Active = True
        Selected = True
        Name = 'indx_ContactNum'
        Fields = 'HRID;ContactNumID'
        DescFields = 'ContactNumID'
      end>
    IndexName = 'indx_ContactNum'
    MasterSource = dsHR
    MasterFields = 'HRID'
    Connection = COACH.coachConnection
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
  object cmdFixNullBooleans: TFDCommand
    Connection = COACH.coachConnection
    CommandText.Strings = (
      'USE SCM_Coach;'
      ''
      'UPDATE [SCM_Coach].[dbo].[HR]'
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
      'WHERE IsArchived IS NULL'
      '      OR IsActive IS NULL'
      ''
      ';')
    ActiveStoredUsage = [auDesignTime]
    Left = 432
    Top = 112
  end
  object dsHRPB: TDataSource
    DataSet = qryHRPB
    Left = 473
    Top = 224
  end
  object qryHRPB: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'HRID'
    MasterSource = dsHR
    MasterFields = 'HRID'
    Connection = COACH.coachConnection
    FormatOptions.AssignedValues = [fvFmtDisplayDateTime, fvFmtDisplayTime]
    FormatOptions.FmtDisplayDateTime = 'nn:ss.zzz'
    FormatOptions.FmtDisplayTime = 'nn:ss.zzz'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'SCM_Coach..HR'
    UpdateOptions.KeyFields = 'HRID'
    SQL.Strings = (
      'USE SCM_Coach;'
      ''
      'DECLARE @hrid AS INT;'
      'SET @hrid = :HRID'
      ''
      'SELECT DISTINCT'
      '       HR.HRID'
      '     , Distance.DistanceID'
      '     , Stroke.StrokeID'
      
        '     , dbo.PersonalBest(HRID, DistanceID, StrokeID, GETDATE()) A' +
        'S PB'
      
        '     , (CONCAT(distance.caption, '#39' '#39', stroke.caption)) AS EventS' +
        'tr'
      'FROM Distance'
      '    CROSS JOIN Stroke'
      '    CROSS JOIN HR'
      'WHERE HR.HRID = @hrid'
      
        '      AND dbo.PersonalBest(HRID, DistanceID, StrokeID, GETDATE()' +
        ') <> '#39'00:00:00'#39
      'ORDER BY HRID'
      '       , DistanceID'
      '       , StrokeID'
      '       , PB ASC;')
    Left = 385
    Top = 224
    ParamData = <
      item
        Name = 'HRID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 230
      end>
    object qryHRPBHRID: TFDAutoIncField
      FieldName = 'HRID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryHRPBDistanceID: TFDAutoIncField
      FieldName = 'DistanceID'
      ReadOnly = True
    end
    object qryHRPBStrokeID: TFDAutoIncField
      FieldName = 'StrokeID'
      ReadOnly = True
    end
    object qryHRPBPB: TTimeField
      FieldName = 'PB'
      ReadOnly = True
      DisplayFormat = 'nn:ss.zzz'
    end
    object qryHRPBEventStr: TWideStringField
      FieldName = 'EventStr'
      ReadOnly = True
      Required = True
      Size = 257
    end
  end
  object dsHR: TDataSource
    DataSet = qryHR
    Left = 168
    Top = 120
  end
  object qryHR: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    AfterInsert = qryHRAfterInsert
    BeforeDelete = qryHRBeforeDelete
    AfterDelete = qryHRAfterDelete
    AfterScroll = qryHRAfterScroll
    IndexFieldNames = 'HRID'
    DetailFields = 'HRID'
    Connection = COACH.coachConnection
    UpdateOptions.UpdateTableName = 'SCM_Coach..HR'
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
      
        '     , CONCAT(TRIM(HR.FirstName), '#39' '#39', TRIM(HR.MiddleInitial), '#39 +
        ' '#39',UPPER(TRIM(HR.LastName))) AS FName'
      '     , gradeID'
      '     , CreatedOn'
      '     , ArchivedOn'
      '     , SCMMemberID'
      'FROM [dbo].[HR]'
      'WHERE HRTypeID = 3'
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
