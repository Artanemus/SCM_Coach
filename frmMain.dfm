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
    ExplicitWidth = 1351
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 42
    Width = 1355
    Height = 954
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 1351
    ExplicitHeight = 953
    object TabSheet1: TTabSheet
      Caption = 'Sessions'
      object Label1: TLabel
        Left = 5
        Top = 15
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
      object Label2: TLabel
        Left = 261
        Top = 15
        Width = 45
        Height = 152
        Alignment = taRightJustify
        Caption = 'PROGRAM'
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
        Width = 185
        Height = 890
        Columns = <>
        TabOrder = 0
      end
      object FlowPanel1: TFlowPanel
        Left = 336
        Top = 15
        Width = 993
        Height = 882
        BorderStyle = bsSingle
        Caption = 'FlowPanel1'
        TabOrder = 1
        object ListView2: TListView
          Left = 1
          Top = 1
          Width = 250
          Height = 336
          Columns = <>
          TabOrder = 0
        end
        object ListView3: TListView
          Left = 251
          Top = 1
          Width = 250
          Height = 232
          Columns = <>
          TabOrder = 1
        end
        object ListView4: TListView
          Left = 501
          Top = 1
          Width = 250
          Height = 232
          Columns = <>
          TabOrder = 2
        end
        object ListView5: TListView
          Left = 1
          Top = 337
          Width = 500
          Height = 232
          Columns = <>
          TabOrder = 3
        end
        object ListView6: TListView
          Left = 501
          Top = 337
          Width = 250
          Height = 408
          Columns = <>
          TabOrder = 4
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Program Builder'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 705
        Width = 1347
        Height = 20
        Cursor = crVSplit
        Align = alBottom
        ExplicitLeft = 3
        ExplicitTop = 731
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 725
        Width = 1347
        Height = 193
        ActivePage = TabSheet3
        Align = alBottom
        TabOrder = 0
        ExplicitTop = 724
        ExplicitWidth = 1343
        object TabSheet3: TTabSheet
          Caption = 'Output'
        end
        object TabSheet4: TTabSheet
          Caption = 'Messages'
          ImageIndex = 1
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1347
        Height = 705
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel1'
        TabOrder = 1
        ExplicitWidth = 1343
        ExplicitHeight = 704
        object relpnlPrgBuilderToolBar: TRelativePanel
          Left = 0
          Top = 0
          Width = 97
          Height = 705
          ControlCollection = <
            item
              Control = VirtualImage1
              AlignBottomWithPanel = False
              AlignHorizontalCenterWithPanel = True
              AlignLeftWithPanel = False
              AlignRightWithPanel = False
              AlignTopWithPanel = False
              AlignVerticalCenterWithPanel = False
            end
            item
              Control = VirtualImage2
              AlignBottomWithPanel = False
              AlignHorizontalCenterWithPanel = True
              AlignLeftWithPanel = False
              AlignRightWithPanel = False
              AlignTopWithPanel = False
              AlignVerticalCenterWithPanel = False
            end
            item
              Control = VirtualImage3
              AlignBottomWithPanel = False
              AlignHorizontalCenterWithPanel = True
              AlignLeftWithPanel = False
              AlignRightWithPanel = False
              AlignTopWithPanel = False
              AlignVerticalCenterWithPanel = False
            end
            item
              Control = VirtualImage4
              AlignBottomWithPanel = False
              AlignHorizontalCenterWithPanel = True
              AlignLeftWithPanel = False
              AlignRightWithPanel = False
              AlignTopWithPanel = False
              AlignVerticalCenterWithPanel = False
            end
            item
              Control = VirtualImage5
              AlignBottomWithPanel = False
              AlignHorizontalCenterWithPanel = True
              AlignLeftWithPanel = False
              AlignRightWithPanel = False
              AlignTopWithPanel = False
              AlignVerticalCenterWithPanel = False
            end
            item
              Control = VirtualImage6
              AlignBottomWithPanel = False
              AlignHorizontalCenterWithPanel = True
              AlignLeftWithPanel = False
              AlignRightWithPanel = False
              AlignTopWithPanel = False
              AlignVerticalCenterWithPanel = False
            end>
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitHeight = 704
          DesignSize = (
            97
            705)
          object VirtualImage1: TVirtualImage
            Left = 24
            Top = 32
            Width = 48
            Height = 48
            Anchors = []
            ImageCollection = ImageCollectionCoach
            ImageWidth = 0
            ImageHeight = 0
            ImageIndex = 3
            ImageName = 'LoadCoachPrg'
          end
          object VirtualImage2: TVirtualImage
            Left = 24
            Top = 86
            Width = 48
            Height = 48
            Anchors = []
            ImageCollection = ImageCollectionCoach
            ImageWidth = 0
            ImageHeight = 0
            ImageIndex = 5
            ImageName = 'SaveCoachPrg'
          end
          object VirtualImage3: TVirtualImage
            Left = 24
            Top = 140
            Width = 48
            Height = 48
            Anchors = []
            ImageCollection = ImageCollectionCoach
            ImageWidth = 0
            ImageHeight = 0
            ImageIndex = 4
            ImageName = 'SaveAsCoachPrg'
          end
          object VirtualImage4: TVirtualImage
            Left = 24
            Top = 194
            Width = 48
            Height = 48
            Anchors = []
            ImageCollection = ImageCollectionCoach
            ImageWidth = 0
            ImageHeight = 0
            ImageIndex = 8
            ImageName = 'StartPrgBuild'
          end
          object VirtualImage5: TVirtualImage
            Left = 24
            Top = 248
            Width = 48
            Height = 48
            Anchors = []
            ImageCollection = ImageCollectionCoach
            ImageWidth = 0
            ImageHeight = 0
            ImageIndex = 7
            ImageName = 'CommitPrgBuild'
          end
          object VirtualImage6: TVirtualImage
            Left = 24
            Top = 302
            Width = 48
            Height = 48
            Anchors = []
            ImageCollection = ImageCollectionCoach
            ImageWidth = 0
            ImageHeight = 0
            ImageIndex = 6
            ImageName = 'BugPrgBuild'
          end
        end
        object RichEdit2: TRichEdit
          AlignWithMargins = True
          Left = 100
          Top = 10
          Width = 1237
          Height = 685
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          Lines.Strings = (
            'RichEdit2')
          ParentFont = False
          ScrollBars = ssBoth
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
                Action = Programs_Open
                Caption = '&Open Program...'
              end
              item
                Action = Programs_Save
                Caption = '&Save Program...'
              end
              item
                Action = Programs_SaveAs
              end>
            Caption = '&Programs'
            ImageIndex = 0
            ImageName = 'MenuDots'
          end
          item
            Items = <
              item
                Action = Reports_Session
                Caption = '&Session'
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
          end
          item
            Items = <
              item
                Action = Help_About
                Caption = '&About...'
              end>
            Caption = '&Help'
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
    object Programs_Open: TAction
      Category = 'Programs'
      Caption = 'Open Program...'
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
    object Programs_Save: TAction
      Category = 'Programs'
      Caption = 'Save Program...'
    end
    object Programs_SaveAs: TAction
      Category = 'Programs'
      Caption = 'Save As Programs...'
    end
    object Programs_Edit: TAction
      Category = 'Programs'
      Caption = 'Edit Program...'
      Visible = False
    end
    object Programs_Delete: TAction
      Category = 'Programs'
      Caption = 'Delete Program...'
      Visible = False
    end
    object Programs_Clone: TAction
      Category = 'Programs'
      Caption = 'Clone Program...'
      Visible = False
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
    object Help_About: TAction
      Category = 'Help'
      Caption = 'About...'
    end
  end
  object ImageCollectionCoach: TImageCollection
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
      end
      item
        Name = 'LoadCoachPrg'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000126494441546843ED99CB0DC2301044
              27EDD0001CB9D10F0D000D20D10D9CB84201D00E682524A2883863678337D2F8
              9243FCD937B32BCBDA06331FCDCCE387006A3BC83AB0047002605F8F7100B0F7
              D88801580078781CD6D9C30582013803D84C00605B8E8660005EADE099F92956
              4B9B9DA7134C4053038C72220A403144248022886800D9101101B220A202D010
              91012888E80006918CF1DF006BF246BFB297E7BF01C8F8415F9E026025CD9C27
              07DA82D16A64AA9C9A4E9FA91A7054BDC8753920077E2BA0222E2A28C7749203
              7260643A298594424AA1AF02A1DEC4AC312A6215319B2B3DF394426D616E8ECD
              BD5C63EE0056A945CC8BCC3A9306516358F006D13B18005B6C9DCAE384CDBE6E
              8017005B00CF21D55880A17DAAFD174035E93F07CFDE813770765931A73BD8A2
              0000000049454E44AE426082}
          end>
      end
      item
        Name = 'SaveAsCoachPrg'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000022C494441546843ED993F4AC5401087
              3F1BC142B013BC817A000B1BAD44B412B5F1061EC146BD80A5E015FC838D96A2
              8D6067275A78016D1441B452E6918590976466E2E6250F93E6C1CB64F7F7EDCC
              EECEEC8E30E4CFC890EBA70368DA839D07DAEE8119E000581A80D01360D3DB4F
              5908CD0177DE06FF68EF86280310F10231E8C7055106F093525EF7643F063652
              FD9921DA0220DA2B4178011622C6D34D4E5B6E882A00D71120F681BD82765C10
              6D047085535B01F22072B5B6194020D495B02900897F9907DAD30184110A9E92
              6574571B36C37B59421BF180415B5493E82114559DA1B10E203B070C8316D5A4
              F3C0BFF5C038B005CC035FC06D922E7F3A03AC91105A058E80A98CD8E7A468B9
              77400C1C40363A2DDD9E045E8C1001408A7DA9D2FA1E6F2EA4F57B01AC284667
              C0BAD650F25E00B2E2B7812BE0496C62028C026FC098224EE6C404F06D80903A
              393DF292044A2A23736A19F8880960099FA07911C82B29CB9882F860D32BFC63
              02D4E18134901CB249B9399BFCD92B4B630248BB9639700EAC19C2279884DA59
              7E03C469A8A9630358C2681A783402A4C3261C0408C483658755D7E0021145FB
              C03BB0031C56101F3EE93BCD88ED81D051DE4E7C09BCC6141F7B19356A53CDB2
              AB8D7C50788E549707549505062EF16DF3805BBC0650E7F17A363DA8245E03A8
              EB82239A780D40DEC7BE62B288B71E7AF5A651DD17179EDC466C5DE29B04C88B
              79B7F836015412DF2480E4F421492BBBEC50F79326E7802ACE6230F400BF7E7C
              9A31FE8AF01C0000000049454E44AE426082}
          end>
      end
      item
        Name = 'SaveCoachPrg'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000001D6494441546843ED99BB2E45411486
              BFD3B8144223124F205E804443A5A091A0F10012A51740A394283D8086509150
              A19050A95069152A89C4AD212B9993EC6C7BCFCCDA675FE6C44C739273E6F27F
              EB5F336756A64597B75697EB270234ED607420740726805D403EAB6E87C0B276
              115B0A8D03F7DA093BECAF86B0019C01B31D0A2A325C056103F849AC5EF5663F
              009612EB7943840220DA0B416801A68BE444CE98CB8CEFD51045002E4A80D802
              3673E651418408A04AA75001B22032B5860C2010CE93300214DCD0B64D9C9CB2
              1207360A8A4E0EBBB29C42950294A05D3545E90EA8562FA173046807B1EACB5C
              9E59D1817FEBC03030074C99085C9BEBF2BB72633792426BC036309812FB648A
              963B0544ED0063C0A343E008F0E209513BC031B0E01077042C8608D00BBC027D
              0E719FC010F0E50151AB03526EFA566B334056499966AA15A0C738D0EF88EC87
              71E03B340744CF89393E6DDA4E81790FF1951434AE757DD2C8377D1A01904525
              BA7BC0688AF61958352EB902D1FEBDD63D90143500ACA4FE89F781375FE5A65F
              63004A9DB9DD234057DF466F6A7AD8F049B75B6032ABA3ADD29257198108A189
              7881F8D35CA5A2BCD2EC34F4D02162CF8175E0212F8A2E8010A26FD510019AB6
              283A101DE83002BF683C79313862E9BA0000000049454E44AE426082}
          end>
      end
      item
        Name = 'BugPrgBuild'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000033C494441546843ED98C9EB4E5118C7
              3F3F16AC58294391851491792865482453140BCA10910C1B8958604164672A32
              971245A60D89253284889D2156FE003BFA722EF71EF7BD67BA97DE7A4FBDBD75
              CF337CBFCFF39CE70C5DB4F9E86A73FC7408FCEF0C7632000C03DE44662245F7
              A7CBD40C08C06560690489C1C0CD48DDDFF14A2190811F0EBC0E04D217B8018C
              8FD02D243B85C01013FD51C6A22F89DEC075606AA05E6995A61090C17E86C414
              4F303D806BC01C4F79E7D24A252007BD0C89D939505B81C966817703DE02CF81
              E5C0A2BAC0D7B188B308753724163B43F64BC0B7DC9CE6EAC8809C5C049639BD
              15051E00D30375FE124F253006785A02E211F018D0BFC6446082F9B7C53527D9
              A8914AE01BA085998D97C036E04E0B34B38043C0486BBE0FF03586410A81E3C0
              869CD363C0264F1047818D39D97BC04C4FDD82980F81EF1E865702173CE4F222
              2B80F31E3A9518EB20A0BEEEDB7D6CBC57736DB51597C6094CCA2D568F801644
              B4801F3A949209D8F6E702B7CC476D4EEA4429E31930DA189807DC0E31E65342
              B6BD9DC03EF3F134B0D612B8EF0060F7FE53C01AA3B30BD8DF34011DC4161827
              AB81739643D7A2B783B60A386B6CE884BAB069028AF034E344D1D48E9A1FA104
              642BCB5AF0EE1C53422E0219B95681B409374EC006B4DB9181900A90AC4D60AF
              65C0265C98F6C94055499495500A8132DDE436DAF604CADA62D5224EC94059B9
              541EB97D4AC806E45AC4A90482EE084D1068AB363A3F77ACC8221F4A40C707BD
              0F69FC937D400F594B8C43B5BC3D891B99F4D59A35AE98F725EF328C29A1C3C0
              66E34191CB8E15DE4E2D411D1F94498D23C09610433E04AA4AE20B3020C46189
              EC67A07F858D46F701F93D08EC88247100D8EED06D9C80FC0F023E069218087C
              F0D04926D0CAC77B035CF3AF4A5E1A5CD8F48231C208BD00B23756975E61DE67
              0DB432983F846532EB81930E04EB8013964CF4992A858030E45B6086490F5DBA
              E73EC9DD1544761CA0FBF3580B7C592BF6CE422A01399A61EEB13DBDBDFE11D4
              DB90DE97A2471D04E45CF5ABBB72B6C1B900DD05CE00975C82AEF9BA08647EF4
              4428122A93A1E6A7B977E6A7570CDDA93FB980F9CED74DC0D76F6D721D02B585
              32D25027039181AB4DADED33F003DDD29A31058487820000000049454E44AE42
              6082}
          end>
      end
      item
        Name = 'CommitPrgBuild'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000001AE494441546843ED97B12BC55114C7
              3FAF6C3619D80C6463B1185825FE00B1D80CAC181819149B52162CAC4A19ACAC
              2652B2B02825132B3AB9BFBCDEF372EF3DA7B8756EFDA677BEDFDFF97EBFE777
              DFBD350A5FB5C2FBC705FC75829E8027A074C0474869A01AEE09A82D54127802
              4A03D5704FA0C1C2366015E80D4F1FF00EDC0277C003B009BCAAAD0F0496094C
              002BC0F02FCD5D015BC08185082B01D2F85A624347C07422A6A9DC42C03CB05D
              C77C0FEC0037C06518A141600058063AEB6A65DCD63522B402A60071B25AFBC0
              02F0D6A2A90EE01818A9FB7D0638CC15A115700A8C87979F03A3918DEC01B3A1
              F6A2415024C557994680EC34B2B3C87A06FA8197C8B7B703D7404FA81F0AE316
              09FF2ED308D8009602D562D81E531A10AC70C8DA05E652C055ED4F023E3288C6
              80B344DC24709288699A1A2B015DC0536233DDC06322C605B432EC5F8D506CAA
              FFF6238E1550FC362A428BFE231301C51F254444D187B9EA7B29FA385D8928FA
              425389902BA5A4215749D9A58ABA52C66EBFA6759AD3A86923B9642E20D7392B
              9C2760E5642E8F2790EB9C15CE13B0723297C713C875CE0AE709583999CBF309
              E761543130D88BA50000000049454E44AE426082}
          end>
      end
      item
        Name = 'StartPrgBuild'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000114494441546843ED98DD0DC2301083
              DD75601E56600DE0891958810D7902452A520454BDD83A7281EB5B953F7F76D4
              4B3361F0671A5C3F12A07782994026203A905B4834501E9E09C8168A13FC6402
              F7CA146FC033801B80231BC42781DF02B800D8CFC24F2C444F802B805DE53C05
              D113A06897217A03C810110024882800344424000A221A403344448026080680
              AE9AD537BF2E964B45786BA9130C806571F664B036EEADD8FD25C061B669E9A0
              5712AADB5EDFD75C7EB66FBCB6905580D2CF7CC460B69022CC32D62CBE4C160D
              A0497C348066F1910028F1510068F1110024F1BD0164F1BD0186FFA92F06BA5C
              AB588A4D983EDE1757EEA009E06EF1CA02994026203A905B4834501E9E09C816
              8A130C9FC00373F64B31E3B12BA20000000049454E44AE426082}
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
    ImageCollection = ImageCollectionCoach
    Width = 32
    Height = 32
    Left = 664
    Top = 528
  end
  object virtImageListPrgBuilder: TVirtualImageList
    Images = <>
    Left = 840
    Top = 536
  end
end
