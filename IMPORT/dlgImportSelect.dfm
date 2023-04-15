object ImportSelect: TImportSelect
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'SCM Coach Import Data'
  ClientHeight = 247
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 21
  object rgrpSelectImport: TRadioGroup
    Left = 16
    Top = 8
    Width = 497
    Height = 169
    Caption = 'Select item to import ...'
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 335
    Top = 196
    Width = 86
    Height = 34
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnOk: TButton
    Left = 427
    Top = 196
    Width = 86
    Height = 34
    Caption = 'Import'
    TabOrder = 2
    OnClick = btnOkClick
  end
  object rbtnSCMServer: TRadioButton
    Left = 40
    Top = 48
    Width = 305
    Height = 25
    Caption = 'SwimClubMeet (connect to server.)'
    Checked = True
    TabOrder = 3
    TabStop = True
  end
  object rbtnSCMFile: TRadioButton
    Tag = 1
    Left = 40
    Top = 92
    Width = 273
    Height = 26
    Caption = 'SwimClubMeet export file. (.scm)'
    Enabled = False
    TabOrder = 4
  end
  object rbtnHyTek: TRadioButton
    Tag = 2
    Left = 40
    Top = 133
    Width = 273
    Height = 25
    Caption = 'HyTek swim meet results file. (.hy3).'
    Enabled = False
    TabOrder = 5
  end
end
