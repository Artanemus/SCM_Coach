object FindPlayscript: TFindPlayscript
  Left = 0
  Top = 0
  Caption = 'Find Playscript'
  ClientHeight = 740
  ClientWidth = 871
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 692
    Width = 871
    Height = 48
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 691
    ExplicitWidth = 867
    DesignSize = (
      871
      48)
    object btnOk: TButton
      Left = 784
      Top = 9
      Width = 75
      Height = 29
      Anchors = [akTop, akRight]
      Caption = 'btnOk'
      TabOrder = 0
      ExplicitLeft = 780
    end
    object btnCancel: TButton
      Left = 688
      Top = 9
      Width = 75
      Height = 29
      Anchors = [akTop, akRight]
      Caption = 'btnCancel'
      TabOrder = 1
      ExplicitLeft = 684
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 871
    Height = 129
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 867
    DesignSize = (
      871
      129)
    object Label1: TLabel
      Left = 41
      Top = 82
      Width = 37
      Height = 21
      Alignment = taRightJustify
      Caption = 'TAGS'
    end
    object Label2: TLabel
      Left = 39
      Top = 12
      Width = 39
      Height = 21
      Alignment = taRightJustify
      Caption = 'Goals'
    end
    object Label3: TLabel
      Left = 7
      Top = 47
      Width = 71
      Height = 21
      Alignment = taRightJustify
      Caption = 'Outcomes'
    end
    object Edit1: TEdit
      Left = 84
      Top = 79
      Width = 775
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'Edit1'
    end
    object DBComboBox1: TDBComboBox
      Left = 84
      Top = 9
      Width = 233
      Height = 29
      DataSource = dsPlayscriptGoal
      TabOrder = 1
    end
    object DBComboBox2: TDBComboBox
      Left = 84
      Top = 44
      Width = 233
      Height = 29
      TabOrder = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 129
    Width = 871
    Height = 563
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 867
    ExplicitHeight = 562
    object DBListBox1: TDBListBox
      Left = 0
      Top = 0
      Width = 209
      Height = 563
      Align = alLeft
      DataField = 'Caption'
      ItemHeight = 21
      TabOrder = 0
      ExplicitHeight = 562
    end
    object PageControl1: TPageControl
      Left = 209
      Top = 0
      Width = 662
      Height = 563
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 658
      ExplicitHeight = 562
      object TabSheet1: TTabSheet
        Caption = 'PlayScript'
      end
    end
  end
  object qryFindPlayscript: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'SessionID'
    Connection = COACH.coachConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'USE SCM_Coach;'
      'SELECT * FROM Playscript;')
    Left = 80
    Top = 152
  end
  object dsFindPlayscript: TDataSource
    DataSet = qryFindPlayscript
    Left = 80
    Top = 217
  end
  object qryPlayscriptGoal: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Connection = COACH.coachConnection
    Left = 320
    Top = 376
  end
  object dsPlayscriptGoal: TDataSource
    DataSet = qryPlayscriptGoal
    Left = 464
    Top = 376
  end
  object qryPlayscriptOutcomes: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Connection = COACH.coachConnection
    Left = 320
    Top = 456
  end
  object dsPlayscriptOutcomes: TDataSource
    DataSet = qryPlayscriptOutcomes
    Left = 464
    Top = 456
  end
end
