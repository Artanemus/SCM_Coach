object SquadNewTemplate: TSquadNewTemplate
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'New Squad Template'
  ClientHeight = 296
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 21
  object Label1: TLabel
    Left = 48
    Top = 43
    Width = 42
    Height = 21
    Alignment = taRightJustify
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 16
    Top = 78
    Width = 74
    Height = 21
    Alignment = taRightJustify
    Caption = 'Nick name'
  end
  object Label3: TLabel
    Left = 52
    Top = 113
    Width = 38
    Height = 21
    Alignment = taRightJustify
    Caption = 'Color'
  end
  object Label4: TLabel
    Left = 61
    Top = 149
    Width = 29
    Height = 21
    Alignment = taRightJustify
    Caption = 'Icon'
  end
  object VirtualImage1: TVirtualImage
    Left = 96
    Top = 138
    Width = 48
    Height = 48
    ImageWidth = 0
    ImageHeight = 0
    ImageIndex = -1
  end
  object Label5: TLabel
    Left = 75
    Top = 8
    Width = 15
    Height = 21
    Alignment = taRightJustify
    Caption = 'ID'
  end
  object DBText1: TDBText
    Left = 96
    Top = 8
    Width = 65
    Height = 17
  end
  object DBEdit1: TDBEdit
    Left = 96
    Top = 40
    Width = 336
    Height = 29
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 96
    Top = 75
    Width = 177
    Height = 29
    TabOrder = 1
  end
  object ColorBox1: TColorBox
    Left = 96
    Top = 110
    Width = 145
    Height = 22
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 232
    Width = 440
    Height = 64
    Align = alBottom
    BevelEdges = [beTop]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 628
    object Button2: TButton
      Left = 125
      Top = 15
      Width = 92
      Height = 32
      Caption = 'Cancel'
      TabOrder = 0
    end
    object Button1: TButton
      Left = 223
      Top = 15
      Width = 92
      Height = 32
      Caption = 'OK'
      TabOrder = 1
    end
  end
end
