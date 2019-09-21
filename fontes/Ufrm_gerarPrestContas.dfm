object frm_GerarPrestContas: Tfrm_GerarPrestContas
  Left = 327
  Top = 21
  Width = 900
  Height = 672
  Caption = 'Presta'#231#227'o de Contas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 457
    Top = 22
    Width = 65
    Height = 13
    Caption = 'Acr'#233'scimos'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 892
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Gerar Presta'#231#227'o de Contas'
    Color = 4210688
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 890
      Height = 39
      Align = alClient
      Picture.Data = {
        0A544A504547496D616765C7030000FFD8FFE000104A46494600010101006000
        600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
        0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
        3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
        3232323232323232323232323232323232323232323232323232323232323232
        32323232323232323232323232FFC00011080045010F03012200021101031101
        FFC4001F0000010501010101010100000000000000000102030405060708090A
        0BFFC400B5100002010303020403050504040000017D01020300041105122131
        410613516107227114328191A1082342B1C11552D1F02433627282090A161718
        191A25262728292A3435363738393A434445464748494A535455565758595A63
        6465666768696A737475767778797A838485868788898A92939495969798999A
        A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
        D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
        01010101010101010000000000000102030405060708090A0BFFC400B5110002
        0102040403040705040400010277000102031104052131061241510761711322
        328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
        292A35363738393A434445464748494A535455565758595A636465666768696A
        737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
        A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
        E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F9FE
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A00FFFD9}
      Stretch = True
      Transparent = True
    end
    object Label14: TLabel
      Left = 255
      Top = 6
      Width = 271
      Height = 27
      Caption = 'Gerar Preta'#231#227'o de Contas'
      Color = clBlack
      ParentColor = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 892
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 22
      Width = 35
      Height = 13
      Caption = 'Cliente:'
    end
    object btn_busca: TSpeedButton
      Left = 382
      Top = 5
      Width = 75
      Height = 42
      Hint = 'Esconde a tela'
      Caption = '&Buscar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_buscaClick
    end
    object SpeedButton1: TSpeedButton
      Left = 792
      Top = 7
      Width = 78
      Height = 41
      Hint = 'Esconde a tela'
      Caption = '&Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
        BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
        BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
        BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
        BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
        EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
        EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
        EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
        EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton3: TSpeedButton
      Left = 614
      Top = 5
      Width = 131
      Height = 44
      Hint = 'Esconde a tela'
      Caption = 'Gravar Presta'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton3Click
    end
    object lk_cliente: TRxDBLookupCombo
      Left = 48
      Top = 18
      Width = 329
      Height = 21
      DropDownCount = 30
      LookupField = 'pk_cliente'
      LookupDisplay = 'nome'
      LookupDisplayIndex = 30
      LookupSource = Dts_cliente
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 97
    Width = 892
    Height = 319
    Align = alTop
    DataSource = dts_pendencia
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'pk_recibo'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Devedor'
        Width = 276
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_liquido'
        Title.Caption = 'Valor L'#237'quido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'baixaparcial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_retenc'
        Title.Caption = 'Valor reten'#231#227'o'
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 416
    Width = 892
    Height = 117
    Align = alTop
    Color = clMenu
    TabOrder = 3
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 890
      Height = 115
      Align = alClient
      Caption = 'Totais do Recibo'
      Enabled = False
      TabOrder = 0
      object Label2: TLabel
        Left = 100
        Top = 21
        Width = 25
        Height = 13
        Caption = 'Juros'
        FocusControl = DBEdit1
      end
      object Label3: TLabel
        Left = 173
        Top = 21
        Width = 26
        Height = 13
        Caption = 'Multa'
        FocusControl = DBEdit2
      end
      object Label4: TLabel
        Left = 100
        Top = 64
        Width = 53
        Height = 13
        Caption = 'Desc Juros'
        FocusControl = DBEdit3
      end
      object Label5: TLabel
        Left = 174
        Top = 64
        Width = 54
        Height = 13
        Caption = 'Desc Multa'
        FocusControl = DBEdit4
      end
      object Label12: TLabel
        Left = 758
        Top = 63
        Width = 113
        Height = 13
        Caption = 'Valor Liquido do Recibo'
        FocusControl = DBEdit11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 528
        Top = 64
        Width = 47
        Height = 13
        Caption = 'Reten'#231#227'o'
        FocusControl = DBEdit12
      end
      object Label6: TLabel
        Left = 616
        Top = 64
        Width = 60
        Height = 13
        Caption = 'Baixa parcial'
        FocusControl = DBEdit5
      end
      object Label9: TLabel
        Left = 9
        Top = 21
        Width = 43
        Height = 13
        Caption = ' Principal'
        FocusControl = DBEdit6
      end
      object Label10: TLabel
        Left = 256
        Top = 21
        Width = 36
        Height = 13
        Caption = 'Tx Adm'
        FocusControl = DBEdit7
      end
      object Label11: TLabel
        Left = 336
        Top = 21
        Width = 57
        Height = 13
        Caption = 'Tx Bancaria'
        FocusControl = DBEdit8
      end
      object Label24: TLabel
        Left = 441
        Top = 21
        Width = 52
        Height = 13
        Caption = 'Tx Seg Via'
        FocusControl = DBEdit9
      end
      object Label25: TLabel
        Left = 526
        Top = 21
        Width = 54
        Height = 13
        Caption = 'Tx Protesto'
        FocusControl = DBEdit10
      end
      object Label26: TLabel
        Left = 616
        Top = 21
        Width = 51
        Height = 13
        Caption = 'Honorarios'
        FocusControl = DBEdit13
      end
      object Label27: TLabel
        Left = 255
        Top = 64
        Width = 64
        Height = 13
        Caption = 'Desc Tx Adm'
        FocusControl = DBEdit14
      end
      object Label28: TLabel
        Left = 339
        Top = 64
        Width = 85
        Height = 13
        Caption = 'Desc Tx Bancaria'
        FocusControl = DBEdit15
      end
      object Label29: TLabel
        Left = 8
        Top = 62
        Width = 68
        Height = 13
        Caption = 'Desc Principal'
        FocusControl = DBEdit16
      end
      object DBEdit1: TDBEdit
        Left = 102
        Top = 36
        Width = 65
        Height = 21
        DataField = 'juros'
        DataSource = dts_pendencia
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 174
        Top = 36
        Width = 75
        Height = 21
        DataField = 'multa'
        DataSource = dts_pendencia
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 100
        Top = 81
        Width = 69
        Height = 21
        DataField = 'desc_juros'
        DataSource = dts_pendencia
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 173
        Top = 81
        Width = 74
        Height = 21
        DataField = 'desc_multa'
        DataSource = dts_pendencia
        TabOrder = 3
      end
      object DBEdit11: TDBEdit
        Left = 760
        Top = 79
        Width = 111
        Height = 21
        DataField = 'valor_liquido'
        DataSource = dts_pendencia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object DBEdit12: TDBEdit
        Left = 527
        Top = 81
        Width = 74
        Height = 21
        DataField = 'valor_retenc'
        DataSource = dts_pendencia
        TabOrder = 5
      end
      object DBEdit5: TDBEdit
        Left = 616
        Top = 81
        Width = 81
        Height = 21
        DataField = 'baixaparcial'
        DataSource = dts_pendencia
        TabOrder = 6
      end
      object DBEdit6: TDBEdit
        Left = 9
        Top = 36
        Width = 80
        Height = 21
        DataField = 'principal'
        DataSource = dts_pendencia
        TabOrder = 7
      end
      object DBEdit7: TDBEdit
        Left = 254
        Top = 36
        Width = 81
        Height = 21
        DataField = 'VrTxAdm'
        DataSource = dts_pendencia
        TabOrder = 8
      end
      object DBEdit8: TDBEdit
        Left = 338
        Top = 36
        Width = 97
        Height = 21
        DataField = 'VrTxBancaria'
        DataSource = dts_pendencia
        TabOrder = 9
      end
      object DBEdit9: TDBEdit
        Left = 440
        Top = 36
        Width = 81
        Height = 21
        DataField = 'VrTxSegVia'
        DataSource = dts_pendencia
        TabOrder = 10
      end
      object DBEdit10: TDBEdit
        Left = 526
        Top = 36
        Width = 83
        Height = 21
        DataField = 'acres_protesto'
        DataSource = dts_pendencia
        TabOrder = 11
      end
      object DBEdit13: TDBEdit
        Left = 615
        Top = 36
        Width = 82
        Height = 21
        DataField = 'acres_honorarios'
        DataSource = dts_pendencia
        TabOrder = 12
      end
      object DBEdit14: TDBEdit
        Left = 253
        Top = 81
        Width = 81
        Height = 21
        DataField = 'DescTxAdm'
        DataSource = dts_pendencia
        TabOrder = 13
      end
      object DBEdit15: TDBEdit
        Left = 336
        Top = 81
        Width = 89
        Height = 21
        DataField = 'DescTxBancaria'
        DataSource = dts_pendencia
        TabOrder = 14
      end
      object DBEdit16: TDBEdit
        Left = 8
        Top = 78
        Width = 81
        Height = 21
        DataField = 'desc_principal'
        DataSource = dts_pendencia
        TabOrder = 15
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 533
    Width = 892
    Height = 112
    Align = alClient
    Caption = 'Totais da Presta'#231#227'o de Contas'
    Color = clMenuBar
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 4
    object Label21: TLabel
      Left = 777
      Top = 56
      Width = 109
      Height = 13
      Caption = 'Total da Presta'#231#227'o'
      Color = clMenuBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label31: TLabel
      Left = 323
      Top = 15
      Width = 70
      Height = 13
      Caption = 'Vr Tx Bancaria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label32: TLabel
      Left = 430
      Top = 15
      Width = 65
      Height = 26
      Caption = 'Vr Tx Seg Via'#13#10' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label33: TLabel
      Left = 605
      Top = 15
      Width = 52
      Height = 13
      Caption = 'Vr Protesto'
      FocusControl = DBEdit20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label34: TLabel
      Left = 686
      Top = 15
      Width = 64
      Height = 13
      Caption = 'Vr Honorarios'
      FocusControl = DBEdit21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label35: TLabel
      Left = 240
      Top = 56
      Width = 64
      Height = 13
      Caption = 'Desc Tx Adm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label36: TLabel
      Left = 322
      Top = 55
      Width = 85
      Height = 13
      Caption = 'Desc Tx Bancaria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label37: TLabel
      Left = 8
      Top = 15
      Width = 34
      Height = 13
      Caption = 'Princial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 99
      Top = 15
      Width = 25
      Height = 13
      Caption = 'Juros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 162
      Top = 15
      Width = 26
      Height = 13
      Caption = 'Multa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 242
      Top = 15
      Width = 52
      Height = 13
      Caption = 'Vr Tx ADM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label30: TLabel
      Left = 8
      Top = 59
      Width = 68
      Height = 13
      Caption = 'Desc Principal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 96
      Top = 59
      Width = 53
      Height = 13
      Caption = 'Desc Juros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 162
      Top = 59
      Width = 54
      Height = 13
      Caption = 'Desc Multa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 523
      Top = 15
      Width = 49
      Height = 13
      Caption = 'Acr'#233'scimo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 433
      Top = 56
      Width = 47
      Height = 13
      Caption = 'Bx Parcial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 521
      Top = 56
      Width = 47
      Height = 13
      Caption = 'Reten'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edt_divida: TCurrencyEdit
      Left = 8
      Top = 33
      Width = 82
      Height = 19
      AutoSize = False
      DisplayFormat = '#,0.00;-,#,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edt_juros: TCurrencyEdit
      Left = 99
      Top = 33
      Width = 55
      Height = 19
      AutoSize = False
      DisplayFormat = '#,0.00;-,#,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edt_multa: TCurrencyEdit
      Left = 160
      Top = 33
      Width = 55
      Height = 19
      AutoSize = False
      DisplayFormat = '#,0.00;-,#,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edt_descjuros: TCurrencyEdit
      Left = 98
      Top = 74
      Width = 60
      Height = 19
      AutoSize = False
      DisplayFormat = '#,0.00;-,#,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edt_descmulta: TCurrencyEdit
      Left = 162
      Top = 74
      Width = 73
      Height = 19
      AutoSize = False
      DisplayFormat = '#,0.00;-,#,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edt_acrescimos: TCurrencyEdit
      Left = 521
      Top = 33
      Width = 71
      Height = 19
      AutoSize = False
      DisplayFormat = '#,0.00;-,#,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object edt_liquido: TCurrencyEdit
      Left = 776
      Top = 71
      Width = 105
      Height = 19
      AutoSize = False
      DisplayFormat = '#,0.00;-,#,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object edt_retencao: TCurrencyEdit
      Left = 520
      Top = 72
      Width = 76
      Height = 19
      AutoSize = False
      DisplayFormat = '#,0.#0;-,#,0.#0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object edt_descprinciapl: TCurrencyEdit
      Left = 7
      Top = 74
      Width = 82
      Height = 19
      AutoSize = False
      DisplayFormat = '#,0.00;-,#,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object edt_bxParcial: TCurrencyEdit
      Left = 432
      Top = 72
      Width = 81
      Height = 19
      AutoSize = False
      DisplayFormat = '#,0.00;-,#,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object DBEdit20: TDBEdit
      Left = 602
      Top = 32
      Width = 57
      Height = 21
      DataField = 'VrProtesto'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
    object DBEdit21: TDBEdit
      Left = 683
      Top = 32
      Width = 89
      Height = 21
      DataField = 'VrHonorarios'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object edt_taxaADM: TCurrencyEdit
      Left = 240
      Top = 33
      Width = 63
      Height = 19
      AutoSize = False
      DisplayFormat = '#,0.00;-,#,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object edt_taxaBancaria: TCurrencyEdit
      Left = 320
      Top = 33
      Width = 89
      Height = 19
      AutoSize = False
      DisplayFormat = '#,0.00;-,#,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object edt_taxaSegVia: TCurrencyEdit
      Left = 432
      Top = 33
      Width = 81
      Height = 19
      AutoSize = False
      DisplayFormat = '#,0.00;-,#,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 14
    end
    object edt_descTxADM: TCurrencyEdit
      Left = 240
      Top = 73
      Width = 81
      Height = 19
      AutoSize = False
      DisplayFormat = '#,0.00;-,#,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
    end
    object edt_DescTxBancaria: TCurrencyEdit
      Left = 326
      Top = 72
      Width = 99
      Height = 19
      AutoSize = False
      DisplayFormat = '#,0.00;-,#,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 16
    end
  end
  object Dts_cliente: TDataSource
    DataSet = tb_cliente
    Left = 144
    Top = 200
  end
  object qry_pendencia: TADOQuery
    Connection = DM.DB
    Parameters = <
      item
        Name = 'cliente'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'cliente2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select r.pk_recibo, r.pk_devedor, r.data, r.hora, r.pk_cliente, ' +
        'r.principal, r.juros, r.multa,'
      
        'r.desc_principal, r.desc_juros,r.desc_multa, r.acres_protesto, r' +
        '.acres_honorarios, r.valor_liquido, r.taxa_retenc, r.valor_reten' +
        'c,'
      
        'd.nome, 0 as baixaparcial, 0 as pk_bxparcial, r.VrTxAdm,r.VrTxBa' +
        'ncaria,r.VrTxSegVia,r.DescTxAdm,r.DescTxBancaria'
      ''
      
        'from recibos r inner join devedores d on (d.pk_devedor=r.pk_deve' +
        'dor)'
      ''
      
        'where r.data_receb is not null and data_canc is null and r.pk_pr' +
        'estcontas is null '
      
        'and exists(select 1 from titulos t where t.pk_recibo=r.pk_recibo' +
        ') and'
      'r.pk_cliente=:cliente'
      ''
      'Union'
      ''
      
        'select 0 as pk_recibo, b.pk_devedor, b.data, cast('#39#39' as varchar(' +
        '8)) as hora, d.pk_cliente,  0 as principal, 0 as juros, 0 as mul' +
        'ta,'
      
        '0 as desc_principal, 0 as desc_juros,0 as desc_multa, 0 as acres' +
        '_protesto, 0 as acres_honorarios, 0 as valor_liquido, 0 taxa_ret' +
        'enc, b.valor_retenc,'
      
        ' d.nome, b.valor as baixaparcial, pk_bxparcial, 0 as VrTxAdm,0 a' +
        's VrTxBancaria,0 as VrTxSegVia,0 as DescTxAdm,0 as DescTxBancari' +
        'a'
      ''
      
        'from baixasparciais b inner join devedores d on (b.pk_devedor=d.' +
        'pk_devedor)'
      ''
      'where b.pk_prestContas is null and d.pk_cliente = :cliente2'
      '')
    Left = 768
    Top = 192
    object qry_pendenciapk_recibo: TIntegerField
      FieldName = 'pk_recibo'
    end
    object qry_pendenciapk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object qry_pendenciadata: TDateTimeField
      FieldName = 'data'
    end
    object qry_pendenciahora: TStringField
      FieldName = 'hora'
      Size = 10
    end
    object qry_pendenciapk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object qry_pendenciaprincipal: TBCDField
      FieldName = 'principal'
      ReadOnly = True
      DisplayFormat = '#,##0.00;-,0.00'
      EditFormat = '#,0.00'
      Precision = 18
      Size = 2
    end
    object qry_pendenciajuros: TBCDField
      FieldName = 'juros'
      DisplayFormat = '#,##0.00;-,0.00'
      EditFormat = '#,0.00'
      Precision = 18
      Size = 2
    end
    object qry_pendenciamulta: TBCDField
      FieldName = 'multa'
      DisplayFormat = '#,##0.00;-,0.00'
      EditFormat = '#,0.00'
      Precision = 18
      Size = 2
    end
    object qry_pendenciadesc_principal: TBCDField
      FieldName = 'desc_principal'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object qry_pendenciadesc_juros: TBCDField
      FieldName = 'desc_juros'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object qry_pendenciadesc_multa: TBCDField
      FieldName = 'desc_multa'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object qry_pendenciaacres_protesto: TBCDField
      FieldName = 'acres_protesto'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object qry_pendenciaacres_honorarios: TBCDField
      FieldName = 'acres_honorarios'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object qry_pendenciavalor_liquido: TBCDField
      FieldName = 'valor_liquido'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object qry_pendenciataxa_retenc: TBCDField
      FieldName = 'taxa_retenc'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object qry_pendenciavalor_retenc: TBCDField
      FieldName = 'valor_retenc'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object qry_pendenciabaixaparcial: TBCDField
      FieldName = 'baixaparcial'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 0
    end
    object qry_pendencianome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qry_pendenciapk_bxparcial: TIntegerField
      FieldName = 'pk_bxparcial'
      ReadOnly = True
    end
    object qry_pendenciaVrTxAdm: TBCDField
      FieldName = 'VrTxAdm'
      DisplayFormat = '#,##0.00;-,0.00'
      EditFormat = '#0.00'
      Precision = 12
      Size = 2
    end
    object qry_pendenciaVrTxBancaria: TBCDField
      FieldName = 'VrTxBancaria'
      DisplayFormat = '#,##0.00;-,0.00'
      EditFormat = '#0.#0'
      Precision = 12
      Size = 2
    end
    object qry_pendenciaVrTxSegVia: TBCDField
      FieldName = 'VrTxSegVia'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 12
      Size = 2
    end
    object qry_pendenciaDescTxAdm: TBCDField
      FieldName = 'DescTxAdm'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 12
      Size = 2
    end
    object qry_pendenciaDescTxBancaria: TBCDField
      FieldName = 'DescTxBancaria'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 12
      Size = 2
    end
  end
  object dts_pendencia: TDataSource
    DataSet = qry_pendencia
    Left = 808
    Top = 200
  end
  object qry_prestcontas: TADODataSet
    Connection = DM.DB
    CursorType = ctStatic
    CommandText = 'select * from prestcontas where 1=2'
    Parameters = <>
    Left = 512
    Top = 240
    object qry_prestcontaspk_prestcontas: TIntegerField
      FieldName = 'pk_prestcontas'
    end
    object qry_prestcontasdata: TDateTimeField
      FieldName = 'data'
    end
    object qry_prestcontaspk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object qry_prestcontasprincipal: TBCDField
      FieldName = 'principal'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 0
    end
    object qry_prestcontasjuros: TBCDField
      FieldName = 'juros'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 0
    end
    object qry_prestcontasmulta: TBCDField
      FieldName = 'multa'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 0
    end
    object qry_prestcontasdescjuros: TBCDField
      FieldName = 'descjuros'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 0
    end
    object qry_prestcontasdescmulta: TBCDField
      FieldName = 'descmulta'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 0
    end
    object qry_prestcontasdescprincipal: TBCDField
      FieldName = 'descprincipal'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 0
    end
    object qry_prestcontaspdescjuros: TBCDField
      FieldName = 'pdescjuros'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 0
    end
    object qry_prestcontaspdescmulta: TBCDField
      FieldName = 'pdescmulta'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 0
    end
    object qry_prestcontasretencao: TBCDField
      FieldName = 'retencao'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 0
    end
    object qry_prestcontasacrescimos: TBCDField
      FieldName = 'acrescimos'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 0
    end
    object qry_prestcontasliquido: TBCDField
      FieldName = 'liquido'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 0
    end
    object qry_prestcontasbaixaparcial: TBCDField
      FieldName = 'baixaparcial'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object qry_prestcontasfaixa: TIntegerField
      FieldName = 'faixa'
    end
    object qry_prestcontasdescricao: TStringField
      FieldName = 'descricao'
      Size = 15
    end
    object qry_prestcontasVrTxAdm: TBCDField
      FieldName = 'VrTxAdm'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 12
      Size = 2
    end
    object qry_prestcontasVrTxBancaria: TBCDField
      FieldName = 'VrTxBancaria'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 12
      Size = 2
    end
    object qry_prestcontasVrTxSegVia: TBCDField
      FieldName = 'VrTxSegVia'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 12
      Size = 2
    end
    object qry_prestcontasDescTxAdm: TBCDField
      FieldName = 'DescTxAdm'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 12
      Size = 2
    end
    object qry_prestcontasDescTxBancaria: TBCDField
      FieldName = 'DescTxBancaria'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 12
      Size = 2
    end
    object qry_prestcontasVrProtesto: TBCDField
      FieldName = 'VrProtesto'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 12
      Size = 2
    end
    object qry_prestcontasVrHonorarios: TBCDField
      FieldName = 'VrHonorarios'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 12
      Size = 2
    end
  end
  object qry_recibo: TADODataSet
    Connection = DM.DB
    CursorType = ctStatic
    CommandText = 'select * from recibos where pk_recibo=:recibo'
    Parameters = <
      item
        Name = 'recibo'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 512
    Top = 280
    object qry_recibopk_recibo: TIntegerField
      FieldName = 'pk_recibo'
    end
    object qry_recibopk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object qry_recibodata: TDateTimeField
      FieldName = 'data'
    end
    object qry_recibohora: TStringField
      FieldName = 'hora'
      Size = 10
    end
    object qry_recibopk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object qry_recibousuario_cobrador: TIntegerField
      FieldName = 'usuario_cobrador'
    end
    object qry_reciboprincipal: TBCDField
      FieldName = 'principal'
      Precision = 18
      Size = 2
    end
    object qry_recibojuros: TBCDField
      FieldName = 'juros'
      Precision = 18
      Size = 2
    end
    object qry_recibomulta: TBCDField
      FieldName = 'multa'
      Precision = 18
      Size = 2
    end
    object qry_recibodesc_principal: TBCDField
      FieldName = 'desc_principal'
      Precision = 18
      Size = 2
    end
    object qry_recibodesc_juros: TBCDField
      FieldName = 'desc_juros'
      Precision = 18
      Size = 2
    end
    object qry_recibodesc_multa: TBCDField
      FieldName = 'desc_multa'
      Precision = 18
      Size = 2
    end
    object qry_reciboacres_protesto: TBCDField
      FieldName = 'acres_protesto'
      Precision = 18
      Size = 2
    end
    object qry_reciboacres_honorarios: TBCDField
      FieldName = 'acres_honorarios'
      Precision = 18
      Size = 2
    end
    object qry_recibovalor_liquido: TBCDField
      FieldName = 'valor_liquido'
      Precision = 18
      Size = 2
    end
    object qry_recibotaxa_retenc: TBCDField
      FieldName = 'taxa_retenc'
      Precision = 18
      Size = 2
    end
    object qry_recibovalor_retenc: TBCDField
      FieldName = 'valor_retenc'
      Precision = 18
      Size = 2
    end
    object qry_recibodata_receb: TDateTimeField
      FieldName = 'data_receb'
    end
    object qry_recibohora_receb: TStringField
      FieldName = 'hora_receb'
      Size = 10
    end
    object qry_recibousuario_receb: TIntegerField
      FieldName = 'usuario_receb'
    end
    object qry_recibodata_canc: TDateTimeField
      FieldName = 'data_canc'
    end
    object qry_recibohora_canc: TStringField
      FieldName = 'hora_canc'
      Size = 10
    end
    object qry_recibousuario_canc: TIntegerField
      FieldName = 'usuario_canc'
    end
    object qry_reciboobservacao: TStringField
      FieldName = 'observacao'
      Size = 200
    end
    object qry_recibodata_venc: TDateTimeField
      FieldName = 'data_venc'
    end
    object qry_recibotipo: TIntegerField
      FieldName = 'tipo'
    end
    object qry_recibochave_tabretenc: TIntegerField
      FieldName = 'chave_tabretenc'
    end
    object qry_recibodias_atraso: TIntegerField
      FieldName = 'dias_atraso'
    end
    object qry_recibopk_prestcontas: TIntegerField
      FieldName = 'pk_prestcontas'
    end
    object qry_recibobaixaparcial: TBCDField
      FieldName = 'baixaparcial'
      Precision = 18
      Size = 2
    end
    object qry_reciboacordo: TIntegerField
      FieldName = 'acordo'
    end
    object qry_reciboVrTxAdm: TBCDField
      FieldName = 'VrTxAdm'
      Precision = 12
      Size = 2
    end
    object qry_reciboVrTxBancaria: TBCDField
      FieldName = 'VrTxBancaria'
      Precision = 12
      Size = 2
    end
    object qry_reciboVrTxSegVia: TBCDField
      FieldName = 'VrTxSegVia'
      Precision = 12
      Size = 2
    end
    object qry_reciboCobJuridica: TStringField
      FieldName = 'CobJuridica'
      Size = 1
    end
    object qry_reciboDescTxAdm: TBCDField
      FieldName = 'DescTxAdm'
      Precision = 12
      Size = 2
    end
    object qry_reciboDescTxBancaria: TBCDField
      FieldName = 'DescTxBancaria'
      Precision = 12
      Size = 2
    end
  end
  object tb_cliente: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select * from clientes where inativado is null order by nome')
    Left = 184
    Top = 200
    object tb_clientepk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object tb_clientenome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object tb_clienteperc_juros_mes: TBCDField
      FieldName = 'perc_juros_mes'
      Precision = 18
      Size = 0
    end
    object tb_clienteperc_multa: TBCDField
      FieldName = 'perc_multa'
      Precision = 18
      Size = 0
    end
    object tb_clientecnpj: TStringField
      FieldName = 'cnpj'
    end
    object tb_clientelayout_Inteq: TStringField
      FieldName = 'layout_Inteq'
      Size = 1
    end
    object tb_clientebaixaTit_Carga: TStringField
      FieldName = 'baixaTit_Carga'
      Size = 1
    end
    object tb_clienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
    object tb_clienteFAX: TStringField
      FieldName = 'FAX'
    end
    object tb_clienteZERO_OITOCENTOS: TStringField
      FieldName = 'ZERO_OITOCENTOS'
      Size = 15
    end
    object tb_clienteRESP_COBRANA: TStringField
      FieldName = 'RESP_COBRAN'#199'A'
      Size = 60
    end
    object tb_clientearquivabxparcial: TStringField
      FieldName = 'arquivabxparcial'
      FixedChar = True
      Size = 1
    end
    object tb_clientebanco1: TStringField
      FieldName = 'banco1'
      Size = 10
    end
    object tb_clienteagencia1: TStringField
      FieldName = 'agencia1'
      Size = 6
    end
    object tb_clienteconta1: TStringField
      FieldName = 'conta1'
      Size = 10
    end
    object tb_clientebanco2: TStringField
      FieldName = 'banco2'
      Size = 10
    end
    object tb_clienteagencia2: TStringField
      FieldName = 'agencia2'
      Size = 6
    end
    object tb_clienteconta2: TStringField
      FieldName = 'conta2'
      Size = 10
    end
    object tb_clienteinativado: TDateTimeField
      FieldName = 'inativado'
    end
  end
  object DataSource1: TDataSource
    DataSet = qry_prestcontas
    Left = 440
    Top = 320
  end
end
