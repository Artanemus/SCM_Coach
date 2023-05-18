object FindSessionKeyword: TFindSessionKeyword
  Left = 0
  Top = 0
  Caption = 'Find Session by Keyword.'
  ClientHeight = 639
  ClientWidth = 830
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 591
    Width = 830
    Height = 48
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 394
    ExplicitWidth = 624
    DesignSize = (
      830
      48)
    object btnOk: TButton
      Left = 751
      Top = 9
      Width = 75
      Height = 29
      Anchors = [akTop, akRight]
      Caption = 'btnOk'
      TabOrder = 0
      ExplicitLeft = 681
    end
    object btnCancel: TButton
      Left = 655
      Top = 9
      Width = 75
      Height = 29
      Anchors = [akTop, akRight]
      Caption = 'btnCancel'
      TabOrder = 1
      ExplicitLeft = 585
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 830
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 16
    ExplicitTop = 8
    ExplicitWidth = 185
    DesignSize = (
      830
      41)
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 68
      Height = 21
      Caption = 'Keywords'
    end
    object Edit1: TEdit
      Left = 90
      Top = 7
      Width = 736
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'Edit1'
      ExplicitWidth = 666
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 830
    Height = 550
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitLeft = 224
    ExplicitTop = 216
    ExplicitWidth = 185
    ExplicitHeight = 41
    object DBListBox1: TDBListBox
      Left = 0
      Top = 0
      Width = 209
      Height = 550
      Align = alLeft
      DataField = 'Caption'
      DataSource = dsFindSession
      ItemHeight = 21
      TabOrder = 0
      ExplicitHeight = 493
    end
    object PageControl1: TPageControl
      Left = 209
      Top = 0
      Width = 621
      Height = 550
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 193
      ExplicitWidth = 431
      ExplicitHeight = 352
      object TabSheet1: TTabSheet
        Caption = 'PlayScript'
      end
    end
  end
  object qryFindSession: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'SessionID'
    Connection = COACH.coachConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'USE SCM_Coach;'
      'SELECT * FROM Session;')
    Left = 80
    Top = 152
  end
  object dsFindSession: TDataSource
    DataSet = qryFindSession
    Left = 80
    Top = 217
  end
end
