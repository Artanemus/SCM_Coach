object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'FINA Disqualification Codes'
  ClientHeight = 687
  ClientWidth = 874
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'DisqualificationCodes'
  Font.Style = []
  TextHeight = 18
  object frxPreview1: TfrxPreview
    Left = 0
    Top = 0
    Width = 874
    Height = 625
    Align = alClient
    OutlineVisible = True
    OutlineWidth = 121
    ThumbnailVisible = False
    FindFmVisible = False
    UseReportHints = True
    HideScrolls = False
    ExplicitWidth = 691
    ExplicitHeight = 462
  end
  object Panel1: TPanel
    Left = 0
    Top = 625
    Width = 874
    Height = 62
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
    ExplicitTop = 462
    ExplicitWidth = 691
    DesignSize = (
      874
      62)
    object Button1: TButton
      Left = 687
      Top = 16
      Width = 80
      Height = 29
      Anchors = [akTop, akRight]
      Caption = 'Print PDF'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 773
      Top = 16
      Width = 80
      Height = 29
      Anchors = [akTop, akRight]
      Caption = 'Close'
      TabOrder = 1
    end
  end
  object frxReport1: TfrxReport
    Version = '6.6.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45061.461690324070000000
    ReportOptions.LastChange = 45061.461690324070000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 200
    Top = 248
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDS'
    CloseDataSource = False
    DataSet = qryDisqualifyCode
    BCDToCurrency = False
    Left = 264
    Top = 328
  end
  object qryDisqualifyCode: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Active = True
    IndexFieldNames = 'DisqualifyCodeID'
    Connection = COACH.coachConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'USE SCM_Coach;'
      ''
      'SELECT DisqualifyCodeID'
      ', DisqualifyCode.DisqualifyTypeID'
      ', DisqualifyCode.Caption AS CodeStr'
      ',DisqualifyCode.ABREV'
      ',DisqualifyType.Caption AS TypeStr'
      ' FROM dbo.DisqualifyCode'
      
        'LEFT JOIN dbo.DisqualifyType ON DisqualifyCode.DisqualifyTypeID ' +
        '= DisqualifyType.DisqualifyTypeID'
      'ORDER BY DisqualifyCode.DisqualifyTypeID'
      ';')
    Left = 144
    Top = 328
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 400
    Top = 256
  end
end
