object frm_recebimento: Tfrm_recebimento
  Left = 240
  Top = 118
  Width = 685
  Height = 554
  Caption = 'Recebimento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 677
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Recebimento de Documentos'
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
      Width = 675
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
      Width = 139
      Height = 27
      Caption = 'Recebimento'
      Color = clBlack
      ParentColor = False
    end
  end
  object pn_dados: TPanel
    Left = 0
    Top = 88
    Width = 677
    Height = 376
    Align = alClient
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 1
    object Label7: TLabel
      Left = 10
      Top = 2
      Width = 49
      Height = 13
      Caption = 'Devedor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 377
      Top = 0
      Width = 54
      Height = 13
      Caption = 'Cobrador'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 377
      Top = 42
      Width = 40
      Height = 13
      Caption = 'Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 300
      Top = 1
      Width = 32
      Height = 13
      Caption = 'codigo'
      FocusControl = DBEdit9
    end
    object DBEdit6: TDBEdit
      Left = 377
      Top = 58
      Width = 288
      Height = 21
      DataField = 'nomeCliente'
      DataSource = dts_devedores
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit7: TDBEdit
      Left = 377
      Top = 17
      Width = 288
      Height = 21
      DataField = 'usuario'
      DataSource = dts_devedores
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object DBEdit8: TDBEdit
      Left = 10
      Top = 17
      Width = 287
      Height = 21
      DataField = 'Nome'
      DataSource = dts_devedores
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 87
      Width = 677
      Height = 289
      Align = alBottom
      Caption = 'Dados do Recibo'
      Enabled = False
      TabOrder = 3
      object Label2: TLabel
        Left = 6
        Top = 16
        Width = 23
        Height = 13
        Caption = 'Data'
        FocusControl = DBEdit1
      end
      object Label3: TLabel
        Left = 78
        Top = 16
        Width = 23
        Height = 13
        Caption = 'Hora'
        FocusControl = DBEdit2
      end
      object Label4: TLabel
        Left = 442
        Top = 261
        Width = 63
        Height = 13
        Caption = 'Valor L'#237'quido'
        FocusControl = DBEdit3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clActiveCaption
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 123
        Top = 16
        Width = 71
        Height = 13
        Caption = 'Data para pgto'
        FocusControl = DBEdit4
      end
      object Label6: TLabel
        Left = 8
        Top = 138
        Width = 56
        Height = 13
        Caption = 'observacao'
        FocusControl = DBEdit5
      end
      object Label13: TLabel
        Left = 256
        Top = 16
        Width = 40
        Height = 13
        Caption = 'Principal'
        FocusControl = DBEdit10
      end
      object Label15: TLabel
        Left = 271
        Top = 41
        Width = 25
        Height = 13
        Caption = 'Juros'
        FocusControl = DBEdit11
      end
      object Label16: TLabel
        Left = 270
        Top = 66
        Width = 26
        Height = 13
        Caption = 'Multa'
        FocusControl = DBEdit12
      end
      object Label17: TLabel
        Left = 235
        Top = 91
        Width = 61
        Height = 13
        Caption = 'Vr Taxa Adm'
        FocusControl = DBEdit13
      end
      object Label18: TLabel
        Left = 218
        Top = 116
        Width = 78
        Height = 13
        Caption = 'Vr taxa Banc'#225'ria'
        FocusControl = DBEdit14
      end
      object Label19: TLabel
        Left = 191
        Top = 141
        Width = 105
        Height = 13
        Caption = 'Vr taxa Seg Via boleto'
        FocusControl = DBEdit15
      end
      object Label20: TLabel
        Left = 257
        Top = 166
        Width = 39
        Height = 13
        Caption = 'Protesto'
        FocusControl = DBEdit16
      end
      object Label21: TLabel
        Left = 245
        Top = 192
        Width = 51
        Height = 13
        Caption = 'Honorarios'
        FocusControl = DBEdit17
      end
      object Label22: TLabel
        Left = 440
        Top = 14
        Width = 68
        Height = 13
        Caption = 'Desc Principal'
        FocusControl = DBEdit18
      end
      object Label23: TLabel
        Left = 455
        Top = 38
        Width = 53
        Height = 13
        Caption = 'Desc Juros'
        FocusControl = DBEdit19
      end
      object Label24: TLabel
        Left = 454
        Top = 63
        Width = 54
        Height = 13
        Caption = 'Desc Multa'
        FocusControl = DBEdit20
      end
      object Label25: TLabel
        Left = 436
        Top = 87
        Width = 72
        Height = 13
        Caption = 'Desc taxa Adm'
        FocusControl = DBEdit21
      end
      object Label26: TLabel
        Left = 429
        Top = 112
        Width = 79
        Height = 13
        Caption = 'DescTxBancaria'
        FocusControl = DBEdit22
      end
      object Label27: TLabel
        Left = 252
        Top = 218
        Width = 49
        Height = 13
        Caption = 'Acr'#233'scimo'
        FocusControl = DBEdit23
      end
      object Label28: TLabel
        Left = 221
        Top = 251
        Width = 76
        Height = 13
        Caption = 'Total Acr'#233'scimo'
        FocusControl = DBEdit23
      end
      object Label29: TLabel
        Left = 429
        Top = 155
        Width = 73
        Height = 13
        Caption = 'Total Desconto'
        FocusControl = DBEdit23
      end
      object DBEdit1: TDBEdit
        Left = 6
        Top = 32
        Width = 65
        Height = 21
        DataField = 'data'
        DataSource = dts_recibos
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 78
        Top = 32
        Width = 41
        Height = 21
        DataField = 'hora'
        DataSource = dts_recibos
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 514
        Top = 256
        Width = 100
        Height = 21
        DataField = 'valor_liquido'
        DataSource = dts_recibos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 123
        Top = 32
        Width = 81
        Height = 21
        DataField = 'data_venc'
        DataSource = dts_recibos
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 6
        Top = 156
        Width = 179
        Height = 21
        DataField = 'observacao'
        DataSource = dts_recibos
        TabOrder = 4
      end
      object DBEdit10: TDBEdit
        Left = 304
        Top = 12
        Width = 100
        Height = 21
        DataField = 'principal'
        DataSource = dts_recibos
        TabOrder = 5
      end
      object DBEdit11: TDBEdit
        Left = 304
        Top = 37
        Width = 100
        Height = 21
        DataField = 'juros'
        DataSource = dts_recibos
        TabOrder = 6
      end
      object DBEdit12: TDBEdit
        Left = 304
        Top = 63
        Width = 100
        Height = 21
        DataField = 'multa'
        DataSource = dts_recibos
        TabOrder = 7
      end
      object DBEdit13: TDBEdit
        Left = 304
        Top = 89
        Width = 100
        Height = 21
        DataField = 'VrTxAdm'
        DataSource = dts_recibos
        TabOrder = 8
      end
      object DBEdit14: TDBEdit
        Left = 304
        Top = 114
        Width = 100
        Height = 21
        DataField = 'VrTxBancaria'
        DataSource = dts_recibos
        TabOrder = 9
      end
      object DBEdit15: TDBEdit
        Left = 304
        Top = 140
        Width = 100
        Height = 21
        DataField = 'VrTxSegVia'
        DataSource = dts_recibos
        TabOrder = 10
      end
      object DBEdit16: TDBEdit
        Left = 304
        Top = 166
        Width = 100
        Height = 21
        DataField = 'acres_protesto'
        DataSource = dts_recibos
        TabOrder = 11
      end
      object DBEdit17: TDBEdit
        Left = 304
        Top = 192
        Width = 100
        Height = 21
        DataField = 'acres_honorarios'
        DataSource = dts_recibos
        TabOrder = 12
      end
      object DBEdit18: TDBEdit
        Left = 512
        Top = 11
        Width = 100
        Height = 21
        DataField = 'desc_principal'
        DataSource = dts_recibos
        TabOrder = 13
      end
      object DBEdit19: TDBEdit
        Left = 512
        Top = 36
        Width = 100
        Height = 21
        DataField = 'desc_juros'
        DataSource = dts_recibos
        TabOrder = 14
      end
      object DBEdit20: TDBEdit
        Left = 512
        Top = 61
        Width = 100
        Height = 21
        DataField = 'desc_multa'
        DataSource = dts_recibos
        TabOrder = 15
      end
      object DBEdit21: TDBEdit
        Left = 512
        Top = 86
        Width = 100
        Height = 21
        DataField = 'DescTxAdm'
        DataSource = dts_recibos
        TabOrder = 16
      end
      object DBEdit22: TDBEdit
        Left = 512
        Top = 112
        Width = 100
        Height = 21
        DataField = 'DescTxBancaria'
        DataSource = dts_recibos
        TabOrder = 17
      end
      object DBEdit23: TDBEdit
        Left = 304
        Top = 216
        Width = 100
        Height = 21
        DataField = 'acrescimo'
        DataSource = dts_recibos
        TabOrder = 18
      end
      object TPanel
        Left = 235
        Top = 243
        Width = 165
        Height = 3
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 19
        object TPanel
          Left = -37
          Top = 122
          Width = 165
          Height = 3
          BevelInner = bvLowered
          BevelOuter = bvLowered
          TabOrder = 0
        end
      end
      object TPanel
        Left = 435
        Top = 147
        Width = 177
        Height = 3
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 20
        object TPanel
          Left = -37
          Top = 122
          Width = 165
          Height = 3
          BevelInner = bvLowered
          BevelOuter = bvLowered
          TabOrder = 0
        end
      end
      object totalDesc: TCurrencyEdit
        Left = 514
        Top = 152
        Width = 98
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00;-,0.00'
        TabOrder = 21
      end
      object totalAcres: TCurrencyEdit
        Left = 305
        Top = 248
        Width = 100
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00;-,0.00'
        TabOrder = 22
      end
    end
    object DBEdit9: TDBEdit
      Left = 300
      Top = 17
      Width = 72
      Height = 21
      DataField = 'codigo'
      DataSource = dts_devedores
      TabOrder = 4
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 677
    Height = 47
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 10
      Top = 11
      Width = 89
      Height = 13
      Caption = 'N'#250'mero do Recibo'
    end
    object btn_buscar: TSpeedButton
      Left = 189
      Top = 6
      Width = 90
      Height = 28
      Hint = 'Esconde a tela'
      Caption = 'Pesquisar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNone
      Font.Height = -13
      Font.Name = 'Verdana'
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
      OnClick = btn_buscarClick
    end
    object SpeedButton1: TSpeedButton
      Left = 554
      Top = 2
      Width = 82
      Height = 43
      Hint = 'Esconde a tela'
      Caption = '&Fechar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object edt_recibo: TEdit
      Left = 104
      Top = 8
      Width = 79
      Height = 21
      TabOrder = 0
    end
  end
  object gb_gravar: TGroupBox
    Left = 0
    Top = 464
    Width = 677
    Height = 63
    Align = alBottom
    TabOrder = 3
    object sb_gravarConf: TSpeedButton
      Left = 350
      Top = 10
      Width = 107
      Height = 44
      Hint = 'Carrega dados da Agenda Di'#225'ria'
      Caption = 'Gravar Recebimento'
      Flat = True
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
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sb_gravarConfClick
    end
    object Label10: TLabel
      Left = 8
      Top = 13
      Width = 102
      Height = 13
      Caption = 'Tipo do Recebimento'
    end
    object Label11: TLabel
      Left = 163
      Top = 10
      Width = 95
      Height = 13
      Caption = 'Data do Pagamento'
    end
    object SpeedButton2: TSpeedButton
      Left = 512
      Top = 13
      Width = 137
      Height = 41
      Hint = 'Retirar da Carteira'
      Caption = 'Excluir Recibo'
      Flat = True
      Glyph.Data = {
        76020000424D7602000000000000760000002800000020000000200000000100
        0400000000000002000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000777777777777
        7777777777777777777078888888887788888888888888888870787FFFFF7777
        7FFFFFFF77FFFFFFF870787FFFFF00777FFFFFF7777FFFFFF870787FFFD99007
        77FFFFD07777FFFFF870787FFFD99907777FFD9007777FFFF870787FFFD99900
        7777FD99007777FFF870787FFFD999900777D99990077FFFF870787FFFDD9999
        007D99999900FFFFF870787FFFFD999990099999990FFFFFF870787FFFFDD999
        9999999990FFFFFFF870787FFFFFDD99999999990FFFFFFFF870787FFFFFFDD9
        999999907FFFFFFFF870787FFFFFFFDD9999990777FFFFFFF870787FFFFFFFFD
        99999907777FFFFFF870787FFFFFFFFD99999900777FFFFFF870787FFFFFFFFD
        999999900777FFFFF870787FFFFFFFD99999999907777FFFF870787FFFFFFFD9
        999DD999007777FFF870787FFFFFFD999907DD999007777FF870787777777D99
        90777DD999007777787078888888D999907888DD99900777887078444444D999
        0744444DD999007000707844444DDD9904444444DD9990088070784444444DDD
        444444444DD9980880707844444444444444444444DD44444470788888888888
        888888888888888888707777777777777777777777777777777FFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
    object cb_tipoRecebimento: TComboBox
      Left = 10
      Top = 29
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = '1 - Na Assessoria'
      Items.Strings = (
        '1 - Na Assessoria'
        '2 - Na Empresa Cliente')
    end
    object edt_dataPgto: TDateEdit
      Left = 162
      Top = 27
      Width = 113
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
    end
  end
  object recibos: TADODataSet
    Connection = DM.DB
    CursorType = ctStatic
    CommandText = 
      'select * '#13#10'from recibos '#13#10'where pk_recibo=:recibo and usuario_ca' +
      'nc is null and usuario_receb is null'
    Parameters = <
      item
        Name = 'recibo'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 314
    Top = 60
    object recibospk_recibo: TIntegerField
      FieldName = 'pk_recibo'
    end
    object recibospk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object recibosdata: TDateTimeField
      FieldName = 'data'
    end
    object reciboshora: TStringField
      FieldName = 'hora'
      Size = 10
    end
    object recibosvalor_liquido: TBCDField
      FieldName = 'valor_liquido'
      Precision = 18
      Size = 0
    end
    object recibosobservacao: TStringField
      FieldName = 'observacao'
      Size = 100
    end
    object recibosdata_venc: TDateTimeField
      FieldName = 'data_venc'
    end
    object recibosdata_receb: TDateTimeField
      FieldName = 'data_receb'
    end
    object reciboshora_receb: TStringField
      FieldName = 'hora_receb'
      Size = 50
    end
    object recibosusuario_receb: TIntegerField
      FieldName = 'usuario_receb'
    end
    object recibostipo: TIntegerField
      FieldName = 'tipo'
    end
    object recibospk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object recibosusuario_cobrador: TIntegerField
      FieldName = 'usuario_cobrador'
    end
    object recibosprincipal: TBCDField
      FieldName = 'principal'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object recibosjuros: TBCDField
      FieldName = 'juros'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object recibosmulta: TBCDField
      FieldName = 'multa'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object recibosdesc_principal: TBCDField
      FieldName = 'desc_principal'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object recibosdesc_juros: TBCDField
      FieldName = 'desc_juros'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object recibosdesc_multa: TBCDField
      FieldName = 'desc_multa'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object recibosacres_protesto: TBCDField
      FieldName = 'acres_protesto'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object recibosacres_honorarios: TBCDField
      FieldName = 'acres_honorarios'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object recibostaxa_retenc: TBCDField
      FieldName = 'taxa_retenc'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object recibosvalor_retenc: TBCDField
      FieldName = 'valor_retenc'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object recibosdata_canc: TDateTimeField
      FieldName = 'data_canc'
    end
    object reciboshora_canc: TStringField
      FieldName = 'hora_canc'
      Size = 10
    end
    object recibosusuario_canc: TIntegerField
      FieldName = 'usuario_canc'
    end
    object reciboschave_tabretenc: TIntegerField
      FieldName = 'chave_tabretenc'
    end
    object recibosdias_atraso: TIntegerField
      FieldName = 'dias_atraso'
    end
    object recibospk_prestcontas: TIntegerField
      FieldName = 'pk_prestcontas'
    end
    object recibosbaixaparcial: TBCDField
      FieldName = 'baixaparcial'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object recibosacordo: TIntegerField
      FieldName = 'acordo'
    end
    object recibosVrTxAdm: TBCDField
      FieldName = 'VrTxAdm'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 12
      Size = 2
    end
    object recibosVrTxBancaria: TBCDField
      FieldName = 'VrTxBancaria'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 12
      Size = 2
    end
    object recibosVrTxSegVia: TBCDField
      FieldName = 'VrTxSegVia'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 12
      Size = 2
    end
    object recibosCobJuridica: TStringField
      FieldName = 'CobJuridica'
      Size = 1
    end
    object recibosDescTxAdm: TBCDField
      FieldName = 'DescTxAdm'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 12
      Size = 2
    end
    object recibosDescTxBancaria: TBCDField
      FieldName = 'DescTxBancaria'
      DisplayFormat = '#,##0.00;-,0.00'
      Precision = 12
      Size = 2
    end
    object recibosacrescimo: TBCDField
      FieldName = 'acrescimo'
      Precision = 12
      Size = 2
    end
  end
  object dts_recibos: TDataSource
    DataSet = recibos
    Left = 336
    Top = 62
  end
  object devedores: TADODataSet
    Connection = DM.DB
    CommandText = 
      'select d.*,c.nome as nomeCliente, u.nome as usuario'#13#10'from DEVEDO' +
      'RES d '#13#10'inner join clientes c on (d.pk_cliente=c.pk_cliente)'#13#10'in' +
      'ner join usuarios u on (u.nu_usu=d.pk_cobrador)'#13#10'where d.pk_deve' +
      'dor = :devedor'
    Parameters = <
      item
        Name = 'devedor'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 368
    Top = 48
    object devedorespk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object devedorespk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object devedoresCGC_CPF: TStringField
      FieldName = 'CGC_CPF'
      Size = 50
    end
    object devedoresNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object devedoresCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object devedoresUf: TStringField
      FieldName = 'Uf'
      Size = 50
    end
    object devedoresagendado_data: TDateTimeField
      FieldName = 'agendado_data'
    end
    object devedoresagendado_hora: TStringField
      FieldName = 'agendado_hora'
      Size = 50
    end
    object devedoresvalor_divida: TFloatField
      FieldName = 'valor_divida'
    end
    object devedorespk_cobrador: TIntegerField
      FieldName = 'pk_cobrador'
    end
    object devedoresnomeCliente: TStringField
      FieldName = 'nomeCliente'
      Size = 50
    end
    object devedoresusuario: TWideStringField
      FieldName = 'usuario'
      Size = 50
    end
    object devedorescodigo: TStringField
      FieldName = 'codigo'
    end
  end
  object dts_devedores: TDataSource
    DataSet = devedores
    Left = 368
    Top = 80
  end
  object qry_divida: TADOQuery
    Connection = DM.DB
    Parameters = <
      item
        Name = 'devedor'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'recibo'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select *'
      'from titulos'
      
        'where pk_devedor=:devedor and pk_recibo =:recibo and usuario_bai' +
        'xa is null')
    Left = 451
    Top = 118
    object qry_dividapk_titulo: TIntegerField
      FieldName = 'pk_titulo'
    end
    object qry_dividamotivo_baixa: TStringField
      FieldName = 'motivo_baixa'
      Size = 2
    end
    object qry_dividausuario_baixa: TIntegerField
      FieldName = 'usuario_baixa'
    end
    object qry_dividadata_baixa: TDateTimeField
      FieldName = 'data_baixa'
    end
  end
  object qry_evento: TADODataSet
    Connection = DM.DB
    CommandText = 'select *'#13#10'from EVENTOS'#13#10'where 1=2'
    Parameters = <>
    Left = 616
    Top = 184
    object qry_eventochave: TIntegerField
      FieldName = 'chave'
    end
    object qry_eventopk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object qry_eventoData: TDateTimeField
      FieldName = 'Data'
    end
    object qry_eventoHora: TStringField
      FieldName = 'Hora'
      Size = 10
    end
    object qry_eventoTexto: TStringField
      FieldName = 'Texto'
      Size = 250
    end
    object qry_eventomotivo: TIntegerField
      FieldName = 'motivo'
    end
    object qry_eventoAgendado_Data: TDateTimeField
      FieldName = 'Agendado_Data'
    end
    object qry_eventoAgendado_Tipo: TIntegerField
      FieldName = 'Agendado_Tipo'
    end
    object qry_eventoAgendado_Hora: TStringField
      FieldName = 'Agendado_Hora'
      Size = 50
    end
    object qry_eventoagendado_cobrador: TIntegerField
      FieldName = 'agendado_cobrador'
    end
    object qry_eventomarcar_nao_localiz: TStringField
      FieldName = 'marcar_nao_localiz'
      Size = 1
    end
    object qry_eventoseq_arq_inclusao: TIntegerField
      FieldName = 'seq_arq_inclusao'
    end
  end
end
