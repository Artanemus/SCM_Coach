object SwimmingPools: TSwimmingPools
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Swimming Pools'
  ClientHeight = 784
  ClientWidth = 763
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 732
    Width = 763
    Height = 52
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 731
    ExplicitWidth = 759
    DesignSize = (
      763
      52)
    object btnClose: TButton
      Left = 651
      Top = 11
      Width = 85
      Height = 30
      Anchors = [akTop, akRight]
      Caption = 'Close'
      TabOrder = 0
      ExplicitLeft = 647
    end
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 14
      Width = 640
      Height = 25
      DataSource = dsPool
      TabOrder = 1
    end
  end
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 0
    Top = 0
    Width = 763
    Height = 732
    Align = alClient
    DataSource = dsPool
    PanelHeight = 91
    PanelWidth = 746
    TabOrder = 1
    RowCount = 8
    ExplicitWidth = 759
    ExplicitHeight = 731
    object Label1: TLabel
      Left = 36
      Top = 16
      Width = 76
      Height = 21
      Alignment = taRightJustify
      Caption = 'Pool Name'
    end
    object Label2: TLabel
      Left = 35
      Top = 51
      Width = 77
      Height = 21
      Alignment = taRightJustify
      Caption = 'Nick Name'
    end
    object Label3: TLabel
      Left = 472
      Top = 16
      Width = 40
      Height = 21
      Alignment = taRightJustify
      Caption = 'Lanes'
    end
    object Label4: TLabel
      Left = 446
      Top = 51
      Width = 66
      Height = 21
      Alignment = taRightJustify
      Caption = 'Pool Type'
    end
    object DBEdit1: TDBEdit
      Left = 118
      Top = 13
      Width = 299
      Height = 29
      DataField = 'PoolStr'
      DataSource = dsPool
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 118
      Top = 48
      Width = 299
      Height = 29
      DataSource = dsPool
      Enabled = False
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 518
      Top = 13
      Width = 56
      Height = 29
      DataField = 'Lanes'
      DataSource = dsPool
      TabOrder = 2
    end
    object DBComboBox1: TDBComboBox
      Left = 518
      Top = 48
      Width = 195
      Height = 29
      DataField = 'luPoolType'
      DataSource = dsPool
      TabOrder = 3
    end
    object DBCheckBox1: TDBCheckBox
      Left = 616
      Top = 19
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Archived'
      DataSource = dsPool
      Enabled = False
      TabOrder = 4
    end
  end
  object qryPool: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Connection = COACH.coachConnection
    SQL.Strings = (
      '   USE SCM_Coach;'
      '   '
      '   SELECT PoolID'
      '   ,Caption AS PoolStr'
      '   ,Lanes'
      '   ,PoolTypeID'
      '    FROM dbo.Pool;')
    Left = 144
    Top = 96
    object qryPoolPoolID: TFDAutoIncField
      FieldName = 'PoolID'
      Origin = 'PoolID'
      ReadOnly = True
    end
    object qryPoolPoolStr: TWideStringField
      FieldName = 'PoolStr'
      Origin = 'PoolStr'
      Size = 128
    end
    object qryPoolLanes: TStringField
      FieldName = 'Lanes'
      Origin = 'Lanes'
      FixedChar = True
      Size = 10
    end
    object qryPoolPoolTypeID: TIntegerField
      FieldName = 'PoolTypeID'
      Origin = 'PoolTypeID'
      Required = True
    end
    object qryPoolluPoolType: TStringField
      FieldKind = fkLookup
      FieldName = 'luPoolType'
      LookupDataSet = tblPoolType
      LookupKeyFields = 'PoolTypeID'
      LookupResultField = 'Caption'
      KeyFields = 'PoolTypeID'
      Size = 0
      Lookup = True
    end
  end
  object tblPoolType: TFDTable
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'PoolTypeID'
    Connection = COACH.coachConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'SCM_Coach.dbo.PoolType'
    TableName = 'SCM_Coach.dbo.PoolType'
    Left = 144
    Top = 152
  end
  object dsPool: TDataSource
    DataSet = qryPool
    Left = 240
    Top = 96
  end
  object dsPoolType: TDataSource
    DataSet = tblPoolType
    Left = 240
    Top = 152
  end
end
