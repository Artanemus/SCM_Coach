object ImportSCMSwimmer: TImportSCMSwimmer
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Wizard - Import SwimClubMeet Members'
  ClientHeight = 771
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 21
  object RelativePanel1: TRelativePanel
    Left = 0
    Top = 675
    Width = 681
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
        RightOf = btnFirst
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
      end
      item
        Control = btnFirst
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = True
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
      end
      item
        Control = btnLast
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
        RightOf = btnNext
      end>
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 674
    ExplicitWidth = 677
    DesignSize = (
      681
      96)
    object btnPrev: TButton
      AlignWithMargins = True
      Left = 128
      Top = 14
      Width = 85
      Height = 68
      Margins.Left = 20
      Anchors = []
      Caption = 'Previous'
      ImageAlignment = iaTop
      ImageIndex = 0
      ImageName = 'arrow_left'
      ImageMargins.Bottom = -10
      Images = VirtualImageList1
      TabOrder = 0
      Visible = False
    end
    object btnNext: TButton
      AlignWithMargins = True
      Left = 236
      Top = 14
      Width = 85
      Height = 68
      Margins.Left = 20
      Anchors = []
      Caption = 'Next'
      ImageAlignment = iaTop
      ImageIndex = 1
      ImageName = 'arrow_right'
      ImageMargins.Bottom = -10
      Images = VirtualImageList1
      TabOrder = 1
      Visible = False
    end
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 576
      Top = 14
      Width = 85
      Height = 68
      Margins.Left = 20
      Margins.Right = 20
      Action = actnExit
      Anchors = []
      ImageAlignment = iaTop
      ImageMargins.Bottom = -10
      Images = VirtualImageList1
      TabOrder = 2
    end
    object btnFirst: TButton
      AlignWithMargins = True
      Left = 20
      Top = 14
      Width = 85
      Height = 68
      Margins.Left = 20
      Anchors = []
      Caption = 'First'
      ImageAlignment = iaTop
      ImageIndex = 6
      ImageName = 'arrow_left_double'
      ImageMargins.Bottom = -10
      Images = VirtualImageList1
      TabOrder = 3
      Visible = False
    end
    object btnLast: TButton
      AlignWithMargins = True
      Left = 344
      Top = 14
      Width = 85
      Height = 68
      Margins.Left = 20
      Anchors = []
      Caption = 'Last'
      ImageAlignment = iaTop
      ImageIndex = 7
      ImageName = 'arrow_right_double'
      ImageMargins.Bottom = -10
      Images = VirtualImageList1
      TabOrder = 4
      Visible = False
    end
  end
  object RelativePanel2: TRelativePanel
    Left = 0
    Top = 0
    Width = 681
    Height = 81
    ControlCollection = <
      item
        Control = vimgTracker
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = True
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
      end
      item
        Control = vimgTackDisplay
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
      end
      item
        Control = vimgTrack2
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
      end
      item
        Control = vimgTrack3
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = vimgTrack4
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = vimgTrack5
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = vimgTrack0
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = vimgTrack1
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = vimgTrack6
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end>
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 677
    DesignSize = (
      681
      81)
    object vimgTracker: TVirtualImage
      AlignWithMargins = True
      Left = 1
      Top = 15
      Width = 48
      Height = 48
      Margins.Left = 0
      Anchors = []
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 9
      ImageName = 'wizBig'
    end
    object vimgTackDisplay: TVirtualImage
      AlignWithMargins = True
      Left = 12
      Top = 15
      Width = 654
      Height = 48
      Margins.Left = 44
      Anchors = []
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 16
      ImageName = 'WizardNodeBgrd5Grey'
    end
    object vimgTrack2: TVirtualImage
      Left = 213
      Top = 15
      Width = 48
      Height = 48
      Margins.Left = 0
      Anchors = []
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 14
      ImageName = 'wizDotSmallFilled'
    end
    object vimgTrack3: TVirtualImage
      Left = 315
      Top = 15
      Width = 48
      Height = 48
      Margins.Left = 0
      Anchors = []
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 14
      ImageName = 'wizDotSmallFilled'
    end
    object vimgTrack4: TVirtualImage
      Left = 416
      Top = 15
      Width = 48
      Height = 48
      Margins.Left = 0
      Anchors = []
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 14
      ImageName = 'wizDotSmallFilled'
    end
    object vimgTrack5: TVirtualImage
      Left = 518
      Top = 15
      Width = 48
      Height = 48
      Margins.Left = 0
      Anchors = []
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 14
      ImageName = 'wizDotSmallFilled'
    end
    object vimgTrack0: TVirtualImage
      Left = 0
      Top = 15
      Width = 48
      Height = 48
      Margins.Left = 0
      Anchors = []
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 14
      ImageName = 'wizDotSmallFilled'
    end
    object vimgTrack1: TVirtualImage
      Left = 112
      Top = 15
      Width = 48
      Height = 48
      Margins.Left = 0
      Anchors = []
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 18
      ImageName = 'check_circle_filled'
    end
    object vimgTrack6: TVirtualImage
      Left = 629
      Top = 15
      Width = 48
      Height = 48
      Margins.Left = 0
      Anchors = []
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 14
      ImageName = 'wizDotSmallFilled'
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 81
    Width = 681
    Height = 594
    ActivePage = tabSelect
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
    OnChange = PageControl1Change
    OnChanging = PageControl1Changing
    ExplicitWidth = 677
    ExplicitHeight = 593
    object tabStart: TTabSheet
      Caption = 'Start'
      object Label6: TLabel
        Left = 27
        Top = 24
        Width = 254
        Height = 21
        Caption = 'WELCOME TO THE IMPORT WIZARD.'
      end
      object Memo1: TMemo
        Left = 24
        Top = 144
        Width = 625
        Height = 353
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        EditMargins.Auto = True
        Lines.Strings = (
          ''
          'The SwimClubMeet import wizard can perform one of these task...'
          
            '        1) Introduce new SwimClubMeet members into your coaching' +
            ' squad.'
          
            '        2) Update your squad member'#39's profile and race history u' +
            'sing information found in'
          'the Swimming Club.'
          ''
          
            'When method 1 is used, the swimmers profile, personal bests and ' +
            'full race history can be '
          'imported.'
          
            'Naturally, for method 2 to work, your squad member must be a mem' +
            'ber of the  '
          'Swimming Club.'
          ''
          
            'To get started SCM_Coach must be connected to the Club'#39's databas' +
            'e server.'
          
            'This database could possibly be located locally, within a Domain' +
            ', in the Cloud, etc. '
          'Talk to the swimming club to get the connection details.')
        ReadOnly = True
        TabOrder = 0
      end
    end
    object tabLogin: TTabSheet
      Caption = 'Login'
      ImageIndex = 1
      DesignSize = (
        673
        544)
      object Shape3: TShape
        Left = 6
        Top = 32
        Width = 656
        Height = 65
        Brush.Color = clOlive
      end
      object Label1: TLabel
        Left = 39
        Top = 139
        Width = 45
        Height = 21
        Alignment = taRightJustify
        Caption = 'Server'
      end
      object Label2: TLabel
        Left = 6
        Top = 179
        Width = 78
        Height = 21
        Alignment = taRightJustify
        Caption = 'User Name'
      end
      object Label3: TLabel
        Left = 18
        Top = 219
        Width = 66
        Height = 21
        Alignment = taRightJustify
        Caption = 'Password'
      end
      object lblLoginErrMsg: TLabel
        Left = 90
        Top = 304
        Width = 216
        Height = 21
        Caption = 'The login failed - retry or abort.'
        Visible = False
      end
      object Label5: TLabel
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
      object lblMsg: TLabel
        Left = 90
        Top = 337
        Width = 251
        Height = 21
        Caption = 'Attempting to connect ... please wait.'
        Visible = False
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
      object Button1: TButton
        AlignWithMargins = True
        Left = 406
        Top = 302
        Width = 85
        Height = 83
        Margins.Left = 20
        Action = actnAbort
        Anchors = []
        ImageAlignment = iaTop
        Images = VirtualImageList1
        TabOrder = 4
        Visible = False
      end
      object Button2: TButton
        AlignWithMargins = True
        Left = 507
        Top = 302
        Width = 85
        Height = 83
        Margins.Left = 20
        Action = actnLogin
        Anchors = []
        ImageAlignment = iaTop
        Images = VirtualImageList1
        TabOrder = 5
      end
      object btnAbort: TButton
        Left = 76
        Top = 561
        Width = 81
        Height = 32
        Caption = 'Abort'
        ModalResult = 3
        TabOrder = 6
      end
      object btnConnect: TButton
        Left = 163
        Top = 561
        Width = 81
        Height = 32
        Caption = 'Login'
        Default = True
        TabOrder = 7
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
      object Label9: TLabel
        Left = 16
        Top = 60
        Width = 633
        Height = 25
        Alignment = taCenter
        AutoSize = False
        Caption = 
          'Select either update profiles and stats or introduce new swimmer' +
          's.'
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
        Height = 113
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
      object VirtualImage1: TVirtualImage
        Left = 313
        Top = 99
        Width = 48
        Height = 48
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 2
        ImageName = 'arrow_right'
        OnClick = actnSrcToDestSelectedExecute
      end
      object VirtualImage2: TVirtualImage
        Left = 313
        Top = 207
        Width = 48
        Height = 48
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 1
        ImageName = 'arrow_left'
        OnClick = actnDestToSrcSelectedExecute
      end
      object VirtualImage3: TVirtualImage
        Left = 313
        Top = 153
        Width = 48
        Height = 48
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 4
        ImageName = 'arrow_right_double'
        OnClick = actnSrcToDestAllExecute
      end
      object VirtualImage4: TVirtualImage
        Left = 313
        Top = 261
        Width = 48
        Height = 48
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 3
        ImageName = 'arrow_left_double'
        OnClick = actnDestToSrcAllExecute
      end
      object VirtualImage5: TVirtualImage
        Left = 42
        Top = 61
        Width = 32
        Height = 32
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 0
        ImageName = 'Search'
      end
      object lblSelect: TLabel
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
        Text = 'edtSearch'
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
      object Label8: TLabel
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
      object Label10: TLabel
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
      object Label11: TLabel
        Left = 72
        Top = 219
        Width = 413
        Height = 21
        Caption = 'When updating, enable this option to have profiles updated.'
        WordWrap = True
      end
      object chkbDoPB: TCheckBox
        Left = 48
        Top = 304
        Width = 298
        Height = 21
        Caption = 'Import Personal Best (PB) race-data.'
        TabOrder = 0
      end
      object chkbDoHistory: TCheckBox
        Left = 48
        Top = 376
        Width = 249
        Height = 21
        Caption = 'Import ALL swimming history. '
        TabOrder = 1
      end
      object chkbDoProfile: TCheckBox
        Left = 48
        Top = 128
        Width = 611
        Height = 21
        Caption = 'Import club member'#39's profile.'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
    end
    object tabFinalStep: TTabSheet
      Caption = 'Final Step'
      ImageIndex = 4
      object RelativePanel3: TRelativePanel
        Left = 0
        Top = 0
        Width = 673
        Height = 544
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
          end>
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 669
        ExplicitHeight = 543
        DesignSize = (
          673
          544)
        object btnGo: TButton
          AlignWithMargins = True
          Left = 294
          Top = 238
          Width = 85
          Height = 68
          Margins.Left = 20
          Action = actnGo
          Anchors = []
          ImageAlignment = iaTop
          ImageMargins.Bottom = -2
          Images = VirtualImageList1
          TabOrder = 0
        end
        object lblGo: TLabel
          AlignWithMargins = True
          Left = 284
          Top = 319
          Width = 105
          Height = 21
          Margins.Top = 10
          Alignment = taCenter
          Anchors = []
          Caption = 'Click to import.'
        end
      end
    end
    object tabSuccess: TTabSheet
      Caption = 'Success'
      ImageIndex = 5
    end
  end
  object myConnection: TFDConnection
    ConnectedStoredUsage = [auDesignTime]
    LoginPrompt = False
    Left = 184
    Top = 576
  end
  object ImageCollection1: TImageCollection
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
        Name = 'arrow_left_double'
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
        Name = 'arrow_right_double'
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
        Name = 'thumb_up'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000023F494441546843ED59D135044110AC
              CB800CC880081001224004880011200244C04580081001224004BCF266F695B9
              B99D59DB7737F3DEF6DFDDCECD5675F754F7F48D50B98D2AC78F79125802700B
              E018C0B395E3E64580E0EF01AC39E00700AE2D48CC8340089EB83F012CD74020
              06DEE336719EC926533CD906FE0B009FF7B6591108C1133073FED0211E03D8E9
              8D1E98890AC53CCF43CB03EC099C01382D9500A552BDEB15E701C08603BD0580
              9F7B9B750A5D01D817542A97DFF23D15884AD4DB2C09B481DF747580805FA41E
              14432004CF6A7B21E88E009CBBCF3741947A91B08840083E06900AB4E79086E4
              164A20073C01BE02587148D74BE98572C153563FC4CD16516FB68B6D76921153
              6ABA4A655B5EEB017E3368E22E55C1620454EE32B820555559B0729C92F32EAE
              A1139886BF326C41205555B580E5824CAD6314A86C4902041733A685AFAA2902
              7C9145E34611F04AF60880189204A61D384D8B14819437739FEB591A080C11C8
              CD1B59577D0A693F55E519D076A4118E541D28458558F57951F2B6EA0A5A3532
              7A07603BD68ED710011630A68FB73FDD6C0D047831F2C380E6F07A36A513600B
              42EFFB56646224593A010E0878EFA0BDCBA5A8F53EA0EDF4A255E8490600D19E
              ABE40868E5E5648F877962145332011D044CBDF1954A2094CEA670853D54A904
              B4DB9D904E25512A01ED7B7601B01247AD440249E9EC12817FB4EDA63F49FE97
              968A80299A8E9BB5E67E6E2BD1F19D26CB597129A1597F80988EF94CE077DC64
              20D0D161E6CB870898BBB4E386D547E007ED5EA6313D8669FE0000000049454E
              44AE426082}
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
        Name = 'wizBig'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000350494441546843ED99FF910D4110C7
              BF17811301223822400488C0890011200244C045800810C11101224004D4A76A
              5AF59B9DD9EDD9DDB7734F5D57CD1F6FDFEC4C7FFB77F71EE9C0E9E8C0F9D725
              80DE1A5C5303D725DD937447D2715A3713C02F927EA5F549D20749DFD700BF14
              008C3E94742AC9988DF20528C0BC48C0A2EFEDEC9B0B00C61F4B7A92243DEBF2
              F4129A7925E9F51C207300DC97F4521226E3E9B7A4F749AA98872DF6B0970570
              DE675DC9DE07C8A374465820AD009E497A9E9DFE393DC31C5A085FE1ACDBD94B
              3CC3AC42140580E4903AB66EF423FD6E653C670C2098D089FB034DA20DB4324A
              51006F32E6CF92FD4F5E30C540FA1F0101828060F43681580C0095623A46A837
              37A3209F93DB9AEF9AD200CEF66E23E6ED9A1CC48331C71E03805ABFB93089D9
              781F9814E7820D988F9913667AA3E60F6300BC24BEA60CBB96CD4F6143780407
              73ECAAD9D600E4D2BF9B0E9CBA78CDFF894E1FD381552DD4001011C8B410719E
              C37A105AB03C41A626F3EF500D00B66F99B687F48D49AF056AA75B1100300E00
              88F20073EA49988F951D38F34E155BD2006A22EB425B469E9A907C447A9A12DE
              BFBD2500A471EA7A6834066FA4169F8BE823F83D0AC03B4E4FFB2FF9C120A094
              3470EE9A9381CD6D24757F0D8D123C4103472E01F833A1A10E1854E5E9BF0480
              9A2C855F3413A2A4D9E9BD4B1A387827F66194AE8838DC93A88069A8A050183D
              F844E64B09D2F8D59EE297F4D39533A152C2E2AD3972CF64E68BB98103C368AD
              1AF566845303A207D10F58293FA883C600508152F55915D8430B5EFA54C598F6
              A0238CB69480A116DFB2A5A47CB09EA4B9A5443B6881A4762DD90EE195EA740B
              6212625527033492575178AD6395625BB73222DFCE72F4ECB18AF1E51D9A675C
              8043ED8368A47CDF5B745C7FF194066CAFEF8A78169E5D065162AE645BDFAC84
              BAC12880D2EC12C74642805942441B98F7E3FAF0EC350AA0664E3CB7AF2CAD53
              6A1867E69A8F6C9A66AFAD00601835E307169D0C1C51C27FE0207613C520A208
              390529C33067E4D30EF653B83569740E000BB1381B2BFFD2D26A4E308E4058CD
              79662E00631229223596FF401101416D83D931836D66DC2E580AC0338A79601A
              FE33AB818259FF991533B9109F592392DEEB9E3535B057466B875F02E8227677
              E95F7CD7B831303DE8C60000000049454E44AE426082}
          end>
      end
      item
        Name = 'wizBig_DotSmall'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000003D0494441546843ED99FD914D4110C5
              CF4680081001224004880011200244800810012240048800112002EA5735BDD5
              6FEECC74CF7D1FBBABB6ABE68FF7EEDC993EFD71BA67EE91CEB81C9D71FD750E
              E0A43DB84B0F5C917447D22D4917CBB85E007E95F4BB8C4F923E48FAB10BF0DB
              0240D1FB921E483265B37A010A30CF0BB0EC7B1BF3D60240F147921E174BAFDA
              BCBC84675E4A7AB506C81A007725BD9044C878F923E97DB12AE1618339CC6500
              9CF71917AAF701F2B0AC9136C82C80A7929E55AB7F2EFF110E3342AEB0D6CDEA
              25FE23AC52920580E5B03AB16EF2B3FC9E55BC560C2084D035F7004FE20DBC32
              942C80D795F26F4BFC871B440A94E71808101082C99B02626B00B894D031C1BD
              751825F50CA74DEF157980647B7720E56D9B1AC4BD51628F00E0D6EF8E26091B
              9F03A139B79840F8583811A6577BF93002E02DF1AD54D8D998378681A96604E3
              410E96D8DDB0ED01A8AD7FBB2C1829616C4555AE2B339597F124C32EC5601FCB
              865D2FF400C008545A04EB417591902FB01520463253B0F08279914A4DE5DF90
              1E0062DF2A6DC6FA35CD4660799EA1490C675EC07B373200501C0008ED4164D1
              9AA932CADB9C21C3B8F0B1B68364DEE8625B1EC04D545D24629E3A57669467EE
              9061CA629E91C81FC2FB585A0028E3F4F5486421BFF8ACF2363F3292F730E708
              7E0F01F8C489E2FFCB8A73400DB419DB6E92CF8305A1B43CE0955AC45CB5FBDF
              B566AFDE1BD523E8189D9005D8D68B5EA9D1C2DE32DBE2883CDDD5E9BF04809B
              AC849FB610A2A5D9A8F02D0FCC24B107BB368C164A550B4D27B1A7514E455065
              4F0E41A374C0547A2445A3B3858CCA581FD0B3DEA0D253F9475DEE7421F3AD04
              0B5F0AB4D9772BF1CBB533A956C2F8D61239A238E6AF09A5A802B3AE8FFF66AE
              F478DE8711490D8848F00440A270226C886B722D123A516BE5177D102F8F0E34
              3EB6335E603DBB5D80EAFC3509CFB020AC857132273B6FFD6EAE648F9480A117
              CF6CECAD6AD69BBD3BC210B40F7626993E529A35B1D8E5A2112EA73B3D847013
              625D27176878B469BCD96B95E6B16EC788FC7196A5575FAB985E3EA1F98F0D48
              A87D0807297FEE6D26AEDF38F280CDAD69327D77994449CC536DFD612543B3E9
              6F64ADBB4B121B0B65E87084834447797F5D9FBE7BCD7AA0174EFC6F5F596699
              06C5B973ADAF6CA6EE5E6701A0306E260F8C9D0C1C2CE13F70C0DDB018028B50
              E0B0320AB3467DDB3153E08E3DBA0680512CC9C6882A6F9406288E4118B37526
              9D033D25B0226D01A3AEBC91E25466C28E3BD869C56DF1B51E68294778101AFE
              33AB814259FF9995503B159F59232BEFFDF92E3DB077655B1B9C033811B3BB4D
              FF01D774E4319E06C8FD0000000049454E44AE426082}
          end>
      end
      item
        Name = 'wizBig_DotTiny'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000385494441546843ED99FDB10D4110C5
              CF8B00112002448008100122400488001120024480081001224004D4AF6A5AF5
              9DBBB3D33DBBF7EE7B55AFABF68FBB7776B64FF7E9AFD9139D713939E3FAEB1C
              C0D61E5CD3035724DD91744BD2C5725D2F00BF4AFA5DAE4F923E48FAB106F8A5
              0050F4BEA407924CD9A85E8002CCF3022CFADCCEBA510028FE48D2E362E9A197
              9787F0CC4B49AF46808C00B82BE9852428E3E58FA4F7C5AAD0C32ED6B0960BE0
              3CCF75A17A1E200FCB1E618364013C95F4ACDAFD73B9071D3242ACB0D7CDEA21
              EE41AB9044016039AC0ED74D7E96DF59C56BC5000285AEB93FF024DEC02BB312
              05F0BA52FE6DE17FF7053D05CAFF1808102404933705C46200B814EA98E0DE9A
              46413DBBCBD2EFEA7980607B7724E5ED3535887B73813D0700B77E776912DAF8
              18E89A73C102E8637482A6575BF13007C05BE25BA9B06B71BE870DE3911C2CB0
              9BB46D01A8AD7FBB6CD87BF19AFF939D3E960D9B5E68012023506911F23C9B6D
              2178C1EA04959ACABF232D0070DF2AED16D63725BD17E89D6E4400A0380010DA
              03E8B4A5401F6B3B08E69D2E76CA03B889AA8B8C661E2C47EDF0ED34813852B5
              7D467A520ADE7F834E01F0BC9BCDC10DB7D479DC2F1B2982BE163147F03B0C20
              CB7FCFD916ED96ECB99750A63CF0C5B97E8F739D60F0DE6B2DCD66351F937B81
              3C05E06FC74373187E05829EA0BC94CC0A4D9DD606E033464BC791CC9602809B
              AC849F060A91C9A035424BB3337BF7B2D09280DB2C889986381E41988AC8C319
              593B8DD201335021A134BA562103882F64FC3E4A21F3696B246364BC1559EB33
              5BA89560531FC8D9388828155DE30BE35E00B349AB1BF534C2ED80D8429807AC
              95DFEB83E600D081D2F55917B885177C0F44ED80DA7B136174A4040CBDF83147
              4A72BFCD24E99112EFE00562E172E10EE995EEF418C24988759D1CA091CD268D
              973D56991CEB5646E4C759B61E3E5631BD7C40738F171050871006293FF74E06
              AE7F71CF03B6D64F45DC0B9F5D06514257AAAD1F5642D36014C0D4D925818D85
              00B344489328EF8FEBC367AF51002D3A719F3A01ADE853326273737D64931A3B
              B300501037A3B06527539A2CE13F7090BBC96208D665BDFFC0519F76B09EC62D
              E5D1110028C4CB0936AEFA4B4BC60BAC45710CC295AE33A3004C498060352EFF
              81220282DE06FAD1A5A615B7172C05E0158526D0CB7F66355028EB3FB3429353
              F1993562E983AE59D3030755B4B5F939804DCCEE5EFA0F4C1DCE317C288A9B00
              00000049454E44AE426082}
          end>
      end
      item
        Name = 'wizBigFilledTicked'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000002E8494441546843DD99FDB54D3110C5
              F7AB800E50C1A30254800A50012A4005A80015D001AF0254800A5001EB679DDC
              754E6E3E26C99C735CF9EBAD777392BD67F6CC2493339DF8383B71FC5A93C075
              49972603FD92F4790D63791100EC1D497725F1776940E4A3A4B71EA446085C96
              F448D20349573BADFB4DD21B49AF24FDEC59A397C07D492F2541C26300FED944
              A469BD5602C8E3DD80C56BE0F0C8BD1669B510402A2F1CAD5E22F37092568DB0
              390B01FC717535DF0948F4496D498B07588860DD6310DC45C3D508209BD77B20
              9FED599453890001FB6967F061FB1BB9C02E11F8BA62B669B50BD9E95AEAA31C
              017447E0FE4B8380261E17234580E284F5BD8A9497112876786151B15304A888
              4FBD7635ACC3412F1CFA6AD39F4F15FB302F45604BED73A043AE1CEECE6BE825
              1DC5424C60CBCC0378D23403B95A492C32524C60ABE09D830F86B79258C82826
              80156E1A5C393225053EAC47D10C5EC9EDC17D022FFC1D3181DF23C80CDF8E82
              3FC23D4AA0258378815F187E4E000DFE3058314C69C9209EE0D9FF10C87302B7
              247D301268C920DEE081787BCA5A8B18B01268C9206B80CF12B04A884B3847DC
              78C469702DF05909F183350BD54890EA72E9D0922A6B4A3E487F240B9548E45A
              241EE0B359881F5A0B598E44CA825EE0BFCC9B671E47090B092FF01866712F88
              09D061E334DA3A4A243CC12F02387594E07F1C59AFB43298FA387176F206FF3D
              BEE67A5F68E69EF0068F4D4D171AF23969B0C70B6C020946ED54D9EA64CE5D48
              BC7AA50C9BEFDD0F8A0926FB43A5B64A6F2CB45AD632FF48FBE1A35A638BBA60
              BD705B80F4CC413A9CD3922F3CFF756B31586BEB36CBDC4B4759277661CD037B
              92A882CF15B29C4E498BB4F6D68E09344F7724A4E362DC583D1016A16FF47EA0
              46D482986CC34BA7F949B69540008037888DDE62171369B2FAFCE35E02AC41C5
              C6D590E92582C5910AD2DCF49935B620251ED78787EE529C5C4C32448A14CBA1
              31E281DAC67828BCDAA3E92E0BD7365993406D6F97DF4F9EC01FC8BA94311ECF
              916C0000000049454E44AE426082}
          end>
      end
      item
        Name = 'wizDotSmall'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000286494441546843ED98812D84411085
              DF554007A80015A00274400574800EA80015D0012A4007744005E493DD986CCE
              EDCECE2197EC267F22313B3BEFCDDBD9999B68C1D764C1E3D700F0DF191C1918
              1908323024142430BC7D64A0A0705BD2AEA40D49ABE9C3E4257D4F926E253D84
              A94F0EE6958103492726E05A7C003A95745D33ACFD3F0A00A66F1C8197F10064
              5F1299E95A11007B922E252D9B935F9344EE535004C8424E804562EC5B317BDE
              241DA67D6E10BD000802E6F37A97749E3E029AB5007C9CBE25634826B81FAED5
              030026EF0CF3B00E20AF0CF043C0391B00DFF1FAE901802CF2A1044F2035D67F
              62956C003CFBE3EF4D4F0ABC00A836E89E856CD0B497F9323E08E0CE6439711F
              AE5A41780158F6CF52296C3D6B961D259532CCE28CB556A71E00B08DF65951E9
              94F19552E22E9095EAF200A0CA1C258F17A98A540F701874F9F7008091AD1450
              57C9AB80B1A59956838C57970780D53F1ACD8F54F59046032EF363B26DAE461E
              001F2610CFBEC6F8BFCCDC677802713BF7449E6CDD677800FCA5849ED30359E5
              C00360E12F715799AB52F86DD0E5DF9301FB9021277A96DE1E68DA434605A2ED
              66FDCA4386E3BF682578E533906A023D19C0996DE6BADADF291195EDF9AF3673
              6516A252A207B2D269AE3E99086F06D857B6BFBD736D394F77B5E73D0000518E
              94C8892A429357BBD8B04E53C85869E7E9E68B6B65D80B208360F0B0732DD960
              4CE4CDE032E66107B699BAF2506F2F29CC434853FB5CDEA108802C273BD756AB
              466180E6290CDD535D14408E872098AAECCF25B3C0901DEC9B47C79F9CCD0B40
              F69F258264D0F77AFA074C7337F24F8B5D72990662DE00BC120ADB0F00610A83
              0E4606820486B78F0C84290C3A1819081218DEBEF019F804E5668031F038996D
              0000000049454E44AE426082}
          end>
      end
      item
        Name = 'wizDotSmallFilled'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000001A6494441546843ED98ED3104411086
              9F8B800C1001322003421081CB001910011990012110013210C2D5AB6EABB6EE
              EC6EF5C716537AAAEED76EF7BD1FDD3D33BBA0F1B5681C3F45E0B71D2C07CA81
              A00255424101C3E1E54058C26082726040C07D600FD85D3FFF023E818FA0E05B
              E1990E08EC2570061C0D007D059E803B40A4C22B8B8040DFF7149F0226F0176B
              3253EF8E3ECF20700D5C395128F6C619FB1D16251001DFE11601E571AD080195
              CDA3EB5FB783CEBDE5E425A0867D37D4FC144F4DA7634F637B096494CE262957
              297909681C1E4EC96A7CAE9C72C1B43C04B449A97CE65807D6CDCE43E004789E
              033D700ABC58727B08644E9F4DACE669F42F09345F42CD37B1EA768E31FA3672
              8A1DEC6B4F0F2859F31B998E12DAFE772C236FE45D5D76748730DF11BC0E084B
              E638358FCF4E8C0881AC52729D81B208444984C0EBCFA30E7442A89C1E0C3DA1
              9A5F7AEF00FD5ECA22A09C6A6C811299A193AA46A52EF5B79E86FD69086412E8
              E7D766A75FFFB38AA6D69FFEAC9234516D69E672C08622F07611088897125A0E
              A4C81848520E04C44B092D0752640C24290702E2A584AE0080853A311071BB30
              0000000049454E44AE426082}
          end>
      end
      item
        Name = 'WizardNodeBgrd'
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
        Name = 'WizardNodeBgrd5Grey'
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
        Name = 'WizardNodeBgrd4Grey'
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
        Name = 'check_circle_filled'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000EC300000EC301C76FA8640000001974455874536F
              667477617265007777772E696E6B73636170652E6F72679BEE3C1A0000039749
              4441546881D59ACD6B134118879FD96C3E5A6B0C8D95227A50110F95160F52A1
              8A16D1FA27E8A982E0498B7A50442DE2C7A1BD88085E14510F2AFE037E1CA4DE
              EC491415455A410F6A7BB18D1FA949331E7637DD6C36C9643F92F8C20BD9CDCC
              BBCF6FE69D999D49849492FFD9B46603F8353DE880428828B01EE80212E6ED2C
              300B4C4B2973813ECF6F0A0921746008D8070C029BA8DC3079E00330013C051E
              F91624A5F4E4182D7C19F80A488F3E038C03DD9E393C80B70117819F3EC09DFE
              1B18033A4215006C07A6030477FA17607728028093402E4478CB178151CCF1E9
              5B00C6547BAD01E04EBF0944821070A509F096DFADD513B5E04F3511DEF2514F
              02801D3426E76BF922B0A72E01403BE1CE36F5FA672A4CB195045C6A0168A78F
              290900D240A605809DFE0758EDE4757B1B1D013A5CEE876311E59209E058D95D
              9739FF330D6A55AD2726A367D352A423AA75668068B51E1804D62AB7890FD37A
              E3E8875288AE08FA9114A253A92BBA30DE7C97E2380A0CD100D37A62E8C3C962
              FA88CE08FA480A915612B1B72496E3CB9D81105631ABE5D145C97D918C20BA95
              040C96D433731F218400E60971006B7D71F4E115E5037711F2B7E728BC5E5009
              9307DAA5B911B2F7C06AEA8417CBD5B7D45A6F20F060ECF6D615E3DABE58A94C
              0368DB1244CFA5D136C66A97ED8BA31F0C04DEB222AB5DC032D5DA5A7F027D7F
              12E202FDF08AAA22024A1BA71533C52E40B8142C07DA62C25BA563954584045F
              FA0CDBE79F9EA3B8880819BEC86A1730AB52B3F0324BFEDEBCB12EDACD142136
              441BD1F24556CFD3A8D69F403F902C4FBCBF1222224CF81CC6349A075B0F4843
              C91BD52885C92CF9FBEE3DE10A7F27989C07DE59F050BE123FAF2752451176B3
              5AFE5520F000CFEC174E018FEB8D5698CC927F907117116CCB5BF6C47E517236
              6A8E83296C2B9DAA69DB1CD36B8053A5CDBE036B2AA690390E6E79895C789125
              FFD0EC89705A1EE0861D1E70DD52A68039BC6E5206DAA4D6170F63039401D2AA
              9BFA332100F875D7F3A14A02E218E7F8CD86B6FC2390A8F7606B2BB0D002F039
              60C0EBD1E2D1161070DCF3D9A82962BC89F0D76BF22908104D127115D07C0B70
              A45323C6440E38A1CCA55AD036B0DF87083F459501EB5B802922069C067E0408
              9E01CE036D75F3D45BC1262485B1E07DF201FE05B880CB0AABEA41FCD02D307E
              BDDC07EC023603C90AC533C05B8CD7F6A7C08494B2E0EBF97E05B80615A21B58
              C5D249C72F60464AF92DF0678521A091F6DFFF5BE51FBD91DE683E6A37400000
              000049454E44AE426082}
          end>
      end>
    Left = 288
    Top = 576
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
    Left = 512
    Top = 576
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
  object VirtualImageList1: TVirtualImageList
    Images = <
      item
        CollectionIndex = 1
        CollectionName = 'arrow_left'
        Name = 'arrow_left'
      end
      item
        CollectionIndex = 2
        CollectionName = 'arrow_right'
        Name = 'arrow_right'
      end
      item
        CollectionIndex = 5
        CollectionName = 'thumb_up'
        Name = 'thumb_up'
      end
      item
        CollectionIndex = 6
        CollectionName = 'cancel'
        Name = 'cancel'
      end
      item
        CollectionIndex = 7
        CollectionName = 'check_circle'
        Name = 'check_circle'
      end
      item
        CollectionIndex = 8
        CollectionName = 'login'
        Name = 'login'
      end
      item
        CollectionIndex = 3
        CollectionName = 'arrow_left_double'
        Name = 'arrow_left_double'
      end
      item
        CollectionIndex = 4
        CollectionName = 'arrow_right_double'
        Name = 'arrow_right_double'
      end
      item
        CollectionIndex = 10
        CollectionName = 'wizBig_DotSmall'
        Name = 'wizBig_DotSmall'
      end>
    ImageCollection = ImageCollection1
    Width = 48
    Height = 48
    Left = 400
    Top = 576
  end
  object ActionManager1: TActionManager
    Images = VirtualImageList1
    Left = 80
    Top = 576
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
    object actnFirst: TAction
      Category = 'Transport'
      Caption = 'First'
      ImageIndex = 6
      ImageName = 'arrow_left_double'
    end
    object actnLast: TAction
      Category = 'Transport'
      Caption = 'Last'
      ImageIndex = 7
      ImageName = 'arrow_right_double'
    end
    object actnPrev: TAction
      Category = 'Transport'
      Caption = 'Previous'
      ImageIndex = 0
      ImageName = 'arrow_left'
    end
    object actnNext: TAction
      Category = 'Transport'
      Caption = 'Next'
      ImageIndex = 1
      ImageName = 'arrow_right'
    end
    object actnAbort: TAction
      Category = 'Login'
      Caption = 'Abort Login'
      ImageIndex = 3
      ImageName = 'cancel'
    end
    object actnTrackStart: TAction
      Category = 'Track'
      Caption = 'Start'
      OnExecute = actnTrackStartExecute
    end
    object actnTrackLogin: TAction
      Category = 'Track'
      Caption = 'Login'
      OnExecute = actnTrackLoginExecute
    end
    object actnTrackMethod: TAction
      Category = 'Track'
      Caption = 'Method'
      OnExecute = actnTrackMethodExecute
    end
    object actnTrackSelect: TAction
      Category = 'Track'
      Caption = 'Select'
      OnExecute = actnTrackSelectExecute
    end
    object actnTrackOptions: TAction
      Category = 'Track'
      Caption = 'Options'
      OnExecute = actnTrackOptionsExecute
    end
    object actnTrackFinalStep: TAction
      Category = 'Track'
      Caption = 'Final Step'
      OnExecute = actnTrackFinalStepExecute
    end
    object actnTrackSuccess: TAction
      Category = 'Track'
      Caption = 'Success'
    end
    object actnGo: TAction
      Caption = 'Go'
      ImageIndex = 8
      ImageName = 'wizBig_DotSmall'
      OnExecute = actnGoExecute
      OnUpdate = actnGoUpdate
    end
  end
end
