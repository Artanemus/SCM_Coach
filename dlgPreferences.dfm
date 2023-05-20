object Preferences: TPreferences
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Preferences'
  ClientHeight = 736
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 21
  object LogoImage: TImage
    Left = 154
    Top = 208
    Width = 306
    Height = 306
    Center = True
    Proportional = True
    Stretch = True
  end
  object Label1: TLabel
    Left = 264
    Top = 531
    Width = 99
    Height = 21
    Caption = 'Business Logo'
  end
  object Label7: TLabel
    Left = 154
    Top = 608
    Width = 306
    Height = 21
    Alignment = taCenter
    AutoSize = False
    Caption = '(PNG, BMP, JPG - min 400x400 pixels,)'
  end
  object Panel1: TPanel
    Left = 0
    Top = 681
    Width = 657
    Height = 55
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 680
    ExplicitWidth = 610
    DesignSize = (
      657
      55)
    object btnClose: TButton
      Left = 562
      Top = 13
      Width = 75
      Height = 29
      Anchors = [akTop, akRight]
      Caption = 'Close'
      TabOrder = 0
      OnClick = btnCloseClick
      ExplicitLeft = 515
    end
  end
  object DBBusinessName: TDBLabeledEdit
    Left = 144
    Top = 16
    Width = 305
    Height = 29
    DataField = 'BusinessName'
    DataSource = dsSCMCoach
    TabOrder = 1
    EditLabel.Width = 106
    EditLabel.Height = 29
    EditLabel.Caption = 'Business Name'
    EditLabel.Layout = tlCenter
    LabelPosition = lpLeft
    LabelSpacing = 4
  end
  object DBNickName: TDBLabeledEdit
    Left = 144
    Top = 51
    Width = 305
    Height = 29
    DataField = 'NickName'
    DataSource = dsSCMCoach
    TabOrder = 2
    EditLabel.Width = 77
    EditLabel.Height = 29
    EditLabel.Caption = 'Nick Name'
    EditLabel.Layout = tlCenter
    LabelPosition = lpLeft
    LabelSpacing = 4
  end
  object DBEmail: TDBLabeledEdit
    Left = 144
    Top = 86
    Width = 489
    Height = 29
    DataField = 'Email'
    DataSource = dsSCMCoach
    TabOrder = 3
    EditLabel.Width = 98
    EditLabel.Height = 29
    EditLabel.Caption = 'Email Address'
    EditLabel.Layout = tlCenter
    LabelPosition = lpLeft
    LabelSpacing = 4
  end
  object DBContactNum: TDBLabeledEdit
    Left = 144
    Top = 121
    Width = 153
    Height = 29
    DataField = 'ContactNum'
    DataSource = dsSCMCoach
    TabOrder = 4
    EditLabel.Width = 115
    EditLabel.Height = 29
    EditLabel.Caption = 'Contact Number'
    EditLabel.Layout = tlCenter
    LabelPosition = lpLeft
    LabelSpacing = 4
  end
  object DBWesite: TDBLabeledEdit
    Left = 144
    Top = 156
    Width = 489
    Height = 29
    DataField = 'WebSite'
    DataSource = dsSCMCoach
    TabOrder = 5
    EditLabel.Width = 55
    EditLabel.Height = 29
    EditLabel.Caption = 'Website'
    EditLabel.Layout = tlCenter
    LabelPosition = lpLeft
    LabelSpacing = 4
  end
  object btnLoadHouseLogo: TButton
    Left = 270
    Top = 558
    Width = 86
    Height = 33
    Caption = 'Load'
    TabOrder = 6
    OnClick = btnLoadHouseLogoClick
  end
  object qrySCMCoach: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    AfterScroll = qrySCMCoachAfterScroll
    Connection = COACH.coachConnection
    SQL.Strings = (
      'USE SCM_Coach;'
      ''
      'SELECT [SCMCoachID]'
      '     , [BusinessName]'
      '     , [NickName]'
      '     , [Caption]'
      '     , [Email]'
      '     , [ContactNum]'
      '     , [WebSite]'
      '     , [CreatedOn]'
      '     , [ArchivedOn]'
      '     , [LogoDir]'
      '     , [LogoImg]'
      '     , [LogoType]'
      '     , [DictionaryState]'
      '     , [defSessionDir]'
      '     , [defProgramDir]'
      '     , [defExportDir]'
      '     , [defImportDir]'
      'FROM [SCM_Coach].[dbo].[SCMCoach]')
    Left = 66
    Top = 336
    object qrySCMCoachSCMCoachID: TFDAutoIncField
      FieldName = 'SCMCoachID'
      Origin = 'SCMCoachID'
      ReadOnly = True
    end
    object qrySCMCoachBusinessName: TWideStringField
      FieldName = 'BusinessName'
      Origin = 'BusinessName'
      Size = 128
    end
    object qrySCMCoachNickName: TWideStringField
      FieldName = 'NickName'
      Origin = 'NickName'
      Size = 128
    end
    object qrySCMCoachCaption: TWideStringField
      FieldName = 'Caption'
      Origin = 'Caption'
      Size = 128
    end
    object qrySCMCoachEmail: TWideStringField
      FieldName = 'Email'
      Origin = 'Email'
      Size = 128
    end
    object qrySCMCoachContactNum: TWideStringField
      FieldName = 'ContactNum'
      Origin = 'ContactNum'
      Size = 30
    end
    object qrySCMCoachWebSite: TWideStringField
      FieldName = 'WebSite'
      Origin = 'WebSite'
      Size = 256
    end
    object qrySCMCoachCreatedOn: TSQLTimeStampField
      FieldName = 'CreatedOn'
      Origin = 'CreatedOn'
    end
    object qrySCMCoachArchivedOn: TSQLTimeStampField
      FieldName = 'ArchivedOn'
      Origin = 'ArchivedOn'
    end
    object qrySCMCoachLogoDir: TMemoField
      FieldName = 'LogoDir'
      Origin = 'LogoDir'
      OnGetText = qrySCMCoachLogoDirGetText
      BlobType = ftMemo
      Size = 2147483647
    end
    object qrySCMCoachLogoImg: TBlobField
      FieldName = 'LogoImg'
      Origin = 'LogoImg'
    end
    object qrySCMCoachLogoType: TWideStringField
      FieldName = 'LogoType'
      Origin = 'LogoType'
      Size = 5
    end
    object qrySCMCoachDictionaryState: TIntegerField
      FieldName = 'DictionaryState'
      Origin = 'DictionaryState'
    end
    object qrySCMCoachdefSessionDir: TWideMemoField
      FieldName = 'defSessionDir'
      Origin = 'defSessionDir'
      BlobType = ftWideMemo
      Size = 2147483647
    end
    object qrySCMCoachdefProgramDir: TWideMemoField
      FieldName = 'defProgramDir'
      Origin = 'defProgramDir'
      BlobType = ftWideMemo
      Size = 2147483647
    end
    object qrySCMCoachdefExportDir: TWideMemoField
      FieldName = 'defExportDir'
      Origin = 'defExportDir'
      BlobType = ftWideMemo
      Size = 2147483647
    end
    object qrySCMCoachdefImportDir: TWideMemoField
      FieldName = 'defImportDir'
      Origin = 'defImportDir'
      BlobType = ftWideMemo
      Size = 2147483647
    end
  end
  object dsSCMCoach: TDataSource
    DataSet = qrySCMCoach
    Left = 66
    Top = 248
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 
      'All (*.gif;*.jpg;*.jpeg;*.png;*.bmp;*.ico;*.emf;*.wmf;*.tif;*.ti' +
      'ff)|*.gif;*.jpg;*.jpeg;*.png;*.bmp;*.ico;*.emf;*.wmf;*.tif;*.tif' +
      'f|GIF Image (*.gif)|*.gif|JPEG Image File (*.jpg)|*.jpg|JPEG Ima' +
      'ge File (*.jpeg)|*.jpeg|Portable Network Graphics (*.png)|*.png|' +
      'Bitmaps (*.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced Metafiles (*.' +
      'emf)|*.emf|Metafiles (*.wmf)|*.wmf|TIFF Images (*.tif)|*.tif|TIF' +
      'F Images (*.tiff)|*.tiff'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Load SCM House Logo'
    Left = 63
    Top = 421
  end
end
