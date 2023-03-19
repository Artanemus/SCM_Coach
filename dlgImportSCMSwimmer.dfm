object ImportSCMSwimmer: TImportSCMSwimmer
  Left = 0
  Top = 0
  Caption = 'Wizard - Import SwimClubMeet Members'
  ClientHeight = 771
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 21
  object PageControl1: TPageControl
    Left = 0
    Top = 102
    Width = 670
    Height = 669
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Start'
      object Label6: TLabel
        Left = 40
        Top = 48
        Width = 74
        Height = 21
        Caption = 'WELCOME'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'SCM Login'
      ImageIndex = 1
      DesignSize = (
        662
        633)
      object Shape3: TShape
        Left = 6
        Top = 32
        Width = 656
        Height = 65
        Brush.Color = clOlive
      end
      object Label1: TLabel
        Left = 48
        Top = 203
        Width = 45
        Height = 21
        Alignment = taRightJustify
        Caption = 'Server'
      end
      object Label2: TLabel
        Left = 15
        Top = 243
        Width = 78
        Height = 21
        Alignment = taRightJustify
        Caption = 'User Name'
      end
      object Label3: TLabel
        Left = 27
        Top = 283
        Width = 66
        Height = 21
        Alignment = taRightJustify
        Caption = 'Password'
      end
      object lblLoginErrMsg: TLabel
        Left = 23
        Top = 368
        Width = 453
        Height = 27
        Alignment = taCenter
        AutoSize = False
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
        Left = 144
        Top = 401
        Width = 306
        Height = 27
        AutoSize = False
        Caption = 'Attempting to connect ... please wait.'
        Visible = False
      end
      object chkOsAuthent: TCheckBox
        Left = 99
        Top = 320
        Width = 206
        Height = 24
        Caption = 'Use OS Authentication'
        TabOrder = 0
      end
      object edtPassword: TEdit
        Left = 99
        Top = 280
        Width = 279
        Height = 27
        TabOrder = 1
        Text = 'edtPassword'
      end
      object edtServer: TEdit
        Left = 99
        Top = 200
        Width = 403
        Height = 27
        TabOrder = 2
        Text = 'edtServer'
      end
      object edtUser: TEdit
        Left = 99
        Top = 240
        Width = 351
        Height = 27
        TabOrder = 3
        Text = 'edtUser'
      end
      object Button1: TButton
        AlignWithMargins = True
        Left = 391
        Top = 435
        Width = 85
        Height = 68
        Margins.Left = 20
        Anchors = []
        Caption = 'Abort Login'
        ImageAlignment = iaTop
        ImageIndex = 3
        ImageName = 'cancel'
        ImageMargins.Bottom = -12
        Images = VirtualImageList1
        TabOrder = 4
        ExplicitTop = 452
      end
      object Button2: TButton
        AlignWithMargins = True
        Left = 499
        Top = 435
        Width = 85
        Height = 68
        Margins.Left = 20
        Anchors = []
        Caption = 'Login'
        ImageAlignment = iaTop
        ImageIndex = 3
        ImageName = 'cancel'
        ImageMargins.Bottom = -12
        Images = VirtualImageList1
        TabOrder = 5
        ExplicitTop = 452
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
      Caption = 'Update or Introduce'
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
        Width = 317
        Height = 25
        Caption = 'Process method. Update or introduce.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object RadioGroup1: TRadioGroup
        Left = 24
        Top = 136
        Width = 609
        Height = 113
        Caption = 'Select process ...'
        Items.Strings = (
          
            'Update the details and racing history of squad swimmers who swim' +
            ' with SCM.'
          'Introduce new SCM club members into your squad.')
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Select'
      ImageIndex = 2
      object Shape1: TShape
        Left = 3
        Top = 16
        Width = 656
        Height = 65
        Brush.Color = clOlive
      end
      object VirtualImage1: TVirtualImage
        Left = 304
        Top = 131
        Width = 48
        Height = 48
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 2
        ImageName = 'arrow_right'
      end
      object VirtualImage2: TVirtualImage
        Left = 304
        Top = 185
        Width = 48
        Height = 48
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 1
        ImageName = 'arrow_left'
      end
      object VirtualImage3: TVirtualImage
        Left = 304
        Top = 239
        Width = 48
        Height = 48
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 4
        ImageName = 'arrow_double_right'
      end
      object VirtualImage4: TVirtualImage
        Left = 304
        Top = 293
        Width = 48
        Height = 48
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 3
        ImageName = 'arrow_double_left'
      end
      object VirtualImage5: TVirtualImage
        Left = 16
        Top = 93
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
        Width = 608
        Height = 62
        AutoSize = False
        Caption = 
          'Select the SwimClubMeet Members you want to include and/or gathe' +
          'r data from..'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object edtSearch: TEdit
        Left = 54
        Top = 96
        Width = 227
        Height = 29
        Hint = 'Search'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'edtSearch'
      end
      object ListViewA: TListView
        Left = 24
        Top = 131
        Width = 257
        Height = 486
        Columns = <
          item
            Caption = 'SwimClubMeet Member'
            MaxWidth = 300
            MinWidth = 250
            Width = 250
          end>
        GridLines = True
        MultiSelect = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 1
        ViewStyle = vsReport
        OnDragDrop = ListViewADragDrop
        OnDragOver = ListViewADragOver
      end
      object ListViewB: TListView
        Left = 375
        Top = 131
        Width = 257
        Height = 478
        Columns = <>
        ReadOnly = True
        RowSelect = True
        TabOrder = 2
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
        Width = 480
        Height = 21
        Caption = 'Aways checked when introducing new SCM swimmers to your squad.'
        WordWrap = True
      end
      object Label11: TLabel
        Left = 72
        Top = 203
        Width = 529
        Height = 54
        Caption = 
          'When updating, known SCM squad swimmers will have thier profiles' +
          ' updated.'
        WordWrap = True
      end
      object CheckBox1: TCheckBox
        Left = 48
        Top = 280
        Width = 257
        Height = 21
        Caption = 'Import Personal Best race times.'
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 48
        Top = 344
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
      Caption = 'Last Step'
      ImageIndex = 4
      DesignSize = (
        662
        633)
      object Label4: TLabel
        Left = 264
        Top = 304
        Width = 105
        Height = 21
        Caption = 'Click to import.'
      end
      object Button3: TButton
        AlignWithMargins = True
        Left = 272
        Top = 205
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
        ExplicitTop = 153
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Success'
      ImageIndex = 5
    end
  end
  object RelativePanel1: TRelativePanel
    Left = 0
    Top = 0
    Width = 670
    Height = 102
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
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 1041
    DesignSize = (
      670
      102)
    object btnPrev: TButton
      AlignWithMargins = True
      Left = 128
      Top = 17
      Width = 85
      Height = 68
      Margins.Left = 20
      Anchors = []
      Caption = 'Previous'
      ImageAlignment = iaTop
      ImageIndex = 0
      ImageName = 'arrow_left'
      ImageMargins.Bottom = -12
      Images = VirtualImageList1
      TabOrder = 0
    end
    object btnNext: TButton
      AlignWithMargins = True
      Left = 236
      Top = 17
      Width = 85
      Height = 68
      Margins.Left = 20
      Anchors = []
      Caption = 'Next'
      ImageAlignment = iaTop
      ImageIndex = 1
      ImageName = 'arrow_right'
      ImageMargins.Bottom = -12
      Images = VirtualImageList1
      TabOrder = 1
    end
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 582
      Top = 17
      Width = 85
      Height = 68
      Margins.Left = 20
      Anchors = []
      Caption = 'Cancel'
      ImageAlignment = iaTop
      ImageIndex = 3
      ImageName = 'cancel'
      ImageMargins.Bottom = -12
      Images = VirtualImageList1
      TabOrder = 2
    end
    object btnFirst: TButton
      AlignWithMargins = True
      Left = 20
      Top = 17
      Width = 85
      Height = 68
      Margins.Left = 20
      Anchors = []
      Caption = 'First'
      ImageAlignment = iaTop
      ImageIndex = 0
      ImageName = 'arrow_left'
      ImageMargins.Bottom = -12
      Images = VirtualImageList1
      TabOrder = 3
    end
    object btnLast: TButton
      AlignWithMargins = True
      Left = 344
      Top = 17
      Width = 85
      Height = 68
      Margins.Left = 20
      Anchors = []
      Caption = 'Last'
      ImageAlignment = iaTop
      ImageIndex = 1
      ImageName = 'arrow_right'
      ImageMargins.Bottom = -12
      Images = VirtualImageList1
      TabOrder = 4
    end
  end
  object myConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_SwimClubMeet')
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    Left = 272
    Top = 16
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
      end>
    Left = 368
    Top = 16
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
    Left = 576
    Top = 16
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
      end>
    ImageCollection = ImageCollection1
    Width = 48
    Height = 48
    Left = 476
    Top = 18
  end
end
