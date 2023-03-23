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
    end
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 576
      Top = 14
      Width = 85
      Height = 68
      Margins.Left = 20
      Margins.Right = 20
      Anchors = []
      Caption = 'Exit'
      ImageAlignment = iaTop
      ImageIndex = 3
      ImageName = 'cancel'
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
      ImageIndex = 0
      ImageName = 'arrow_left'
      ImageMargins.Bottom = -10
      Images = VirtualImageList1
      TabOrder = 3
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
      ImageIndex = 1
      ImageName = 'arrow_right'
      ImageMargins.Bottom = -10
      Images = VirtualImageList1
      TabOrder = 4
    end
  end
  object RelativePanel2: TRelativePanel
    Left = 0
    Top = 0
    Width = 681
    Height = 81
    ControlCollection = <
      item
        Control = shapeLine
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = True
        AlignRightWithPanel = True
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
      end
      item
        Control = vimgLineStart
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = True
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
      end
      item
        Control = vimgLineEnd
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = True
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
      end
      item
        Control = vimgLogin
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
        RightOf = vimgLineStart
      end
      item
        Control = vimgMethod
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
        RightOf = vimgLogin
      end
      item
        Control = vimgSelect
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
        RightOf = vimgMethod
      end
      item
        Control = vimgOptions
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
        RightOf = vimgSelect
      end
      item
        Control = vimgLastStep
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
        RightOf = vimgOptions
      end>
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 677
    DesignSize = (
      681
      81)
    object shapeLine: TShape
      AlignWithMargins = True
      Left = 61
      Top = 37
      Width = 559
      Height = 4
      Margins.Left = 60
      Margins.Right = 60
      Anchors = []
      Brush.Color = clBackground
      Pen.Width = 0
    end
    object vimgLineStart: TVirtualImage
      AlignWithMargins = True
      Left = 17
      Top = 15
      Width = 48
      Height = 48
      Margins.Left = 16
      Anchors = []
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 12
      ImageName = 'line_start'
    end
    object vimgLineEnd: TVirtualImage
      AlignWithMargins = True
      Left = 616
      Top = 15
      Width = 48
      Height = 48
      Margins.Right = 16
      Anchors = []
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 11
      ImageName = 'line_end'
    end
    object vimgLogin: TVirtualImage
      AlignWithMargins = True
      Left = 112
      Top = 15
      Width = 48
      Height = 48
      Margins.Left = 44
      Anchors = []
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 16
      ImageName = 'wizCircleTickedFilled'
    end
    object vimgMethod: TVirtualImage
      AlignWithMargins = True
      Left = 207
      Top = 15
      Width = 48
      Height = 48
      Margins.Left = 44
      Anchors = []
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 15
      ImageName = 'wizDotFilled'
    end
    object vimgSelect: TVirtualImage
      AlignWithMargins = True
      Left = 302
      Top = 15
      Width = 48
      Height = 48
      Margins.Left = 44
      Anchors = []
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 15
      ImageName = 'wizDotFilled'
    end
    object vimgOptions: TVirtualImage
      AlignWithMargins = True
      Left = 397
      Top = 15
      Width = 48
      Height = 48
      Margins.Left = 44
      Anchors = []
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 15
      ImageName = 'wizDotFilled'
    end
    object vimgLastStep: TVirtualImage
      AlignWithMargins = True
      Left = 492
      Top = 15
      Width = 48
      Height = 48
      Margins.Left = 44
      Anchors = []
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 15
      ImageName = 'wizDotFilled'
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 81
    Width = 681
    Height = 594
    ActivePage = TabSheet2
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
    ExplicitWidth = 677
    ExplicitHeight = 593
    object TabSheet1: TTabSheet
      Caption = 'Start'
      object Label6: TLabel
        Left = 27
        Top = 32
        Width = 74
        Height = 21
        Caption = 'WELCOME'
      end
    end
    object TabSheet2: TTabSheet
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
        Left = 416
        Top = 302
        Width = 85
        Height = 83
        Margins.Left = 20
        Anchors = []
        Caption = 'Abort'
        ImageAlignment = iaTop
        ImageIndex = 3
        ImageName = 'cancel'
        Images = VirtualImageList1
        TabOrder = 4
      end
      object Button2: TButton
        AlignWithMargins = True
        Left = 521
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
    object TabSheet7: TTabSheet
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
        Left = 35
        Top = 56
        Width = 512
        Height = 25
        Caption = 'Update existing swimmers or introduce new squad members.'
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
        ItemIndex = 1
        Items.Strings = (
          
            'Update the details and racing history of squad swimmers who swim' +
            ' with SCM.'
          'Introduce new SCM club members into your squad.')
        TabOrder = 0
        OnClick = rgrpMethodClick
      end
    end
    object TabSheet3: TTabSheet
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
        ImageName = 'arrow_double_right'
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
        ImageName = 'arrow_double_left'
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
      object Label7: TLabel
        Left = 24
        Top = 19
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
        TabOrder = 2
        OnDragDrop = ListBoxDestDragDrop
        OnDragOver = ListBoxDestDragOver
      end
    end
    object TabSheet4: TTabSheet
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
        Width = 414
        Height = 21
        Caption = 'When updating, enable this option to have profiles restored.'
        WordWrap = True
      end
      object CheckBox1: TCheckBox
        Left = 48
        Top = 304
        Width = 257
        Height = 21
        Caption = 'Import Personal Best (PB) race times.'
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 48
        Top = 376
        Width = 249
        Height = 21
        Caption = 'Import ALL swimming history. '
        TabOrder = 1
      end
      object CheckBox3: TCheckBox
        Left = 48
        Top = 128
        Width = 611
        Height = 21
        Caption = 'Import member'#39's profile.'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Final Step'
      ImageIndex = 4
      DesignSize = (
        673
        544)
      object Label4: TLabel
        Left = 264
        Top = 272
        Width = 105
        Height = 21
        Caption = 'Click to import.'
      end
      object Button3: TButton
        AlignWithMargins = True
        Left = 266
        Top = 172
        Width = 85
        Height = 68
        Margins.Left = 20
        Anchors = []
        Caption = 'Go'
        ImageAlignment = iaTop
        ImageIndex = 4
        ImageName = 'check_circle'
        ImageMargins.Bottom = -2
        Images = VirtualImageList1
        TabOrder = 0
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Success'
      ImageIndex = 5
    end
  end
  object myConnection: TFDConnection
    ConnectedStoredUsage = [auDesignTime]
    LoginPrompt = False
    Left = 144
    Top = 440
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
        Name = 'wizDisabled'
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
        Name = 'wizDone'
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
        Name = 'wizReady'
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
        Name = 'line_end'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000239494441546843ED98813104411045
              FF4580081001224004880019100132900122400488001120024440BD32ADFAF6
              76EFC68ED9B56ABA6AEAB66A7766FAF7FFDDD373230DDC4603F75F0540DF0C16
              060A03891128124A0C60F2F4C24072081317280CFC30804B92D625ADBA312FE9
              398C2B49D7E1396AE92E193892741CE595742EE9240648170036249D4922FA3F
              B1374987FA02D368B901EC05E7BD0377926EC378082F9014401948CCDBFE3410
              3901E0D48D24348EBD4B02103A9F66DBC1E139F75123885C0070FADEC986A8E3
              18B28831E6C3D24AF898796B7539910B0051DE729147FFB1CE1B40AB4EC6C445
              60702C00B900BC3AE9EC44C8A6891558BB742F97AB2CE400E037453A24668A21
              254B6CAAD2A95F2C0700CADE6ED8845A1E5BFB9B40329F33049B08481D00FBB8
              6DD4A83456F3374332B65D8B79304835C328BB24F3B7D501F848D9AD3277A145
              F256B72799C929B3319FFF258054CD22A1C510AEDF96D0636802A74A285541BD
              27712A005F462981B0906224B095E24ECA28CE72EADA093AB8830C005E4680E1
              046DD34A3CB913BDD35682D247CDB664464A30110B82F948878E16A393E5999B
              DB98E538896D0336C4719312CED316C7B4D35C80AC0D67BDCEDB69035177A1B1
              CB0CBF94458CB6D92E34D5DEA9B70B8D81C02172C2E4145B9190CD41DF574AEF
              AC6FCA66812061F97E42F35DE6409D93347930E2FF5621475EDCDF2AE4C84CC7
              6B1BA35961F98BEF7356A14EF016009D8479CA268581C24062048A841203983C
              BD30901CC2C40506CFC02721E46831E75D5F560000000049454E44AE426082}
          end>
      end
      item
        Name = 'line_start'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000024E494441546843ED98812D84411085
              9F0A50012A4005E8800AD0810E50011DA0023A4005A80015A002F2C94EB2F7E7
              BFFB676F96CBB1935C2E17B3BB33EFBD999DB5A039B785398F5F2D815933D818
              680C041168120A02185EDE18084318DCE0DF31B021694BD2AEA42549FC7E97F4
              987DEE25BD0481752FF732B02AE958D28173E71349A74EDF909B2701823E4B88
              971C060B8792EE4A1695FA0E2540F0179D4D910841F1413A1852DA4E1F24961B
              495C9606E6F59F944037F88F24A19B81CDA90F025E4C7ED4C84E96AC373697DF
              B804D0FC43261B50273082F118050E43EBC919396D16ACF79CF1ED332E0110DC
              4FBB803C097983B7C34982C08D89AB8226104A003D83BED99EA421D98C3B10D6
              AE33292DBB23733AF6317094BA0E5B201D8A336248C90A3B02466F0C7D09E407
              D2CBE9E911633D7708565D467D093C27CD7320DD23DAC761F0362BE6684B1DB9
              20FB12F8CCE046B3A5C5DB658B627E8B50D8593B12F39F4C80D6B792B2AE2DA1
              D70AB7F2484DFEC922CEDB28050C0B11A380AD15FF4A1BFDA98B8C1B9D82AE6A
              9E51822EB436453722585AB2055DFD0E008949C31CA3B2CD314809FABD2D95A0
              910E6C624F4946DEF56E964AC6690E67B61F9A8B987F784318F248871AB0B783
              3B388FE3340F1A7BCCF00DB21863B33D68BAB3D3CC1E3406000F9BF34C4E1E60
              F0A1E7B3363A8A4C3C6F88015BCC7B800BC4DE084349D4180287CEF8FEBB3701
              DBCCDEBEF66F15A483C6D13748738BDBB72B80A8536902D1F3AAAF6F095487B4
              70C3C6402160D5DD1B03D5212DDCB03150085875F7C64075480B379C7B06BE00
              A1D36C31CEB67E0C0000000049454E44AE426082}
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
        Name = 'wizDot'
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
        Name = 'wizDotFilled'
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
        Name = 'wizCircleTickedFilled'
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
      end>
    Left = 248
    Top = 440
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
    Left = 472
    Top = 440
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
        CollectionIndex = 13
        CollectionName = 'login'
        Name = 'login'
      end>
    ImageCollection = ImageCollection1
    Width = 48
    Height = 48
    Left = 360
    Top = 440
  end
  object ActionManager1: TActionManager
    Images = VirtualImageList1
    Left = 40
    Top = 440
    StyleName = 'Platform Default'
    object actnLogin: TAction
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
  end
end
