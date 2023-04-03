object ImportSelect: TImportSelect
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'SCM Coach Import Data'
  ClientHeight = 206
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
    Height = 129
    Caption = 'Select item to import ...'
    ItemIndex = 0
    Items.Strings = (
      'SwimClubMeet. (Connect to server.)'
      'SwimClubMeet export file. (.scm)'
      'HyTek swim meet results file. (.hy3).')
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 335
    Top = 156
    Width = 86
    Height = 34
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnOk: TButton
    Left = 427
    Top = 156
    Width = 86
    Height = 34
    Caption = 'Import'
    TabOrder = 2
    OnClick = btnOkClick
  end
end
