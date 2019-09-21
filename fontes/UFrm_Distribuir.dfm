object Frm_Distribuir: TFrm_Distribuir
  Left = 220
  Top = 46
  Width = 770
  Height = 650
  Caption = 'Distribuir'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    762
    623)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 762
    Height = 574
    Align = alClient
    BevelOuter = bvNone
    Color = clInfoBk
    TabOrder = 2
    object lb_mens: TLabel
      Left = 360
      Top = 128
      Width = 137
      Height = 13
      AutoSize = False
    end
    object Label4: TLabel
      Left = 9
      Top = 203
      Width = 184
      Height = 13
      Caption = 'Quantidade a distribuir para o Cobrador'
    end
    object Panel4: TPanel
      Left = 0
      Top = 518
      Width = 762
      Height = 56
      Align = alBottom
      TabOrder = 0
      object Gauge_atualizando: TGauge
        Left = 568
        Top = 15
        Width = 185
        Height = 30
        Progress = 0
        Visible = False
      end
      object lb_informacoes: TLabel
        Left = 8
        Top = 24
        Width = 66
        Height = 13
        Caption = 'informa'#231#245'es...'
        Visible = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 3
      Width = 745
      Height = 184
      Caption = 'Filtros'
      TabOrder = 1
      DesignSize = (
        745
        184)
      object Label1: TLabel
        Left = 6
        Top = 16
        Width = 35
        Height = 13
        Caption = 'Cliente:'
      end
      object Label5: TLabel
        Left = 5
        Top = 58
        Width = 75
        Height = 13
        Caption = 'Tipo de T'#237'tulos:'
      end
      object btn_buscar: TSpeedButton
        Left = 586
        Top = 21
        Width = 140
        Height = 78
        Hint = 'Carrega dados da Agenda Di'#225'ria'
        Anchors = [akLeft, akTop, akRight, akBottom]
        BiDiMode = bdRightToLeft
        Caption = 'Buscar'
        Flat = True
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
        ParentBiDiMode = False
        ShowHint = True
        OnClick = btn_buscarClick
      end
      object lk_cliente: TRxDBLookupCombo
        Left = 6
        Top = 31
        Width = 329
        Height = 21
        DropDownCount = 20
        LookupField = 'pk_cliente'
        LookupDisplay = 'nome'
        LookupDisplayIndex = 20
        LookupSource = Dts_cliente
        TabOrder = 0
      end
      object edt_tipotitulo: TEdit
        Left = 7
        Top = 72
        Width = 57
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 2
        TabOrder = 1
      end
      object GroupBox5: TGroupBox
        Left = 7
        Top = 98
        Width = 353
        Height = 62
        Caption = 'Devedores em atraso no per'#237'odo '
        TabOrder = 2
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
          Top = 42
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
          Top = 42
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
        object edt_atraso1: TDateEdit
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
        object edt_atraso2: TDateEdit
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
      object GroupBox1: TGroupBox
        Left = 366
        Top = 107
        Width = 232
        Height = 49
        TabOrder = 3
        object Label2: TLabel
          Left = 8
          Top = 19
          Width = 146
          Height = 13
          Caption = 'Total de Devedores a Distribuir'
        end
        object lb_total: TLabel
          Left = 160
          Top = 19
          Width = 57
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 272
      Width = 545
      Height = 241
      Caption = 'Distribuir igualmente para estes Cobradores'
      TabOrder = 2
      object RxCheckListBox1: TRxCheckListBox
        Left = 2
        Top = 15
        Width = 541
        Height = 224
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
        InternalVersion = 202
      end
    end
    object edt_qtde: TEdit
      Left = 8
      Top = 221
      Width = 89
      Height = 21
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 762
    Height = 49
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Distribuir Carga'
    Color = clGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      762
      49)
    object SpeedButton1: TSpeedButton
      Left = 632
      Top = 1
      Width = 96
      Height = 43
      Hint = 'Esconde a tela'
      Anchors = [akLeft, akTop, akRight, akBottom]
      BiDiMode = bdRightToLeft
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
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ParentBiDiMode = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
  end
  object Panel3: TPanel
    Left = 564
    Top = 320
    Width = 183
    Height = 161
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvLowered
    Color = clInfoBk
    TabOrder = 1
    DesignSize = (
      183
      161)
    object sb_gravarConf: TSpeedButton
      Left = 12
      Top = 18
      Width = 159
      Height = 127
      Hint = 'Carrega dados da Agenda Di'#225'ria'
      Anchors = [akLeft, akTop, akRight, akBottom]
      BiDiMode = bdRightToLeft
      Caption = 'Distribuir'
      Enabled = False
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333000003333333333F777773FF333333008877700
        33333337733FFF773F33330887000777033333733F777FFF73F330880FAFAF07
        703337F37733377FF7F33080F00000F07033373733777337F73F087F00A2200F
        77037F3737333737FF7F080A0A2A220A07037F737F3333737F7F0F0F0AAAA20F
        07037F737F3333737F7F0F0A0FAA2A0A08037F737FF33373737F0F7F00FFA00F
        780373F737FFF737F3733080F00000F0803337F73377733737F330F80FAFAF08
        8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
        3333333773FFFF77333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ParentBiDiMode = False
      ShowHint = True
      OnClick = sb_gravarConfClick
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 332
    Top = 37
  end
  object Dts_cliente: TDataSource
    DataSet = qry_clientes
    Left = 504
    Top = 104
  end
  object qry_devedor: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from devedores'
      'where 1=2')
    Left = 272
    Top = 24
    object qry_devedorpk_cobrador: TIntegerField
      FieldName = 'pk_cobrador'
    end
    object qry_devedorpk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object qry_devedorvalor_divida: TFloatField
      FieldName = 'valor_divida'
    end
  end
  object usuarios: TADOTable
    Connection = DM.DB
    CursorType = ctStatic
    TableName = 'usuarios'
    Left = 384
    Top = 40
  end
  object dts_usuarios: TDataSource
    DataSet = usuarios
    Left = 416
    Top = 40
  end
  object qry_temp: TADOQuery
    Connection = DM.DB
    Parameters = <>
    Left = 273
    Top = 257
  end
  object qry_cobradores: TADOQuery
    Connection = DM.DB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from usuarios')
    Left = 296
    Top = 344
    object qry_cobradoresnu_usu: TIntegerField
      FieldName = 'nu_usu'
    end
    object qry_cobradoreslogin: TWideStringField
      FieldName = 'login'
      Size = 15
    end
    object qry_cobradoresSenha: TWideStringField
      FieldName = 'Senha'
      Size = 10
    end
    object qry_cobradoresNome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qry_cobradoresnivel_acesso: TIntegerField
      FieldName = 'nivel_acesso'
    end
    object qry_cobradoresPK_GRUPO: TIntegerField
      FieldName = 'PK_GRUPO'
    end
    object qry_cobradoreslogado: TStringField
      FieldName = 'logado'
      Size = 1
    end
    object qry_cobradorespk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
  end
  object dts_cobradores: TDataSource
    DataSet = qry_cobradores
    Left = 336
    Top = 344
  end
  object qry_clientes: TADOQuery
    ConnectionString = 'FILE NAME=C:\sistemas\SisCob.udl'
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from clientes'
      'order by nome')
    Left = 464
    Top = 112
    object qry_clientespk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object qry_clientesnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qry_clientesperc_juros_mes: TFloatField
      FieldName = 'perc_juros_mes'
    end
    object qry_clientesperc_multa: TFloatField
      FieldName = 'perc_multa'
    end
    object qry_clientescnpj: TStringField
      FieldName = 'cnpj'
    end
    object qry_clienteslayout_Inteq: TStringField
      FieldName = 'layout_Inteq'
      Size = 1
    end
    object qry_clientesbaixaTit_Carga: TStringField
      FieldName = 'baixaTit_Carga'
      Size = 1
    end
    object qry_clientesTIPO_LOGRADOURO: TStringField
      FieldName = 'TIPO_LOGRADOURO'
      Size = 10
    end
    object qry_clientesLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 50
    end
    object qry_clientesNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object qry_clientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object qry_clientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object qry_clientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object qry_clientesCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qry_clientesUF: TStringField
      FieldName = 'UF'
      Size = 50
    end
    object qry_clientesPONTO_REF: TStringField
      FieldName = 'PONTO_REF'
      Size = 30
    end
    object qry_clientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
    object qry_clientesFAX: TStringField
      FieldName = 'FAX'
    end
    object qry_clientesZERO_OITOCENTOS: TStringField
      FieldName = 'ZERO_OITOCENTOS'
      Size = 15
    end
    object qry_clientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object qry_clientesSKYPE: TStringField
      FieldName = 'SKYPE'
      Size = 40
    end
    object qry_clientesMSN: TStringField
      FieldName = 'MSN'
      Size = 60
    end
    object qry_clientesRESP_COBRANA: TStringField
      FieldName = 'RESP_COBRAN'#199'A'
      Size = 60
    end
    object qry_clientesarquivabxparcial: TStringField
      FieldName = 'arquivabxparcial'
      FixedChar = True
      Size = 1
    end
    object qry_clientesbanco1: TStringField
      FieldName = 'banco1'
      Size = 10
    end
    object qry_clientesagencia1: TStringField
      FieldName = 'agencia1'
      Size = 6
    end
    object qry_clientesconta1: TStringField
      FieldName = 'conta1'
      Size = 10
    end
    object qry_clientesbanco2: TStringField
      FieldName = 'banco2'
      Size = 10
    end
    object qry_clientesagencia2: TStringField
      FieldName = 'agencia2'
      Size = 6
    end
    object qry_clientesconta2: TStringField
      FieldName = 'conta2'
      Size = 10
    end
    object qry_clientesfavorecido1: TStringField
      FieldName = 'favorecido1'
      Size = 40
    end
    object qry_clientesfavorecido2: TStringField
      FieldName = 'favorecido2'
      Size = 40
    end
    object qry_clientesinativado: TDateTimeField
      FieldName = 'inativado'
    end
    object qry_clientestipoatraso: TStringField
      FieldName = 'tipoatraso'
      Size = 1
    end
    object qry_clientescodsocio: TStringField
      FieldName = 'codsocio'
      Size = 4
    end
    object qry_clientescodentidade: TStringField
      FieldName = 'codentidade'
      Size = 8
    end
    object qry_clientesrazaosocial: TStringField
      FieldName = 'razaosocial'
      Size = 120
    end
    object qry_clientesdiasatrasoremessaspc: TIntegerField
      FieldName = 'diasatrasoremessaspc'
    end
    object qry_clientesnaturezainclusaospc: TStringField
      FieldName = 'naturezainclusaospc'
      Size = 2
    end
    object qry_clientesretirarPorNegociacao: TStringField
      FieldName = 'retirarPorNegociacao'
      Size = 1
    end
    object qry_clientestiposDeTitulos: TStringField
      FieldName = 'tiposDeTitulos'
      Size = 200
    end
    object qry_clientestaxaAdm: TBCDField
      FieldName = 'taxaAdm'
      Precision = 12
      Size = 2
    end
    object qry_clientesvr_taxa_bancaria: TBCDField
      FieldName = 'vr_taxa_bancaria'
      Precision = 12
      Size = 2
    end
    object qry_clientesvr_segunda_via: TBCDField
      FieldName = 'vr_segunda_via'
      Precision = 12
      Size = 2
    end
  end
end
