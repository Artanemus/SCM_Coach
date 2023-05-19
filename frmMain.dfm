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
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
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
    Font.Height = -16
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
        Left = 453
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
        Left = 122
        Top = 15
        Width = 325
        Height = 878
        Columns = <>
        TabOrder = 0
      end
      object SessionWidgets: TRelativePanel
        Left = 56
        Top = 19
        Width = 60
        Height = 874
        ControlCollection = <
          item
            Control = spbtnSessionToggleVisible
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = True
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = True
            AlignVerticalCenterWithPanel = False
          end
          item
            Control = ShapeSessBar1
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = True
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = spbtnSessionToggleVisible
          end
          item
            Control = spbtnSessionToggleLock
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = True
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = ShapeSessBar1
          end
          item
            Control = spbtnSessionNew
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = True
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = spbtnSessionToggleLock
          end
          item
            Control = spbtnSessionDelete
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = True
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = sbtnSessionEdit
          end
          item
            Control = ShapeSessBar2
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = True
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = spbtnSessionDelete
          end
          item
            Control = spbtnSessionReport
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = True
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = ShapeSessBar2
          end
          item
            Control = ShapeSessDot1
            AlignBottomWith = spbtnSessionReport
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
          end
          item
            Control = sbtnSessionEdit
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = True
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = spbtnSessionNew
          end>
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          60
          874)
        object spbtnSessionToggleVisible: TSpeedButton
          Left = 6
          Top = 0
          Width = 48
          Height = 48
          AllowAllUp = True
          Anchors = []
          GroupIndex = 1
          ImageIndex = 0
          ImageName = 'VisibilityOn'
          Images = vimglistSession
          Flat = True
          Layout = blGlyphTop
          Margin = 0
        end
        object ShapeSessBar1: TShape
          AlignWithMargins = True
          Left = 6
          Top = 58
          Width = 48
          Height = 4
          Margins.Left = 0
          Margins.Top = 10
          Margins.Right = 0
          Margins.Bottom = 10
          Anchors = []
          Brush.Color = 8421631
        end
        object spbtnSessionToggleLock: TSpeedButton
          Left = 6
          Top = 72
          Width = 48
          Height = 48
          Hint = 'Lock-Unlock the session.'
          Anchors = []
          ImageIndex = 4
          ImageName = 'Lock'
          Images = vimglistSession
          Flat = True
          Layout = blGlyphTop
          Margin = 0
        end
        object spbtnSessionNew: TSpeedButton
          Left = 6
          Top = 120
          Width = 48
          Height = 48
          Action = Session_New
          Anchors = []
          ImageIndex = 2
          Images = vimglistSession
          Flat = True
          Layout = blGlyphTop
          Margin = 0
          NumGlyphs = 2
        end
        object spbtnSessionDelete: TSpeedButton
          Left = 6
          Top = 216
          Width = 48
          Height = 48
          Action = Session_Delete
          Anchors = []
          ImageIndex = 3
          Images = vimglistSession
          Flat = True
          Layout = blGlyphTop
          Margin = 0
          NumGlyphs = 2
        end
        object ShapeSessBar2: TShape
          AlignWithMargins = True
          Left = 6
          Top = 274
          Width = 48
          Height = 4
          Margins.Left = 0
          Margins.Top = 10
          Margins.Right = 0
          Margins.Bottom = 10
          Anchors = []
          Brush.Color = 8421631
        end
        object spbtnSessionReport: TSpeedButton
          Left = 6
          Top = 288
          Width = 48
          Height = 48
          Anchors = []
          ImageIndex = 5
          ImageName = 'Report'
          Images = vimglistSession
          Flat = True
          Layout = blGlyphTop
          Margin = 0
          NumGlyphs = 2
        end
        object ShapeSessDot1: TShape
          Left = 0
          Top = 326
          Width = 20
          Height = 10
          Anchors = []
          Brush.Color = 8421631
          Shape = stCircle
        end
        object sbtnSessionEdit: TSpeedButton
          Left = 6
          Top = 168
          Width = 48
          Height = 48
          Action = Session_Delete
          Anchors = []
          ImageName = 'Edit'
          Images = vimglistSession
          Flat = True
          Layout = blGlyphTop
          Margin = 0
          NumGlyphs = 2
        end
      end
      object RelativePanel1: TRelativePanel
        Left = 530
        Top = 16
        Width = 60
        Height = 879
        ControlCollection = <
          item
            Control = sbtnPrgItemNew
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = True
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
          end
          item
            Control = sbtnPrgItemEdit
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = True
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
          end
          item
            Control = sbtnPrgItemDelete
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = True
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
          end>
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          60
          879)
        object sbtnPrgItemNew: TSpeedButton
          Left = 6
          Top = 1
          Width = 48
          Height = 48
          Action = Playscript_New
          Anchors = []
          ImageName = 'Lock'
          Images = vimglistSession
          Flat = True
          Layout = blGlyphTop
          Margin = 0
          NumGlyphs = 2
        end
        object sbtnPrgItemEdit: TSpeedButton
          Left = 6
          Top = 55
          Width = 48
          Height = 48
          Anchors = []
          Caption = 'Edit Playscript'
          ImageIndex = 6
          ImageName = 'Edit'
          Images = vimglistSession
          Flat = True
          Layout = blGlyphTop
          Margin = 0
          NumGlyphs = 2
        end
        object sbtnPrgItemDelete: TSpeedButton
          Left = 6
          Top = 109
          Width = 48
          Height = 48
          Action = Playscript_Delete
          Anchors = []
          ImageIndex = 3
          Images = vimglistSession
          Flat = True
          Layout = blGlyphTop
          Margin = 0
          NumGlyphs = 2
        end
      end
      object ScrollBox1: TScrollBox
        Left = 594
        Top = 19
        Width = 735
        Height = 870
        TabOrder = 3
        object FlowPanel1: TFlowPanel
          Left = 0
          Top = 0
          Width = 731
          Height = 230
          Align = alTop
          AutoSize = True
          BorderStyle = bsSingle
          Caption = 'FlowPanel1'
          TabOrder = 0
          object Panel2: TPanel
            Left = 1
            Top = 1
            Width = 128
            Height = 224
            Caption = 'Panel2'
            TabOrder = 0
            object Label4: TLabel
              Left = 58
              Top = 84
              Width = 32
              Height = 21
              Caption = 'DUR'
            end
            object Label5: TLabel
              Left = 56
              Top = 22
              Width = 32
              Height = 21
              Caption = 'KMS'
            end
            object Label3: TLabel
              Left = 5
              Top = 13
              Width = 45
              Height = 84
              Alignment = taRightJustify
              Caption = 'STATS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -32
              Font.Name = 'Segoe UI'
              Font.Orientation = 900
              Font.Style = []
              ParentFont = False
            end
            object Edit1: TEdit
              Left = 58
              Top = 111
              Width = 48
              Height = 29
              Alignment = taCenter
              ReadOnly = True
              TabOrder = 0
              Text = 'Mins'
            end
            object Edit2: TEdit
              Left = 56
              Top = 49
              Width = 48
              Height = 29
              Alignment = taCenter
              ReadOnly = True
              TabOrder = 1
              Text = 'kms'
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'PlayScript 001'
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
            ImageIndex = 0
            ImageName = 'MenuDots'
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
            ImageIndex = 0
            ImageName = 'MenuDots'
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
            ImageIndex = 0
            ImageName = 'MenuDots'
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
                Action = Edit_Swimmers
                Caption = '&Swimmers...'
                ImageIndex = 3
                ImageName = 'Members'
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
                Action = Edit_Coaches
                Caption = '&Coaches...'
                ImageIndex = 3
                ImageName = 'Members'
              end
              item
                Action = Edit_Swimmers
                Caption = '&Swimmers...'
                ImageIndex = 3
                ImageName = 'Members'
              end
              item
                Action = Edit_Contacts
                Caption = 'C&ontacts...'
                ImageIndex = 3
                ImageName = 'Members'
              end
              item
                Caption = '-'
              end
              item
                Action = Edit_Preferences
                Caption = '&Preferences...'
              end>
            Caption = '&HR'
            ImageIndex = 0
            ImageName = 'MenuDots'
          end
          item
            Items = <
              item
                Action = Session_New
                Caption = '&New Session...'
                ImageIndex = 4
                ImageName = 'New'
              end
              item
                Action = Session_Edit
                Caption = '&Edit Session...'
                ImageIndex = 5
                ImageName = 'Edit'
              end
              item
                Action = Session_Delete
                Caption = '&Delete Session...'
                ImageIndex = 6
                ImageName = 'Delete'
              end
              item
                Action = Session_Clone
                Caption = '&Clone Session...'
                ImageIndex = 7
                ImageName = 'Clone'
              end
              item
                Caption = '-'
              end
              item
                Action = Session_Find
                Caption = '&Find Session (by Keyword)...'
                ImageIndex = 11
                ImageName = 'Search'
              end>
            Caption = '&Session'
            ImageIndex = 0
            ImageName = 'MenuDots'
          end
          item
            Items = <
              item
                Action = Playbook_New
                Caption = '&New Playbook...'
                ImageIndex = 4
                ImageName = 'New'
              end
              item
                Action = Playbook_Open
                Caption = '&Open Playbook...'
              end
              item
                Action = Playbook_Save
                Caption = '&Save Playbook...'
              end
              item
                Action = Playbook_SaveAs
                Caption = 'S&ave As Playbook...'
              end
              item
                Caption = '-'
              end
              item
                Action = Playbook_ImportPlayScript
                Caption = '&Import Play Scripts'
                ImageIndex = 1
                ImageName = 'Import'
              end
              item
                Action = Playbook_ExportPlayScript
                Caption = '&Export Play Scripts'
                ImageIndex = 2
                ImageName = 'Export'
              end>
            Caption = '&Playbook'
            ImageIndex = 0
            ImageName = 'MenuDots'
          end
          item
            Items = <
              item
                Action = Playscript_New
                Caption = '&New Playscript'
                ImageIndex = 4
                ImageName = 'New'
              end
              item
                Action = Playscript_Delete
                Caption = '&Delete Playscript'
                ImageIndex = 6
                ImageName = 'Delete'
              end
              item
                Caption = '-'
              end
              item
                Action = Playscript_Load
                Caption = '&Load from file...'
                ImageIndex = 10
                ImageName = 'FileRead'
              end
              item
                Action = Playscript_Save
                Caption = '&Save to file...'
                ImageIndex = 9
                ImageName = 'FileWrite'
              end
              item
                Caption = '-'
              end
              item
                Action = Playscript_Find
                Caption = '&Find...'
                ImageIndex = 11
                ImageName = 'Search'
              end>
            Caption = 'P&layscript'
            ImageIndex = 0
            ImageName = 'MenuDots'
          end
          item
            Items = <
              item
                Action = Squads_Templates
                Caption = '&Squad Templates...'
              end
              item
                Caption = '-'
              end
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
              end
              item
                Action = Tools_Inventory
                Caption = '&Equipment Inventory...'
              end
              item
                Action = Tools_DisqualificationCodes
                Caption = 'D&isqualification Codes...'
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
              end
              item
                Action = Help_WebHelp
                Caption = '&Web Coach Wiki...'
              end>
            Caption = 'H&elp'
            ImageIndex = 0
            ImageName = 'MenuDots'
          end>
        ActionBar = ActionMainMenuBar1
      end>
    Images = virtImageListMenu
    Left = 664
    Top = 608
    StyleName = 'Platform Default'
    object Edit_Coaches: TAction
      Category = 'Edit'
      Caption = 'Coaches...'
      ImageIndex = 3
      ImageName = 'Members'
    end
    object Edit_Swimmers: TAction
      Category = 'Edit'
      Caption = 'Swimmers...'
      ImageIndex = 3
      ImageName = 'Members'
      OnExecute = Edit_SwimmersExecute
      OnUpdate = Edit_SwimmersUpdate
    end
    object Session_New: TAction
      Category = 'Session'
      Caption = 'New Session...'
      ImageIndex = 4
      ImageName = 'New'
      OnExecute = Session_NewExecute
      OnUpdate = Session_NewUpdate
    end
    object Session_Edit: TAction
      Category = 'Session'
      Caption = 'Edit Session...'
      ImageIndex = 5
      ImageName = 'Edit'
    end
    object Session_Delete: TAction
      Category = 'Session'
      Caption = 'Delete Session...'
      ImageIndex = 6
      ImageName = 'Delete'
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
      OnExecute = File_ImportExecute
      OnUpdate = File_ImportUpdate
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
    object Squads_Templates: TAction
      Category = 'Squads'
      Caption = 'Squad Templates...'
      OnExecute = Squads_TemplatesExecute
      OnUpdate = Squads_TemplatesUpdate
    end
    object Squad_New: TAction
      Category = 'Squads'
      Caption = 'New Squad...'
    end
    object Session_Clone: TAction
      Category = 'Session'
      Caption = 'Clone Session...'
      ImageIndex = 7
      ImageName = 'Clone'
    end
    object Squad_Edit: TAction
      Category = 'Squads'
      Caption = 'Edit Squad...'
    end
    object Squad_Delete: TAction
      Category = 'Squads'
      Caption = 'Delete Squad...'
    end
    object Edit_Contacts: TAction
      Category = 'Edit'
      Caption = 'Contacts...'
      ImageIndex = 3
      ImageName = 'Members'
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
    object Playbook_New: TAction
      Category = 'Playbook'
      Caption = 'New Playbook...'
      ImageIndex = 4
      ImageName = 'New'
    end
    object Playbook_Open: TAction
      Category = 'Playbook'
      Caption = 'Open Playbook...'
    end
    object Tools_Pools: TAction
      Category = 'Tools'
      Caption = 'Pools...'
      OnExecute = Tools_PoolsExecute
      OnUpdate = Tools_PoolsUpdate
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
    object Playbook_Save: TAction
      Category = 'Playbook'
      Caption = 'Save Playbook...'
    end
    object Playbook_SaveAs: TAction
      Category = 'Playbook'
      Caption = 'Save As Playbook...'
    end
    object Playbook_Edit: TAction
      Category = 'Playbook'
      Caption = 'Edit Playbook...'
      ImageIndex = 5
      ImageName = 'Edit'
      Visible = False
    end
    object Playbook_Delete: TAction
      Category = 'Playbook'
      Caption = 'Delete Playbook...'
      ImageIndex = 6
      ImageName = 'Delete'
      Visible = False
    end
    object Playbook_Clone: TAction
      Category = 'Playbook'
      Caption = 'Clone Playbook...'
      ImageIndex = 7
      ImageName = 'Clone'
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
    object Tools_Inventory: TAction
      Category = 'Tools'
      Caption = 'Equipment Inventory...'
    end
    object Help_WebHelp: TAction
      Category = 'Help'
      Caption = 'Web Coach Wiki...'
    end
    object Tools_DisqualificationCodes: TAction
      Category = 'Tools'
      Caption = 'Disqualification Codes...'
      Enabled = False
      OnExecute = Tools_DisqualificationCodesExecute
      OnUpdate = Tools_DisqualificationCodesUpdate
    end
    object Playscript_New: TAction
      Category = 'Playscript'
      Caption = 'New Playscript'
      ImageIndex = 4
      ImageName = 'New'
      OnUpdate = Playscript_NewUpdate
    end
    object Playscript_Delete: TAction
      Category = 'Playscript'
      Caption = 'Delete Playscript'
      ImageIndex = 6
      ImageName = 'Delete'
    end
    object Playbook_ImportPlayScript: TAction
      Category = 'Playbook'
      Caption = 'Import Play Scripts'
      ImageIndex = 1
      ImageName = 'Import'
    end
    object Playbook_ExportPlayScript: TAction
      Category = 'Playbook'
      Caption = 'Export Play Scripts'
      ImageIndex = 2
      ImageName = 'Export'
    end
    object Playscript_Save: TAction
      Category = 'Playscript'
      Caption = 'Save to file...'
      ImageIndex = 9
      ImageName = 'FileWrite'
    end
    object Playscript_Load: TAction
      Category = 'Playscript'
      Caption = 'Load from file...'
      ImageIndex = 10
      ImageName = 'FileRead'
    end
    object Session_Find: TAction
      Category = 'Session'
      Caption = 'Find...'
      ImageIndex = 11
      ImageName = 'Search'
    end
    object Playscript_Find: TAction
      Category = 'Playscript'
      Caption = 'Find...'
      ImageIndex = 11
      ImageName = 'Search'
      OnExecute = Playscript_FindExecute
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
        Name = 'File'
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
        Name = 'FileWrite'
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
        Name = 'FileRead'
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
      end
      item
        Name = 'Members'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000314494441546843ED988FD18C410CC6
              9FAF0254800A50012A4005A8800E50012A40051F15A00254800A5001F33B9B9B
              4CECBEB7D975EEBBF166E6E6FEBCBBD93CC9936C72273A72393972FBB5023874
              04D708AC1198F4C04AA149074E6F9F89C00D4977255D92C467E49DA48F925E95
              776FE06B49B7CA0F5FCA73D63F9F413102E0BCA447921EEE38F8B1A4276E0D20
              DF56F600F87E057017AE11001F245DEDD2FEDBBB1EE8CB12B5B8FDBBA46B9288
              4C4AB200F02ADE377923E959A10EBFDD96C49A2B6ECDCDF0FCB4612174626D4A
              3200A0CE6749BC23D003636B12F97ED92DFAB9602154224ADD9201E039FCB524
              6FEB20407E730FFD3978FA7A63E39253AA5B3200E0F2D3A22572BBA6DC1BEA69
              B404E0BDAB685D51C800F0FCEFF194A7D11D497C475A89CCB34F8902B1519601
              70F411F03940B9A3EC51FE6AC2E546C29B9C891C203131FC9CA30255230AEB28
              95763B475A2C55214FB5BF9E0328F434E23B09496E509530FC62B91788800991
              E2B645B8275AF700770ACF5392C90153BC5445E2E131D95B09FCA394E516259B
              A04600A02CDEC8F1000CBAE72A0FCF5BBD109E676DDA78948E02602FFD1021C7
              30288301D665D25E448328A39617508A17D1B4F29AA24EAD3A0C2938F4A69908
              1CDAF6CDF9FF1D00784F2306E7F94CE98CB301BCB6124B4ED0DFB4FA7CF45099
              B81B2C7FC80DF674494F046C74B464ED521C1659C2D204D6C050855E843D2437
              AF250734298467987751EC2FA511E3E31EC050A5289FBE52D540D85EA2C49C6D
              D1DDEAAC458089AB35A870E3E2150B37EFD1A300368A59A9B5F6C383C1785A11
              5F4677DD2F71CEFE230284114F78C1683CC02B3DB3164500A10DE1DE8860FC14
              16FBAD5AC4B163DB83F908C410C23D423D75D1040B30D0E666FA2613464E730E
              673ED8C1D56DD3E701D0FE1ADF7B26AED97C20176CF887DF16F9A586CFCEDCFE
              01E001F836F7C2686F9240E50DF5A364AB678AAA37B6B700F494D784ADD5A57E
              F027A1711A12FF10689D73700018E6A3DE72E6108059EF8EEC5F012CCDAA231E
              CDEE998E40F6C033B1FE5F549BBD025D01ECD5BD1DCAD708743869AF4BD608EC
              D5BD1DCA7F01FCEEA831B2921B460000000049454E44AE426082}
          end>
      end
      item
        Name = 'New'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000001FC494441546843ED986151C4301085
              DF29001480034001380007E0001C000E90000A1814000E90C0290014C07C37C9
              CD12D2F47A6D4A7A2433FDD1C936D9F7DE66779B99263E6613F75F15C05F2B58
              15A80AF46460E342E84AD2A5A4ED9EC4E4FAFC43D2ADA41BBF8155E05A1200A6
              300080BF3FEAC07BC1CC87A4A2C44E08E0CB58957A367EF9681DAD0046383C55
              8111484E6EF1BF14D893B42BE953D26B8497D8FC51823FBB0E8572DFD9BE24BE
              3990B425692EE94D5227056C613B8C80F0F33870EC9CB01B847E593BEC9F9C41
              2A653F4B82145FB8D606800280B0635200707C59BE1D8A14807B49770160AAA7
              0FC59802B1F5065180D8250E193694520042B061388D0A80D885BD13C7A00FA5
              490138755900253CBB439F816C21E4B307201E4C28F14EFB3D5416CA0E00DF39
              98674E8D4749170D008A3AC496610A10998402C7B9E03DA6407187D8172A54B0
              1984F7BE00FCDAE792782088DF5A06BF8F54E35E85CC3AE8D3210B133E4D0062
              DD4153254E7412CBA9C101D8505AE710F33D45CAF7432910D4215442994EAD04
              CD1A8FADA076A3D8BC0DB5D0A9D83A8447DB0D0840FDE804601569C7B6A900C6
              663CDCAF2A5015E8C94032844873BEEFEFB94FF6CFA90D8BF4BB5197BB00A2A5
              A51FA1592B71C03C6DCCE2663A54A044875B7D2AF516BAD5F1AAC0CA146536AC
              219499E0D6E5AB02AD146536F806EE4BDA31C8F8688A0000000049454E44AE42
              6082}
          end>
      end
      item
        Name = 'Lock'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000023B494441546843ED99F135043110C6
              BFAB0015A00254800A50012A4005A800157015A00254800A50012AE0FDC83EB1
              EF6E77B2898D23F3CFBD7B3B9BCCF7CDB7934932D084DB60C2E3D74F005893B4
              2869C5FDC2D19DA46BF77B9992B49400E6249DBAC09B6204C8B6A4C714405201
              D892742469DA18D48BA43D496746FFB16E29002095ABDA0C27922E9C647884A4
              D625EDD4FC569DB43AE3880500E3B792900F762F896CA0F9510610585F700F91
              D1922432D2C962011C7BACBE3A206DC1009AC0A75CC4646BB753F45274157AF6
              74BFE164638905399D3B4700CF585E1AE513930164F3E0067DF264648D852CCC
              3AE7F9AE55290680CF22B59DFF21C647CE9A818564EFDB1C31000E24EDBBD10E
              25F13FC462DFFF98AB002819F864A08B04FF97846817366BA592325AADC094C4
              D0E6ACE97DC61A5ADA0CCB47EC97CB902A93C2B7B5BC5A00B058554CA7082A64
              0C7A2A7AA5B16601F0E6BD4DF7D887F9DD6D638CA1002CFE2900FAA415006636
              5250EFC630CF69918479B002E08B01336925030DB26101ACFA7DF60BF4FF56CB
              9E01CE87D8DCFBC6669EF3208B6505D0D47AB4B606BFA10A71F2B63C8666EBD6
              336B069A00DC188E1EC19E15005AA7F51E65D633A0AC00EA07571510EBC157F6
              0C1000ED37A7766C84304A28A710D64D4FD60C58CA649B4F01E0336466A38DD6
              80E7E6394B2F14C06A886BC9C09FFA06B880A86E53426490C297C5AFF1E2D0F2
              11FBD74829820A19A3B5F5B00080015651FAFBBE3201F3F454AD77671600218C
              F5EE5B00F44E796DC289CFC03BC1238A31E3477E040000000049454E44AE4260
              82}
          end>
      end
      item
        Name = 'VisibilityOff'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000003BC494441546843ED9881B14D410C86
              F32AA00354800A50012A4005A80015A00254800A50012A400754C07C6673262F
              7693ECB967E69E3B6367EEBC7BDFDD93CD9FFCF993BD6772E2EBECC4FD97FF00
              8E9DC15E062E8AC8CF633B563DDF03C0F90F22F245441E548D1C739F05A0CE5F
              6B0EBD3E05103E03387DCF4474F7207A35B00604D9BB2122648F179F6F3A6A7D
              6C9FA127EFBF8AC8F743E93792D10A089CBC2D22F73BCE56FD02CC0B1179BF56
              38A23E908120D244F242D5DB601FAAC779CF6681648D6C06C4A7A65E80C221A2
              AB727C594478597AF1DE8367FF531179590D4A06003B19081C63CDF2190A42BF
              472272C9390CF85B956C540010A9CFEE80ADD5092044DE02211B8000CC706500
              709EC646B4FC8A4090155489BF4A2728962D80BC729B68A89CD55D11006410E7
              75217B4423EB13EF9A3AF50EA43E7028A29B1787301323003EF2C81CD151B588
              4064EA5429546C1008A5D410C4689823F23A52907ADF94B2C2E6598A93487338
              9FEF38D579DC7AC0881DD0968C5D352271DD17760F008DE5617B08DAE07C6F3A
              CD4078C7A8076CD3FC58D8C4A1884E80E07B955BE495C02CCB03B0BCFFD59C8F
              5460160407DB6788304A132D32F7D66C60BF8E25FFDCC8904BA54E96626C12D5
              6FEEF48AC41255E577A68498C761544DDF2FA0EDC316E98FE65C129CBF85ED65
              4FA31CDD272C4DCF457470208182094AA5E5190B80C2D5620DB5D71C42F37932
              3834CA043C7EDE9EAB649AADF6AC857A16804D53D5A875A4876304C23EC70087
              73D9B2D95E94D102B0055C51080EF4CDAE0AC236BBBB4DF33300D49ACE5D5D0A
              F962E1108C67EB77B6A1298FAD09DBECAE1406419BB1737D299251FCAA44C752
              2FC2E2E90408A8837844CB0F93A18C62C82A04542242D1CF2C5E21664064C9F3
              3F34A48D4C0D2259DAC22BB3F9484EAB35D1DBE79DEF4E05D13067AF8B95D91C
              9E4289CA15336B76384F7F517A0DA782A80BF6C65AE475389B3795E07BED9A6B
              E8E4231F8E34591BEF8DC644BA72674562F50ECCE84046C950769FB06306CE93
              8565F6F111C900B0DFCFE6FC8F4390C5A1E120F4D900A841D33E73D09552FD20
              ADF4054F0D8CE3D09BCA05DC80AA80D0BB44A854950C5803BDCBB77E4F3600C4
              8BC31908EDAC4F10503664177A61CBAEACB0BB406601600447A8035E15C5C9B4
              FE20106B00585A516044B2A23A3D209A25FBFC54260E01601DD21F7329401DC9
              FD2F6FEAAC2A92D20D3B594D0CB3B81580199A8CF6AE02B12700AB32B13700D3
              20F608600AC45E01F44074AF9E7B0660410C7F60DB3B004070C142A1BA33D129
              00D87416DA42EF37B571F219F8031D3DFD310C1B9D900000000049454E44AE42
              6082}
          end>
      end
      item
        Name = 'VisibilityOn'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000039B494441546843ED9981910D411086
              FB2220034480081001224004880011200264702240048800191001F555F5FFAA
              5FBF99E9D9B77775AE6AA74ADDDA9BEEE9BFFF7F7A7AE74EEC928F934B1EBF6D
              002E9AC18D818D819519D824E409BC6A6677CCEC9699DDF5773CF39EF1DBCCBE
              F9F3677FFEE2EF5771B096814766F63804BD3418C0BC37B30F4B0D35FF58002F
              CCEC59C8F0B1EBCB0E86DE98D9ABA58E9602401EEFCCEC7A63212421794832FC
              642025494A32437279FC34B327EE670ACB1200048E5CE2F8E59943060A766A61
              4FC20367F25A32C21F40CA310380EC7DF20CCA2181BF74FD968B4C4C2031F88B
              40D8F4F7AAC45400A09BE0554D88850D87FEAB8CAB2A614330486C3458837D40
              61D0600D40A8821DD88F00A0F3AF29786885DEDEC006A9A994E679EC117CA0F5
              DE2039AF13881BBD84F50064D9FC71FD9F0E167EEA32886CB5A69355E4F276E0
              0B49C1C6159FD395530F00B25116099EE72E8D2EA998356C54918841954701F1
              EEB907D9C3810D3E64C33372DA1B2D00914202C1D188F22CB58FCE56DE233083
              FCEE7B04FCFE76E19BB591B1C601E80CA03468A42BB245F094C6D1408602D1CC
              6A32466E1C9C1A80DEA9210388C150357A9B31AEF1D7FF035BB0515527988051
              49A3AA84B827E09BBECE1EE8684CB00060CC488779D16626FB021E5940D70435
              1A59193B9B082066BFDA605A2CEE17FA18E89E195116B36B459B1D0B11002FD5
              9FCC3ABD28003B79F724345321FE3B0911506461A64260A34D0CE8EE891974C5
              26FE114EF8994D4C29651F30F68ACB5994D1089ACDF9B0D8044B2BDDA232CADA
              51D73352A27452E654160141BFD33AC8E893744ECC54BAF25CEAD117B35A7684
              8D56029B562B11FBA4AA31CC9D70F35C1A357304A0C383805870D4CCC11C74C7
              7EA7A52632CFDC51574B33476F25C0DFFDCC393824AB763A4A43F21A7591C889
              C05A9F8BDA800437EAADE86AE9443586277C55017247885302E49CA85A064E69
              550E12519DB6649BACC7CFD6B213AE0010308EA39C78470691CBD1D721495B7C
              85E12F5E167465136D6700683E998F9F7B0202DDF4412359B4F602C1D295B21F
              F22D0789C91708CDEABC04804E5E80E45B041D82F15A850CC66B150A82AE5790
              57ABD3E5B280C02BB9EDC02C052043E8267355C59969EC9883D66172B6195C0D
              400EC816FF7A55A702406D87D151491DFA389681EC1469A8EAC4CB5D314486F3
              E52E32A92A599580ED6F646586CE7BC25949E8BCE3ECFADF005C58EA7DE18D81
              8D819519D824B43281ABCDFF018921E03192487AFD0000000049454E44AE4260
              82}
          end>
      end
      item
        Name = 'Delete'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000164494441546843ED99E14D03310C85
              BF4E40376004D8A06513468009A01B74846ED2B2016C001BB413802CE5A4A84D
              9338BD501D3C4BF7E32E4EECE7E738C965C6C4653671FF11806B332806FE0A03
              AFC08B13CC0AB07E17494D0AD538B604ECF1C80EB0A72406F4ACD400F82E59E8
              DC9EF5F15F0018F2344EA52CAD173092B2919D27350C0CFEC4A9E4E9E7C1E3B6
              E171C43DB8C7F3A0EBB621005194EF819BF0FE01EC8F18980377E1DB01784F30
              745506ACA62F82530F891A6FEBC436B4BF9D5937042037EF4AD1110340294827
              011EB30A8901315058394BF9A914520A2985B495D042969D052AA3DA4E271244
              9BB9282893DF4AAC013B179B3C25CEBCD6663A26761E369D6329158AAEE78186
              BF2802E0BA6272D3DB4089DBC69855A8C1DFDF4DA14FE0760C2F2BC6B01F6343
              41C8AA7B1868B985A9F035A9F21C55ACD100D84006E2B123135FC0C673F5E461
              A0359A5DFB0940D7F0560C2E062A82D45565F20CFC0062799D311B6C0DDD0000
              000049454E44AE426082}
          end>
      end
      item
        Name = 'Report'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000001C3494441546843ED59DB4D0331109C
              54001D0015043A800A1015403AA003A002A00228012A800E4809500174001AC9
              46D6C9771EDFC38EA5F54F92D3DA9ED9D9C769B342E36BD5387E1881DA0AAA0A
              DC00B806B05F08F00F80070077A9FB1402B70048A0C62201DEDFBB1402DF053D
              DF05FA09E0682A81DFE00085F01C4AC9772A80E4C3E640EECE90EF3402337A3D
              3CCA14C8F1C6D4121BABF54515082F1B1351B13C3402392134D829054962FB8B
              2A2060CC363102392194ED5E61832990A380F5814848150DA1E61B99F581DA21
              2454C56C93A239908D4ED86004FAFAC0D484E5B9AF00B60915165340505F3221
              81CD00919D2740969CBE9DF590588C4072D497F03F47935700F69C1D497070C5
              CF9CD7977FDB1A631592E0C4CD9378774A344380404F01BC05881FDDF0D83F5A
              2C8414C5A42C7680EF03E30B002FEE771304889580CF837C3871E1D50C01E603
              4BEA8123C1EFAC4C9C88FB35A8BA1212B237D4D8E9D81D03F8089E3DBB4AD50C
              010265697DEA71C0CE2BE071D3F3971112CD10603EB027AC3B2426136097F44D
              6764988FDEF605E07068B792C4CDFFC94707900413CD97BBD12E1537D2F3CC89
              E4EBBBA28078671D332350C7EF629BAE0D4EB9FF0FE02E6F31FE03BFB8000000
              0049454E44AE426082}
          end>
      end
      item
        Name = 'Edit'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000033F494441546843ED9879C80D511887
              9F2F9148241259229125916489105992C8CE67DFF77DDF65DFF77DDF77591289
              1059924824125922914824129D7AA7DEE6BBF7CE9D7B67FBEACE7FBF3BB799E7
              79CF7B66CE992C72F99195CBF9C908843D829911F061049A00738079C035A7EB
              4769040A01BB818E0AFA38D02591445404CA024780FA3160134A444560AEB44D
              BC62C795888A8001779268079CB51B862960EEDD0930D5B58E44126642378D8A
              401EE979236026693212063EC753298C11C82BF01D54359D244ECA68E5982341
              0BE4038E02ED63CCD67812B78196C0F758333C4881FC52793319ADE30950CD61
              2476016FE23D9E82122820F06D158879DB9E008E3948247C1907215050DAA68D
              2299052C905C351D09BF05CCF2C0F47C6B053F0358A4F26C59F7583F995131F3
              E19FD33AC89CF753A0B0B44D2B05320D58A2F24C60BECAA704FE6F32F07E0A14
              91CAB750205381A52A4F0716AA7C5AE0FF240BEF974051816FAE402603CB6D32
              8B553E23F0BFDDC0FB21504CDAA699029908AC54798AAD8DCE09FC2FB7F05E0B
              1497CAEBF5CA7860B5029B042C53F9BCC0FF4C05DE4B811202DF58818C05D6AA
              3C0158A1F205A033F0235578AF044A0A7C2305321A58AFF2386095CA17A5F231
              97076E84D27D8C9612F886EAA623818D2A8F01D6A87C49E0BFB9018DF7DF7404
              4A0B7C0375F1E1C066954701EB54BE2C6DF3D50BF8745AA88CBCFEEB2990A1C0
              569547001B54BE2295FFE2157CAA02E5A4F27515C86060BBCAC3804D2A5F15F8
              CF5EC2A722505EE0EB289081C04E9587005B54BE2E6DF3C96B78B70215A46D6A
              2B90FEF22DC7FA6910B04D9DBF21F01FFD8077235051E06B29907EC01E950700
              3B54BE296DF3C12FF864052A49DBD454207D807D3619B373B28E5B52F9F77EC2
              272350592A5F4381F4020EA8DCD7D6467704FE9DDFF04E025504BEBA02C9060E
              A9DC1BD8ABF25D817F1B04BC93C063DB5EB5BBAC342DB69EC07E057A4FE05F07
              05EF24A0B7745D65342CB61EC041057A5FE05F0509EF46402F39BA018715E803
              F9E8F43268F85404CC66DB6CD2ADE3A154FE4518F06E0462F13D12F8E761C1A7
              236026B8F930FB2C4CF85405CCE740B3937A1A36BC934014F81C19D2D9D0385E
              3C883F640482A872A27B644620EC11F80FD4919C3180B038370000000049454E
              44AE426082}
          end>
      end
      item
        Name = 'Clone'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000014A494441546843ED993D6E02311085
              BFBD4E2E00220D54D4A4E50C697290349C216D52A7A301910B701DA2510A5628
              B647B36BAF40CFD54AF6BE99F7DEF867BD1D77DEBA3BCF1F1198DAC1A803AFC0
              16985522F0037C00BB127E84C006F82C018FD4FF027CE5B022040EC062A4044B
              3047E0796C02971E60448052D2D6EF8E1149C00DEEC93431C61DE3A1092C7BEA
              EC7BCF6E75A6762095A808389C718B949B0372C0A1746A881CC86D266E75E4C0
              9F02D9BD4A93784099E45E7597A91C9003FF2BA012D23E30706EA88454422AA1
              AB023A0BDD9E08DD2BC4803272C7D0596880CA3A8D96BE76527578AA78AD7EEB
              8A5DB3CFA397BB2902F64FC048B46896BC9148B6C82436B027E01D585762F10D
              BC01E7127E944009B759BF0834933A1128E740ABD5C6AEEE57512172045AAD36
              D508B4586D2C46550251679BBD17F947D62C394F2011F0A85473CC2F06826B31
              8E670DDF0000000049454E44AE426082}
          end>
      end
      item
        Name = 'Search'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000002A1494441546843ED99E151D6401086
              5F2AD00EC00A900A900A1C2B502B102A502A102A502B502B502AD00EB403A002
              9867E696593249EE2E7BE14B66727FC27CDC77B7CFBDEFEE6D604F2B1F7B2B8F
              5F1BC0AE15DC1458B302AF25BD92F4323D8DE546D25F49BF25FD4C3FCFC639C5
              426F257D927450181520EF25FD2F9C5F35AD06E0B9A4EF9DD3AED9EC54D265CD
              174AE6960260932FC92EB6EEADA4AFC9229C2E270DA4598A2736F383F9A8D16C
              940010D4AF4EF05792DE15D8821CF921E9998B181550A3C928012078026170EA
              F8FFA262770E8093F76ABC496015CBF44FCD0170CA58C7C65965F07E572AD361
              FA804AF54212CFD0C801FC73D506DB981253362527C813B3D3795273CA5A0FDF
              19032058EC63D621806829C4FB9FD39AAC850AA1310680CF3FA4D5BFA5A40D6D
              96BE7CE716012074286300C87D9C368B78BF0BED7321BCEE18C075AAEB047092
              FCDB42012A12B739239C0763005EEA5CB2D78051863F3E3540D8AB8EF0C900BC
              579B5D3CC98A965BB35A8816C06ECFF0464E81A6B935E66D7F0BA3C6518DD107
              E6D2827339DA08E7D6D802DDCDC2252F5D8C769B37B95B7227E04B1E7D0B2A4C
              BD787CF2A24093C290034005EC63FD0B971B095DDB84D186FC71D669D652E700
              D8B3DB91A2002F25C0940C6A3EA76FA35927CA822500CCEBCACF67F44A54A721
              35FADEE20CA2D99B5929409F12160C8AF4BD5276D5E165C8BF993581A8012020
              2A081BEF9778C7CDA1E2D04AA39AF541FC3A0C510B6031911704646F58433C04
              4ED014026F9F661053012C18FF57080F41828F25B92FCF2125A200954E7A34BD
              09C42E01ECE44376DA3540186209002188A5004C865812C02488A50154432C11
              A00F62B07B5D2A8087A087A285F1B7F9C385B26400EB78ED7F10BD97E6D201B2
              37FD06903DA299276C0ACC7CC0D9E557AFC03D711588316245F5CB0000000049
              454E44AE426082}
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
      end
      item
        CollectionIndex = 9
        CollectionName = 'Members'
        Name = 'Members'
      end
      item
        CollectionIndex = 10
        CollectionName = 'New'
        Name = 'New'
      end
      item
        CollectionIndex = 16
        CollectionName = 'Edit'
        Name = 'Edit'
      end
      item
        CollectionIndex = 14
        CollectionName = 'Delete'
        Name = 'Delete'
      end
      item
        CollectionIndex = 17
        CollectionName = 'Clone'
        Name = 'Clone'
      end
      item
        CollectionIndex = 3
        CollectionName = 'File'
        Name = 'File'
      end
      item
        CollectionIndex = 4
        CollectionName = 'FileWrite'
        Name = 'FileWrite'
      end
      item
        CollectionIndex = 5
        CollectionName = 'FileRead'
        Name = 'FileRead'
      end
      item
        CollectionIndex = 18
        CollectionName = 'Search'
        Name = 'Search'
      end>
    ImageCollection = ImageCollectionCoach
    Width = 32
    Height = 32
    Left = 664
    Top = 528
  end
  object vimglistSession: TVirtualImageList
    Images = <
      item
        CollectionIndex = 13
        CollectionName = 'VisibilityOn'
        Name = 'VisibilityOn'
      end
      item
        CollectionIndex = 12
        CollectionName = 'VisibilityOff'
        Name = 'VisibilityOff'
      end
      item
        CollectionIndex = 10
        CollectionName = 'New'
        Name = 'New'
      end
      item
        CollectionIndex = 14
        CollectionName = 'Delete'
        Name = 'Delete'
      end
      item
        CollectionIndex = 11
        CollectionName = 'Lock'
        Name = 'Lock'
      end
      item
        CollectionIndex = 15
        CollectionName = 'Report'
        Name = 'Report'
      end
      item
        CollectionIndex = 16
        CollectionName = 'Edit'
        Name = 'Edit'
      end>
    ImageCollection = ImageCollectionCoach
    Width = 48
    Height = 48
    Left = 156
    Top = 106
  end
end
