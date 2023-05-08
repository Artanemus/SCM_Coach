object NewSession: TNewSession
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'New Coaching Session'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 21
  object Panel2: TPanel
    Left = 0
    Top = 392
    Width = 624
    Height = 49
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 391
    ExplicitWidth = 620
    object btnCancel: TButton
      Left = 129
      Top = 9
      Width = 79
      Height = 30
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
    end
    object btnPost: TButton
      Left = 214
      Top = 9
      Width = 79
      Height = 30
      Caption = 'Post'
      Default = True
      ModalResult = 1
      TabOrder = 1
      OnClick = btnPostClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 392
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitHeight = 391
    object Label1: TLabel
      Left = 0
      Top = 13
      Width = 112
      Height = 21
      Caption = 'Session Name ...'
    end
    object Label2: TLabel
      Left = 3
      Top = 222
      Width = 89
      Height = 21
      Caption = 'Session Date'
    end
    object Label3: TLabel
      Left = 3
      Top = 77
      Width = 170
      Height = 21
      Caption = 'Description, short note ...'
    end
    object Label4: TLabel
      Left = 0
      Top = 398
      Width = 89
      Height = 21
      Caption = 'Session Type'
    end
    object Label5: TLabel
      Left = 171
      Top = 255
      Width = 61
      Height = 21
      Caption = 'Duration'
    end
    object Label6: TLabel
      Left = 327
      Top = 255
      Width = 66
      Height = 21
      Caption = '(Minutes)'
    end
    object Label7: TLabel
      Left = 3
      Top = 295
      Width = 91
      Height = 21
      Caption = 'Session Time'
    end
    object DatePicker1: TDatePicker
      Left = 3
      Top = 249
      Date = 44163.000000000000000000
      DateFormat = 'd/MM/yyyy'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 0
      Top = 40
      Width = 417
      Height = 29
      DataField = 'Caption'
      TabOrder = 1
    end
    object DBMemo1: TDBMemo
      Left = 0
      Top = 104
      Width = 417
      Height = 112
      TabOrder = 2
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 0
      Top = 425
      Width = 262
      Height = 29
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 238
      Top = 252
      Width = 83
      Height = 29
      TabOrder = 4
    end
    object TimePicker1: TTimePicker
      Left = 3
      Top = 322
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 5
      Time = 44163.440787812500000000
      TimeFormat = 'h:mm AMPM'
    end
  end
  object qrySessionDlg: TFDQuery
    Left = 248
    Top = 80
  end
  object dsSessionDlg: TDataSource
    DataSet = qrySessionDlg
    Left = 336
    Top = 80
  end
end
