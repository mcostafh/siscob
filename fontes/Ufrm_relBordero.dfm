object frm_RelBordero: Tfrm_RelBordero
  Left = 169
  Top = 141
  Width = 845
  Height = 546
  Caption = 'Filtro para Border'#244' de Baixa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 47
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object Gauge_atualizando: TGauge
    Left = 632
    Top = 52
    Width = 169
    Height = 29
    Progress = 0
    Visible = False
  end
  object lb_mens: TLabel
    Left = 81
    Top = 484
    Width = 13
    Height = 13
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label13: TLabel
    Left = 337
    Top = 45
    Width = 91
    Height = 13
    Caption = 'Carteira - Cobrador:'
  end
  object Label15: TLabel
    Left = 8
    Top = 90
    Width = 99
    Height = 13
    Caption = 'Al'#237'nea para cheques'
  end
  object Label16: TLabel
    Left = 176
    Top = 90
    Width = 67
    Height = 13
    Caption = 'Tipo do T'#237'tulo'
  end
  object Label17: TLabel
    Left = 14
    Top = 414
    Width = 180
    Height = 13
    Caption = 'Pasta para gerar o arquivo Excel (csv)'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 837
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Border'#244' de T'#237'tulos'
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
      Width = 835
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
      Left = 151
      Top = 6
      Width = 193
      Height = 27
      Caption = 'Border'#244' de T'#237'tulos'
      Color = clBlack
      ParentColor = False
    end
  end
  object Panel2: TPanel
    Left = 216
    Top = 441
    Width = 353
    Height = 67
    BevelOuter = bvNone
    TabOrder = 1
    object btn_imprimir: TSpeedButton
      Left = 42
      Top = 5
      Width = 120
      Height = 60
      AllowAllUp = True
      Caption = '&Imprimir'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDD000DDD
        DDDDDDDD0087700DDDDDDD00887007700DDDD08877877007700DD77788877770
        070D778888877777700D7F8888F7777777707F88FF88877777707FFF88998887
        77707F88AA8887708770D77F888778F0877DDDD77F78FFFF0DDDDDDDD77FFFFF
        F0DDDDDDDDD7FFFFFF00DDDDDDDD7FFF77DDDDDDDDDDD777DDDD}
      OnClick = btn_imprimirClick
    end
    object SpeedButton2: TSpeedButton
      Left = 193
      Top = 5
      Width = 120
      Height = 60
      AllowAllUp = True
      Caption = '&Fechar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
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
      OnClick = SpeedButton2Click
    end
  end
  object lk_cliente: TRxDBLookupCombo
    Left = 6
    Top = 62
    Width = 323
    Height = 21
    DropDownCount = 20
    LookupField = 'pk_cliente'
    LookupDisplay = 'nome'
    LookupDisplayIndex = 5
    LookupSource = dts_clientes
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 154
    Width = 401
    Height = 239
    Caption = 'Filtro '
    TabOrder = 3
    object Label2: TLabel
      Left = 6
      Top = 54
      Width = 76
      Height = 13
      Caption = 'Motivo da Baixa'
    end
    object Label7: TLabel
      Left = 6
      Top = 98
      Width = 113
      Height = 13
      Caption = 'N'#250'mero das Presta'#231#245'es'
    end
    object GroupBox5: TGroupBox
      Left = 5
      Top = 148
      Width = 370
      Height = 70
      Caption = 'Per'#237'odo das Baixas'
      TabOrder = 0
      object Label8: TLabel
        Left = 182
        Top = 21
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label48: TLabel
        Left = 4
        Top = 23
        Width = 14
        Height = 13
        Caption = 'De'
      end
      object Label61: TLabel
        Left = 8
        Top = 43
        Width = 138
        Height = 14
        Caption = 'Ex.: 120   08/05/2009'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = cl3DDkShadow
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label70: TLabel
        Left = 184
        Top = 43
        Width = 138
        Height = 14
        Caption = 'Ex.: 60     07/07/2009'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = cl3DDkShadow
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object edt_fx1: TEdit
        Left = 27
        Top = 18
        Width = 41
        Height = 21
        Hint = 'Ex: 30 a 60 dias em atraso'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnExit = edt_fx1Exit
      end
      object edt_fx2: TEdit
        Left = 207
        Top = 18
        Width = 34
        Height = 21
        Hint = 'Ex: 30 a 60 dias em atraso'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnExit = edt_fx2Exit
      end
      object dt_inicial: TDateEdit
        Left = 71
        Top = 18
        Width = 106
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
      end
      object dt_final: TDateEdit
        Left = 243
        Top = 18
        Width = 104
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 3
      end
    end
    object cb_motivo: TComboBox
      Left = 6
      Top = 69
      Width = 127
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 0
      ParentFont = False
      TabOrder = 1
      Text = 'PG-Pagamento'
      Items.Strings = (
        'PG-Pagamento'
        'TR-Retirada')
    end
    object edt_prestcontas: TEdit
      Left = 6
      Top = 113
      Width = 123
      Height = 21
      TabOrder = 2
    end
    object cbx_prestgeradas: TCheckBox
      Left = 7
      Top = 20
      Width = 143
      Height = 21
      Caption = 'Somente com Presta'#231#245'es geradas'
      TabOrder = 3
    end
  end
  object cbx_baixa: TCheckBox
    Left = 10
    Top = 126
    Width = 115
    Height = 17
    Caption = 'Border'#244' de Baixas'
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = cbx_baixaClick
  end
  object cbx_previsao: TCheckBox
    Left = 474
    Top = 126
    Width = 149
    Height = 17
    Caption = 'Previs'#227'o de Recebimento'
    TabOrder = 5
    OnClick = cbx_previsaoClick
  end
  object GroupBox2: TGroupBox
    Left = 412
    Top = 154
    Width = 389
    Height = 239
    Caption = 'Per'#237'odo dos vencimentos'
    TabOrder = 6
    object Label11: TLabel
      Left = 4
      Top = 23
      Width = 14
      Height = 13
      Caption = 'De'
    end
    object Label9: TLabel
      Left = 182
      Top = 21
      Width = 15
      Height = 13
      Caption = 'at'#233
    end
    object Label10: TLabel
      Left = 7
      Top = 50
      Width = 138
      Height = 14
      Caption = 'Ex.: 120   08/05/2009'
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = cl3DDkShadow
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label12: TLabel
      Left = 204
      Top = 50
      Width = 138
      Height = 14
      Caption = 'Ex.: 60     07/07/2009'
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = cl3DDkShadow
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object dt_prev1: TDateEdit
      Left = 73
      Top = 17
      Width = 106
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
    end
    object dt_prev2: TDateEdit
      Left = 241
      Top = 17
      Width = 106
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
    end
    object cb_bxparcial: TCheckBox
      Left = 9
      Top = 86
      Width = 176
      Height = 17
      Caption = 'Subtrai Baixas parciais'
      TabOrder = 2
      Visible = False
    end
    object edt_vencfx1: TEdit
      Left = 27
      Top = 18
      Width = 41
      Height = 21
      Hint = 'Ex: 30 a 60 dias em atraso'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnExit = edt_vencfx1Exit
    end
    object Edt_vencfx2: TEdit
      Left = 202
      Top = 18
      Width = 34
      Height = 21
      Hint = 'Ex: 30 a 60 dias em atraso'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnExit = Edt_vencfx2Exit
    end
  end
  object Panel3: TPanel
    Left = 3
    Top = 111
    Width = 806
    Height = 2
    TabOrder = 7
  end
  object cb_titareceber: TCheckBox
    Left = 128
    Top = 127
    Width = 109
    Height = 17
    Caption = 'T'#237'tulos em Aberto'
    TabOrder = 8
    OnClick = cb_titareceberClick
  end
  object cb_cobrador: TRxDBLookupCombo
    Left = 335
    Top = 62
    Width = 276
    Height = 21
    DropDownCount = 8
    LookupField = 'nu_usu'
    LookupDisplay = 'Nome'
    LookupDisplayIndex = 5
    LookupSource = dts_usuarios
    TabOrder = 9
  end
  object edt_alinea: TEdit
    Left = 112
    Top = 88
    Width = 57
    Height = 21
    TabOrder = 10
  end
  object cbx_TitulosAbertoSemParcelas: TCheckBox
    Left = 242
    Top = 127
    Width = 224
    Height = 17
    Caption = 'T'#237'tulos em Aberto sem Parcelas de acordo'
    TabOrder = 11
    OnClick = cbx_TitulosAbertoSemParcelasClick
  end
  object edt_pasta: TEdit
    Left = 201
    Top = 410
    Width = 348
    Height = 21
    TabOrder = 12
  end
  object edt_tipo: TComboBox
    Left = 250
    Top = 88
    Width = 71
    Height = 21
    ItemHeight = 13
    TabOrder = 13
  end
  object Dts_cliente: TDataSource
    Left = 416
    Top = 8
  end
  object DataSource1: TDataSource
    Left = 416
    Top = 8
  end
  object dts_clientes: TDataSource
    DataSet = tb_clientes
    Left = 416
    Top = 8
  end
  object usuarios: TADOTable
    Connection = DM.DB
    CursorType = ctStatic
    TableName = 'usuarios'
    Left = 352
    Top = 105
  end
  object dts_usuarios: TDataSource
    DataSet = usuarios
    Left = 320
    Top = 105
  end
  object qry_rel: TADODataSet
    Connection = DM.DB
    CommandText = 'select *'#13#10'from jobs'#13#10'where job=:rel'
    Parameters = <
      item
        Name = 'rel'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 360
    Top = 163
    object qry_reljob: TIntegerField
      FieldName = 'job'
    end
    object qry_relnome_campo: TStringField
      FieldName = 'nome_campo'
      Size = 50
    end
    object qry_relvalor: TBCDField
      FieldName = 'valor'
      Precision = 18
      Size = 2
    end
    object qry_reldescricao: TStringField
      FieldName = 'descricao'
      Size = 70
    end
    object qry_relcategoria: TStringField
      FieldName = 'categoria'
      FixedChar = True
      Size = 1
    end
    object qry_relchave: TIntegerField
      FieldName = 'chave'
    end
    object qry_reltag_1: TStringField
      FieldName = 'tag_1'
      Size = 50
    end
    object qry_reltag_2: TStringField
      FieldName = 'tag_2'
      Size = 50
    end
    object qry_reltag_3: TStringField
      FieldName = 'tag_3'
      Size = 50
    end
    object qry_reltag_4: TStringField
      FieldName = 'tag_4'
      Size = 50
    end
    object qry_reltag_5: TStringField
      FieldName = 'tag_5'
      Size = 50
    end
  end
  object qry_aux: TADOQuery
    Connection = DM.DB
    Parameters = <>
    Left = 320
    Top = 163
  end
  object ADOCommand1: TADOCommand
    Connection = DM.DB
    Parameters = <>
    Left = 336
    Top = 211
  end
  object tb_Ocorrencias: TADOTable
    Connection = DM.DB
    TableName = 'ocorrencias'
    Left = 480
    Top = 387
    object tb_Ocorrenciasnome: TStringField
      FieldName = 'nome'
      Size = 30
    end
    object tb_Ocorrenciaspk_ocorr: TIntegerField
      FieldName = 'pk_ocorr'
    end
    object tb_Ocorrenciastipo: TStringField
      FieldName = 'tipo'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource2: TDataSource
    DataSet = qry_aux
    Left = 216
    Top = 195
  end
  object tb_clientes: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select * from clientes where inativado is null order by nome')
    Left = 336
    Top = 8
  end
end
