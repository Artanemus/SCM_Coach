object ImportSelect: TImportSelect
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'SCM Coach Import Data'
  ClientHeight = 358
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  TextHeight = 21
  object rgrpSelectImport: TRadioGroup
    Left = 16
    Top = 8
    Width = 497
    Height = 302
    Caption = 'Select item to import ...'
    ItemIndex = 0
    Items.Strings = (
      'SwimClubMeet Member(s) profile data. (TCP/IP)'
      'SwimClubMeet Member(s) profile data and racetimes. (TCP/IP)'
      'SwimClubMeet Session Race-times. (TCP/IP)'
      'SwimClubMeet Session export file. (.scm)'
      'SwimClubMeet export to Carnival file. (.scmd)'
      'SCM Canival export to SwimClubMeet file. (.scmd)'
      'SCM Coach Swimmer(s) export file. (.scmc).'
      'HyTek swim meet results file. (.hy3).')
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 319
    Top = 316
    Width = 86
    Height = 34
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnOk: TButton
    Left = 411
    Top = 316
    Width = 86
    Height = 34
    Caption = 'Import'
    TabOrder = 2
    OnClick = btnOkClick
  end
end
