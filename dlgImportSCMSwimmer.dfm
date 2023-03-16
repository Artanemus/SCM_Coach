object ImportSCMSwimmer: TImportSCMSwimmer
  Left = 0
  Top = 0
  Caption = 'ImportSCMSwimmer'
  ClientHeight = 577
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 21
  object VirtualImage1: TVirtualImage
    Left = 288
    Top = 88
    Width = 48
    Height = 48
    ImageWidth = 0
    ImageHeight = 0
    ImageIndex = -1
  end
  object VirtualImage2: TVirtualImage
    Left = 288
    Top = 142
    Width = 48
    Height = 48
    ImageWidth = 0
    ImageHeight = 0
    ImageIndex = -1
  end
  object VirtualImage3: TVirtualImage
    Left = 288
    Top = 196
    Width = 48
    Height = 48
    ImageWidth = 0
    ImageHeight = 0
    ImageIndex = -1
  end
  object VirtualImage4: TVirtualImage
    Left = 288
    Top = 250
    Width = 48
    Height = 48
    ImageWidth = 0
    ImageHeight = 0
    ImageIndex = -1
  end
  object VirtualImage5: TVirtualImage
    Left = 8
    Top = 16
    Width = 48
    Height = 48
    ImageWidth = 0
    ImageHeight = 0
    ImageIndex = -1
  end
  object ListViewA: TListView
    Left = 8
    Top = 88
    Width = 257
    Height = 409
    Columns = <
      item
        Caption = 'SCM Swimmer'
      end>
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsList
    OnDragDrop = ListViewADragDrop
    OnDragOver = ListViewADragOver
  end
  object ListViewB: TListView
    Left = 359
    Top = 88
    Width = 257
    Height = 409
    Columns = <>
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
  end
  object Button1: TButton
    Left = 312
    Top = 528
    Width = 131
    Height = 33
    Caption = 'OK'
    TabOrder = 2
  end
  object Button2: TButton
    Left = 168
    Top = 528
    Width = 131
    Height = 33
    Caption = 'Cancel'
    TabOrder = 3
  end
  object edtSearch: TEdit
    Left = 62
    Top = 16
    Width = 203
    Height = 29
    Hint = 'Search'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = 'edtSearch'
  end
  object myConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_SwimClubMeet')
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    Left = 456
    Top = 120
  end
  object ImageCollection1: TImageCollection
    Images = <>
    Left = 456
    Top = 184
  end
  object qrySCMSwimmer: TFDQuery
    Connection = myConnection
    SQL.Strings = (
      'USE SwimClubMeet;'
      ''
      'SELECT '
      ''
      'MemberID'
      ',FirstName'
      ',LastName'
      ',CONCAT([FirstName],'#39' '#39',UPPER(LastName)) AS FNAME'
      ''
      'FROM Member WHERE IsSwimmer = 1;')
    Left = 456
    Top = 248
  end
  object FDCommand1: TFDCommand
    Connection = myConnection
    Left = 456
    Top = 320
  end
end
