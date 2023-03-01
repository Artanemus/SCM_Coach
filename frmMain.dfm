object Main: TMain
  Left = 0
  Top = 0
  Caption = 'SwimClubMeet Coach'
  ClientHeight = 996
  ClientWidth = 1355
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 21
  object ActionMainMenuBar1: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 1355
    Height = 42
    UseSystemFont = False
    ActionManager = ActionManager1
    Caption = 'ActionMainMenuBar1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 7171437
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Spacing = 10
    ExplicitWidth = 780
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 42
    Width = 1355
    Height = 954
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 946
    ExplicitHeight = 668
    object TabSheet1: TTabSheet
      Caption = 'Sessions'
      object Label1: TLabel
        Left = 0
        Top = 56
        Width = 45
        Height = 141
        Alignment = taRightJustify
        Caption = 'SESSIONS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Segoe UI'
        Font.Orientation = 900
        Font.Style = []
        ParentFont = False
      end
      object ListView1: TListView
        Left = 56
        Top = 15
        Width = 361
        Height = 617
        Columns = <>
        TabOrder = 0
      end
      object btnNewSession: TButton
        Left = 432
        Top = 56
        Width = 121
        Height = 33
        Caption = 'New Session'
        TabOrder = 1
        OnClick = btnNewSessionClick
      end
      object Button1: TButton
        Left = 432
        Top = 112
        Width = 121
        Height = 33
        Caption = 'Edit Session'
        TabOrder = 2
        OnClick = btnNewSessionClick
      end
      object Button2: TButton
        Left = 432
        Top = 164
        Width = 121
        Height = 33
        Caption = 'Delete Session'
        TabOrder = 3
        OnClick = btnNewSessionClick
      end
      object Button3: TButton
        Left = 432
        Top = 224
        Width = 121
        Height = 33
        Caption = 'Clone Session'
        TabOrder = 4
        OnClick = btnNewSessionClick
      end
      object Button4: TButton
        Left = 432
        Top = 288
        Width = 121
        Height = 33
        Caption = 'Session Report'
        TabOrder = 5
        OnClick = btnNewSessionClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Programs'
      ImageIndex = 1
      object RelativePanel1: TRelativePanel
        Left = 0
        Top = 0
        Width = 1347
        Height = 918
        ControlCollection = <
          item
            Control = Splitter1
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = RichEdit1
          end
          item
            Control = Memo2
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
          end
          item
            Control = RichEdit1
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
          end>
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 152
        ExplicitTop = 216
        ExplicitWidth = 185
        ExplicitHeight = 41
        object Splitter1: TSplitter
          Left = 1
          Top = 369
          Width = 1410
          Height = 16
          Align = alNone
        end
        object Memo2: TMemo
          Left = 1
          Top = 738
          Width = 1410
          Height = 179
          Lines.Strings = (
            'Memo1')
          TabOrder = 0
        end
        object RichEdit1: TRichEdit
          Left = 1
          Top = 1
          Width = 1345
          Height = 368
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          Lines.Strings = (
            'RichEdit1')
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = File_Exit
                Caption = '&Exit'
              end>
            Caption = '&File'
          end
          item
            Items = <
              item
                Action = File_Swimmers
                Caption = '&Swimmers...'
              end>
            Caption = '&Squad'
          end>
      end
      item
        Items = <
          item
            Items = <
              item
                Action = File_Connect
                Caption = '&Connect...'
              end
              item
                Caption = '-'
              end
              item
                Action = File_Import
                Caption = '&Import...'
                ImageIndex = 1
                ImageName = 'Import'
              end
              item
                Action = File_Export
                Caption = '&Export...'
                ImageIndex = 2
                ImageName = 'Export'
              end
              item
                Caption = '-'
              end
              item
                Action = File_Exit
                Caption = 'E&xit'
              end>
            Caption = '&File'
            ImageIndex = 0
            ImageName = 'MenuDots'
          end
          item
            Items = <
              item
                Action = File_Coaches
                Caption = '&Coaches...'
              end
              item
                Action = File_Swimmers
                Caption = '&Swimmers...'
              end
              item
                Caption = '-'
              end
              item
                Action = Edit_Preferences
                Caption = '&Preferences...'
              end>
            Caption = '&Edit'
            ImageIndex = 0
            ImageName = 'MenuDots'
          end
          item
            Items = <
              item
                Action = Session_New
                Caption = '&New Session...'
              end
              item
                Action = Session_Edit
                Caption = '&Edit Session...'
              end
              item
                Action = Session_Delete
                Caption = '&Delete Session...'
              end
              item
                Action = Session_Clone
                Caption = '&Clone Session...'
              end>
            Caption = '&Session'
            ImageIndex = 0
            ImageName = 'MenuDots'
          end
          item
            Items = <
              item
                Action = Squad_New
                Caption = '&New Squad...'
              end
              item
                Action = Squad_Edit
                Caption = '&Edit Squad...'
              end
              item
                Action = Squad_Delete
                Caption = '&Delete Squad...'
              end>
            Caption = 'S&quads'
            ImageIndex = 0
            ImageName = 'MenuDots'
          end
          item
            Items = <
              item
                Action = Programs_New
                Caption = '&New Program...'
              end
              item
                Action = Programs_Edit
                Caption = '&Edit Program...'
              end
              item
                Action = Programs_Delete
                Caption = '&Delete Program...'
              end
              item
                Action = Programs_Clone
                Caption = '&Clone Program...'
              end>
            Caption = '&Programs'
            ImageIndex = 0
            ImageName = 'MenuDots'
          end
          item
            Items = <
              item
                Action = Reports_Session
              end>
            Caption = 'Rep&orts'
            ImageIndex = 0
            ImageName = 'MenuDots'
          end
          item
            Items = <
              item
                Action = Stats_Session
                Caption = '&Session Stats...'
              end
              item
                Action = Stats_Swimmer
                Caption = 'S&wimmer Stats...'
              end
              item
                Action = Stats_Performance
                Caption = '&Performance charts...'
              end>
            Caption = '&Analytics'
            ImageIndex = 0
            ImageName = 'MenuDots'
          end
          item
            Items = <
              item
                Action = Tools_Drills
                Caption = '&Drills...'
              end
              item
                Action = Tools_Intensity
                Caption = '&Intensity and Pace...'
              end
              item
                Action = Tools_PoolEquipment
                Caption = '&Pool_Equipment...'
              end
              item
                Action = Tools_Distance
                Caption = 'Di&stances...'
              end
              item
                Action = Tools_Strokes
                Caption = 'S&trokes...'
              end>
            Caption = 'Te&rms'
            ImageIndex = 0
            ImageName = 'MenuDots'
          end
          item
            Items = <
              item
                Action = Tools_Pools
                Caption = '&Pools...'
              end
              item
                Action = Tools_Dictionary
                Caption = '&Dictionary...'
              end
              item
                Action = Tools_StopWatches
                Caption = '&Stop Watches...'
              end
              item
                Action = Tools_Timed
                Caption = '&Timed Events...'
              end>
            Caption = '&Tools'
            ImageIndex = 0
            ImageName = 'MenuDots'
          end>
        ActionBar = ActionMainMenuBar1
      end>
    Images = virtImageListMenu
    Left = 664
    Top = 368
    StyleName = 'Platform Default'
    object File_Coaches: TAction
      Category = 'Edit'
      Caption = 'Coaches...'
    end
    object File_Swimmers: TAction
      Category = 'Edit'
      Caption = 'Swimmers...'
    end
    object Session_New: TAction
      Category = 'Session'
      Caption = 'New Session...'
    end
    object Session_Edit: TAction
      Category = 'Session'
      Caption = 'Edit Session...'
    end
    object Session_Delete: TAction
      Category = 'Session'
      Caption = 'Delete Session...'
    end
    object File_Connect: TAction
      Category = 'File'
      Caption = 'Connect...'
    end
    object File_Import: TAction
      Category = 'File'
      Caption = 'Import...'
      ImageIndex = 1
      ImageName = 'Import'
    end
    object File_Export: TAction
      Category = 'File'
      Caption = 'Export...'
      ImageIndex = 2
      ImageName = 'Export'
    end
    object File_Exit: TAction
      Category = 'File'
      Caption = 'Exit'
    end
    object Squad_New: TAction
      Category = 'Squads'
      Caption = 'New Squad...'
    end
    object Session_Clone: TAction
      Category = 'Session'
      Caption = 'Clone Session...'
    end
    object Squad_Edit: TAction
      Category = 'Squads'
      Caption = 'Edit Squad...'
    end
    object Squad_Delete: TAction
      Category = 'Squads'
      Caption = 'Delete Squad...'
    end
    object Edit_Preferences: TAction
      Category = 'Edit'
      Caption = 'Preferences...'
    end
    object Stats_Session: TAction
      Category = 'Analytics'
      Caption = 'Session Stats...'
    end
    object Stats_Swimmer: TAction
      Category = 'Analytics'
      Caption = 'Swimmer Stats...'
    end
    object Stats_Performance: TAction
      Category = 'Analytics'
      Caption = 'Performance charts...'
    end
    object Programs_New: TAction
      Category = 'Programs'
      Caption = 'New Program...'
    end
    object Tools_Pools: TAction
      Category = 'Tools'
      Caption = 'Pools...'
    end
    object Tools_Dictionary: TAction
      Category = 'Tools'
      Caption = 'Dictionary...'
    end
    object Tools_Drills: TAction
      Category = 'Terms'
      Caption = 'Drills...'
    end
    object Tools_Intensity: TAction
      Category = 'Terms'
      Caption = 'Intensity and Pace...'
    end
    object Tools_PoolEquipment: TAction
      Category = 'Terms'
      Caption = 'Pool_Equipment...'
    end
    object Tools_Distance: TAction
      Category = 'Terms'
      Caption = 'Distances...'
    end
    object Tools_Strokes: TAction
      Category = 'Terms'
      Caption = 'Strokes...'
    end
    object Programs_Edit: TAction
      Category = 'Programs'
      Caption = 'Edit Program...'
    end
    object Programs_Delete: TAction
      Category = 'Programs'
      Caption = 'Delete Program...'
    end
    object Programs_Clone: TAction
      Category = 'Programs'
      Caption = 'Clone Program...'
    end
    object Tools_StopWatches: TAction
      Category = 'Tools'
      Caption = 'Stop Watches...'
    end
    object Tools_Timed: TAction
      Category = 'Tools'
      Caption = 'Timed Events...'
    end
    object Reports_Session: TAction
      Category = 'Reports'
      Caption = 'Session'
    end
  end
  object ImageCollectionMenu: TImageCollection
    Images = <
      item
        Name = 'MenuDots'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000140494441546843ED98314A03511445
              CFEC20B595A5A4B2B7895B0818D29925B803CD0E5C827641215B489AF4566299
              CADA1D280F5E204CE234FFDD193EBC5F858479FF9E7B2F61780D959FA672FD24
              C0D00966029940A10359A10E0317C0D47F5F032F85669F7D5C95C018D80123BF
              F507B8013EA32154004FC0634BEC12B0EF438F0AC044FEB6944AEE920C75E1D7
              C0BD7F7E053E42ADF7614A0085DE939909D08BCD1D9764029940A10359A14203
              8B1F5727307185DB62A5FF0C50026C8063805B05840AE00E786B099E01EFD110
              2A0073DE12383E96407895540026BCEA0A1D9CB72AD909AFCEE1026502D1753F
              3B2F017AB139DF4687B63913C804740E28FF46AF80B94B5F015F0A0C2540D58B
              ADEA578B97BEDCBDF0DA7CFB72771F5D2365851E5AABC5E768F1364F09A0D07B
              3233017AB1395F2586B63913C804740EFC010D361E315A72BD9C000000004945
              4E44AE426082}
          end>
      end
      item
        Name = 'Import'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000001F4494441546843ED98BD2E44411480
              BF2DD4B412A1D01195074078000A74A2A5E305AC17A0A3151D0A1E80E0015442
              A720122DB5464E7247D6B873EF999FBDBB9BCC94BBE7CE7CDF9C3333776E8B01
              6FAD01E7270BF43A839A0C2C02E3C044C3B0AFC01B7053356E9DC011B0D530B8
              3DDC31B0ED62A812D8010E7A0C6F86DF050ECB585C0223C02330D62702EFC00C
              F069F3B8049681CB3E8137182BC09556A00DEC59C10B0D0BDD5AE3ED03C2F5A7
              B932E012B86B48621EC80265259433A02CC15C42A916F15431E3CFCA9937617D
              9101813F2F88D6001F899E0B18F8E942E009F0914822305772906876211BDE74
              E3232102F62E78EF73907996EC6FB80B3E4442C550F73AADEAA408AA83EF8A44
              2A012D7C72891402BEF04925620542E19349C40854C15F00ABD6022AFB4D427C
              76A77F6B3254A00E5EEED2F6EBB0DC27E46E6B8B45498408D4C1CB8155761089
              809C23723A279308119804CE80D992121178695502F27F99C403B00EBCF8ECDD
              2102D2FF28700A2C1583497D1B788D802D710D6C001F3EF0121B2A20CF0E0327
              C0B705AF15301243C026F0E50B1F2B20CFCBE02260B7BA12EA8C77F5A1F289C9
              40D5003E022A5057501670CC4CCE80B6AE7209E512D2D68A232E97502EA15C42
              913350514272987536B90B68BE2B7911756B117B41C404678198D94BF16CCE40
              8A598CE9E30712D68D31561E64D80000000049454E44AE426082}
          end>
      end
      item
        Name = 'Export'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000EC300000EC301C76FA8640000001974455874536F
              667477617265007777772E696E6B73636170652E6F72679BEE3C1A000001F749
              4441546881ED983F4B1C4118879FD7083990F801041B418816A9AC442D04FF14
              862082454008A4B049A168AF7E044B05B54E95B4A60E214D406C0F2B0589E569
              0807C637CD89CB38B3DEEECCDCDEE2FEE06DDE99619E676759EE46549532A7A7
              6800DF540245A7F402A8AAB38041E000B8006E01ED50DDB6F6DC0306521953E0
              4781DF1D8476D525F03A9300F00238ED02F8FB3A017AB2084C7601B4591336D6
              5EEC19B1F4EA40C3313F74FA8161A337027C3727BA045E5A7A9F54F59B27585B
              119159E0D868D76C734BFF19AD048A4E255074A20888C8BC889C19B514632FD7
              67D4377DC090D17B1563A3D2BF42AE13F80CFC307AF5C82CC9FC04C68CDEB96D
              A2554055AF80ABC0506D47551BC0AF76E696FE15AA048A4E2550742A81A2E325
              20222B22B2E8B17E4E44567D1872FF161291F7C011702722CBAAFA35E3FA19E0
              0B5013919AAAEEE60249BB344AB933FA08FCE3E1C6A009BC4B8C2FF1F856E143
              627C0AB8498CDD016BB95872C0BF31E093120B4F0900D3C01FCBB802E3D1055A
              10EB0E8026F0D625004C00D78EB55B1D398184C48603E42FB06FE91F1AAF4DB2
              B67373E45DF8C44964A95C4F3E884000092FF820021E12DEF0C104724804810F
              2A904122187C7081362482C247114891080E1F4DC02211055E5591D666512222
              9B409FAAEE44DB23A64027F2BCFFD074432A81A2F31F4366965D1A9C2FAF0000
              000049454E44AE426082}
          end>
      end>
    Left = 664
    Top = 448
  end
  object virtImageListMenu: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'MenuDots'
        Name = 'MenuDots'
      end
      item
        CollectionIndex = 1
        CollectionName = 'Import'
        Name = 'Import'
      end
      item
        CollectionIndex = 2
        CollectionName = 'Export'
        Name = 'Export'
      end>
    ImageCollection = ImageCollectionMenu
    Width = 32
    Height = 32
    Left = 664
    Top = 528
  end
end
