object SessionNew: TSessionNew
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'SwimClubMeet Coach Sesssion Builder.'
  ClientHeight = 505
  ClientWidth = 922
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 21
  object Label1: TLabel
    Left = 62
    Top = 28
    Width = 76
    Height = 21
    Caption = 'Pool Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 306
    Top = 28
    Width = 82
    Height = 21
    Caption = 'Pool Metres'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 33
    Top = 75
    Width = 89
    Height = 21
    Caption = 'Session Date'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 20
    Top = 122
    Width = 118
    Height = 21
    Caption = 'Session Duration'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 20
    Top = 149
    Width = 119
    Height = 21
    Caption = '(Hours : Minutes)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 324
    Top = 195
    Width = 51
    Height = 21
    Caption = 'Squads'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 321
    Top = 75
    Width = 89
    Height = 21
    Caption = 'Session Start'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 21
    Top = 195
    Width = 68
    Height = 21
    Caption = 'Programs'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 607
    Top = 195
    Width = 58
    Height = 21
    Caption = 'Coaches'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object DatePicker1: TDatePicker
    Left = 144
    Top = 74
    Date = 44985.000000000000000000
    DateFormat = 'dd/mm/yy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 0
  end
  object DBComboBox1: TDBComboBox
    Left = 144
    Top = 26
    Width = 145
    Height = 29
    TabOrder = 1
  end
  object TimePicker1: TTimePicker
    Left = 144
    Top = 130
    Width = 89
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 2
    Time = 44985.563691250000000000
    TimeFormat = 'HH:mm'
  end
  object ListView1: TListView
    Left = 381
    Top = 195
    Width = 201
    Height = 230
    Columns = <>
    TabOrder = 3
  end
  object TimePicker2: TTimePicker
    Left = 432
    Top = 74
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 4
    Time = 44985.560485127320000000
    TimeFormat = 'h:nn AMPM'
  end
  object ListView2: TListView
    Left = 104
    Top = 195
    Width = 201
    Height = 230
    Columns = <>
    TabOrder = 5
  end
  object ListView3: TListView
    Left = 674
    Top = 195
    Width = 201
    Height = 230
    Columns = <>
    TabOrder = 6
  end
  object Button1: TButton
    Left = 800
    Top = 448
    Width = 75
    Height = 35
    Caption = 'Post'
    TabOrder = 7
  end
  object Button2: TButton
    Left = 674
    Top = 448
    Width = 75
    Height = 35
    Caption = 'Cancel'
    TabOrder = 8
  end
end
