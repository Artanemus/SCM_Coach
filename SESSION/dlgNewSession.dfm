object NewSession: TNewSession
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'New Coaching Session'
  ClientHeight = 577
  ClientWidth = 420
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
    Top = 528
    Width = 420
    Height = 49
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 527
    ExplicitWidth = 416
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
    Height = 528
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 3
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
      Top = 374
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
    object Label8: TLabel
      Left = 268
      Top = 467
      Width = 140
      Height = 21
      Caption = 'Pool Metres+ABREV'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 0
      Top = 436
      Width = 109
      Height = 21
      Caption = 'Swimming Pool'
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
      Top = 401
      Width = 262
      Height = 29
      DataField = 'SessionTypeID'
      DataSource = dsSession
      KeyField = 'SessionTypeID'
      ListField = 'Caption'
      ListSource = dsSessionType
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
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 0
      Top = 463
      Width = 262
      Height = 29
      TabOrder = 6
    end
  end
  object qrySession: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Connection = COACH.coachConnection
    SQL.Strings = (
      '  USE SCM_Coach;'
      '  '
      '  SELECT  '
      '  SessionID        '
      '    ,Caption        '
      '    ,FileName        '
      '    ,CreatedOn      '
      '    ,ModifiedOn      '
      '    ,lanesBooked     '
      '    ,timeBooked       '
      '    ,startDateTime   '
      '    ,endDateTime  '
      '    ,KMswum  '
      '    ,PoolID  '
      '    ,SCMCoachID '
      '    ,SessionTypeID'
      '  FROM dbo.Session;')
    Left = 248
    Top = 80
  end
  object dsSession: TDataSource
    DataSet = qrySession
    Left = 336
    Top = 80
  end
  object tblSessionType: TFDTable
    ActiveStoredUsage = [auDesignTime]
    IndexFieldNames = 'SessionTypeID'
    Connection = COACH.coachConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    TableName = 'SCM_Coach.dbo.SessionType'
    Left = 248
    Top = 304
  end
  object dsSessionType: TDataSource
    DataSet = tblSessionType
    Left = 328
    Top = 304
  end
end
