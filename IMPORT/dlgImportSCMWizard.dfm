object ImportSCMWizard: TImportSCMWizard
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Wizard - Import SwimClubMeet Members'
  ClientHeight = 768
  ClientWidth = 669
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 21
  object pnlFooter: TRelativePanel
    Left = 0
    Top = 672
    Width = 669
    Height = 96
    ControlCollection = <
      item
        Control = btnPrev
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
      end
      item
        Control = btnNext
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
        RightOf = btnPrev
      end
      item
        Control = btnCancel
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = True
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
      end>
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 671
    ExplicitWidth = 665
    DesignSize = (
      669
      96)
    object btnPrev: TButton
      AlignWithMargins = True
      Left = 20
      Top = 14
      Width = 85
      Height = 68
      Margins.Left = 20
      Action = actnPrev
      Anchors = []
      ImageAlignment = iaTop
      ImageMargins.Bottom = -10
      Images = UIImageList
      TabOrder = 0
    end
    object btnNext: TButton
      AlignWithMargins = True
      Left = 128
      Top = 14
      Width = 85
      Height = 68
      Margins.Left = 20
      Action = actnNext
      Anchors = []
      ImageAlignment = iaTop
      ImageMargins.Bottom = -10
      Images = UIImageList
      TabOrder = 1
    end
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 564
      Top = 14
      Width = 85
      Height = 68
      Margins.Left = 20
      Margins.Right = 20
      Action = actnExit
      Anchors = []
      ImageAlignment = iaTop
      ImageMargins.Bottom = -10
      Images = UIImageList
      TabOrder = 2
    end
  end
  object pnlHeader: TRelativePanel
    Left = 0
    Top = 0
    Width = 669
    Height = 81
    ControlCollection = <
      item
        Control = imgTackBkgrd
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
      end
      item
        Control = sbtnMethod
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = sbtnLogin
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = sbtnStart
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = sbtnSelect
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = sbtnOptions
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = sbtnFinalStep
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = sbtnSuccess
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end>
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 665
    DesignSize = (
      669
      81)
    object imgTackBkgrd: TVirtualImage
      AlignWithMargins = True
      Left = 12
      Top = 16
      Width = 654
      Height = 48
      Margins.Left = 44
      Anchors = []
      ImageCollection = WizardCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 6
      ImageName = 'wizTrackState1'
    end
    object sbtnMethod: TSpeedButton
      Tag = 2
      Left = 213
      Top = 15
      Width = 48
      Height = 48
      Anchors = []
      GroupIndex = 1
      DisabledImageIndex = 1
      DisabledImageName = 'wizImageDisabled'
      ImageIndex = 0
      ImageName = 'wizImage'
      Images = WizardImageList
      HotImageIndex = 2
      HotImageName = 'wizImageHot'
      Flat = True
      Layout = blGlyphTop
      Margin = 0
      PressedImageIndex = 3
      PressedImageName = 'wizImagePressed'
      SelectedImageIndex = 4
      SelectedImageName = 'WizImageSelected'
      OnClick = sbtnGenericClick
    end
    object sbtnLogin: TSpeedButton
      Tag = 1
      Left = 112
      Top = 15
      Width = 48
      Height = 48
      Anchors = []
      GroupIndex = 1
      Down = True
      DisabledImageIndex = 1
      DisabledImageName = 'wizImageDisabled'
      ImageIndex = 0
      ImageName = 'wizImage'
      Images = WizardImageList
      HotImageIndex = 2
      HotImageName = 'wizImageHot'
      Flat = True
      Layout = blGlyphTop
      Margin = 0
      PressedImageIndex = 3
      PressedImageName = 'wizImagePressed'
      SelectedImageIndex = 4
      SelectedImageName = 'WizImageSelected'
      OnClick = sbtnGenericClick
    end
    object sbtnStart: TSpeedButton
      Left = 1
      Top = 15
      Width = 48
      Height = 48
      Anchors = []
      GroupIndex = 1
      DisabledImageIndex = 1
      DisabledImageName = 'wizImageDisabled'
      ImageIndex = 0
      ImageName = 'wizImage'
      Images = WizardImageList
      HotImageIndex = 2
      HotImageName = 'wizImageHot'
      Flat = True
      Layout = blGlyphTop
      Margin = 0
      PressedImageIndex = 3
      PressedImageName = 'wizImagePressed'
      SelectedImageIndex = 4
      SelectedImageName = 'WizImageSelected'
      OnClick = sbtnGenericClick
    end
    object sbtnSelect: TSpeedButton
      Tag = 3
      Left = 315
      Top = 15
      Width = 48
      Height = 48
      Anchors = []
      GroupIndex = 1
      DisabledImageIndex = 1
      DisabledImageName = 'wizImageDisabled'
      ImageIndex = 0
      ImageName = 'wizImage'
      Images = WizardImageList
      HotImageIndex = 2
      HotImageName = 'wizImageHot'
      Flat = True
      Layout = blGlyphTop
      Margin = 0
      PressedImageIndex = 3
      PressedImageName = 'wizImagePressed'
      SelectedImageIndex = 4
      SelectedImageName = 'WizImageSelected'
      OnClick = sbtnGenericClick
    end
    object sbtnOptions: TSpeedButton
      Tag = 4
      Left = 417
      Top = 15
      Width = 48
      Height = 48
      Anchors = []
      GroupIndex = 1
      DisabledImageIndex = 1
      DisabledImageName = 'wizImageDisabled'
      ImageIndex = 0
      ImageName = 'wizImage'
      Images = WizardImageList
      HotImageIndex = 2
      HotImageName = 'wizImageHot'
      Flat = True
      Layout = blGlyphTop
      Margin = 0
      PressedImageIndex = 3
      PressedImageName = 'wizImagePressed'
      SelectedImageIndex = 4
      SelectedImageName = 'WizImageSelected'
      OnClick = sbtnGenericClick
    end
    object sbtnFinalStep: TSpeedButton
      Tag = 5
      Left = 519
      Top = 15
      Width = 48
      Height = 48
      Anchors = []
      GroupIndex = 1
      DisabledImageIndex = 1
      DisabledImageName = 'wizImageDisabled'
      ImageIndex = 0
      ImageName = 'wizImage'
      Images = WizardImageList
      HotImageIndex = 2
      HotImageName = 'wizImageHot'
      Flat = True
      Layout = blGlyphTop
      Margin = 0
      PressedImageIndex = 3
      PressedImageName = 'wizImagePressed'
      SelectedImageIndex = 4
      SelectedImageName = 'WizImageSelected'
      OnClick = sbtnGenericClick
    end
    object sbtnSuccess: TSpeedButton
      Tag = 6
      Left = 629
      Top = 15
      Width = 48
      Height = 48
      Anchors = []
      GroupIndex = 1
      DisabledImageIndex = 1
      DisabledImageName = 'wizImageDisabled'
      ImageIndex = 0
      ImageName = 'wizImage'
      Images = WizardImageList
      HotImageIndex = 2
      HotImageName = 'wizImageHot'
      Flat = True
      Layout = blGlyphTop
      Margin = 0
      PressedImageIndex = 3
      PressedImageName = 'wizImagePressed'
      SelectedImageIndex = 4
      SelectedImageName = 'WizImageSelected'
      OnClick = sbtnGenericClick
    end
  end
  object pageCNTRL: TPageControl
    Left = 0
    Top = 81
    Width = 669
    Height = 591
    ActivePage = tabMethod
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabHeight = 40
    TabOrder = 2
    TabWidth = 90
    OnChange = pageCNTRLChange
    ExplicitWidth = 665
    ExplicitHeight = 590
    object tabStart: TTabSheet
      Caption = 'Start'
      object lblMsgStartInfo: TLabel
        Left = 27
        Top = 24
        Width = 356
        Height = 21
        Caption = 'Welcome to the SwimClubMeet data import wizard.'
      end
      object imgStartBanner: TVirtualImage
        Left = 27
        Top = 80
        Width = 214
        Height = 425
        ImageCollection = UICollection
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 8
        ImageName = 'WizardIntroImage'
      end
      object memoStart: TMemo
        Left = 280
        Top = 80
        Width = 369
        Height = 425
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        EditMargins.Auto = True
        Lines.Strings = (
          'Lorem ipsum dolor sit amet, consectetur adipiscing '
          'elit, sed do eiusmod tempor incididunt ut labore et '
          'dolore magna aliqua. Ut aliquam purus sit amet. '
          'Risus commodo viverra maecenas accumsan lacus '
          'vel facilisis volutpat est. Sodales ut etiam sit amet '
          'nisl purus in. Elit eget gravida cum sociis natoque '
          'penatibus. Blandit massa enim nec dui nunc mattis. '
          'Cras semper auctor neque vitae tempus quam '
          'pellentesque nec nam. Ornare massa eget egestas '
          'purus. Non tellus orci ac auctor augue mauris augue '
          'neque gravida. Vitae sapien pellentesque habitant '
          'morbi. Interdum velit laoreet id donec ultrices '
          'tincidunt. Pharetra convallis posuere morbi leo urna '
          'molestie at elementum eu.'
          ''
          'Lorem ipsum dolor sit amet consectetur adipiscing '
          'elit pellentesque habitant. Eu nisl nunc mi ipsum '
          'faucibus vitae. Vitae congue mauris rhoncus aenean '
          'vel elit. Aliquam purus sit amet luctus venenatis '
          'lectus magna fringilla. Hendrerit gravida rutrum '
          'quisque non tellus orci ac auctor. Vitae tortor '
          'condimentum lacinia quis. Ut pharetra sit amet '
          'aliquam id. Laoreet non curabitur gravida arcu ac '
          'tortor dignissim convallis. Fermentum et sollicitudin '
          'ac orci phasellus egestas tellus. Eros in cursus turpis '
          'massa tincidunt dui ut ornare. Sed felis eget velit '
          'aliquet sagittis id consectetur purus ut.')
        ReadOnly = True
        TabOrder = 0
      end
    end
    object tabLogin: TTabSheet
      Caption = 'Login'
      ImageIndex = 1
      DesignSize = (
        661
        541)
      object Shape3: TShape
        Left = 6
        Top = 32
        Width = 656
        Height = 65
        Brush.Color = clOlive
      end
      object lblServer: TLabel
        Left = 39
        Top = 139
        Width = 45
        Height = 21
        Alignment = taRightJustify
        Caption = 'Server'
      end
      object lblUserName: TLabel
        Left = 6
        Top = 179
        Width = 78
        Height = 21
        Alignment = taRightJustify
        Caption = 'User Name'
      end
      object lblPassword: TLabel
        Left = 18
        Top = 219
        Width = 66
        Height = 21
        Alignment = taRightJustify
        Caption = 'Password'
      end
      object lblMsgLoginErr: TLabel
        Left = 90
        Top = 286
        Width = 216
        Height = 21
        Caption = 'The login failed - retry or abort.'
        Visible = False
      end
      object lblMsgLoginInfo: TLabel
        Left = 27
        Top = 48
        Width = 610
        Height = 25
        Caption = 
          'To get started you need to login into the SwimClubMeet database ' +
          'server.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblMsgLogin: TLabel
        Left = 90
        Top = 319
        Width = 251
        Height = 21
        Caption = 'Attempting to connect ... please wait.'
        Visible = False
      end
      object lblLoginDBver: TLabel
        Left = 18
        Top = 512
        Width = 639
        Height = 21
        Alignment = taCenter
        AutoSize = False
        Caption = 'APP VER +  SCM DB VER + COACH BD VER '
      end
      object chkOsAuthent: TCheckBox
        Left = 90
        Top = 256
        Width = 206
        Height = 24
        Caption = 'Use OS Authentication'
        TabOrder = 0
      end
      object edtPassword: TEdit
        Left = 90
        Top = 216
        Width = 279
        Height = 29
        TabOrder = 1
        Text = 'edtPassword'
      end
      object edtServer: TEdit
        Left = 90
        Top = 136
        Width = 403
        Height = 29
        TabOrder = 2
        Text = 'edtServer'
      end
      object edtUser: TEdit
        Left = 90
        Top = 176
        Width = 351
        Height = 29
        TabOrder = 3
        Text = 'edtUser'
      end
      object btnDisconnect: TButton
        AlignWithMargins = True
        Left = 333
        Top = 357
        Width = 85
        Height = 83
        Margins.Left = 20
        Action = actnDisconnect
        Anchors = []
        ImageAlignment = iaTop
        Images = UIImageList
        TabOrder = 4
      end
      object btnLogin: TButton
        AlignWithMargins = True
        Left = 234
        Top = 357
        Width = 85
        Height = 83
        Margins.Left = 20
        Action = actnLogin
        Anchors = []
        ImageAlignment = iaTop
        Images = UIImageList
        TabOrder = 5
      end
      object btnConnect: TButton
        Left = 163
        Top = 561
        Width = 81
        Height = 32
        Caption = 'Login'
        Default = True
        TabOrder = 6
      end
    end
    object tabMethod: TTabSheet
      Caption = 'Method'
      ImageIndex = -1
      object Shape4: TShape
        Left = 6
        Top = 40
        Width = 656
        Height = 65
        Brush.Color = clOlive
      end
      object lblMsgMethodInfo: TLabel
        Left = 16
        Top = 60
        Width = 633
        Height = 25
        Alignment = taCenter
        AutoSize = False
        Caption = 'Select either update or introduce.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object rgrpMethod: TRadioGroup
        Left = 24
        Top = 136
        Width = 609
        Height = 137
        Caption = 'Select method ...'
        Items.Strings = (
          
            'Update the details and racing history of squad swimmers who swim' +
            ' with SCM.'
          'Introduce new SCM club members into your squad.')
        TabOrder = 0
        OnClick = rgrpMethodClick
      end
    end
    object tabSelect: TTabSheet
      Caption = 'Select'
      ImageIndex = 2
      object Shape1: TShape
        Left = 3
        Top = 16
        Width = 656
        Height = 41
        Brush.Color = clOlive
      end
      object imgArrowRight: TVirtualImage
        Left = 313
        Top = 99
        Width = 48
        Height = 48
        ImageCollection = UICollection
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 3
        ImageName = 'arrow_right'
        OnClick = actnSrcToDestSelectedExecute
      end
      object imgArrowLeft: TVirtualImage
        Left = 313
        Top = 207
        Width = 48
        Height = 48
        ImageCollection = UICollection
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 2
        ImageName = 'arrow_left'
        OnClick = actnDestToSrcSelectedExecute
      end
      object imgArrowRightDbl: TVirtualImage
        Left = 313
        Top = 153
        Width = 48
        Height = 48
        ImageCollection = UICollection
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 4
        ImageName = 'arrow_double_right'
        OnClick = actnSrcToDestAllExecute
      end
      object imgArrowLeftDbl: TVirtualImage
        Left = 313
        Top = 261
        Width = 48
        Height = 48
        ImageCollection = UICollection
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 1
        ImageName = 'arrow_double_left'
        OnClick = actnDestToSrcAllExecute
      end
      object imgSearch: TVirtualImage
        Left = 42
        Top = 61
        Width = 32
        Height = 32
        ImageCollection = UICollection
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 0
        ImageName = 'Search'
      end
      object lblMsgSelectInfo: TLabel
        Left = 24
        Top = 25
        Width = 617
        Height = 25
        Alignment = taCenter
        AutoSize = False
        Caption = 'Select the Members to process ..'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object edtSearch: TEdit
        Left = 80
        Top = 64
        Width = 227
        Height = 29
        Hint = 'Search'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = edtSearchChange
      end
      object lbSrc: TListBox
        Left = 42
        Top = 99
        Width = 265
        Height = 430
        DragMode = dmAutomatic
        ItemHeight = 21
        MultiSelect = True
        TabOrder = 1
        OnDragDrop = ListBoxSrcDragDrop
        OnDragOver = ListBoxSrcDragOver
      end
      object lbDest: TListBox
        Left = 367
        Top = 99
        Width = 265
        Height = 430
        DragMode = dmAutomatic
        ItemHeight = 21
        MultiSelect = True
        TabOrder = 2
        OnDragDrop = ListBoxDestDragDrop
        OnDragOver = ListBoxDestDragOver
      end
    end
    object tabOptions: TTabSheet
      Caption = 'Options'
      ImageIndex = 3
      object Shape2: TShape
        Left = 6
        Top = 24
        Width = 656
        Height = 65
        Brush.Color = clOlive
      end
      object lblMsgOptionsInfo: TLabel
        Left = 32
        Top = 27
        Width = 608
        Height = 62
        AutoSize = False
        Caption = 
          'These options determine what data is a extracted from SCM and th' +
          'en placed into SCM_Coach.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object lblOptionProfileInfo: TLabel
        Left = 72
        Top = 163
        Width = 544
        Height = 42
        AutoSize = False
        Caption = 
          'This option is always checked when introducing new SCM swimmers ' +
          'to your squad.'
        WordWrap = True
      end
      object chkbDoProfile: TCheckBox
        Left = 48
        Top = 128
        Width = 611
        Height = 21
        Caption = 'Import club member'#39's profile.'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkbDoRaceHistory: TCheckBox
        Left = 48
        Top = 321
        Width = 217
        Height = 24
        Caption = 'Import swimming history.'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object chkbDoContactNum: TCheckBox
        Left = 72
        Top = 232
        Width = 193
        Height = 17
        Caption = 'Include Contact details.'
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 2
      end
      object chkbDoSplit: TCheckBox
        Left = 72
        Top = 376
        Width = 193
        Height = 17
        Caption = 'Include Split Times.'
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 3
      end
    end
    object tabFinalStep: TTabSheet
      Caption = 'Final Step'
      ImageIndex = 4
      object pnlFinalStep: TRelativePanel
        Left = 0
        Top = 0
        Width = 661
        Height = 541
        ControlCollection = <
          item
            Control = btnGo
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = True
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = True
          end
          item
            Control = lblGo
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = True
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = btnGo
          end
          item
            Control = ProgressBar1
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = True
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
          end>
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 657
        ExplicitHeight = 540
        DesignSize = (
          661
          541)
        object btnGo: TButton
          AlignWithMargins = True
          Left = 288
          Top = 236
          Width = 85
          Height = 68
          Margins.Left = 20
          Action = actnGo
          Anchors = []
          DoubleBuffered = False
          ImageAlignment = iaTop
          ImageIndex = 4
          ImageName = 'check_circle'
          ImageMargins.Bottom = -2
          Images = UIImageList
          ParentDoubleBuffered = False
          TabOrder = 0
        end
        object lblGo: TLabel
          AlignWithMargins = True
          Left = 278
          Top = 317
          Width = 105
          Height = 21
          Margins.Top = 10
          Alignment = taCenter
          Anchors = []
          Caption = 'Click to import.'
        end
        object ProgressBar1: TProgressBar
          Left = 22
          Top = 344
          Width = 617
          Height = 17
          Anchors = []
          TabOrder = 1
          Visible = False
        end
      end
    end
    object tabSuccess: TTabSheet
      Caption = 'Success'
      ImageIndex = 5
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 50
        Height = 21
        Caption = 'Results'
      end
      object DBGrid1: TDBGrid
        Left = 16
        Top = 43
        Width = 633
        Height = 470
        DataSource = DataSource1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
  end
  object wizSCMConnection: TFDConnection
    ConnectedStoredUsage = [auDesignTime]
    LoginPrompt = False
    Left = 64
    Top = 488
  end
  object UICollection: TImageCollection
    Images = <
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
      end
      item
        Name = 'arrow_double_left'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000001AC494441546843ED98BD4A04410C80
              BF7B3A3B3BC5420B0B0B052D2C1414FC05052D2C14B4B0B0D0427D036B6B1FC1
              57F015640FF7388E9B4932939C1CCCD693ECF72599CD7103E6FC19CC393F4DE0
              BF3BD83AD03A50598136429505AC0E6F1DC8947009783796D81C13D5810EE40D
              58364894C4846CE21EA42FBE46A2246698DFBB0393201A899298D1647A0AA440
              BA97A5BA908B59015EA53BE425E00DBF0ABC48F05E23E40DBF0E3C69E03D04BC
              E13780472D7CAD8037FC26F06081AF11F086DF06EEACF0A502DEF0BBC04D097C
              898037FC1E705D0A6F15F0863F002E6BE02D02DEF047C0792DBC97406A63E6A4
              4F8193590A74EFCA01AD01CF5380C225AC3F257240A90D1A2A6115903A91DAA4
              6112250292C416703FAB712A15902476805BA34477A9BBCB6D7A6A042489D486
              CD8D9359A2564092D807AE8C9D307D623D04248943E0224AC24B40923806CE22
              243C055212DF7F4BF02B713BA7DD09296694CA5B6052E20758043E854FCBB884
              3666983242605C6201F8507E177B094B4C98402F31B77F2D2A8B5E7F2C6A84EA
              C994199A80B25061C75A07C24AAB4CDC3AA02C54D8B1D681B0D22A13FF020827
              70317241B97C0000000049454E44AE426082}
          end>
      end
      item
        Name = 'arrow_left'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000169494441546843EDD8314F02411005
              E04741E21F9482C21F2816361634161634169A180C0916361414268682C60233
              C9981073B7AC3B6FE624996DD95DDE37B364EF18E1CCC7E8CCF323014377303B
              901D3056208F90B180E6E5D98186128E017C35ACEB5C12DD816B001700AE007C
              32109100097FA9A11F004C016CAC8828C071F89FCCCF002600D6164404A02BBC
              645E2AE0F53F035CC30BDCB303EEE13D0121E1BD0061E13D00A1E1D980F0F04C
              C020E15980C1C233008386F704ACF4967DB1DCB2356B1917595F17DE14F15413
              A4750E0320DFDD877857C4636BC053EB588012421E99E5A973712A4CCBE74C40
              09B15584BC0750071B50427C28E29E29F00094103B45CC59082F4009B157C41D
              03E1092821E45F09F961DF5A11DE8012E2A0881B0B2202D0879829C092DFF595
              F277B0E3CB8E129EF12CF4D7EA0942869C7FCA883A4294B05D9B24C0ADB4951B
              67072A0BE5362D3BE056DACA8DB3039585729B961D702B6DE5C6DFCC644A3134
              07CECB0000000049454E44AE426082}
          end>
      end
      item
        Name = 'arrow_right'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000163494441546843EDD8B16A02511005
              D0AB8508292C2C6C12B04821068B14299222450A411B0BF17FF477245808FE8A
              E473C2C02C04D922BEB9338F85B15C769FF7CC7DF096EDA1E3BF5EC7F32301B5
              1BCC06B201E304720B1907687E3C1BF833C23980AB79A4772EC06A40C21F017C
              03D8DF99C1743B03D0847FD12487488415701BBE996618C20A58E8D699B5EC83
              10841520B95F15F15C03C10048EE37454CA3112C80E47E57C46324820990DC9F
              8A984421D800C9FDA5887104C20320B9978A187923BC00927BAD88074F842740
              726F1431F042780324F756117D0F440460A780B69736F369ED0D700D2F13F104
              B887F7048484F7028485F70084866703C2C3330155C2B300D5C2330055C33300
              43002700AB9B63D67CC2B61DDB6DD7180799BCF79F017CE81F84856734D00CE5
              09C045DBE8DC87AD06219F567EFE5B3DEB3EC6166265295A27014563233E940D
              108759B45436503436E243D9007198454B75BE815F84673631D0794A4C000000
              0049454E44AE426082}
          end>
      end
      item
        Name = 'arrow_double_right'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000001D8494441546843ED98CD2B074118C7
              3FBFA393BB8B3B39CA95AB5CBD148952A21429CA4149120745A24814C9CBC5C5
              5FA2FC3D9ADABD6CEDB3F3CCB333DB2FB3D79DEFCCF7F33CB33BCF3C3DFAFCE9
              F5B97F3240D719CC19C8193046206F216300CDF27F998159E05319BA31E047A9
              F11AAECD8033FF01CC2920268027E01538F672A518A40128CD97D3FB404C012F
              C050213A004E15FE1A87FA0254CDFB40CC14D91AA8B8D807CE1B9D790EB002B8
              65EA325107ED34BBC085A74771982F809B44321402B10D5C5A2134003120B680
              6B0B84162006C426701B0A11021003621DB80B8108058801B1063C68212C0031
              20568B43CF9BC30A1003621978F62568032006C462517A3472B4051003620178
              6F226813601E78AB59B0EEA09334490196847D5B675ED224DD422BC0A332F292
              26E947ECFEDDF74AF39226E96F7403B8519A9734490F3257845D29CD4B9AA4A5
              C48E50CBD77DB092266931B7079C29232F699296D3EE3E7BA2342F69925E680E
              8123A5794993FC4A395EB451862B10526762A4B8D48F56349D5CEA9D8749E00B
              182C0CF9B455AA109DB555CA204E03DFCAC65609E10AB34E1B5B2544486BD141
              FC36559621EFDBAC4643D6376B32803984C60972068C0134CB7306CC21344E90
              33600CA059DEF719F8039C8E6C314C63FC530000000049454E44AE426082}
          end>
      end
      item
        Name = 'cancel'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000045A494441546843DD994BC856551486
              1F470D121CA4995D9C6B2828A4140935494428D02C4CA814BC444DAC0C1AA50E
              EDE2A0FBC454C2C0CBA08186821814DE8204ED322F29CD1482121A25AF9CF3B3
              BFC5DA7BAF73FEEF0CFE361C3E38DF5A6BBFEFD967EFB5D67BA631C5C7B4298E
              9F2108DC09CC482E3DA3BF92EB9F713EB471115800AC063602F756005E030E01
              C78053C0CDC9109A0C813B80178155C0133D4188CC11E043E0873E31FA1098D5
              005F0FCCEB33A9E3A35510890F805FBAC4EC4A40A07702F77799A483ED55E04D
              E0B3A84F1702DB81B702812F03BF02FAD5A53137B9660762EC00345F754409D4
              C07F0DEC03F6566784BB81E79AEBA1827D884484C016E0E3CC445F001F01DF06
              807B268F019B80B519FF97804F4AB16B04D600073301DE055EEF09DCBABD03BC
              9689F54C73ECBA7F970894C01783F624D56BBE1C011D95DF674E9BDAAAF5C43F
              E1F69F1340A7D312EF88CD81D906EC72022D05CE4F1661C55F40CF39366F036F
              D8FB1E0165D80B4E927AA5493636C6FCE6C64F1D8995FC5E6E925A1A52C94E0F
              7024637B04363B3B7F3FF082035020DA4DAE7D112511F1D3B1FCBC995327924E
              A689E1115091B5C2382E074E987B2D88079BFB3F021112513FD557C7CD9C379A
              843851D15A024A32DA30E9B8042C2C3CFD96804C6A242CF89ACF4540956E3A9E
              4D8F764B40B5CE1EE350CA885D0075B16D217815C0C8EB6C091C6EEAFA9483EA
              FBDF0B1B34022C62E34D3107F8CDFC711D98D9DEB304B409D31259AFD33D81D3
              A50450EEDAE85D5EB574CA2B802D00A703B7F78125F037A096B01DDF350924C0
              811C09F9F6052F5FE51D5BF4DDD7AE4C4AE02EE04F8354DDD2D311F48D8D4722
              75AF6D726F2AEFB5D63C3FDB1558D4940F6990DDC0AB1D08C83447A20F78C57B
              0FD86A303C0C9CFDDF11F05E21A9074A4ED131C42BA40340956A3ADC57480676
              139F011E09A21F6A139F06F4CAA4C3DDC432B0C7A87ADA070204863C46D55F5B
              11217B8C7ACB55ABFF23492A62937B4EB63F5062D30ADC1E169CD715A9BCC835
              EB5D8075B16DF14938B312CB4869630928454B2D4B871487C79DC7D30750571F
              498F6AFCD3A1C25205A6BB02BAF925F0A4715AE6280FD1B2D8728FFA3D0A7C63
              9C55D2ABB49F18D18646F289B49C1C18DD8FF402AD7FA4A139E0C82D92783EAD
              11C8B5943919658896D29359543AA85AF8B74640FFE79AFA21E414BBAA397945
              0DBD1AFB9131556415E5A3C5CE0153FC42E375672DFB21E4959C9CA23937E414
              EB5A922A89BA3999C5D9EBD55B9E8CD23A1545DE1A01052991507FAAEB6415A2
              6F20E5619D239F84C0CB2842407625855AFFAB6BFA1C783F40447DAEB4277D9A
              B28A43EA5E55A6BB10906D497C4D271EC7078EF069175D8116A048A8431AEA13
              93C8AB03541F121A5D0928E8101FF994A454B4A968B4B55891481F026DC0F633
              EB538E14197A7AC0574DED25E02319361A603204D2392449AE6C2E9516FAA897
              CA33B2958EA34FA86A9A8E36D71F51A039BB7111F0E2ABC716110D0197A236F6
              312481B183F5024E7902B700B3171340987A79AB0000000049454E44AE426082}
          end>
      end
      item
        Name = 'check_circle'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000049E494441546843D5995BC8555510C7
              7F9F2F3E24F860DEBABD272414642805F9524460D0950ACB82CACCA2F2020952
              8914A415D11D4C2DA244EBC18794025128BA182894E57B8976B12048A127E5FF
              B1F7617DAB99B567EF73F6C319D81C387BD6ACF9AFCBCC7F664F30E63231E6FE
              D307800B8099C9A335FA2779CE8C72D14605E00AE036E021E0A20607FF04F600
              FB8083C0D961000D03603AB002B815B8A1A31302F329F02670AC8B8D2E006657
              8E3F005CDE6552638C764120DE007E6963B32D0039BD09B8A4CD242D747F079E
              017644C7B401F01CF06CC0F009E05740BF7A249725CFDC808DE701CDD7285100
              4DCE1F02DE077636CE0873807BAAE7EA827E084404C04AE06D67A28F81B780AF
              028E5B2AD7030F03773BE31F05DE29D96E027007B0DB31F032B0B6A3E3F9B0AD
              C01AC7D69D55D8355F9700949C2F1AED08AAD37C1E0085CA234EB469DAB58EFE
              0F869D330C283A2DB242ACE7CC3AE025C3D035C0E1613D6C182F47BF3374B600
              EBF3FF2D00CAB0478D24B5BA4A363DFB3F69FEB12AA9A57329D96901A7646C0B
              C023C6CDFF00B8BF27CF17003F1BB61596EFCBFE574452641A88054024EBA66C
              E08DC0173D00D808DC052828E420C4AF3ECFE6FCBB4A8803469B035092D18549
              E54760610FCE8B32BC50D9FDC901F10320A69B8A000F427B0E405C677B362094
              115B02B4828405C26200538E730EE0938AD7A7FE88DF9F6AE96049FD29E01547
              410E6BC16A990F9CCC74FF022EACFFCB01E81CA61459C769DE089D7F0278CDB1
              A7FBB0D978F71B9013C019C0E43DC801FC0BA824ACE5FB2A817818943D555D45
              6455210C6F005E748C28EFE4A4EFE27A675200B380D39911554BB73B86EBD41F
              A115226CEF3A76949C94A43CB18EB542EFF17C07AEACE8436AE855E069C372CE
              5B4A201E04DE73BC1381F3EE433D44EF756F52590C7CDB158047BA2C104A444A
              48963C59B80FA97E1880758474BEE5582A51D6782FF0A1E3FCE30655F08E9062
              BEE64CC53C4252C82FF137C092C0114A5504781AB0CBF1483C47455054BE0674
              6452312FB114F230AA9AF65267A6D24E78CEA9BAF32EB33746F575DE4470C3A8
              B55D5D8B9EDC2135BDB645973DD1CBEB032536EDC0A4E4CE59AB2A7A512AD623
              3BA148146E9524CEAB71968F9B426D72004AD1EA96A5A28EC3D286952B819013
              5E246ADA10B51E55F8A72262298269EE80FEDC0B2CCB065D17E83C5820961722
              5193F3D7025F664AA2F4A2F6038916346A9FA897D3242908E96B5C57F9C868B7
              FC2F08B42929A36D1481905DAF1D130164B559441DC416FE6BDA01BDF78AFA08
              EF893858D2F1EE93C999C6A5ADA27C749511608A5F68ACEAAC5EB93EDA2B5E3B
              4573BA61B8A949556AEA8EB2CD62B551EAC52A96B44D0064A40442F5A99E031D
              0FBE3A0F227D79FB24E4BC942200A457EA50EBBDAA2631CFD7034054E7AAF7A4
              4F5379C7211DDED8996E0340BA11CA20BD517CE00847BBE80ED42B23102A30FA
              FAC424F0AA00A37576F808A55BDBC7473E2529913691C69C8B154F65DB1D488D
              D59F596F315A9181AB30A9B2BFE25E727C4A868D1A1806403A875A9237578FCA
              3D7DD44BDB33D2551F479F5055347D563D7F441DF5F44605C0B2AF1A5B402472
              5C1DB5914B9F0046EEAC6570EC019C0759CEE931C28834D00000000049454E44
              AE426082}
          end>
      end
      item
        Name = 'login'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000016A494441546843ED99E151C3300C46
              5F376084B20123B0496102D800D8800DDA4D98A11BC0066C00A71EBEF305A789
              6C55C687FC37B6A2F77D8A1C271B061F9BC1F327007A3B180EFC07079E81A74A
              D04FE01578995BEF51422D00296F019038BFC62800EFC0752F80CAEA392DFBCA
              1617C5F67020007E1408075A4AA1766D3C035AE5AE8087731B8F32A0AB0392FC
              1B70031C807B65B2A5E9AE00D31DD702C215401494A4779994AD10EE00D6105D
              002C21BA0158413401D4BEC3E7DDE41190EE9486F6996802C8171B74C42A883F
              0970046E01396D2D8D2680E20968E98E93EBB22BE725A449BEFB79600FDC6540
              DAE4BB025824DF0DC02AF92E0096C9BB0348BD0B401A35353FED114D5D48D970
              4ED3D3CB9C45F2EE0E246069BFF2356D4D9F5F12C9DD81A584B4D70340AB98F5
              FC70C05A516DBC7040AB5869BEC5FF810F605B0AEEF175DA0260D81F1CA2BCEC
              EEB367130F072CCA703646005C54DE15C1C38115225D74CAF00E7C036EF65731
              5B48308D0000000049454E44AE426082}
          end>
      end
      item
        Name = 'WizardIntroImage'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000D6000001A908020000007E825F
              D90000000467414D410000B18F0BFC6105000000097048597300000EC300000E
              C301C76FA864000031F149444154785EEDBCF7775347D7B77FFF5FEF0FDFFB5D
              4F128A8B6C4996E52A4B3AEA36A68510480821A4D06CDCAB8AD5DD2BA637870E
              A1B7D0ABE935406861DECF9C23C9B20CA1A44CBE4FF65AD7F23A4847A7CC5CB3
              67EFD111FF51D9024984C6B04664DA4196E5F5A82D910F204B46397E868D133F
              572ACA9EC4FF6E48414230A4202198640593FC230589BF0B2838413B793BBEC7
              04EDA42426E8F52E28474E789642FCBCC4BF05529010CC5B157C57523C4B90B2
              5B82847329A4EC46FCAF2749C164154841E2EFE23FE3BB5F996DE5F7AC21A0B6
              7094ED18491FFE30E2E74ADD26FE9D90828460A0205F7619BFF822BF17732E00
              268A3871EE563E3571F24DDE2799E477133B13FF42DEAEA0DA125330D9C23F51
              C1C49EC4BF93FFC4B54B86BF91D00E68248EB2FDE72AA8A07C6AE267897F03A4
              2021185290100C294808669C82AFFBDA4D316FEC9594CF13C41F84142404430A
              1282210509C1FC2759AF7721E5F304F107210509C1BC51C194FD08E22F821424
              04F31A0593DF4E594F06C9EF12C41F87142404F3460513CED18F2C89BF94B728
              48BFF325FE6ADE1E057F87C45108E283210509C19082846048414230FF49F977
              0AA41AF157430A1282210509C190828460DEA22041FCD59082846048414230A4
              2021185290100C29480886142404430A1282210509C19082846048414230A420
              21185290100C29480886142404430A1282210509C19082846048414230A42021
              185290100C29480886142404430A1282210509C19082846048414230A4202118
              5290100C29480886142404430A1282210509C19082846048414230A420211852
              90100C29480886142404430A1282210509C19082846048414230A42021185290
              100C29480886142404430A1282210509C19082846048414230A4202118529010
              0C29480886142404430A1282210509C19082846048414230A42021185290100C
              29480886142404430A1282210509C19082846048414230A42021185290100C29
              480886142404430A1282210509C19082846048414230A42021185290100C2948
              0886142404430A1282210509C19082846048414230A42021185290100C294808
              86142404430A1282210509C19082846048414230A42021185290100C29480886
              142404430A1282210509C19082846048414230A42021185290100C2948088614
              2404430A1282210509C19082846048414230A42021185290100C294808861424
              04430A1282210509C19082846048414230A42021185290100C29480886142404
              430A1282210509C19082846048414230A42021185290100C2948088614240443
              0A1282210509C19082846048414230A42021185290100C29480886142404430A
              1282210509C19082846048414230A42021185290100C29480886142404430A12
              82210509C19082846048414230A42021185290100C29480886142404430A1282
              210509C19082846048414230A42021185290100C29480886142404430A128221
              0509C190828460DE5F416BE835F0B7DA659276487C2495F89EAFE7F7DFFD0790
              B8C114C6EDF68FBF8B7F0CEFA9604AA327E0EF76CA242B883EC02B137B42E99E
              D7F6D0EFBCF58F2171831389EDA3DC82D22009FED937258EB72998D2C46304C6
              83D6971B3AF1163E2BF56699FBE5D7271C36D6496F2265E77F18AF6F01A02888
              EB979B42EA8EB58079F0CDED40BC9F82F1861EDB4E90AC609B4CE88D0AF29DB1
              91EC5C32E377FE07C2EF516901E54E9391DB81CBA7400ABE9D0F503081D2E8CA
              B66215F6E7AFABAD5E35FE5A426A29AE947284D806FF087F97BF35261FFE8917
              C7F67C33F29E319276568E236FBFED087F14E522E38D20DFAF3BCBE6E6AF7005
              7B1505D5522790E503F16B7B1BC9773791949DC510BBFDB7F7D4BBF0DE0AAA2C
              FE44D3C70964DBC2D9D6A8BC3F7F4BEBF0AA6D2D1CAB57B94AB53D92699667E7
              D871629ACA67695749FCB3DC5ABE7F007BE280F25BAF675C9728D7C65F8F2B38
              F6CA5F0FC612BF6C376E36CBDE9465F372DB10F3A0A0A553BEC258BBBDFB2525
              DFDD4452761683D2C27F523BBF772E0805657C1966F754634B9AA995FB640F69
              ACD138417D69C0303BA876547E52F4BDDA11985CE4D53AA2C90A4235BDAB35AD
              B82A5BF2E796F64141B525E0F8B2B76FDB23DBFC61EC0965C74E2A5F494A4F24
              48DAE7EF54B03D49B2405A515DDE345FEBAA8B0BEA76A92C9D2A495130925ED2
              A273F9F366F8B3EC2DDCC2D4837092EFE55D887D50B9C737DC69CA476430E724
              4879EB03183B5ACAA93F80F75630DB16D44FEB9C54D438BF7ADFD19B0C2EFE1F
              F552FCD558C30905B50E7786B4FCD04D76FC1EFB74C548A6997F1016C60F0805
              DD05D39B7A7EBCDDBEF1A9DAD609B22DBE450D9B1F323667E98F0881B0F0FFE6
              D6C74E2A5FC9845650E0478BEF93ACE07B449D0F420E75E67E3ED55A0279A56D
              FAD2E663775870C32D59C141D9CE50AEC3F7C5CA4D3FDF6733960EF2E922F520
              9C0977F416621F545A4621F1629C948FC88C4933E1AD0F60EC6829A7FE003E40
              C17042C1078C7DBA7C47EEB430425DB2827A974FEBACB8C3D89927ACB6F3DC6B
              14B4B57CAC9FF788B1CAE069BC2B2BE8F9A6613D14FC6CE9561CEAF715D44831
              781328D31C972F9E7229AFC43FF88E645B3B64E48B1C8762F67810E4789131A8
              367743C17443ED47FAC527EF33DFBACB490A0654A6DA259E6D671EB3AAAEFDF2
              1C9D72644EF27D2924EE6E227837F641A5659249BC9572B458A78493BC91DF92
              DAC748DAFF8DAF8F7D5C01D93C4FE893CFFB617CC0441C5449618EC57F9FB1BA
              EE736A074F076505656C7EADBD7E51E3DAC3375FADFAE9EAF0BE679F14D6E6B8
              C2991276530E02059B8A67565F7DC6E62CDB6CF874885B686D737D1919D87EDB
              3E7F4095321183E4B690DA35E638BC57620AAACC1D398E3ED88C7FC6CE95722F
              32AF938C83D715525E97F354AE1D3632CD7845B150A9397A1105355220D7DEA2
              B3571F1A656DAB4FF32CD6DA039BD10ED9525D6D641F5A69796084D72B63878D
              A9FC9A9E8EDD5DA70CBF418D149289E09F78977F5C6E137404CF6D624DA48C3A
              FE4FD90FF938960E4E9282BC616302C5CEA5144CF2462AD9E6A8CA14DF93A37C
              1004903EC515942F60ECBE3E84B729988C72E7120A05B903ACA14DC79F6D3DF5
              4263F3E5B9FA94FBD45AC25A9B072170FDA1FBC3FBEE2F6EDA728BB1FC194D48
              895466B94696EF41636D6AEEDA83306998CDD5347DB626C71ECD363568A5E65C
              7B90DFA15D4E3AF947027A577B5E6997CED1A5B5B5EBAC9D3A4BB7CED2CB91FA
              F5F63EBC9557DA21375947E1B461BDB3171FC9307AA616B9334AD052BCF9328D
              C16C7338CFD55330AD0F07511A54E9958C12DF27792DFFD5D4C7BB0A5969043B
              EB9DDD3814BA014796FBB20BC7CF3084D38A82705DEBE8FCAFAE2A534246DBA9
              B3050C656DC6D2FAF3D759EFBAD3B835958DDB20AF093436440E3C61ACB6ED47
              8DAC60BC773B3ED2B90136A6160672ECDD4565037A7B8FDA14559B3AD4C61E9D
              34986B59AD35F7A9CDE12CA337D3E4850D2A6377B6A987B77F5CC134A36F8AC1
              8386CAB6FB55524B86A931C3D89C6D6AD35AA268995C6B7FAEB557676DE79D62
              09ABCD7E558927BDA8151B7A474741696F9EA3572B75641BDBD30BC353F421BD
              6D4883A0AE1889B1670AA51BDAA6167A212E7A87778193A7ECE894540513A408
              F36EBCA7827C438E017CA12BD2B3E3EAF9A74C25B955A68832E0B448046DADBA
              D265876F3077FF39696EE8D20B36A7A25757EA91AF784CC1E1EDD78E5F6505E5
              28815141478B66F49BA77715BBC25AAB1F5339BA90B7ACC4516E151B688B6C53
              20DB1892890095C19F56DC0AE1E08AD60A69FAE18D16B5118FC4380B746943FF
              29C7C176BCF994CB08654B41FCE523C786092B28134673F3F1600E831C7B2750
              C2093A26D318E69879819F5BEED73A5B70B585AE68BEBDB5D85675EE12EB193A
              9A255566484D99267796D1AD32D4D5B4ED7BF41BAB6ED990638929884B857970
              1ADDCF039B25C4AFD0ECD63B83FFA3AD9992E78682F0AFC8B52ECF81DBC160F0
              E79521B7410B7761DE472F201D97636D28C3E40718C3991677A654A7325563EA
              CF32352130C3BC5C5B37D05923BC53706B125AAF0D42E32F808E59463FD4CCB5
              470B5CFD86F2551800D85F19B4CA38C418C610CD34FA7185E9067786B115E30A
              6D8B86523A05C4E413A5E0F2C0EE9B8C39160CA41BBC4A08E1776B6F762CF422
              C2CDAFDC30A568E9F1DBCC3D78B4A0BC4D63894741DC86B5E9F40D36F4E3359D
              A345EB0CE6383BD034EAA206BDC43B154DAC4C2B8A37E8CE4C730B44CFB6B4AA
              A556B5A559A611E05C48F973ED6174A7DAC87B486BED44D444490EE9F565DE82
              19FEA259A16C6B23A67E8DBD59C6C3D783E2E301A7C0F17170BCA8B5B7415C18
              9CE308179477154CEB818B9052268AF0A9801BE713BDBD29BFBCADA81CF1C65F
              684B2878F877158CCDB9E85DF42BB7C1ECC685E9CA1A734B57665996A8CC15B8
              41BDB5576F19CCB54674568FCED1A475D46AEC355A7BA3CE15D439C3CAD08282
              18060ABCAD6C6E8DB356E7AACA75D6E89D8DB9CED65CA7476BF52142A33DF157
              670B013414FEA2233416AF0E376BC3D06DC93237644B4DF85B541ECC73F1C50A
              397E27322B3E29A1588479780B1D011155E6D83EB2820A1F2EE2072808F8448C
              01ED5AD473F631AB0C9D90474614F15F517071F33A542AE9251505E5EEBD17D9
              EA9FEE154DF7638695BB3C88ABCFB136617A72478F42A6DCB2686E59C79482DA
              995FF4AEDAF410AD0305110271631FE5D699E6F457F8CFF58CBC58B59B0DEF7E
              35BCE7F9F09EA7C37B1F0DEF7D38BCEF2EFE0EEE78BAB4E51466B1B4FC506609
              0F57F9659DC6391DC1F5D757ED7DB2F7123BF5805D7ECEB011DD7CA32274406D
              AF43AFCB2D189A94DF5232BBF79BC67D2DFD9750C5CB70113F5BB6CD3774C737
              74EFB3653BF8ADC9E31E20124CFB7AB37BF0E1E6636CFF28BBF0986D3AC8BEAA
              D85D52DA26391B2F5D63036B4F401795DD8DD0CE7BDADCD4143CF88CB17ACF88
              D6EC4136C983AB14448F2EF31D5FEE3DAAB6D69BE7F9A35B2E1EBFC30E8CBEEA
              D936FA6DD3CE425787D61434CE887CD7B063DDFE5FCF3E64276EB3D0DA4B8EAF
              BA30A890F6C80A720BA796784B176D750FDEDF728CED39C7F69C67FBCE711ADA
              8F7DBE746DBE0B22F2418B2645E343BE0C83BBFCEB8DBE81BB2347D9D97B6CFF
              0586F68CACBF61FF32ACB65578064FFCD0BA1DD1812F73CA22A6199A4B176E70
              0FDCDA7C949DBACBF69E6743BB5870ED43DE7A621494E1E318B9024F1ADA8BCA
              C3072FB3E69E73288155065F1EF2275B585552B3F1E82FBB2FBCD49736674955
              0DDDFB4EDC6188586805C3CC3E3E0F4A9EAF566C7BCA98EBD3285A27CDE8C1C8
              CE32D6D7B4EEBEF79C7D51B90D990DD22CF422065C4179C7370D87E1DFC0B617
              03DB9E0D6E7B3CB8FDDEE0EE9B03BBAEF6EC38B7F3ECF3CB4F98BBE726149C9C
              DB86AB8282FDDBD93DC6B69C60FDBB1EBA87CE57860F2D6CD85ADF7DF2FC6376
              9DB1E6BEA379654D3CAC9A0308457965E1811D0FCE3F62507352D172DFAA6BA3
              2F180A880D87D8CE336CD6928D1A7BABE9B36EA45999E6A639CBB6E2C8C76EB3
              A6FED1FA9EF30BEB76BB7BAF9FBAC1B6EC61D6D2E60B5758FBC07E8DAD4E65E7
              0BEC50506B6A6A0A1C8E2BE84312C915B4F8729C9EF0861B30E6F38A8183A318
              1BE79607362DF36FDC7F89DD78C9BEAED9AA77340FED78789BB1C6EEA395C13D
              CDBDC7F75D64179F31C7C2280689A2204E31B49321D5DE758EB5ADBA5B173D55
              173D591F3D5E1F3D7AE226BBF8802DAED992EB68C836D569A5D67C471017307F
              E94E8CFCB3B799BFFFF692A6433317AD59E139B0FB0C3B799BCDFCDE77E0EA8B
              AEAD6730843035E95D1EC4C5E9DFACB9F8881DBBC682C3B7AA823FCF5FB1BD2E
              72EED06576FC26839A48C1316328222A53CADFA6204E169115E4C5202213C6DF
              D4A20AC4BF7C574F3EAF2AEAF65D66914DA7A160B6A566D692289AD2F1653726
              1D5C3414D498DC4DA1330F7F6525361F3E9557DE85C09365ACAE71FF783FAE60
              86990792FC69ED98D13ECEABE5F3A3D52FCF2CCD3A7B6DFEF46A8DEB1BD3FC8A
              9DE79E9EB8C5D28A9A90596322D6483DC84AD13AD2E73DC88D30FF2A936F5A49
              35225FBAB126BAF1FAE55F598E7D594649C327794D5030BF2C38B8F3C6C5C76C
              72E1B7DB4EB1A337D98AC0E14CA946EB6CD297B9271555E0838533033894EBEB
              41F887789066AE9F62AC357CD69153EA4330C8B5068E9C61FB0EB3AB3798AF7D
              47B6AD36C3C64B0464FD1A635383FFD0D357ACAEF5478D095505CAF600267D5D
              5973C7C8D5AD279E9CB8CB9678B7E497D7E3EC05D39B0ACBEB478E3DDF79FA59
              6560EBD16BCC3EAF0D2F7E9CFF2DC60C368EDD64437B1FC415E4B9E067CB76D9
              E6AD995CDC34D5D8C2A77E530B4A3AB4BFDAB872E4D0AB6B4F588E548B88801C
              00947E310CFFB61F65B8922C43AB346B005E623ACA75D4CDABE8197DC9C76DD7
              C8718DBD92E794E6955F566D7ECC986FE84A8611F37B6BF10C4CCD2D2A6323C2
              EAA6C3ECF028E313F4585DF2F72B2817F3194581C68ED19BAF1812A07C570792
              59FCC5B55E79CEE6ACE8D09736228F29985975E109AB0A1DCB30C8D39FB52DAB
              A471C34E76F424D3E6376B245C34D2AFB62CD3CA1AF75628B8A06204C2290A22
              F5C971F0891B8D8E240FC7E7E9B9CB6398DD9C6D5FDC3CB803727F5DBB0D7622
              95561547D38B78555438BD13592326119429891204550B0680F5F32E04BC450D
              03C87E50824088826981A1DD572EFDCAAA23FB7FBACCA62DEEFF28FF7BFDB416
              E367418DA31E2E42E51C170AACD6F0FA5BC86B33CCB5FF53B05CEBF27C54BC12
              1918AA0428689916F971CFAF2F915A4476209AC6A2206A02634BB35F8E82EE6D
              B128C867E156E35CDFF0813BB8F8FAEE9D1A7B555EA99C15E43616B802737EE8
              BDF11B0FC3156D1B758E95D952037A5D6568C0106DE83874FD37262BC8BF0E05
              B829348E614E9FD689E432985512CE2A09669778B5A616DBA79D379EB22F976D
              561B1A0B9D011CA1ADFFC6D93BF0AF25BDA0BED0D9A529692F72F59B67F61BA6
              0754A625FEE1C3979FB17507AF40C134C38A5C57FDD663AF468E33B8A8B5D7C3
              C2C9052B78D6E4F02183742D5CFB90B1A59E9FE1FDDFADA09C4DF3937105CDDD
              AAE2F0B70D47AE3E67D6792114596985DEFCD2F0ACEF877E614CEBACC0A5EB9C
              0DC5B39A361E7C3438F20089517A096A021462D5C72EB2DED58FB4C636145C2A
              0BD2C75096B1B6DAB3F5DE0BF6C58A2DC8BDD24CAD2A8B2FAF2C0A1D91FCA2DC
              C92C89CA711705AC3BDBBA1C8A63D4FAD79E44EA3939AF412345784522B5A386
              C08C896C46CE9AE5FAD7DA86D93CCDD088B3A371AFBF60B5E191E219A1A9456E
              45C1E15D57309BF3BB98DF5930C397E36ACE30577F94BF44E3E0454C5A496DA6
              B9C1F4790071A2A5FF0202AAB6B4150A66395B271BEB117E9060E4185AE62CE8
              7BFC8245060EBE8B829996CAE1FDF7AE31CCFE3F644B75A84B50EDE6B9063027
              B8E647715F6BF71DD3972E47F7A71BEA31EA72ADA15C9BB7B26DEFE833860245
              C9BC0106D5D4E286A2999DB80CAD03C57B37E015AE3DA8B7B6220AAE68DD975D
              DC50EC0A23CF397B97F90746B151E80A43C15CA9575518511579F5765F7AD152
              E9B3669C77CD4FD7F5657525B3FDB397F4229B5FDCB8ADA0DC0BF91056D05088
              82F0AF787AFB27F9353D23BFADD9C7A4B9437FB982B27329F093C90BA7DD6905
              6D985E479FB39AE811841CC42AC40FDFEAB3A71F3274249F018B6BD28AAB0203
              57CE8FB2626B1D3A1E335AF9C2106E6F6EE5766D6967860513719FCEDEA731B6
              55B7EDBCF76A9C8208840A7C81C6CCCB52BDB31BD99B7351E4E403B6E31CCB29
              AD458FF27E35CBABFF56EF5443CD5443154E8DDA02DB79D3FCE9A6AAC986A553
              8D4BD4CE15530C0B307CA36B4EE878C5C097D65006AEDD756DF4096BEC3A899D
              F5656D48D45496A618122F00117816D46D448D6F9A1B416A08FF5070A45B5BD2
              F952085FE3D09BA339C58D576EB3401F146C50D9F8C2785CC1A3C90AF2857DAB
              27A7CCD3B5FDC1AE4B0CB3B6BC50A0ACB90654251EB5A1F2574C88C3FBD4AE06
              9533A076F00A5D8719C01A5A54B50196CCAF184475CC2B3FA903F623461A6675
              E8CB431952C3A4E2DA298666CC0939E666BDA506E71D1C195597D4E6C9F5DF99
              3BECDBFA9D53F257E8ACBEE2B29E1C537B8E3992230572246F7AE1CA4979DF9E
              BDCFD6EC79A47721B2D6F66EBF76F617866A892F4148289CBD98E591B82317C2
              F67FB59575ED579086A2C7FF5605E595FAF10A167A717D7B2FB0EEAD7710AE72
              9CFE4986C57B2EB1BE1D8FF5A5018019562DF9162E1B79F4844D9BD95A50EACE
              B4547DDBB00A0999B47028A3B433CB15D5B97AF58E555A53B8DABF074D0C05D1
              883C86252988EEC1052068A597B420320DECB977E806B32DC07CD488EC9EE7F8
              E6305FBB3222FFAB471CC2593018EC0B3AE7556D1ADAF378C391171B8F3EDF7E
              966D3AFC10113ABAFAE7F10ADEB8FE98CD5DB24E5E9469CBB6A074E5CB341C33
              5F7C36CCEAAAEB3E8C6183B898E3F461FE4D935AA6585AD2ACEE748B17B1566F
              EEC8296ABD94AA604857E25614ACF56C433BC414443952EAEFDAF6EBAE0B2CDB
              CA5311046FDC206E13C3586DA87AFE92F5AC3A98ED72A7BB222A67486D8FE82C
              DDB9D688A2E09715FDC88675125F87D2D9DB54A65A8C1C695ED78AD091CEED8F
              477E663F9E603B8FB3E3971932B9E0E061BDD4A436341796792E3F628D1D2773
              ED2D53F3EBB30C3EEE5F5CC18CA29A7C573366FFE0F0955CA707E6F5EEB80A05
              9183E6957AF937E02E1FD2C1FC699E82726C7B74A59ECF2BB7A041A62D5ACB93
              2B5909210A76A617A19EF005D75C3E7495E95C7EC40F75D90A0C8E452DBBB3ED
              BEDCB228EA090C1A6359F0D7676C69C51A548B534B9685561F41E997E9F44D75
              4472CABBB36CD17CD76A9D14AD0D1EC05D7DB5F2473EB8CD5E1425490A8690CB
              E32F624345947FADB2AC6D1F62D2D4E23A25042A2B1D9831271B9667DBAA8B66
              B7A222BEC9D8B6D3ACA6FDF8B2B683CBDB8ED4B69F5DE1F98947C1B882008179
              E3EEDB5010850EB7190731B9012E40A64D6B6B2F9CD11EDE7819D534423BA6F8
              345333144CB37A010221F6D1491D9AE2D68B77585BFF4124062857E525AA708E
              C9D31C3CC6A3A0773BA29DBCA4CA97F1724A833D3B9EED3CCFD4B616EC86FC95
              2FB2A008C34C5252AD28A876C614CC7644B4D6640507F5D64628986B692F9915
              B5CDEFDC7C8C21F9DE729279D7DE58EE3F551138BDBCF5E00F755B6FBD60F5A1
              6D1A436D565163D134EFC0B6FB67EFB17C572B6A112E9FA993C32D6C2B2CF3D5
              450EA1E3E6AD1842B6879CAF77C7C5B38FD9E0EED1C1DD3707775F1FD875B56F
              E7E8D09E1BABF6DE1AD875AD73DBA53587EE4159EB977CE64918926CCEBBF347
              15C440FCA175278FC9F66604804F57F6A08FA77DB77A525123862F42C8D482E6
              22BBEFFA4D166C3F82E46652F10FEB7FBAB1F9C82FFF5F41D5144B483BAD2BC3
              121EA760E5F6D729189852ECD797B7CFAEECBFCA9877D505CCB6B00153B61202
              1505334CF5887F15A19F467F633DDB6F952EEECA29AD47559B66A847F844FD91
              515477FF37165E750269CD38051F32D492300028851EC492097C92C78BCDC0FA
              0B476E21756BC0BC9F616E8182E9369FA260A6C415541B5ACFDD63BE01AE20A6
              A7D82AA9D1DBE43FFE94B11AEFB66405B54E7FDFCE974824700BD82D59C11C63
              0D14EC1CD89F8570E508652015B6F1CC3BC71CFAAA72DD9D57ECCB15ABF36C2D
              F82797B26EFB95A7AC6DF8A663C140B6B3515BEE85DC9966D4C57585A50D38AF
              A7FBA7499AEFF5666F9EBDC1FAB9FFF263B66EDF739D05337508E6C995724B8E
              B561FAA29EE337D8C1CB4C6B5D99EBF0AB8C88825C41DFF071DFF029E05D75DC
              3374AC6DF5CFFE357CBB79E048EBAA63C18D675157FDAD0AC681821145C17C57
              0FAE589A1BB88BDCAE627DBA798577FDF1D34F98DAD902FFB2AD1D2863A54F07
              D5C5751B36DD3A7E9A15CD68CDB6AFC450AE09EF48B779A0A0CA19C93447F21D
              C3188E35819F30B016546CD3D9027C8961CC3F0E4A634CBBF0E0D81D669C13C5
              74A9B1F13591B1ABE2296313B2ABE388466B2EA8ED35989135D6269DDD9B6B0F
              671BD167BD05CEC8DDE72C34741C033DDB16C6B4888DCD7BEE8CDE8F2998F26D
              1E14E4DF4DDB034870718FA8513011675ADC938D8D090591A7624EC49151D378
              870EF1EF7B6C885B9D3A6BBBA6C4DDD0760C1362B57B3BCFA2E42771609BD619
              ECDFF56AFB19865B5014CCB207B3EC7E9D33AA33D53D7BC13AFAF7A9ACCD536D
              C1749B1F17996DE68BD50B2AD6DCFE8D2DACDC8C52436BF21794452E3C62EBF6
              FF8A0186A1A8B23572AC1EB44CAEA5A9C859F784B1C8EAE37996E63CC9976BAD
              43D9BBFB0CC3747CF531A2F5B5CAC0D6CF2B032BFCEB371F7980E464E381A7E6
              4FDB542535282891BE23D45D7CCAD20DD5E945AD93729B8BCA7A9071C9792187
              E7DF313C8A0F0A29F2BC237F48C18C625E8EE497379FBCC3AAA207B3EDCB870E
              5E5B7BF4BEAC60BBDADAABB5F6669B02E9FA4AB767EFBD5FF8DA8D343F80745B
              9ADB9861F34CB546D3AD619514CDB32BB9E03EFEB55EC5EB72419B5B65AD59BD
              FFC9E5E7AC70264FD778221CFB2A297E55D8B6B52CACDF8EF91729A0F2CC3662
              0FFF4A14FED9BAD5A668BE2378EB2932A4A3D91264E50A6AA5E6913D7747EF32
              948A13FCE30AE6D83B11577EF06D1B7DC54B6624B8E86664FD19567F9AA58DE7
              8216BE2484D9EDC065D6367414537C424184C6BAB6630F5FB14A9423490AA2C8
              18D8CD7E3CCD78F6394EC170AEB91E0A76F6EEC5709A620DE01499E680CAD88E
              669C5FB1FAE60BB6B8665B8EB915095CE982C1D117EC9BC6ADC876F2CB3A9315
              2C70780A1DB5B75FB2C0C0214C4128D80B9CCD55C1BD8F18B37F1E5AD27468ED
              9E175B8FDF3B30FA78DBCFF7826B4E2EACDEA091EA26E556AA8A5173F0FC32B2
              F12CF2878C923AFE7583BDAFA874883F42819A4F2636F3C8C4DB9F9322CF3BF2
              C10AF2678A54063F0AA534C3B2C15DB7877FFA256F46F5A1BB6C496853B6A399
              B7B5A54F23F5A16451E5D7CE991B628CCDFE61F0DBD66DE71F307D694586D537
              D5DAA128A894232B038A829BD05B19C666B4E69882F686B9D59D975FB2EAF059
              9C9D779B14D06022B66016E0E9BC7C6181BCB220D23E1C64FA77ABF92BE66E79
              A8B4E31A78CA25056A0227AE4F50F0C7BDF7AEDEE10AC2391C24C93FAE2072C1
              4FF26B6C5FF97F7EC0EABB4FE94A793982E10105D3E30AC2EF6CA3FBC64BD6DA
              7730A6207FA827022F5FAB20E6DCA1BD0CA5035F72471E69E9C2C5E04528A8B7
              D43DC344AC286809A5590299E690AC601B14C4299636EE511B1AF50E0F666158
              629AEBD1BBA06037A2664241BDA31553CAB567CC3F7458676CD29578F31D8D43
              3BEF220A6AADD5C5E5FE7CA70FF36FAEBD8967C0D8C112CC2AF6E7DB7AD2F37C
              69856E04BF792BBBD18C9F2D1F2C28F7E63AF9722097CFD8C51FE43175202ACB
              4495278912C899869C6CBC0F7F48C1E269FC518E8FF5CBEADA0FEFBFC68A3E5B
              398A1475913BAEE000E0CF0D587C8E99DE8BB75843D761E4F5C83934520D52C0
              740B4F045552983F6125F92A837B6ECB0A6AEC1E4C2ED9764FA6A5853FE9091C
              75C7EEB1D5076F23D4A517CB0FCF59DAB882561EEAE4458108D24184ABCAD089
              1B18EB0BE4C7E04C831A532FAE536DF6A71737A2F8BDFA944141FFD051BED0CF
              8B533E116FF9E9DEA57B4CFEB63E25042A0A46FE9BB34265AD400DBEF6E0CB1C
              572BEE4EEB82823EF8978EE3583D93F3EA9A3B2E2026756EBDA0757895A71974
              B6505649634D8027B82B3C5B93140CC3C2B88221F8A7917A143575AE2066CC27
              2F59B8FF00EAF13429922E85B882A6085770C5DA1B2FD8D2D67D2A431DCAD2EA
              F061A4E096793E8C103E72620AF2F931CB583DFA842173E8DA78E163F58A7C6B
              58636E40B50BABBEADDF9E6DAEF93867095E81C71A53CBC7DA4ABD2D5AE0E82E
              B0F723A9C5C8C1F8D438961DBBCDBA47468B6735655B972289579B8362144C26
              5941E5947A6737C61F5228D7D77DA751F3AFDA098732ED4BB31DAD4A14848239
              B65E5E5E945485D79FDF7CF2D1F0FE0781813B93749E7453779AB93BDDCC9F3A
              4156CECB88C876B4A96B51CF54434D5A49ADD6D99261AECD2F6F430AB8EB1CDB
              7391D9BE8CE697F95100E538517DF36F5A21043EA8B2344CCA6FC1A4801EB57F
              D97B8D31E4CB05659D7ADB80CA104436533C3D923FCDB3F1F08BC19DD7CE3F64
              1D1B4E2341CC3406F565BDE8B0AE91F3979F317921904B89892F192808EF7125
              33BE1FBAFE8A7DD7BA5B5B565B300BA3C233D9580F1D55F6DAD6BED3A7EEB3B3
              8F90839EE073ABB5139FC27566992AAAFC3F22D3E2658ACD830917658AF2F8C9
              9A7D6CC72959410973C500B71313347F3EA0F6D223165D7F3EC3124C977A32A4
              0E798876AB4A3C485190C37CFAC3FA6CA941636B98FE6DDF459E7D9E2D98E1CF
              867FD6E69C324FD1CC485A49F5C851B67AF78313B7D8C0F6DBB9D610C25B8E14
              C0F5746D7E70F33776EE01DB75866D3AF668D5BE1B5D2397A31B471737EED263
              50191014F9570C7A6750E76C58E6DB7DF5395BDCB425B7AC4263AFE2DF4BD9BB
              004F301083E44787F037E69FEC468A30EFC81F52101791E7EAC17514CE8860CC
              610ADC7CEA317A08018C8F754B0F2C443482A6FAE98196A1D3889190ECD36F77
              E74A6BD38DFD71053197D5A91D9555EDBB60CFE72B37403B5885121B7F0B66F8
              6ADA4F4291BACE535FD68C947F3338F3DB5533BE1F9EF1FD1A99A169DFB55BBF
              0CF1A798AC9DB050E7F2F7EE4275C11F9E2899D9A532364EFB7A184DBCFF2243
              AE962D2DB9FA84F9074F2285851039CE9E49C5F503FBEE1DBACD103FD0D90839
              C9E0151893E30823D6A2DC0EAEBB79E9196B1A3C69F92AA8296FCC9DE9767ED3
              B5E6C0AFB8A985756B779F67FED5176095A220C26196B4A2A16BF7F5176C65DB
              08A260B282ABF7B2ED8882B6485C41CCC5C10C53A3C6518F28DED0772AC312CD
              30F7F1A544F9F91A1CF6EB9A3D68E42F2A47F24ABDE9252BF3CA5A56ED7E8C5A
              07E981F1B370A6B541FAA27BA9F7D0E9076CEB3196EF6A3C7091B50D5C46E19C
              2B75C31BE8956EA837CE8EA0353A375FF70E1F8E6E3EB576FF7DE88883E01642
              6BAF14CDF0C84BD06D530AAA5157F987AF60FCF46EBF31EBFB3ECC125946FE04
              1A285DB8A16F1B5B587B10D9734C06D98D1461DE913FA42036E440D88BD46DCD
              E1475718F3AE3B83A8C0A74EBE44C97FD48D880D057565A179D55B31255D7BC5
              E4CA6050651AC830F7A0A19157E54DF34F2A5EFA4DF316BC5BF6DD107CC59846
              288582A07BE4E1A5A76CF4255FE7BBF6823716626D02BC38B0E70EC600EA069D
              A3E77F74F5BAD2D6CD279EA3B7B0271A173B9CB8C91A3B2FA0A6CBB1B88F5D45
              C75CC474935912CD2D1D289A3530F4D3B383371005310577649ADA1578DF9B3B
              30ADE01E210D92361EAAA5BAC5CD3B0FA12ABFC70F8E534097F6ADA3B6F9EDE8
              A1439721F723EE1F80880EAFC6565713DEF392B14AFF6ED458C90AA20B371D66
              D8E60F7C987BF9FC650D20B4A31D2EFCCA6ABB4E2245C990BA140531D491217C
              BE6CDBB5E76CDA37ABF5656DBC563554633A5EBDF705AEE1E2AFECEA2BFE28CD
              C9BBACB1FBAC16A3D7587FE6366B6E1FC59D72FFF0D71632CEEA9E5A58CB6712
              4793CE55A5B6AD449B2045CE75F87D4317CEFCC2FCEB8EE63A3D86E9FDF9A551
              F80AD1E7576ED877918D3EE72DCFC1C673FE30C7AA3D2F0DB3C348BE952C4821
              459877E48F2A88D681851A9B5F57DE92615D81BF1F1556F202827F84FF9E8807
              1B7BE747F90D45B33B0A3FF5E49435671AC393F3A22A535F5C41D4BFCD883139
              AE66D3DC88DAE99E6CA84B333722DF422F2230A0024837F25F49625C220068ED
              8D9886F89754C051FB71D102DDB42A7C5CE7ECC0A48FABC2C5E4957BEC0B7C73
              56742C6A585FF675176699A9858DE8895C7B1499B873DE00926B2898618CE638
              BBE07AF19C763E05C7FD4B52903FC5AE7893E308E27AA61AAA700BC573BDB32B
              BB67AE682F9ADB5830B355636F459F6192CA3244E51088F921C2D78C2C8DD996
              1A9DBD3AD7D1C01594BFD84D58689C3DC015941FF8E0CD650D14CD6CC76D2210
              AA6DC80AFC904F06D97633867196D16B98D18D7C11C9835A6A452A8CC99D07B6
              391DAEAF0717B5EC2E5D3C9829D520A340C445FA3135AFA5C0D1A977F0F40EFE
              F18549A33BBDB8193332CA0BFE25077206A94727F523CFD3D86B765EB8FDF343
              0677D38B7C79CE4EA44F9015B760991B2DFDAA77D677C3B3BE5BC3F9761DFF0E
              C2D682D99F670E8A0F320955DE8BF750703C3CF1E4091FB2017B049308EA4419
              C43FD4B0CAB73463FBC8B94E9897298E561E0C244C315D72A2C39B18FD016FF8
              C398B6D8420C12441C13B104834CEE30F9572996309F562C18D31CBEF68B7E75
              D4F33EB3A208E0DF22F0EC9E079BB03CFA15DA7552148936DF9F1F2100F81ABB
              3C8A50C4200CA3A4E05D9EF865968C7CFD725923C9CFEE23FB41018B6AC3E146
              9280225D65E3AEC8AB3FFC194F7E0BFC770B7C58F2BFBCD4C05579B4B6569E08
              CAEBD571F84F051494577803F2C788DCE857057E55FCA70BCAD7DFBC83E5AF06
              788370F8CE09BCFC0262FF7780FCB4294A87F8028ADE119DA4AF2D99D9535CDE
              C92B24A35F65F0E138BC3DA52EAD6918641405D24B2AEA7AD6A15E4196CC7F97
              C31795202E32482FE07781A696D06EFC8B4759BB04F17894F89F33DE933F4141
              B9C48BFDA6262E5F621FD8293F5984BC10E98EDD07D09DF827620C0F81F2404F
              740C483E8E727BBCFB2D1DBCBDA42EA4353CB3917FBEA435F7E115C55D653A90
              F784821CFEAE7940FE8BDD7AB43105A38A97B00467C447D0C17215A2FC3E9F97
              2331120AF289B21B452BBF062E16FFE25B192AB0244902F97966FE9B9590EC16
              4F949561A3A0DC5DE24E9314C48B7C994656D01B5FF26D954745CCC2781FF390
              CCDB84932C812CE518A1847F6AB35F2DF990F822E041446540F267BA0C518DB9
              9BB78F690D14D4DB7BA614567857EF436A014D1117C759283FFDAFE5BF3E91D7
              22F83764AF27A9EBDF830F5690138F701CA5C3E2704163FB7005E11C5FA09165
              0DCA6B135DF17D38F22BFCC594D795A65714942DC49C827691B174CB62F5C872
              74A5EC29238B288BCBD7DE628A8FFD0404DBF11BC1B922C9F14F417E5D51B097
              170D385A22BCF12744C64BA0FCAE275941ABF2BB276548281710237E0D8A82CA
              0CC0516C56D6A17879148FCDCA9520B1E617A3889870916FC7427502BE5C227F
              630995F9AFC9ECEE6CA90989201C929BAE576DEC511B95213A8036445CC46E57
              9EB291E38C27129641ADA51F534AFC7E03FCBE783925FF1AC1A28C3ABE861A33
              3ECE8418F44EFC590AF2B42909C521799F6405B1A1FC93EFAF1C84EFA9C81757
              70EC0813C552A660994ED92D28C817C0E5A65792B638F2FE4AF0935F89052145
              0EFCC576F2352829C1EF2908E363795E2C8226C13B409E6A1313B1A2602C24A7
              5818DB21A1601C4565251551A26086D59F81906C45AACA15E416C63C8B350EDF
              96E3342E5286EF1057D00305E5A79D9B50A0B87BAF38BE1884403CCE611E90E7
              041EA1ADFE8269A12D47D8D567AC607A905FA73430EE7E955F247205BD0A72D4
              4FB63026A25805B9854924BDAE4CC4FC4518A6BC98B28FF2CF3711DB2DDE6D49
              A081E448336EE7D8E9629D3D11FECD611CEC16BF176EA1CCD8DD29AFF3281B8F
              B5CA1913E71D1B1E49C79F788531925F1F835B1877910F924447AA6C3132F017
              0A2A168EC1AF3649C4F1C446851C9BADEEA9452BF5A5CD07AFB2EBBFB17D9758
              68FD99259E91CAE09E259E1DD5D123918DD751DD1FBFCBBE6AD8C0136BDC85D4
              134B9CE24D1A1B245C440E8FD963C3261602F995A7B6DE3BF1272AF806F8E41B
              D3224E5C97D7BFA26C27BFC299D07931E23BC477FE4005C11B144C8A64C94A8D
              53308994CB7B072628289F5A65E5C0BF0C9BB22D5B884C2E769D9C24E1DE4428
              ADA8696A612DEA5FD4E6F32A5735F61CF8F1E767179FB21377F80ACE8EB3AC77
              C7DD15C17D1952857E46CB1463359729F61FD22512A4310B630AC6FD038A7C0A
              49EDF61EFCF50AFE4924AB934CCA6E6FE54D9F4DB9B504E3F41AAFE06B9960D8
              7BA00C127E31B6A8ECDF3814291592AF708276E3D0DBBBA6E4B90B4ABB73ED28
              6B5A9114AA4CB5F2B2626D7E59B0607A18F3B5694E6F8E2338D5D892E352DA81
              FBCD75B775C8908232C9EA2493B2DB5B79D367536E2DC138BDFE460553FC03EF
              ADA01C2351B715B8063FCE71A717FA956FD8726D9D001B19C56D2A53A868FAE0
              A47C6F7E693F025E5A8952FAC423EE3805B985FC77E249FE91827F2629A74B30
              4EAF2405DFC804B1DE177E3176743F17F14D8CBBC23790B03056C1C44B16A580
              8BC3D35CA5A0494A343BF9FF0F860D54878A82FC80310B65946D0E29F8A79172
              BA04FFFF563026477CED862BD8AF310F71E2652F29F84F2759C1772249820F03
              274DB6EDB58CBBC237206B81A238BE86827FCAB1702CFEC5978A9460A94CC1BF
              3B110352F06F679C5EEFC2780FDE17E5A4C9B6BD96C4E581942324E05AF0D53B
              F8277F6BC757EF100E3B95C897F04FD688E78EC93D1BCB3865FFF8E9E4650DD9
              B97F98827F27C98DFE579072BAD792F291BF9444E59120E562DE8EBCBE98BC74
              1C9F91E3A4ECFFFBC48E26ABA62C412BA4ECF6FE908231524EF75A523EF29792
              E21F48B998B7139326A9469E40EA477E87D8D1FEC50AFEDB48F10FA4ECF08EA4
              389742CACEBF0729F86F23C53F90B2C33B92E25C0A293BFF1EA420F1BF155290
              100C29480886142404430A1282210509C19082846048414230A4202118529010
              0C29480886142404430A1282210509C19082846048414230A42021185290100C
              29480886142404430A1282210509C19082846048414230A42021185290100C29
              480886142404430A1282210509C19082846048414230A42021185290100C2948
              0886142404430A1282210509C19082846048414230A42021185290100C294808
              86142404430A1282210509C19082846048414230A42021185290100C29480886
              142404430A1282210509C19082846048414230A42021185290100C2948088614
              2404430A1282210509C19082846048414230A42021185290100C294808861424
              04430A1282210509C19082846048414230A42021185290100C29480886142404
              430A1282210509C19082846048414230A42021185290100C2948088614240443
              0A1282210509C19082846048414230A42021185290100C29480886142404430A
              1282210509C19082846048414230A42021185290100C29480886142404430A12
              82210509C19082846048414230A42021185290100C29480886142404430A1282
              210509C19082846048414230A42021185290100C29480886142404430A128221
              0509C19082846048414230A42021185290100C29480886142404430A12822105
              09C19082846048414230A42021185290100C29480886142404430A1282210509
              C19082846048414230A42021185290100C29480886142404430A1282210509C1
              9082846048414230A42021185290100C29480886142404430A1282210509C190
              82846048414230A42021185290100C29480886142404430A1282210509C19082
              846048414230A42021185290100C29480886142404430A1282210509C1908284
              6048414230A42021185290100C29480886142404430A1282210509C190828460
              48414230A42021185290100C29480886142404430A1242B144FE1F4E6485F69C
              DEE1310000000049454E44AE426082}
          end>
      end>
    Left = 264
    Top = 552
  end
  object qrySCMSwimmer: TFDQuery
    Connection = wizSCMConnection
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
    Left = 528
    Top = 552
    object qrySCMSwimmerFNAME: TWideStringField
      FieldName = 'FNAME'
      Origin = 'FNAME'
      ReadOnly = True
      Required = True
      Size = 600
    end
    object qrySCMSwimmerMemberID: TFDAutoIncField
      FieldName = 'MemberID'
      Origin = 'MemberID'
      ReadOnly = True
    end
    object qrySCMSwimmerFirstName: TWideStringField
      FieldName = 'FirstName'
      Origin = 'FirstName'
      Size = 128
    end
    object qrySCMSwimmerLastName: TWideStringField
      FieldName = 'LastName'
      Origin = 'LastName'
      Size = 128
    end
  end
  object UIImageList: TVirtualImageList
    Images = <
      item
        CollectionIndex = 2
        CollectionName = 'arrow_left'
        Name = 'arrow_left'
      end
      item
        CollectionIndex = 3
        CollectionName = 'arrow_right'
        Name = 'arrow_right'
      end
      item
        CollectionIndex = 5
        CollectionName = 'cancel'
        Name = 'thumb_up'
      end
      item
        CollectionIndex = 5
        CollectionName = 'cancel'
        Name = 'cancel'
      end
      item
        CollectionIndex = 6
        CollectionName = 'check_circle'
        Name = 'check_circle'
      end
      item
        CollectionIndex = 7
        CollectionName = 'login'
        Name = 'login'
      end
      item
        CollectionIndex = 3
        CollectionName = 'arrow_right'
        Name = 'arrow_left_double'
      end
      item
        CollectionIndex = 4
        CollectionName = 'arrow_double_right'
        Name = 'arrow_right_double'
      end
      item
        CollectionIndex = 10
        Name = 'wizBig_DotSmall'
      end
      item
        CollectionIndex = 18
        Name = 'check_circle_filled'
      end
      item
        CollectionIndex = 14
        Name = 'wizDotSmallFilled'
      end
      item
        CollectionIndex = 21
        Name = 'wizWhiteDot'
      end
      item
        CollectionIndex = 8
        CollectionName = 'WizardIntroImage'
        Name = 'wizBig_DotTiny'
      end>
    ImageCollection = UICollection
    Width = 48
    Height = 48
    Left = 344
    Top = 552
  end
  object actnManager: TActionManager
    Images = UIImageList
    Left = 528
    Top = 488
    StyleName = 'Platform Default'
    object actnLogin: TAction
      Category = 'Login'
      Caption = 'Login'
      ImageIndex = 5
      ImageName = 'login'
      OnExecute = actnLoginExecute
      OnUpdate = actnLoginUpdate
    end
    object actnSrcToDestAll: TAction
      Category = 'TranferBtn'
      OnExecute = actnSrcToDestAllExecute
    end
    object actnSrcToDestSelected: TAction
      Category = 'TranferBtn'
      OnExecute = actnSrcToDestSelectedExecute
    end
    object actnDestToSrcAll: TAction
      Category = 'TranferBtn'
      OnExecute = actnDestToSrcAllExecute
    end
    object actnDestToSrcSelected: TAction
      Category = 'TranferBtn'
      OnExecute = actnDestToSrcSelectedExecute
    end
    object actnExit: TAction
      Category = 'Transport'
      Caption = 'Exit'
      ImageIndex = 3
      ImageName = 'cancel'
      OnExecute = actnExitExecute
    end
    object actnPrev: TAction
      Category = 'Transport'
      Caption = 'Prev'
      ImageIndex = 0
      ImageName = 'arrow_left'
      OnExecute = actnPrevExecute
      OnUpdate = actnPrevUpdate
    end
    object actnNext: TAction
      Category = 'Transport'
      Caption = 'Next'
      ImageIndex = 1
      ImageName = 'arrow_right'
      OnExecute = actnNextExecute
      OnUpdate = actnNextUpdate
    end
    object actnDisconnect: TAction
      Category = 'Login'
      Caption = 'Disconnect'
      ImageIndex = 3
      ImageName = 'cancel'
      OnExecute = actnDisconnectExecute
      OnUpdate = actnDisconnectUpdate
    end
    object actnGo: TAction
      Caption = 'Go'
      ImageIndex = 8
      ImageName = 'wizBig_DotSmall'
      OnExecute = actnGoExecute
      OnUpdate = actnGoUpdate
    end
  end
  object WizardCollection: TImageCollection
    Images = <
      item
        Name = 'wizImage'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000EC300000EC301C76FA8640000001974455874536F
              667477617265007777772E696E6B73636170652E6F72679BEE3C1A000001EB49
              4441546881ED984D2FA44110C77F3D112EB39291ACB810F1F60D70DB83F80C04
              731307EC27E313082E9C76EF760507DC8641189775D8DA43D76464768479AAA9
              48FA9F743ADD79EAE55F5DDD55334144F8CC28793B604526E08D4CC01B998037
              32016F6402DEC804BCD1F31E4A430853C00CF055B7AE811F22729ADC98882419
              C4D3AC02BF017961FC025680522ABB21C5EF8110C200B00DCCE956033800CE75
              3D0A7C03BEE87A1F5810915BB3F104911F20465688A9B20EF476F8AE17D800EA
              B44EA362B69F206DF6D5A16360EC0D3263FAAD00BB18D3C94AA0FA2CF2AF3ADF
              46A27912CB9E049A1776BD80EC6633955C080053EAC07DA79C7F837C1FF0A03A
              268BFA612964333A1F88C853B7C222F20738D4E57451272C048674BE34E8B868
              D3D5352C04FEEA1C0C3A9AB2858B9185C095CEC3061D233AD70A6B487489FB0A
              5EE286EA98F8F04B2C2227C467B41F582DA0620D28139FD1B3A27E58EBC00A31
              8275BA2B64E3C08DCA2EB9D40175A404ECD15D2B314EAB95D881D850BA105087
              2AB49AB93AB1C2FE77278839FFFD59E4933473A9DAE90AB005CCEBD6239DDBE9
              B2AE77814511B9331BB746A02D9D96699D46A771042C614C9BE427D08E10C204
              300B0CEA560DF82996D7E6255BEF41E023F1E9FF95C804BC9109782313F04626
              E08D4CC01B998037FE0165BE73E296A979D30000000049454E44AE426082}
          end>
      end
      item
        Name = 'wizImageDisabled'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000EC300000EC301C76FA8640000001974455874536F
              667477617265007777772E696E6B73636170652E6F72679BEE3C1A000002AA49
              4441546881ED984F6B134118C67F339B5A2851B025E24511ABADE95DA5B86C8B
              14A4BDABA557F5A4DFC052B1B45FC1537B56EAD9469486B23B50CC0748F10F45
              BD69AA82DA8396ECEB21A3144925DDD9BA14F6B98419E69D797EC9CECBB35122
              C24196CEDA80AB7280AC950364AD1C206BE500592B07C85A3940D62AECC7A6C6
              980111B90094EC5443445E0441F03AEDB3548A715A4751342522778173BBAC59
              07E683207808C4691C9A0AC0DADA5AEFF6F6F663E0B29DFA0684C05B3B3E0504
              C0613B5EE9EAEABA363C3CFCD9F56C67006BDE0065605344664AA5D2E2D0D0D0
              CF9DEBEAF5FAA146A3715329350BF401EB5AEB4BBEEF7F7139DFF50E68FBCD97
              45E4A5E77913BEEF6FB45B68811E18639E369BCD65A554594496802B383C4E4E
              5D288AA2295A8FCDE6BFCCEF94EFFB1B9EE74D009F44642C0CC349170F4E00F6
              C22222339D98FF2DBBF69E1D4EBB78480C608C19A0D56DBE964AA5C5BDD66F6D
              6D2DD0BAECE5300CCF26F59118C0F6794424FCFBC276A2F1F1F11F406487E793
              FA7001380EA0947A9F740FA5D4BB9D7B25910B406C4D28873D1480D63A712F4F
              0CA0B5FE0810C7F189A47B00270144E443621F490B955235FB19542A95EEBDD6
              DB9A00208EE35A521F89017CDF7F452BDB1CE9E9E9B9B1D7FA62B1780B2802F5
              D1D1D137497DB8C6E97900A5D4AC31E674A745D56AB55F44EE0388C89C8B0127
              009B2A5780BE66B3B9DC0944B55AEDF73CEF09D00B3C1B191979E4E2C1F51788
              B5D6578175A5D4601CC7B5300C6FB7BB13954AA53B8AA23B8542A1A6941AA415
              E62601A734994A9C36C61C1591251119B353DF691FA78B76FC5C6B7DDD358942
              CA2F3436984DD38AD6ED54179139FBD8A472709A007FB4BABA7A466B7D512975
              0C5A7D3E8EE39A4BB7D94DFB02F03F75E0FF95C801B2560E90B57280AC950364
              AD1C206BE50059EB17468311A5E8E46D1F0000000049454E44AE426082}
          end>
      end
      item
        Name = 'wizImageHot'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000EC300000EC301C76FA8640000001974455874536F
              667477617265007777772E696E6B73636170652E6F72679BEE3C1A0000067F49
              4441546881ED595B6C145518FEFE996EEBD25A309242231053958BF22029526A
              7766174B084A49348110122F893E102A895C24118C42D48418E441B0DCD41745
              456A62006B79D8D439B35B6BD1255E622CE1122F082D82A9C0BAEE2E3DBF0F3B
              4B87ED6C77B6DD5249FC9ECE7FCE7FF9FEB99C73FE738899713343196D02C3C5
              FF098C368A0AE4471142D400984744B3014C035009A0CC1ABF02A09B998F2B8A
              720C405B7777F7574B972EED1B6E601ACE4F6C18C644455156017812C0E43CCD
              CF12D1BEBEBEBE1D8140E0CC50390C298170387C9B9472138015006E196A700B
              09227A379148BC545F5F7F315FE3BC130885424B98B90940C5758E884E31730B
              807622EA2A2A2A3A138FC72F0140494949F9D5AB57274929A711511D804700DC
              93E1FA2280E7745DFF604412300CA3485194370134DABA99990F32F3B64020D0
              0EC0F5D31042D412D13A008FC1369930F33B6565658DD5D5D5C98225D0D1D1E1
              4D24120788A8C1D6FD0311ADD434ADDD2D692784C3E11A29E56E00F75F234574
              24168B2D59B0604134977DCE69341289781CC8EF9152CE192E7900F0F97C9DD1
              68742E80A6741F332FF47ABD9F4422114F2EFB9C6FC034CDDD48FDAC40EA13D9
              A0EBFAEBC3E09C15A150680D336F034056D75E5DD7570C663368024288E544F4
              A1ADEB8591226F8BB99688B65D2348B45CD3B4FDD9F4B3266018C6784551BA00
              DC6E75EDD6757D6541D96681699A4DE89F2C2E2493C9E9D9A6D8ACFF80A228AF
              A29FFCF752CA3585A5991DD168742D337F6789E33D1ECF2BD9741DDF80699A93
              019C04500C4032B3CFEFF7778C08DB2CB0A6D930520F392EA5BCDB69C5767C03
              44B40A29F20070F0469307002BE6414B2CB1B62C03302001C3308A98F9095BD7
              1B4321100C06C79AA639CB34CD59C16070EC507C64C47EBCB9B959CD54707A03
              7391DA4902C0495DD7F37AFA8661CC14421C2E2E2EBE00E0188063C5C5C5174C
              D33CD4DEDE7E5F3EBE745DEF20A2539678474545C59C9C09A8AA3ACF26B6208F
              ED41381C6E5014A5D35AF4EC5BF522008BFBFAFA8E86C3E1862CE64E60666E4D
              0B44F450A6C2800498B9DA267EE93692611833A5941F03183388DA1829E5FE50
              2874AF5BBF00C2B67675E6A0D3273435DD20A22EB75188680B06279F4629336F
              71EBD75A8B0000CC3C75C0B883CD441BA9DFDC04310C631C112D744B0AC0C39D
              9D9DE56E14E3F1F8B5A9938826668E3B25902E03E1F57AAFB809A2AA6A15F22B
              4F3DF178FC2E378A959595976DE2AD99E30529EA7908659D94B22007524E095C
              CB38168B95398C0F402291380DC055016221E9F57A4FBB513C77EE9CFDA95FCE
              1C774AA0DBD69EE226C8FCF9F3FF0270C48DAE85CF6B6A6A2EB951F4783C760E
              6733C79D12389E6E30F30CB78C5455DD00E06F17AA51001BDCFA65E6E936F144
              E6B8D33AF04DBA2DA57CD06DA0BABABA1F1545596611CC8628112DD375FD27B7
              7E89C86713BFCE1C774AA0CD66BC18FDD5514EF87CBECF88680E8043B8FE9F48
              22B5317B40D3B416B7FE521468914D681BA0E0308128A669FE0CEBA08A88029A
              A6893C8202003A3B3BCB63B158150078BDDED36EBF793B4CD3D401088BC72F9A
              A6550190761DA7B95B02780FC08B0020A57C3EED241F5884BFCDD7CE0E665E4F
              44E9F6FBC8200F64590792C9E40E00310020A20621C43C27BD91841042B37D3E
              FFA8AABACB49CF3181FAFAFA1E007BD332113545221137FB9C822012898C21A2
              3DB0FE3F22DA59575737600A05065989A5949B01F458E28C6834BAB3D044B321
              1A8DEE00909EC2BBE3F178D69A386B028140A0979957A2BF1E78CA34CD4D85A3
              E90C21C446004FA765666EB4164A470CBA17F2FBFD9F02D86EEBDA3C92490821
              3612D16BB6AEED1687ACC8B983ECE9E9593761C28429481DC202A924AA4A4B4B
              57565757BB597973A2A3A3C39B4C267710D133B6EE4352CA75B96C5D1DEEB6B6
              B6969496967E84FE2400A08B991BFD7EFF17F953EE87104203B08B88ECF5F261
              8FC7B3ACB6B63696CBDEF5F17A7373B35A5151B1958856A37F756600AD52CAAD
              814040C07DFD4C42081F11AD07D080EB57FB2629E5EA402070D595A3215C703C
              CACCBB60ABDC80D44AC9CC2DCC1C26A2AE6432F9EBB871E32E01406F6F6FB9AA
              AA9355559DCECC3E008B00DC99E1FA0F00AB745D3F900F9F215D310583C1B125
              25252F5BB394376F07D7230EE06D8FC7B3A9B6B6F6CF7C8D0B71C9F72C52977C
              AE6A071B7E07B04F4AF9D60DBFE47380120A856603A867E6D948DD7F4D02506A
              8D4791227C02408499DBCE9F3F7F74D4AF59FF0BB8E96FEAFF4F60B4F12FA49D
              8A4A79DF1FF20000000049454E44AE426082}
          end>
      end
      item
        Name = 'wizImagePressed'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000EC300000EC301C76FA8640000001974455874536F
              667477617265007777772E696E6B73636170652E6F72679BEE3C1A0000013E49
              4441546881ED983D4EC3401046DF206840020A4E102A125A6E913E47E23AFC48
              8833D023BA5C808A286EE26228B2514210E0E0CF0C96E6495B58F2FA9BE75DEF
              DA3677A7CFEC4517D09614882605A249816852209A14882605A24981687A2FB0
              DFD585CDEC041894C3A9BBBF7512E4EED2065C02F7400D78693570078CE479E2
              E2C740B551F876AB80F1BF142877FEBBE2576D0E0C55B9CA87F81A386C70DE51
              39578229FE4A98D929F04AF345A106CEDC7DD6365B350203765BD10E807345B0
              4AE037C328F921A51298B29C164DA94B9FD64804CA26F5B8439707C5FC07D143
              0C606623E0899F57A20AB872F71745AE6C1975F76760C2B2C0AFA88089AAF855
              B07A371E02B7C082F5E6B5006E800B759E6C0A6D6366C77C7C9993CCF94F395D
              09FC15BDFF1E48816852209A14882605A249816852209A1488A6F702EF84332A
              4AED4BCE630000000049454E44AE426082}
          end>
      end
      item
        Name = 'WizImageSelected'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000EC300000EC301C76FA8640000001974455874536F
              667477617265007777772E696E6B73636170652E6F72679BEE3C1A0000043F49
              4441546881ED99DD4F1D4518C67F7B0E8452306DC18B6352BD6B286D82369022
              8816EA3F60136D20FE15F6A60D31B1819AD08B1A885268D4C44FAE0CA620E1CE
              2B638CDF9AA6DA8F045AB182D5F6825A6B04A6173327E765CEECEEECEE01D2A4
              6F3261C2CCFB3CEF3333E7DD776703A5140FB2E5B63A80ACF650C0565B552540
              8220C801ED400FD00634018F01F566CA1D6011B8047C0F7C0E7CA5945ACD4CAE
              944ADD8002700AB80EA884ED77E034B03B530C2903DF050C03FFA608DC6EFF01
              6781C64D1100BC082C3902B90A8C00478116A0017D44AB4CBF0578C908BFECF0
              FF0B7879C3049840462DD235E053A00B08122E4407F009B06A61BE0D54575400
              500B4C5B443F03CF6439BF06BB1DF8C1C29E05EA2A2200A876043F0E6CCB1ABC
              E0A801DE728888DD091FF071EBC81CAF54E00EAE570C4791EF5C2601409FB52A
              1B16BCE03C6671F6A612003C6A324311686CA38317DC3259DC8C4AB151206302
              E4A72467DE64ACFD40B769FB81AA04FE35C08F827F349100E071F403469934D7
              E149DC0C7C04DC76E4F95BC08740B327568748B1F708796287399F16C4931E64
              013008AC3802B7DBFFC0001ECF0D6052F80D790930DB7F433876C690E480098F
              C0ED36112702E814F31780BC8F802EE174C583643045F0C536E0B1B357C5FCB2
              A3EC7A1FE811FD1965905C1604411370226CDCC3FA8320D8173668B867C5BF0E
              DB735C025A45FFCB98005E25DB3B459EF805F842F45BCB461DDB7691D296B5C4
              A44A57B649DAFE2622C5024F8AB9177C8E5041F47F8B5899266067C4B8AF3500
              7B22C61744BF600FBA04D48BFE9D08E032B00C1685B52CFA8FD883595EEA437F
              DC9B89E5122015D73BC68BB694963421965CF5657BD0256051F49F8800FE155D
              1E64B55BE8E74D98C9186ED8832E019744BF390C55E92B9199B8E83CEC33A5D4
              4AC4F85ED12F13EA12F0ADE877C690BF8EAE7FD2DA2A301433A74BF4BF291B75
              E4DDA729E5DD39E24B8901D23F034E7A9412F362FE419F5A28C7FA8BAA431E24
              698AB98F3D16E739317F1EC8C50A308EA784E37414891031802E957DCAE99371
              C11B5C799930E89C13E258A074EBB616B70BC26F2FF001BA3C70950CEF034D9E
              588728BDE0DF050ADE020CC0B020BF086CF72136BE79601FA557CA661CB57C84
              FF76D6D7646742E74680EC443F138A20EFF90690B501EF0ADE3F801D890518A0
              23ACBFA7796D1382EFB78EDE91C8F91E80C316E0868930C1CB051B89F5F100CD
              B3FEE55A991FA3F76FC283A31678C7E2388FC7558C2F418D43C42F404F05827F
              16B860614F01B55EFE0988F2C01BD616AFA1EBA16E9FBC2EB00213F89485A7D0
              97BCFE97602956EC059319EC3C3F8FBE12EC030E008DE89BED6AD37F0AE83501
              CE39FCFF048E268E27E5B6EF00CEA01F30494B08BBDD03DE041A52C592F1FC16
              D0F742D75204BE80AE44337DE40B4C2099CC7C666D039E377FF700BB813A33E5
              1FF457C92BC077E8CFAC5FAB0A7C66AD8880ADB407FE4BFD43015B6DF70168FB
              E5DAE7EB5FC80000000049454E44AE426082}
          end>
      end
      item
        Name = 'wizImageTick'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000030000000301006000000079225
              C40000000473424954080808087C086488000000097048597300000EC300000E
              C301C76FA8640000001974455874536F667477617265007777772E696E6B7363
              6170652E6F72679BEE3C1A000004D549444154789CED5C3D4C1441147EB3BBC7
              FD00C21D3FD160B88212124305110141A2D4C6C2CEDA440A4C08905C02095243
              48A0A1505BA3A1C5868468082D4428888906D4462DF0EF20DEED5A3C9FE7DEDD
              DCFE38BB3B8BF7355F387677DE7CDFCDECDB99B7C70CC3300C03AA08084AD001
              FCEFD0820EC00A8C31C698AAE25FE934723289DCD8884C63F8F818F9F367E4C3
              431CE1BAEE4FB4CEC1829E82CC025FBB863C3A8A3C3888DCD9891C8D3ABBFAC9
              09F2AB57C89B9BC8EBEBC81B1B811B4406F8C588A626E4D959E477EF281A7FF9
              E8C81C472AE5BB1EFE081E8B993BFAF56B30825BF1972FC833331477680D40F4
              F521BF7E2D87C04E99E2BE7C393406202626907FFE9443C87F65EAC7FDFBD219
              80507EA7B34B4B7208E6352F2E52BF25316061410E61FCE6E5E5C00C404C4DC9
              2144D0EC7E6A7229FCC000722E2787004133DD23FAFA3C3300914820BF7D2B47
              C76563CA9AECA7AF0ED7823219645A12A8C28C8E0EE4C949DBA7D8FBE6373723
              7FFB466755B912934ECDCD8246C0F838726DADBDE3C304C5831561D2696CCCF2
              D0CADF7C5A24FBF0818E3E2BAC28972E45A38611894C4FA75286C1584383A288
              6E87D6B854D5E508181941BE70A1F271E1010A0FA06977EE3434003076FEBCA6
              0168DABD7BC924001A21AAB5B636E4A1216E3C952F70E386A8508246B1F085D1
              8D60ACB5555501346D6C4CBC11D7AF73E3AA7C22ADC7871756C21783B1544A55
              01186B6BD3846D570D0F73DB33CFF9B44142DE7FFF8E4CCBC9E18153E101F279
              00805CEED1A3E363005DDFDD3D3D15154D368B5C57877A1736803823A0BD1DD9
              4BE16B6BBDC83FDC0BFFF8B178E109F138F2C58B25F1963FA1A54574087F1A54
              7A7B6331809A9A4CA6A90980B1743A121171DD7FFDC6EFEC8817BE18A5BA720C
              109FEF2B4A4F4F2C06A069B76F9F3B0700904830061089DCBDDBD8E8DE08B9A6
              1A2BD4D5157FC2318031514D2A4A77B759F8E26BC7E36E8C0897F07C700CA047
              6911884651722B53ED19116EE14B75E518F0E993A826757D7B3B9B05C8E59E3E
              C5ADF8BF73AE72286F849C3757A7F8F8B1F8134E1A4A9DA334D4693D0E1F8A72
              E54A3C0EA069B76ED5D7638B95CF3839C1F822113CD2A9F07EDC5CADE0200DC5
              03B01300FBFBA243D1F5972FB359807CFED9337B2322160BAFF084BDBD62E109
              169938559289473EFFE2054E4D4F9ED833827F2500BFD349A7D8D8E0FDC7C280
              E7CF4587520C5DDFDAC211B1B6E6CC0819E7781EF83A726B43F15E40AB218787
              C8DEAF8AAAEAE0602201A0AA376F9666CD007265355678FF1E399D364FED0570
              47009E409BEE0F1F7A136029F2F9CDCD1F3F70449893B6307DE309ABAB3CE1FF
              C0DE96646B2B326545FE6D9CA8EAD5AB89446103C5EFF6DD3195C9279396FA5A
              1D6036627E5E8E0ECACE998C6D5D9D19502D4BA9CC0707C8D1A87003CC46540B
              B3CCEC4361567923A6A7E51020681E1F77ADA3DB13CD4650B570D042F8CD0116
              E79A0DA0BDAD95153984F19AA90C5F82F2F4F28650D5F4597B41636242B85EA2
              2F6836826ED66FDEC821A453A6B8FBFB3DD3C9AB0B9B8DA0F4F5C10364FF1FE8
              EC313D7BCFCD51DC9EEBE37503E50DA1CD697AB00BAAF491DAA5385A5AFCD643
              B217B5A980895ED4A629ACAB0BD969990CEF456D5A9DA417B52BACD5788CC00D
              B082B9508CEA95E8456FDCE62F80DEF3A52D55FAA902797B28BD01671DD55F4B
              0918BF0088944796D535FF880000000049454E44AE426082}
          end>
      end
      item
        Name = 'wizTrackState1'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000262000000180806000000597091
              68000000097048597300000EC300000EC301C76FA8640000001974455874536F
              667477617265007777772E696E6B73636170652E6F72679BEE3C1A0000101D49
              444154789CED9D6B9454D59580BF7DAA1AE86E148D62E3385150830C33CBE830
              3E78D4AD5A8A7110159D253E235197F1113466C4D732C1CC8A1A434212A37126
              3A4B41B208101045213D304D4FD5AD8606677A664DB2E20B152638DA6066C628
              9DD06DD7D9F3E3DEEAAAC67ED4ADEE86D875BE5F754F9D7D7AD7A9EA7BF7D967
              9FBD4555E90D119904CC01BE008C07EA0001DE075E073603CFABEA8E5E077138
              1C0E87C3E11886F8BEFF3955BD5444CE15915354752CA0C01E60A7AA6E8AC7E3
              EBA64F9FFE7A6F63484F8698889C0C3C0CCC2530BCFA2207AC0216AAEADBE57E
              1887C3E170381C8E4F034D4D4D275A6B1F04AE0062FD7457555D95CBE5BE71CE
              39E7BC75E09B9F30C444E432E059A026A25E1F0237ABEACA88728E3210911104
              3F800B813380630003EC055A807A60B9AAFEE19029394C49A7D347C462B1EB55
              F53CE054E068A04355DF15916DC05ACFF3D603F6902A3A0CD9BE7DFBE11D1D1D
              F3ACB5E78BC8E9C0514027D02A22CDC08BADADADCFCF9D3B377768351D7E6CDA
              B4A9B6BABAFA5A559D059C0E8C057222D2AAAADB45E4A55C2EB726954A751E62
              55871DCDCDCDD59D9D9DD7A8EA05C01482B9B704F7FB975575C3D8B163574D9E
              3CB9E3902A5A2164B3D94B54F519E0C888A2FB811B3DCF5B5EDCD8CD101391BB
              814514BC600AAC07D6005B80D6B0FD58603A7019309BEE5EB3DB54F58988CA39
              22202297008F037FDA4FD7BDC05DAAFAD3A1D7AA2230D96C7681AA2E040EEBA7
              EFAB04FF705B0F825E9580643299DB44E45BC011FDF47D53556F4A2693FF7230
              14AB047CDFBF097804F84C3F5D77596B6F4DA552FF7410D4AA083299CCB522B2
              9860B1DD17EF88C8ED8944E28583A157A5E2FBFE7CE0C7454DAAAA1B44648DB5
              764B4747C77B00F1787C5C3C1ECFDB491752645789C8BD8944E27BF901BA0C31
              11B91C5859D4F915E07A557DB92FA544E46C600930296CB2C035CE3336F88888
              008B813B238A3E03DCA4AACE4B50269B366DAA1D356AD473C0F911C472AAFAB7
              C964F2F1A1D2AB1248A7D3A38C312B09E2554BC502F77B9EB76888D4AA085A5A
              5AAAF6EDDBB74C44AE8C20A6AAFA5032997C60C814AB0056AF5E1DABABAB7B0A
              B821A2E8F73DCFBB9BC091E218443299CC5522B29C829DF49A31E6BA1933666C
              EF4B2E9BCD9EA9AA4B80C96193AAEA15C9647235045B59F998B0A545833702D3
              FA33C2C2D1B601538174D864809F88C871A57E3847C97C9FEE46D85EE0EBC0E7
              81D1402DF067619FDD45FD6E00FEF120E938EC686969A9AAAEAE5E4F7723EC55
              E01663CC49D6DAEA582C76B8889CA5AA8F001F857D6222F2582693B9F5A02B3D
              7C30C698E7E86E84ED50D5F9C0446B6DB5B5F63063CC5F85DEB20FF272C0777C
              DFBFEB602B3C8C90B6B6B615071861BB54F58E582C36A9AAAAAAC65A7B98B5F6
              74117900F89FBC9C882CF47DFF9B8740E761435D5DDD337437C276037701936B
              6B6B6BF7EFDF3F1A385544EE277816E459E0FBFE770FA2AA15416363E37122F2
              0F84769288A4ADB553FB33C2001289C4CB1D1D1DD3086CAB505C963636369E04
              A1474C445612C41B41E0099BA6AABF8BA2A4881C013453F08CAD50D5ABA38CE1
              E81D11990314BB9CD701F354F5C35EFA57033F01E615355FAFAA4B874CC9618A
              EFFB0F1118BC10B8951F696D6D7DA0B738A46C367BACAAAE05CE0E9BDA81A99E
              E7FDC741507758E1FBFE7D045B6200A8EA0F478F1E7DEF9429533EEEA97F369B
              1DABAAAB8164D8D40924DD1671743299CCED22F25851D393471F7DF4577B8B43
              6A6A6A3AD25ABB82C282C58AC8171289C4E62157769891C964AE1791678A9A96
              555555DD3275EAD41E637EB76FDF7E787B7BFB320A0B1655D539C964F2A52157
              B642C86432C58B92D7ACB55353A9D4077D0A1D404343C3981123463413384C10
              91158944E26A21309C5E21B0F21438BB144F584F84DB945BC3B13E06C6ABEABB
              E58CE528202271E035E0A4B0E945E05255ED37185C4496025F0A2FF700135C00
              7FE9F8BEFF59E04D600480883C9048241EEC4FAEA5A5A5A6ADAD2D0BFC6528D7
              904824CE1B52658719A151B593C0D30BB0C8F3BCFBFA93ABAFAF1F595B5BBB99
              208E15609BE77953874ACFE148F8C0D845211EEF09CFF36EEB4F2E9D4EC763B1
              58BDAACE0C9B7EE979DE69B86DB29209EF1D3B29C4843DEB79DE7525881ADFF7
              5F002E0AAFDFDCB367CF24777065E03436361E178FC777017140ADB5D352A9D4
              B672C66A6A6A3ACB5ADB4C687319632619E0620A5B922F956B8441D736E52FC2
              CB2AE0AA72C77274E3620A46D86F093C61A59EC8BB05F84DF8BA0E705ECA68CC
              A7608435251289874A119A3265CAEF812B091624A8EACC6C367BEA9069390C51
              D59B291861FFEE79DEFDA5C8CD9A35AB9DE0DE935F709C9DC9649C2116819123
              47DE40C1087BD55AFBB552E452A954672C16BB86C2F6FCA9E974FADCA1D071B8
              B26FDFBE6B281861BBDADADA6E2E51D45A6BE751D8223E79DCB871170EBA8215
              48F89B8E8797BF28D7080308B732D7879762ADBDD8D03DEE654DB983F732C6B4
              4118CF119C4CCDF378946D6355DD4F105B96E7A2DEFA3A7AA46BEE73B9DCC344
              58D97B9EB703F879FE5A55DDDC47A3EB2122228F10211D88E779BB8165F96B63
              8C7B204540558BEF398BA2A4A498366DDA5E11E98A4935C6B8DF7D0444A4F8B7
              BA385C5894442A95FA4044BAB216B87BCEE010EEF6E55F0FAA9D2422E70BF016
              7062D876B2AA7E22D9581444642241D67D80FFA5FFE3CE954C1B85157FA99CA1
              AAFF1645203C8C514EF58376606419727FD44C983081A54B974615DBDFD6D676
              44949B2280EFFB5703CBFBEDD89D37808911653E1584B9D6FE24A298B5D68E49
              A552FBA208F9BE7F31412C65147E031C1F51E6D3C2FF113DEF1122724C229178
              3F8A4C369B3D57551B22FEA9F709F2630D47CABD979EE879DECE2802E1D65724
              8F8DAAB68948D4675125D165CB18634E993163C61B03192C9D4E9F6C8CD90120
              226F1982EDAA3CAD3D8B45E2BDA2D7CE081B7C769529E3928B0E8C77A31A6100
              618C936360FC36AA1116E2E67EE0FC3EAA110620226EEE078EB5D6EEEEBF5B77
              8C316EEE079F2E5BA6B3B373C071EFF95C6300AA3ACE0C74C01EE8AF24926360
              B8F93D34B8793F74B8B93F74B8B93F74B8B9FF23A4AAAA6AC0DFCB8811238AC7
              B086E0245D9E7103FD03078C11E968A7A324269421730261CE3847D91C5B5F5F
              5FCED6C2F8C156A402396AFBF6ED87471552D5F143A04BA551BD79F3E6BAFEBB
              75C75A3B7E0874A934C45A7B4254A15C2E377E0874A974BA6C19553D7610C6EB
              B29344646F9C60DB2A1F23368D20666C201407E86F56D5CB06385EC523224F53
              48EC371B887AB2B538F0769DAA5E32288A5500BEEFFF0AF80B60D4E8D1A36702
              1BA2C88B48F1DC7FC3F3BC870753BFE18CEFFBCD04B9D84C7B7BFB2C605514F9
              E2B917916F271289AFF7D5DF51C0F7FD06E05C80AAAAAAD904D5394A46446617
              95CF7BCCF3BC3B0657C3E18BEFFBEB084ECA138BC566038FF52DF1098AEF394F
              7B9E77E360E956A9F8BEBF16B8144055A711C4F1968D31A6D84EDA69808D450D
              836134158FE192280E0EEB8B5ECF0F93E7964498D8754151D38B83A65565D035
              F7AA7A3F11B60B9A9A9A2602971735B9B98F46F1EFFE3E227875B76CD9723C45
              C98C73B99C4B6C19011129FEDDDFD3D2D25255AAECD6AD5B8F51D52FE7AFADB5
              6EEE2320222F15BD5E904EA747952ADBD4D474645875E2136339CA47449AF3AF
              07C9B9D43586AA6E3404A78AF24B978B44E4CC72470E8F785E105E7E0CAC2877
              2C47375E22482A0A7014B04C444A7D283D49E114582BEE3B8984B5F60982134F
              00D33299CCC252E45A5A5A6AC22CE3F907D83F7B9EF7ABA1D071B822224F119C
              2C06382D9BCD3ED257FF3CF5F5F52373B9DC0AA03A6C6A1E48DE9F4AA4BDBD7D
              09E1768C889CD2D6D6F6682972E9743ADED9D9F933E0300055FDCF542AE532EB
              47201E8F2FA7103274BC31E6C912454D2E975B46F08C00D8D1DADABABE2F0147
              691863961354E900B8209D4E9FDD57FFBE686A6A3A8B426A1E0BAC33AAFA3A05
              97BF004B44644CD4C1432FCD120A1E83D5AAFA5E1F228E1251D54E82FA915D06
              33B056447A8D9B11911A11F929706D51F3BD2EAB7E3452A9D43BC0F7F2D722F2
              77994CE6DBE9743ADE9B4C6363E3716D6D6D8D8459F581766BED3D43ACEAB023
              3CADD755C54055EFF17DFF877D7967B66EDD7A4C6D6DED460A21129DAABAA0B7
              FE8E9E993973E6EF44A478D1F115DFF79FEC2B4EB2B9B9F933C698F5845B9A04
              258E8AEF5B8E12983A75EA1F44A4B882C4BC6C36BBACB9B9B9BA379986868631
              BEEF3F5F94834C8D3177BAACFA83C3F4E9D3DF55D57CEE2F31C62C49A7D325EF
              4CE56968681863AD2DB693567A9EB7235F6BF224E097404DF86623F037A5260E
              0D8DB0E78154D8F401F0E7AEBCD1E022228BE9BECDF83EF02841DCD29B0437BC
              09045EC93B80E2C2EB4FABAA8B152883743A1D37C66C04CE296A7E15F8516767
              678331E6BF8151C0A4582C76A9AA7E85A0083B04DFC9AD9EE795BAAA7574C764
              3299750724B9DC01FC08D864ADDD5D5D5D3DA2A3A363123047556F03BA1628AA
              BA20994CFEE020EB3C5C906C36BB4A55E716B5ED021EB5D66E1C3972E47F596B
              E3AA3AD15A7B11703B45C7FC4B2D07E6E8994C26B34444AE2B6A7A07785444EA
              6B6A6A767DF4D147C618F3398298B0AF5294834D44BE9B4824EE3DB81A0F6FC2
              3247BF06C64050F43B97CB5D5A6ABDC9B06CD85A0ACF913663CCA93366CC785B
              F20195223297C03396B7D45E212812DD676078B81DB98442B16F0B5CA5AA3FEF
              5DCA510E222204DE99A82BFCA7819B55D5AD8ECA24ACFFB696EE9528FA232722
              5F4B24123F1E2ABD2A81FAFAFA913535352B4524CA21130BDCEF79DEA2A1D2AB
              12686969A9DAB76FDFB2A262C7A5A022F2602291F8E690295601AC5EBD3A5657
              57F71485835AA5B2D8F3BC7B709EC841C7F7FD2B809F5188577DCD18735D58B6
              A857B2D9EC99AABA04981C36A9885C9E4824D60048D1C91644E46E601105634C
              090266D7005B28247C3D96A0A0EE6504D6787100F37C55FDFBB23EA5A3244464
              0EF038F0D97EBAEE0116A86AD4CCEE8E9E31BEEFDF092CA4C8EBD213AAFA6BE0
              CBC964B2B9AF7E8E92916C363B5F55BF45FFD9E1DFB0D6DE9C4AA5D20741AF8A
              209BCDDEA8AADFA1107FD41B3B45E4D64422B1B19F7E8E12C966B35F54D5C574
              4FBEDE13BB45E4F6442211B59A842302BEEFCF078A17D7AAAA1B44648DB5764B
              3E596B3C1E1F178FC7F376D28574B7ABEEF13C6F717E806E861880885C063C4B
              619BB2543E046E52D54847CC1DE5212223084EE4CD06CE20C84B22C05EA005A8
              079687B5261D83483A9D3EC218F325E03CE0F3045B021DC03B22B2CD5AFB7C32
              99DC80AB6630E86CD9B2E5B05C2E378FC033791AC1DC7702EF02DB80759EE7BD
              809BFB4167D3A64DB5A3468DFAA2AAFEB531E674553D06C801ADAABA4D44D65B
              6B9F8B5297D2511AE9747A9431E61A60163085A028B88A48ABB5F65F8D311B6A
              6A6A564D9932E5E343AB696590CD662F51D567885E326C3F70A3E779DD9C239F
              30C4807CCCD843C015F47F5C3F4770126FA1AAEE8AA894C3E170381C0EC7A70A
              DFF727101C26BA1288F5D3DD022B8D310B67CC98F1F6816FF6688875BD1914F0
              9E43B0FA3C81604B12822DAF1D4003F082AABED9F3080E87C3E170381CC39374
              3A7D727848EB5C602281B712E03D11D9A5AA1B093CF53B7A1BE3FF011628EB65
              8D6A706B0000000049454E44AE426082}
          end>
      end
      item
        Name = 'wizTrackState2'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000262000000180806000000597091
              68000000097048597300000EC300000EC301C76FA8640000001974455874536F
              667477617265007777772E696E6B73636170652E6F72679BEE3C1A00000FBD49
              444154789CED9D6B745CD57580BF7D47B22C215EA6205337601E01D7ED225097
              87A57B07AD00A1E6ED2E1B024E1C60111E318414F35A24265D09C471701A02A1
              05BAC0E02EC7766C1E063BAE5D990E7347964DAB763559E165C06E4C4198B425
              80652466EEEE8F734773059266EE68649799F3FDD23D73F6D6D619AD997DF6D9
              676F5155864344A60017025F0226032D8000EF02AF009B80A75475DBB04A2C16
              8BC562B158AA90743AFD791199099C011C0F1C0A28F00EB01DD8E838CE9AB6B6
              B65786D32143396222722C7037301BE3788D440E58092C50D537CAF9432C168B
              C562B1583E2B643299A381EFABEA2540A2C8740556261289EFB4B6B6BEFEC917
              3FE58889C82CE071A029A65DEF03D7A8EA8A98729632109171C025C079C0C9C0
              618003EC02BA81F5C03255DDB3CF8CAC5244E420E00AE02CE004E00F807EE02D
              600BF024B05655837D666495B275EBD603FAFBFBE70267ABEA4922720890057A
              802EE0999E9E9EA766CF9E9DDBA78656211B376EDCAFB1B1F1ABC00CE024CCCE
              3F07F488C856557D3697CBAD6E6F6FCFEE5343AB90AEAEAEC66C363B4755CF11
              916998B50F309FF72F88C8BA091326AC9C3A756AFFBEB5B436F07DFF22E051E0
              E098A21FA9EA55C9647259747090232622B7008B2844C114580BAC063A311F76
              0087036DC02CE05C0647CDAE57D507621A678981885C04DC0FFC5191A9BB809B
              55F51FC6DEAAEA47441C603EB000D8BFC8F49780AB5475F3981B561B88EFFBD7
              03DF030E2A32F7B52008AE3EFDF4D3FF792FD85513643299AB55752130A1C8D4
              1D22729DEBBAFFB837ECAA053299CC5755753166B33D126F0237789EF7F45E30
              AB6649A7D3F344E467912105D6A9EAEA20083AFBFBFBDF06686E6E9E1804415B
              1004B344E43C06FB55B7799E774F5EC18023262217032B22935F04AE50D51746
              324A444E03960053C2A1009863236395474404580CDC1453F451E06A55B55182
              321191FD802780B36388E580BF52D5FBC7C6AADA20954A8D4F24122B30F9AAA5
              1288C81DAEEB2E1A2BBB6A81EEEEEEFADEDEDEA5C0976388297097E779778E91
              5935C1AA55AB122D2D2D0F8BC89571E444E4C7AEEBDE82791F2C152493C95CAA
              AACB08FD24117919B8DC75DDAD23C9F9BE7F0AC64F9A1A0EA9885CE2BAEE2A30
              4759F99CB0C7283861CF01ADC59C300055DD024C0752E190033C2822934AFEEB
              2CA5F263063B61BB806F035F009A81FD803F0EE7EC8CCCBB12F8FBBD6463D521
              22F598C870D4097B09B816380668040E004E0516021F847312C07D2272DDDEB3
              B6EA701289C4130C76C2B689C83C553D2E97CB35E672B9FD45E4CF31D1B2F7F2
              72AAFAC3743A7DF35EB7B87A90DEDEDEE50C76C27688C88D8EE34CA9ABAB6BCA
              E572FB27128993803B81FFCECB010B3299CC77F7B6C1D5444B4BCBA39F70C276
              AAEACDAA3AB5A9A969BF3D7BF634ABEA09C01D98EF02005475BEEFFB3FDAEB06
              57395D5D5D9354F5EF28F849A96C363BBD981306E079DE0B7D7D7DAD18DF0A4C
              10ECB1CD9B371F937F40445660F28DC044C25A55F5F7718C0CF366BA2844C696
              ABEA657174588647442E04A221E735C05C557D7F98F98DC083C0DCC8F015AAFA
              D8981959A588C85D188717CC2E732170E770114611391C9327765A38D4074C57
              D57F1F6B5BAB8D743A7DBB882C8C0CFDA4A9A9E9B669D3A67D3CD47CDFF70F05
              5601A7874359553D3D994CDA23E298F8BE7F03705FFE59441E9A3061C23787CB
              43CA643207ABEA720A1B9600F892E7799BC6DEDAEA2293C95CA1AA8FE69F5575
              697D7DFDB5D3A74F1F32E737CC9D5C4A61C3A22272A1EBBACFEE0D7B6B01DFF7
              07362522F272369B9DDEDEDEFE5E11B1417474741CD8D0D0D0850998002CF73C
              EF32C1384E2F62BC3C054E2B25123614E131E5E650D7C7C064557DAB1C5D9602
              225207BC8C89BE003C03CC2C25195C441E03BE163EBE031C6513F84B47443E07
              BC068C0B87EE54D5EF9720D704F8C09F85431DAA7AD6D858599D844ED5764CA4
              17555D944C266F2F26B77EFDFA86E6E6E64D983C5654754B32999C3EA6C65619
              E117C60EC27C3C1179C075DDEB8BC9A552A9BA4422B11E38331CFA95E7792762
              8FC94AA6BBBBBBA9B7B7773B859CB0C73DCFBBBC0451279D4E3F2D22E787CFAF
              F5F4F44CB11757464F5757D7A46C36BB03A803D4719CD6B6B6B62DE5E8CA6432
              A7AA6A17A1CF2522531CE0020AA1B667CB75C260E098F297E1633D7069B9BA2C
              83B8808213F63B4C24ACD41B79D702BF0D7F6E016C94321EF328386119E0AE52
              8454B517B37BCA476ECE1491132A6F5EF5A2AAD7103A61C0BF2593C93B4A919B
              3163469FAA5E0AEC01B3417CFEF9E7AD2316838686862B295C8A78299BCD7EAB
              14B9F6F6F66C22919843E178FE844C2673C658D858ADF4F6F6CEA1E084EDF8F0
              C30FAF2951340882602E8523E263274E9C785EC50DAC41B2D9EC1C8C1306F0CB
              729D3000D775B7AAEADAF0518220B8C06170DECBEA72950FA3A3B502FA2CE666
              6A9EFBE31C1BABEA4798DCB23CE70F37D73224D1B5BF5B47AA80FC09C242C7BF
              880CD9B58F4178D328CF42CC5157492493C99D22B234FFEC388EFD428AC7C0FF
              BDAA2E8A5392A2B5B57517919CD42008ECFF7D3C06FE575575F18C1933FA4A15
              0C8FCA06AA1644A2639651A0AAA7451E47ED27398E33A04344CE16E075E0E870
              EC5855FD54B1B13888C87198AAFB00FF43F1EBCEB5CC6E0A3BFE52395955FF35
              8E407819A39CEE077D40431972D5C847C041AA5AF2872280885C062C2B3A7130
              AF02C7C594F94C3069D2A4B7962F5FFE8731C5825C2E77607B7BFB877184D2E9
              F40522B226E6EFFA2D70444C99CF0AFF4BFCBA470087799EF76E1C01DFF7CF00
              3AE2C8A8EABB2272682CCB3E3B94F559AAAA472793C9ED7164C2A3AF58111B55
              DD1DDE0CB70CCD802F2322C7BBAEFBEA6894A552A963138944FE3BF97507735C
              95A7670899B8BC1DF9D93A619567479932B6B8E8E8782BAE131612EB43D43224
              BF8BEB8485D8B51F3DBD719D300011B16B3F7A82200876169F3618C771ECDA57
              9E015F269BCD8E3AEF3D5F6B2C64A2335A854350AC25926574D8F5DD37D875DF
              77D8B5DF77D8B5DF77D8B5FF7F487D7DFDA8DF9771E3C64575040EE6265D9E89
              A3FD059FD011EB6AA7A5248E2A43E648C29A7196B2395C44CA39A69D5C69436A
              9043B66EDD7A405C21C771268F812DB546E3A64D9B5A8A4F1B4C100493C7C096
              5A43C68D1B77645CA15C2E37790C6CA975067C19553DBC02FAA27ED2AE3ACCB1
              553E47AC159333361AA209FA9B5475D628F5D53C22F208A6282B9824DAB8375B
              A309E76B54F5A28A18560388C8AF813F05C663AEE4AF8BA922BAF6DF51D5BB2B
              655BB5934EA7BBC292384E5F5FDF0C60654C15D1B5FF81E779DF1E76A66510BE
              EF770067003434349C8BE9CE513222124DF6BF2F994CDE58590BAB17DFF7D760
              6ECA1304C1B9446AB995C8C0DA8BC823AEEB5E5541F36A92743AFDA488CC0450
              D5564C1E6FD9D4D5D5B546EE7D6D77800D91D72BE1344575D8228A95616DE4E7
              7961F1DC92080BBBCE8F0C3D5331AB6A83E8DADF11B6992A89F0E2CAC59121BB
              F631701C27BAF6B71323AADBD9D97984AA0E1433761CC716B68CC7C0DAABEAAD
              DDDDDDF5A50A6EDEBCF930E0EBF967BBF6B119582F559D9F4AA5C6972A98C964
              0EC694DCC9CBDBB5AF0022D215791CB59F1404C1800E55DDE0602AB4E75DB3F3
              45E494729587BBD773C2C78F81E5E5EAB20CE2594C5151804380A56103EA5278
              90C22DB01EEC7B12970730379EC0447B1794221416745D8EA9A707F04FAAFAEB
              CA9B57BDA8EAC3989BC588C889BEEF2F2C22029882AE41102CC7B49E02E81A4D
              DD9F5AA4AFAF6F0985E398E377EFDE7D6F2972A954AA2E97CBFD1CD83F1CFA0F
              D7756D65FD18D4D5D52D53D57CCAD0118EE33C54A2A8A3AA4B31DF1100DB7A7A
              7AD68E2460290DC7719601F9122EE77476769E36D2FC91C86432A7464AF304C0
              1A47555FA110F2176089881C18577918A5594221C17095AABE3D8288A5445435
              8BE91F39E030034F8AC8B0793322D214D6518AB638BACD56D58F87AABE09DC13
              19FA6B11F941D8ED6048C23EABCF51A8AADF07DC3A765656279EE7BD2B22D12E
              06B7FABEFF9391A2339B376F3EACB9B979038514896C1004F3879B6F199A33CF
              3CF3F744361D22F28D743AFDD0FAF5EB87CD93ECEAEA9A904824D6121E690281
              AA463FB72C25307DFAF43D2232D0414244E6FABEBFB4ABABAB7138998E8E8E03
              7DDF7F8A420D3215919B6C55FDCAD0D6D6F61685FA61A2AA4B52A954C9275379
              3A3A3A0E54D5013F4944562493C96DF95E93C700BF029AC2F9CF017F596AE1D0
              D0097B0A680F87DE03FEC4B637AA2C22B298C1C78CEF02F762F2965EC37CE01D
              85894ADE08441BAF3FA2AA3657A00C42A76B03F0C5C8F04BC04F31B592FE0B93
              43360598097C03D3841DCC7B729DAA96BAABB50CC6097366A20559B7A9EA4F81
              8D4110EC6C6C6C1CD7DFDF3F05D367EF7A4C0376004464BEEBBA7FB3774DAE1A
              C4F7FD95C0ECC8D80E55BD3708820D0D0D0DFF1904419DAA1E1704C1F9227203
              834B16DDE9795ED1766096A1F17D7F09707964E84D55BD5744D6373535EDF8E0
              830F1CC7713E0F9C2B22DF04A235D87EE479DE6D7BD3DE6A276C73F41B201FA8
              4AE572B999A5F69B0CDB863D49E17B64B7889CE0BAEE1B924F181391D998C858
              3EA2F522A649F48889E1E171E4120ACDBE03E05255FDC5F052967208F393EE61
              B033560A8F00D70CD7A4DA529CF0A8F1490677A228460EF896AAFE6C6CACAA0D
              C2DE912B8038974C0211B9C375DD456365572DD0DDDD5DDFDBDBBB94B0D97189
              28F07DCFF3BE3B4666D504AB56AD4AB4B4B43C2C2257169F3D88C59EE7DD8A8D
              44569C743A7D8988FC9C305F55445E062E775D77EB4872BEEF9F82F193A68643
              0A5CEC79DE6A3021B681C922720BB0888233A698A4CDD540278582AF87631AEA
              CEC2DCD0882630CF53D5BF2DEFCFB49482885C08DC0F7CAEC8D47780F9AA1AB7
              B2BB6508C2BCBC9B304736C5CA29FC06F87AD8DCD5327AC4F7FD79C0F7285E1D
              FE5511B9C675DDD4D89B551BF8BE7F15F0430AF947C3B11DB8CEF3BC0D45E659
              4AC4F7FDAFA8EA621129564664277083E77971BB495862904EA7E789487473AD
              C03A555D1D044167BE586B7373F3C42008DA82209815E6840DF855AA7A6B3299
              5C9C5730C81103109159C0E3148E294BE57DE06A558D7BC5DC520622320E7323
              EF5CE0644C5D12017601DDC07A6059D86BD25241C2A3F8AF0167015FC01C09F4
              036F025B30C7F4EB623466B794486767E7FEB95C6E2E70B6889C8859FB2CA6F3
              C116604D32997C1ADB49A2E26CDCB871BFF1E3C77F4544FE023809D3983A87D9
              A06F51D5B541103C11A72FA5A53452A9D478C771E688C80C601A66ED15B3F6FF
              02AC6B6A6A5A396DDAB48FF7A59DB582EFFB17614ABAC46D19F691AA5E954C26
              0705473EE58801F99CB1BB804B285EDD3787B91DB6405577C434CA62B1582C16
              8BE533453A9D3E2ABC4CF4652051647A20222B8005AEEBBEF1C9178774C4065E
              3475902EC4E4C51C8939920473E4B50D93A8FCB4AABE36B4068BC562B1582C96
              EA246CE03D13735BF8384CB4124CDFED1DAABA0113A9DF369C8EFF03EF749A49
              CE3EE9F40000000049454E44AE426082}
          end>
      end
      item
        Name = 'wizTrackState3'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000262000000180806000000597091
              68000000097048597300000EC300000EC301C76FA8640000001974455874536F
              667477617265007777772E696E6B73636170652E6F72679BEE3C1A00000E2F49
              444154789CED9D7D98D4D575C73FDFD90502A218AD0AB149F09DBE3C2636B5C2
              EEB0F149626CB48AF40111498C2F04356892826F35C1F4291A43244DABB1D5F4
              51943E0488881221290DA6FB2C0B8B69D33E6D9EF8860A8D1614D394DA269575
              99D33FCE1DE637B8BBF3FBCDCEB075E67EFE9AB973CFDDB377767FF7DC73CF3D
              4766C640489A044C033E0E4C048E0304BC0E3C073C093C6666DB071C24128944
              229148A401E9EAEA3A45D274E0A3C069C0318001AF013B80BFCBE572EBDADBDB
              9F1B680CF56788493A19B80398891B5E83B11F580D2C32B397AAF94522914824
              128944DE297477779F082C36B359404B85EE06AC6E6969F9525B5BDB8B077FF8
              36434CD20CE061604C46BDDE00AE36B35519E52255206924300BF803E04CE058
              2007EC017E0C7C1F586166FF3B6C4A3628928E04AE00CE014E077E0DE8057601
              DB80B5C07A332B0C9B920D8AA423804FE35EFA3380A3813EE055A007F82EEEA5
              DF3F6C4A3628920E033E057C029FFB63F08DF8ABC053C013C01A33EB1B36251B
              1449A38139C079C087F0B92FE0CFFB1F011B80D566D63B6C4A36119B376FBE08
              7810787746D137CD6C6E4747C78A6463992126E9466009252F9801EB8135C016
              FC1F0E6002D00ECC00CEA7DC6B769D99DD9B51B94806245D04DC03FC7A85AE7B
              801BCCEC6FEAAF55E32329072C0416018757E8FE0C30D7CCB6D65DB126409280
              EB80C5C0B80ADD5F00E699D9DFD75DB12641D23CE04EE0A80A5D7702D79AD9DF
              D65DA92641D2A780A5F8667B305E01AE37B3C7EBAF55F3D2D5D5355FD237134D
              066C30B3358542614B6F6FEF6E80B163C78E2F140AED663693723BC9809BA74E
              9D7A577180038698A48B815589CE4F035798D98F06534AD26460193029341580
              39D133567BC262B414589051F4417C618A5E822A09DE804781733388ED07FEC8
              CCEEA98F56CD81A477E1CFA66919C40AC0AD66B6A43E5A3507924600CB814B32
              881970BB99DD561FAD9A03492DC0B7802B338A7E1DB8D1060B008F54457777F7
              6C335B41B093243D0B5C9ECFE79FAA207796992D037E233499A459F97CFE11F0
              A3AC624CD843948CB01F026D958C300033DB064C013A43530EB84FD2F1E97FBD
              484ABE4EB911B607F822F001602C7018FE452F005E4EF4BB12F8EB43A463C311
              16A3F5941B61CF00D7002701A3812380B370AFC17F873E2DC0DD92AE3D74DA36
              16C10BF928E546D876DC3B762A3EF78703BF0BFC29B037F4C9015F9574C3A1D3
              B6B1081BBF95941B613B81CFE31BEF31F8DC9F01DC06FC4751145824E9CB874C
              D9C6E441CA8DB097811B80DFC49FF563F1D0885BF1B5A0C842E06B8748C7A6A1
              A7A7E77833FB2B4A7652675F5FDF944A4618403E9F7F6ADFBE7D5370DB0ADC09
              F6D0D6AD5B4F2ABE41D22A3CDE08DC13D66666FF9545C91037D343C933B6D2CC
              2ECD32466460244D03922EE775C06566F6C600FD4703F70197259AAF30B387EA
              A6648322E976DCE005DFEDDF09DC36908751D204DC7898129AF60153CCEC9FEB
              AD6BA321E9167CBE8B7C03B8D9CCDE1AA0FF31C023C08743531FF0E178449C1D
              49D70377279AEE073E37501C92A477E3865B71C352003E6E664FD655D10644D2
              15B82156643970CD4031BF21767239A50D8B01D3CCEC89BA2ADA446CDEBCF9C0
              A644D2B37D7D7D53CE3EFBECBD15C4CAD8B469D3B851A346F550F28CAD9C3A75
              EAA5C20DA7A7712BCF80C9693C61FD118E29B786B1DE02269AD9AE6AC68A9490
              D40A3C8B7B5FC00392A7A7090697F4101EDC0C7E9DF68418C09F1E49EFC5638E
              4686A6DBCC6C710AB93140171E580BB0C9CCCEA98F968D4930AA76E0BB7F80AF
              99D9CD29E446E1A975DA43D336339B328848E420248DC3BD5F4786A67BCDECBA
              1472ADF845A18F85A67F053E188FC9D2139E1D3B28C5843D6C6697A790CBE19B
              F50B42D30BC0A4189232747A7A7A8EEFEBEBDB09B40296CBE5DADADBDBB75533
              5638A6EC21D85C9226E5800B29B9DA9EA8D6088303C794DF0B6F4700B3AB1D2B
              52C685948CB09FE39EB0B437F2AE017E165E1F07442F6536E65332C2BA81DBD3
              0899D9AFF0BFFFA2E7E663924EAFBD7A0DCDD5948CB07F02FE388D9099EDC3E7
              BEB8E1982C291A62D9B8929211F60CF0853442E1C6E41C4AC7F3A7E3F99522E9
              9943C908DB89FF1F5424AC0997513A223E19BF551F19227D7D7D7370230CE07B
              D51A61E0C79466B63EBC55A150B8304779DCCB9A6A071F608CB61A8C17F11B17
              45EEC9726C6C666FE2B165452E18A86FA45F92737F47969D7D4874FC9D44539C
              FB6C2417913BB3A40331B397F1A39AFEC68A5426F977BF244B4A0A33DB43794C
              6AFCBBCF46F26F7569D858A4C2CCF602C9AC0571EE6B80994D4EBC1DB29D94CB
              E50E8C21E95C012F022786B693CDEC6DC9C6B220E9543CEB3EC02FA87CDDB999
              F925A51D7F5ACE34B37FCC22102E635453FD601F30AA0AB946E44DE0C82C0F45
              004997022B2A762CE7793C10BD11D905BC27A34C01186766FF934548D285782C
              65167E06BC2FA3CC3B85FF247BDE238063CDECF52C02923E0A6CCAF8735EC7F3
              633522D53E4B4F34B31D5904249D85E733CC42356BD13B86D9B36793CBE5AA96
              BFEAAAAB7ED1DADA7A1480A4D3F2F9FCF343D1A7B3B3F3E4969696E29AFC622B
              7E5C55E4D57E64B2B23BF13A1A61B56767953205C22DD94855ECCA6A8405323D
              4423FDF2F3AC465820CEFDD0F95556232C10E77EE81428BFFD9E9638F707316F
              DE3C5A5A2A25BF1F9403B64C5F5FDF90E3DE7B7B7B778F1E3DBAF8767C3D16E6
              4A2591224323CEEFF010E77DF888733F7CC4B91F3EE2DCFF3F64C4881143FE5E
              468E1C991CA3D08ADFA42B1E4D8EC78F2A87C2F8C4EBBD94023E23B5E104DC85
              9F85F713BD61436582A4515578C526D6439926E36849470C94AA651026D64399
              2663B4A4E3CCECB58C7213EBA14C9321FCD99D754D9E587B55DED9AC5CB9124F
              8B571D975C72C9DE9696962301CC6C02A5CB28D592B493F6B4E2C7564543AC8D
              A11B62C900FD27CD6CC610C76B7A243D4029B1DFF9786DB12C24036FD799D945
              3551AC0990F413E0B78177E157F237641C2239F75F32B33B6AA55BA323A90798
              8C6F223E01ACCE384472EEBF62665F1CB067A40C499B28DD763C9FF29C566948
              CEFDDD66F6F99A28D604485A87DF94079FC7BB07E9DE1FC9B97FC0CCE6D644B1
              26A6ABAB6B2D301DC0CCDAF038DEAA696D6D6D4BDCFBDA910336263EAF85D194
              1C232651AC0DEB13AFE787E4B9A908895D17269ABE5B33AD9A83E4DCDFAA0CDB
              2A49A70017279AE2DC672339F7B7843C49A990F43ECA9319C7C496D948CEFD4D
              A1BA442A241D0B7C26D114E73E1BC9F95A184A7CA52224D59D3FC058912A099B
              C22243B6930A85C28131CC6C630EBF555434CD2E90F47BD50E1E12BA9E17DEBE
              8567598E0C9D27F0E47C004703CB332C4AF751BA05F62AF13BC9CABDF88D2770
              6FEFA234422129E32A3C9F1EC00FCCEC27B557AFA1F9167E9B0BE083C057D308
              8584AE2BF1F247003D21C761243DCB28958B3A0DF8F3344221A1EBB7F1D24700
              FF8227D78DA467051E3204FEECBE3F8D50581396E36B04F84DF9F5034B44D292
              CBE556E0553A00CEDBB265CBE4C1FA0F467777F759928A294A0AC0BA9C993D47
              C9E52F6059C8AA9C89E0A5594629C0F01133DB3D884824252187CF02120633B0
              3694B5E8174963242DA7DC2B7073CCAA9F0D337B05B82BD1F42792BE12169C7E
              91F41E7CF1F99DD0B40FB8A97E5A3626E1B65EB28AC18D92BE31987726786336
              520A91E8A3DC231C4941C85598DC747C56D2FDC1C8ED174947E10B7FF148B300
              2C8859F5B3119ED1B7249A2E93B43C9C6EF44B58B31FA39483CCF0B98F59F56B
              407B7BFB2E4AF9C36466CB3A3B3B33C7BF6FDAB4695C28FE5D2C1ABEAAA3A363
              7BB1D6E44978298A31A1FF0F813F4C9B383418618F016787A6BDC06FC5F246B5
              45D252CA1795D7F19DEA06DC63667830FF797861DE64E1F5182B5025C1E8DA08
              7C24D1FC0CF01778AEA47FC763C826E171049FC50BF2827F27D79A59AA5D6DA4
              9CB0CB5F477992CBEDF8DCFF00CFFB35129FFB697831F0E40665A199FDD9A1D1
              B6B108C7F0AB819989E69DF8336723F06F78B6F153F1CDE1F594A72C4A550E2C
              D23F92960197279A5EC1E7FEFBF8F790034EC163C23E47790EB654E5C022E909
              658E7E0A141D559DFBF7EF9F9EB6DE64A833B996D23AF24B49A7E7F3F99754DC
              AC489A89FFD3153D5A4FE345A2070D0C0FC791CB2815FB2E00B3CDEC3B034B45
              AA213C18EF22FB0EFF01E0EAB83BAA9E70D4B896F24A1495D80F7CC1CCBE591F
              AD9A83E085590564B96452006E35B325F5D1AA3908DEC7E58462C7293160B199
              7DB93E5A3507925AF0E3F92B2BF53D88A5C04DD113597BBABABA6649FA36210B
              81A46781CBF3F9FC5383C985FA92CB2815FB36E0E2A953A7AE0177B11DE82CE9
              4660092563CC7057F31A600BA584AF13F082BA33706B3C19C03CDFCCFEB2CADF
              33920249D3807B80F756E8FA1AEE11C89AD93DD20FC13BB3003FB219F05838F0
              53E033A1B86B6488844DC87CFCA8B2D291C0F3F8C6A3B3DE7A350B92E6E2317A
              4757E8BA03F7006FACD02F9212499FC48DABE32A747D19B8DECCB256938864A0
              ABAB6BBEA4E4E6DA800D66B6A650286CE9EDEDDD0D3076ECD8F18542A1DDCC66
              526E279999DDD4D1D1B1B438800E369A25CD001EA6744C99963780796696F58A
              79A40A248DC46FE49D0F9C89E72511B007F831EEBE5E116A4D466A48388AFF34
              700EF001FC48A0173F3AD8861FD36FC8521B31920E4987E3718FE7E201FCC7E0
              7160BBF0B95F073C1EE7BEF6483A0CF824F0FBC0197861EAFDF8067D1BBE697F
              344B5DCA483AC2CDC939781A970FE1736FF8DCFF031E9EB2DACCDE1A36259B88
              CD9B375F84A774C95A32EC4D339BDBD1D151E61C799B21061463C66E07665139
              BBEF7EFC86D22233DB9951A94824128944229177145D5D5D27485A8C1FDB57AA
              9F5490B40A5894CFE75F3AF8C37E0DB1031F7A01EF69F8EEF3FDF89124F891D7
              763C50F971337BA1FF11229148241289441A9350C07B3A7E5BF854DC5B095E77
              7B6738A65FD7D1D1B17DA031FE0F108BAF1715C4DD890000000049454E44AE42
              6082}
          end>
      end
      item
        Name = 'wizTrackState4'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000262000000180806000000597091
              68000000097048597300000EC300000EC301C76FA8640000001974455874536F
              667477617265007777772E696E6B73636170652E6F72679BEE3C1A00000B6749
              444154789CED9D7FB0555515C73FEBC90F1F283F3250A41FC87B92FD321D1290
              BF2A342C1571067F2409D690944856489A41658AE5683663395393983A438A63
              2AE08FFCC1D81F2668635353EA202A248680963F227C2AEFAEFE58E7F2F63DF7
              BD77CF39F7BCD99C73F77766CDDC7BEE5EFBACFD3DF79CB3F6DA7BAF2DAA4A5F
              1091A380D380CF0313804301015E053601EB81BB5575739F9504040404040404
              049410227224703A3003F8083006506027B005780858A3AA9BFAACA337474C44
              3A8115C01998E3D51FBA81D5C072557D317D3302020202020202028A03119908
              5C019C051CD0A0B8627ED232557DA1AEAEB823262273805B806129ED7A0B58A8
              AAB7A7D40BC800111982FD014E018E03C6026DC02EE029E0016095AABEEDCDC8
              92424446015F014E048E06DE0FBC0B6C0736027701F7AA6AC59B912585888C00
              E601338163814380BDC00E6003B0168BD2777B33B2A41091E1C0B9C01730EEC7
              601DF11DC013C03AE04E55DDEBCDC8924244DA81B9C01781C918F715EC79FF24
              701FB05A55DFF566640B414466033701A353AA76010B547555CD5155DD27C052
              ECE26A2415ECC1360FE8008647D209CCC76E3CB7BC028BDC3A83E42FC06C605B
              8CF7DE642770AE6F7BCB2298A3BB14EB7434E2FE1960BA6F9BCB2258647E31F0
              7A02EE37039FF56D739904381FF87702EEB70027F9B6B74C8239BF3B1370BF0D
              98EDDBDEB20BB028C67B25F285E647BE51D54FEA887CA7B5BDF8554B6BEA742A
              3F3356F869604A02A3A601CF3A7ADDC0D9BEC92AA3442FA39F25B821E3B21238
              C0B7FD4596E8C6FA434ADEF7028B7DDB5E74010E04EE49C97D3770896FDB8B2E
              C060E0B694DC57801FFBB6BDE8820D77ADCCF0BCBF9668B42B48EED7E44B313F
              E959606A02BD29914FE5DE2367ECFB3D2AD409EC710AAD0746A6306E14F0A8A3
              FF0630DE37696513E0BAD80DB713B80C1B1E1B8E0D271F057C1B782956F626DF
              F61755A297D1A3313E9F011602132347E1E0E866BB8AFA88D9377CB7A1A88245
              21EF8BF1F91C70017064C4FD41D870CDE5D447CC2EF6DD86A20AD6F1BB33C6E7
              16E09BD8A4E4F688FB6380E5C06BB1B23FF4DD86220B3645C8E5F3256009F0D1
              E8593F1CF824F03DEA2366D7F8B6BF6C028C8F7C9B2AC78F02A352E88F8C7CAB
              AAFEFF800ED51E47EC76E7C7A7D33861CE4946511B19FB9D6FE2CA24D8EA55F7
              46BB0718D14FF9F65E6EE4F37CB7A388025CE97058C116B2F4196104C661F395
              AA3A5DC0B1BEDB5144012E8DFD87AF0306F7537E0CF047A7FC7B8421E2ACDC2F
              8E71FF2B60483FE547531B35EE0666F86E4711059B83EA727F0BD0DE4FF911D4
              468D2BC0A9BEDB5126A13632FC6C1A27CCA96324D689AFF193C0222815E7E235
              1C8EECE724D39CBADE050EF74D5E190418043CEF5CBC35405B42DD9B1DBD1DFD
              DDCC417AE5EF83C03B0E87CB13EA0DC3164D54F51EF6DD96A249E454ED7638FC
              6942BDA1C0638EDE06DF6D299A442F0C37BAF8CB847A8380871DBDBF1186C9D2
              723F8CDA08D7CD09F5DAB0F94855BDCD842929795D93F151A7AEEA274D6BA2AE
              A9319F6B521B308B9E1415EB54F5493242553702F7475F0763E3A901CD631636
              F10F2CFC3F4F93AFC8FB3A16D206CB03774ECEB6951D8B8021D1E7C7B0E85843
              A8EA1EE06CECE6053841448ECEDFBC52632136FC02F0176C18BE2154F51DECD9
              535D313C4D448ECFDFBC52E3ABD8280758EFFF5B4994D4564CCE05FE1B1D3A1A
              CBAF14901C73B155F0005BB1FBA021A277C23C6C5105D894A353F236AE453117
              EB6400DC1FF93A99A0AA4F00F7465F0598D5862D03AFE2CEAC95F751C7F41CEA
              0B80939DCFBF50D537932AAA6A1736C1BF8A5373B3AA35E072BF42A32E4D12A8
              253ABEC33914B84F07F725F293149D0F54751B706B1F75053486FBBFBF5A53A4
              A450D55DC06F9C43E17F9F0EEE7FF5DAA8639108AAFA0670837328709F0FA639
              9FF3F6936602BC404F28B3238710DE24A7BE24CB9D5B597667D0F974866BD299
              D1BEAEFD80A3FD45DE068666E0FE9C0CE7DAB41FB477A0E45F1974BA81833270
              3F2BC3B9FEB91F703450F29F8C7A6332703F23C37976ED071C0D94647D961E91
              71E82BED79B2BC8B5A495C5F66520E7E92FB4E7EBE0D1BAEAA6207CDE315E7F3
              FB72A82FA0165B33EA84E4A2CD617B9A9EA9832DB95BD27A784D557767D00BDC
              378F3DAAFA6A06BDC07DF3A860B9C1D222709F3F5C5F667B0EF5B97ED2616D39
              541847A32D91029A43E0D70F02EFFE10B8F787C0BD3F04EEF74FE4715DDC3A2A
              6DD8EA8C2A0ECBE1046E1D6FE4505F402D8EC8A0F3616C454D40768C1391A119
              F426E46D480BE290686BA3B49890B7212D88761139B471B13A4CC8DB90168460
              CFEEB49890B31D01B5BECCB81CEA73FDA45D83B061AB89D181E9D89CB166E04E
              D05FAFAA739AACAFE521222BB1554C609368D3AE6C7527DEAE51D5D9B918D602
              1091BF039FC012879E8025174D0397FB65AABA222FDBCA0E11D9804D926DC3F6
              375C9DB20A97FBAB54F5FB79D9567688C823F4AC763C19DB572F0D5CEEAF57D5
              8B7231AC0520226BB0F98D603C5E9FB20A97FB95AABA2017C35A18227217707A
              F4753A9654BA19B87ED29636E041E7401E4E935BC7E339D417D0B3D4156051B4
              E97422449BC52E710EADCDCDAAD680CBFD652292382C2D2293B0ADC3AA08DCA7
              83CBFDA5229238AA2B221FC296F257B12E37AB5A032EF7DF1591C1491545642C
              F035E750E03E1D5CBE9688C88149154564349672A7B7BA02B26383F3396F3FE9
              41B0AD2A062AA1EBB86657170451B0FC259BE95965B196E4095DDDECFAAF1012
              BAA6E5FE03D4AE78FA4142BD7842D7877CB7A568427D42D7AB13EA0D05FEE4E8
              3DEEBB2D4513EA13BADE90506F10F088A3F7574242D7B4DCB7630BE7AA1CDE92
              50AF0D73BCAA7ACF1112BAE6754D0E676012BA760347567F7053F7E7B5C5D12A
              DFE49549B07C30EE66A38DB6381A86E5517297E0CEF3DD8E220A7085C36105DB
              4F72503FE5C7031B1D9D2EE018DFED28A20097C4FEC33FA7FF2D8EC652BFC5D1
              F1BEDB5144012E8C71FF6BFA49E182AD2C8B6F71F439DFED28A200E7C5B8BF95
              FEB7381A89EDB8E23EA74EF1DD8E320903B3C5D12A55A5FA6307B60165F5C766
              37FD7E9DB0BDD140FC11AE8DDD9CBBB06CE39FA267D3EF8F034B819763656FF4
              6D7F5105EBE5AF8FF159DDF4BB039B3F360A8B085F8D6515771F880B7DB7A1A8
              427D2FBFDAD35F44CFA6DF23B00DD757006FC6CA7EC7771B8A2AD864F13B627C
              6E012EC2B6C66BC736BB9F0CFC88FABC9189B6030BD227FFBF8DF1B90D9B66F2
              B1E8597F10702CB08CFA1C6C89A2C741525D8FBC37FDDE0D4C548D1CB1A8D019
              D4465C9E26C13065F4F2712361DDC099BE492BA3440FC6B83396446E2484A89B
              E57E18B5BDFD24B217B8D0B7ED45176CA8F1EE94DC770397F8B6BDE8826D5577
              5B4AEE2BC0E5BE6D2FBA0007002B333CEFAF210C070FD435392B7AB6B891B1A9
              09F4A6443E957B8FCCD9F77BACF0D2983356C1E623CDC37AFEC323E904E6633D
              55B7BC0217F826ABEC029C86ED1FD9E886DC01CCF56D6F59048BCE5C4C7DD4A5
              37F90761482C4FEE051B2A4B921D7E13F019DF3697498005D83EB78DB87F1198
              E9DBDE3209F0656AE78CF5252F01A7F9B6B7EC8245E3E31D8F75914FD4E9F849
              1D91EFB4B617BFEA62B74E892ADE071199834DF01E463ABC059CAFAA69979807
              6480880CC156E49D0C1C87E525112C44FD14F00036FEDCE5CDC892225AB53A1F
              38111B161E832D4E79199B1B7637709FA6D81B31201944E460ECE136133806E3
              7E2F96ED7A23364FE69EC07DFE1091E198537012362436168B0EECC0B8BF17F8
              BDA6D897322019A2959373B1342E9331EEAB9DED3F63697556ABEA7BDE8C6C21
              88C86C2CA5CBE894AA5DC002555D55535FDC118B4ED2015C8985E11A2DD7EFC6
              42D7CB55756B4AA302020202020202020A051139025BC87536368CDC1F2AC0ED
              989FF4625D5DBD3962CE892661C36033B10CBFD58CB23BB1740A8F60BDCFE753
              B62120202020202020A0D010914E2CD9EB0C601216AD044B17B515CB13B64655
              37F755C7FF012CE5A119449E98630000000049454E44AE426082}
          end>
      end
      item
        Name = 'wizImageDisabledTick'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000030000000301006000000079225
              C40000000473424954080808087C086488000000097048597300000EC300000E
              C301C76FA8640000001974455874536F667477617265007777772E696E6B7363
              6170652E6F72679BEE3C1A0000044849444154789CED9ACF4F134114C7BBDB8D
              5C4AF8610AE8C19880203D184D042EFD65F540B870221AF488FE01460F466284
              C88544BD9190A8898909442F5E4CA14A69FA238DFC01DB488D7231C6949403F1
              62DBAD876F5ECCA0A5BBCBD257753E9761DE4C6767DEF7EDDB99094AB55AAD56
              AB2E09132AF704FE77A400CC480198910230230560460AC08C14801929003352
              0066A400CC48019891023023056046E39E8059D2E9743A9DEEEFC7EDEDF030AC
              5EAFD8AB5040FBFBF7C16030180CE6F38D9FA93594E6BC8E56D5542A954AA526
              2731BFBB77613F7DDADA38B91CCAB93908B2B484BA6188822E2E964AA552A974
              ED5A24128944225FBE38B796FD691A01B2D96C369BEDEC84235EBD823512117B
              EDEEA24C26516E6D89ED274FA20C0651B6B68AED6B6B9AA6699A76E74EB95C2E
              97CBAF5FC37EFC38CA7C1EF60B171A2504BB00A2E3D369580707516E6F637EF7
              EE79BD5EAFD7FBF4A9CFE7F3F97C3F7ED41A4FD7755DD78F1C29140A8542616A
              4A511445516667D17AF428CA7219A5562305374E08E66F80AA8A113F3808877F
              F8E076BBDD6EF7D898DFEFF7FBFD9F3E991D5114686101A96673D3300CC330A2
              51D86B399E38750ACFBF7A15F5F979AB2B330BDB2E88723C6A946AB6B7ED3A7E
              2F94E3E1F8E7CF61ADE778970B01F0F87128140A854287E77882791B3A3D4D7F
              51AA39A8E333994C2693191880E3D7D761A51C5F8F870FE1F89B37ED3EDF2A0D
              4F4188FCF171387C6000D6EFDF29C7DB1D578CF8781C56B38E271617ED3EDF2E
              0D7B031289442291387B168E7FF1426C6D6929168BC562F1DC39ABE38A8EB71A
              F19F3F8BF5A121ABCF3F28872E0022FECC19555555557DF70E568F47ECA56970
              E0EA2A1C3A32526F5CBB8EA71C8FDDD1CA8A68EFE9B1B23627387401B0B0F3E7
              51EBECDCBF775B1B1CBAB202E1E8C4FB0BA7723CE6A528D4820069FC86FCD005
              C009F4D93344DC8D1BB0D65B687B3B1C148BD11B41115FA9542A958AF91C4F11
              8F79DCBA25B69E3821F6FBF6CDDAEA0E4EC3BE0181402010083C79821A1D8CEA
              416FC4EA2ACA440276FBBB9A68341A8D465B5A50A313B3CB85F13736CC8DEB1C
              0DDF862212EFDF47EDEB5773BF6A6B4379EC58BD9EFB47BCCBE5F1783C1ECFF5
              EB5443A9EBE170381C0E7FFC686E3ECEC17C0EB87DDBA991C403D4EFFBF8783C
              1E8FC77B7BD16F6646FCDD83074ECDC32ACC7741AA9A4C2693C9642C86FAC58B
              564730EB789CB0DFBCC1B788CE1FB118DE94D1511ACDFE5AECC17C176418D87D
              4C4C20076732B0D3655C6D6A399E723CA51ADC7E52C4D32E2C97C373AF5CA1D1
              9C5D9779D86F4309EC723A3A309F972F515EBAF4E7DE7480A2CB3562EF75F4DE
              F3C6DBB770FCE5CBB8F2D8D9716C0136691A0144283551843E7A84B2BBDBDA38
              BA4E391E6FCAF232ECCDB3E22615E0777095D1D787081E19412EEFEAA276DAC7
              D376926B576395BF46807F15F95F11CC480198910230230560460AC08C148019
              290033520066A400CC480198910230230560460AC0CC4F9320D5864BDBCC7200
              00000049454E44AE426082}
          end>
      end
      item
        Name = 'wizImageSelectedTick'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000030000000301006000000079225
              C40000000473424954080808087C086488000000097048597300000EC300000E
              C301C76FA8640000001974455874536F667477617265007777772E696E6B7363
              6170652E6F72679BEE3C1A0000078549444154789CED9B5B48145F1CC7E7ECEC
              7A593575BD54680981970AC4302ABBE9D66304D945147BE8290872C35E0A1FBA
              A881059A5B9A451645978712AD4C24902C2A93B22B51A945574B37AB076DD5D5
              71FE0FBF7E6C33CDEC9CD99D75EA9FDF978F7BDC39E77799CB99DF394B789EE7
              799E99944E32E86DC0BFAEC904E8ACC904E82CA3DE06A008218410C3CF1362E1
              42A0D50A9C3F1F989C0C9C3E1D181A2AEC657010D8DB0BECEC043E7C08BC7E1D
              D8DE0ECF3E8ED3CE032F850FE1892668DA34606929F0FD7BB4CABFECE901EEDF
              0F8C8FD72D0E131BF0C8486065257068686202AEC49111E09123C0A8A8FF4D02
              40EBD703FBFAE802F2EA15D06E07E6E400535381160BD0681412DBF17B1B3600
              31E15D5D74E3F7F703F3F3FFBA040803525DEDD9D1F17160430370E95220217E
              7398611886C9C800D6D501F1592067E7F1E34093E98F4D00283818D8D8E8D9A1
              A74F814B96F82BD0EAECC687FEA3479EED6E6E0686846836BE360E984C74813F
              7A141814A457C03DFB111808ACAAA24B84EF578446866360E56E313B76E81D60
              EFFC2A2C14FA21F6EFD8319FC7F1CDC0BC3CCF67CADF1778693FB76FF7EC676E
              AED7FD7B6750743410670B62836A6AF40E9CD604C94D2ABE7C01AA9FBE7A6948
              4D8DB4214F9E00B5BFC783707635772E302B4B486C371AFD333E3E231E3F96F6
              BFBADA6F0900CD9801C41717FC0F4EE33232B47578F66CE0D9B3C0EFDFA51D17
              F3DB37E09933D88FB8FFC0C0AAAAE8E8A42493E9D0A19898D6D6E0E08A8AA8A8
              B8383ABB701A2B9EBE0E0F03E9DFAC5506045FDDC50ED7D76B137042802525C0
              B131BA802B717414585C1C185859191D9D9C1C1060B7C7C6F6F400791ED8D5A5
              2E11F5F5D2E39595D1FA4D841DFE2E2892E1A58FB51A2C86A1703EDFD626DF93
              A7FEB10887673A3EDCB51321B1B12CCB30466361A1C532344488D94C08BEB788
              D5DDCDB21CC77156ABD35958D8DF8FB523B1DD8B17C3A73B7784FFC5EF272440
              5CE48B7E94E5E8458B80E2C063C9E0EE5DBA7EE4B4772FD09F81DFBA35329261
              3C071E9598C8712CCBB2F9F99EBF877EBF7E2D6C8F8B032E58A0641F6502B02C
              2C565313CF2B5D43D2823308CBCB3B77AA3D5EB97F71E0C3C30D14DE8227070F
              8E8CD86C7D7D070EC87FEF57BFF1C54CAC152B94C6A34C407ABA74BBFA5B8E5B
              2613C3ECDA057F1B355B97F03EF084304C79B9CB65B3F5F5E1BC9F56B76F4BB7
              CBC5CD2DCA04242549B7BF7C4977BC5B010165653131E9E92653515154546E2E
              21090958C8F045DE069EE36EDD723A878747476D3687C3DB2B512E0E7271738B
              3201B87022D6870F74C7334C404065656C6C5A1A21414184B4B41062B1B0ACC1
              60326DD91211C130DE26C2FBC0DFB8E174320CC7D5D50D0E0605416B62A27A0B
              1886613E7E946E978B9B5B9409102FFDA17009505E818176FBD4A9A9A984180C
              84B4B4308CC140484484FB1BC1C184308CDA44F81EF88686DFAD570E98B40606
              A4DBC3C2948EF4FBA23CCF1B0C3C8F6BBAB8602225BA44781FF8D656F9C0BBAD
              55EE495B5126402EC37257865B2E574181C371F224CF330C219B37432B5617A5
              249D08DFCFF84B9794AF575CB1532BB9335D2E6E6E512600771988357326DDF1
              0CE372D96CBDBDB5B53CCF713CBF6D9BF2D9264C84D15850A0FD198FC2D24577
              378D2FBF4B2E0E9F3E291D499900DCDE2116D66AE8E57215163A1C55551C77ED
              9AD3D9DE4E9B0842A64CD1FE8C475DBD0AB37A2C7DA8554A8A74BB72422913D0
              D121DD8EAFE2EAC571CDCD83839B368D8D5DB83030303EEEEBFDD7F3C355FE28
              6059992F63BBD7B2C5BA7F5FE948CA04E08626B156AF263F45D78F5B70C67576
              8E8FB7B50D0DEDDB373676F122DC31D525C2BBC0A34A4BC18E172FD41E29F47B
              D52AE96FC9C5ED977EE88A7178F1BF7D0BC4B2342A2B0BFAB979536940E9FED1
              9173E7583633D36CCECB63D9B56B3D3DE27D0BFCF9F3C08D1B7D2BA52C5F0E9F
              C47EBF7B079C350B7AF730E950572EC61D6CE2F26B63236D3F9EFBC7441417B3
              ACD56A36739CB05CCCF32C9B9D1D1AEA6D397ACF1E1C471B7BE53621949450F7
              A36E407C5111EF68C30C6766FAEA9870BC9414A3313B3B2CACA38365D7AD0B0D
              A5DD49F7F52BF0F4696072B2B67665660AFDC6FF389D1827CD13203400779A89
              1D7FFE1C68366BE5B0705C9605CE9903142F49E2AC8C65FD33BED92CF453EC7F
              79B9EA7EBD33044B09F87E2036E4D429AD03A03741274E48FBFBF933303C5C75
              BFBE19949D0D94DB37B37BB7DE81F395A0A22269FF90D9D95EF7AF8D8172B7A4
              BF3711C2C0CB9D6076BBCFE3686328DE9BE516A991F850D4FE19A18D1FB85459
              5BEBD98FCB9781BE6F7FD1D801DC37A394087CF1B15AF50AB8D0EE65CB80CF9E
              79B6FBCA154C9466E3FBC721BC222A2A80729730B63735017136A3FDF674EC57
              18700CA89C7D48DCACEB870D5F5A7728EDF89A35409C2DC8398AC4376EDC0A88
              BB25E6CD0346450171C50089ED6969C0DC5C6100DFBCA11BDFE100E6E4F83D3E
              FE1E409888F070607939105F5C9402E26FE28EB6C3878116CB84C565A206924E
              08BE59E34E38ACA1F83BE0B8868B5550FD7EA4A7588C9B28098B7EB884B972A5
              F0332E9AC7C703434284BDFCF801C49D69588F7FF00088D5C97BF7C06FFD7FA6
              FAC724E05FD5E42FE575D6640274D6640274D67F89ABAD738EC5B72800000000
              49454E44AE426082}
          end>
      end>
    Left = 264
    Top = 488
  end
  object WizardImageList: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'wizImage'
        Name = 'wizImage'
      end
      item
        CollectionIndex = 1
        CollectionName = 'wizImageDisabled'
        Name = 'wizImageDisabled'
      end
      item
        CollectionIndex = 2
        CollectionName = 'wizImageHot'
        Name = 'wizImageHot'
      end
      item
        CollectionIndex = 3
        CollectionName = 'wizImagePressed'
        Name = 'wizImagePressed'
      end
      item
        CollectionIndex = 4
        CollectionName = 'WizImageSelected'
        Name = 'WizImageSelected'
      end
      item
        CollectionIndex = 5
        CollectionName = 'wizImageTick'
        Name = 'wizImageTick'
      end
      item
        CollectionIndex = 10
        CollectionName = 'wizImageDisabledTick'
        Name = 'wizImageDisabledTick'
      end
      item
        CollectionIndex = 11
        CollectionName = 'wizImageSelectedTick'
        Name = 'wizImageSelectedTick'
      end>
    ImageCollection = WizardCollection
    Width = 48
    Height = 48
    Left = 344
    Top = 488
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 56
    Top = 352
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 160
    Top = 352
  end
  object qryHR: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Connection = COACH.coachConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'USE SCM_COACH;'
      ''
      'SELECT '
      'HRID'
      '--,FirstName'
      '--,MiddleInitial'
      '--,LastName'
      
        ',SUBSTRING(CONCAT(FirstName, '#39'.'#39', MiddleInitial, '#39'.'#39', UPPER(Last' +
        'Name) ),0,80) AS FName'
      ',SCMMemberID'
      'FROM  dbo.HR'
      ''
      
        'WHERE SCMMemberID IS NOT NULL AND (IsActive = 1) AND (IsArchived' +
        ' <> 0)'
      'ORDER BY LastName'
      '')
    Left = 528
    Top = 384
  end
end
