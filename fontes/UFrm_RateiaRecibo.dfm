object Frm_RateiaRecibo: TFrm_RateiaRecibo
  Left = 337
  Top = 242
  Width = 520
  Height = 385
  Caption = 'Rateio'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 512
    Height = 317
    Align = alClient
    BevelOuter = bvNone
    Color = clInfoBk
    TabOrder = 2
    object Gauge_atualizando: TGauge
      Left = 320
      Top = 264
      Width = 137
      Height = 22
      Progress = 0
      Visible = False
    end
    object Label1: TLabel
      Left = 8
      Top = 3
      Width = 35
      Height = 13
      Caption = 'Cliente:'
    end
    object lb_mens: TLabel
      Left = 360
      Top = 128
      Width = 137
      Height = 13
      AutoSize = False
    end
    object Label5: TLabel
      Left = 10
      Top = 43
      Width = 34
      Height = 13
      Caption = 'Recibo'
    end
    object lk_cliente: TRxDBLookupCombo
      Left = 8
      Top = 18
      Width = 329
      Height = 21
      DropDownCount = 8
      LookupField = 'pk_cliente'
      LookupDisplay = 'nome'
      LookupDisplayIndex = 20
      LookupSource = Dts_cliente
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 7
      Top = 252
      Width = 297
      Height = 46
      TabOrder = 3
      object Label2: TLabel
        Left = 16
        Top = 16
        Width = 146
        Height = 13
        Caption = 'Total de Devedores a Distribuir'
      end
      object lb_total: TLabel
        Left = 168
        Top = 16
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
    object edt_recibo: TEdit
      Left = 8
      Top = 57
      Width = 57
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 1
    end
    object GroupBox5: TGroupBox
      Left = 8
      Top = 86
      Width = 353
      Height = 62
      Caption = 'Per'#237'odo dos Recibos'
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 512
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Rateia valores do Recibo entre os T'#237'tulos'
    Color = 4210688
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 362
    Top = 48
    Width = 134
    Height = 189
    Color = clInfoBk
    TabOrder = 1
    object sb_gravarConf: TSpeedButton
      Left = 12
      Top = 72
      Width = 107
      Height = 48
      Hint = 'Carrega dados da Agenda Di'#225'ria'
      Caption = 'Aplicar Rateio'
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
      ShowHint = True
      OnClick = sb_gravarConfClick
    end
    object btn_buscar: TSpeedButton
      Left = 13
      Top = 15
      Width = 107
      Height = 48
      Hint = 'Carrega dados da Agenda Di'#225'ria'
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
      ShowHint = True
      OnClick = btn_buscarClick
    end
    object SpeedButton1: TSpeedButton
      Left = 10
      Top = 128
      Width = 114
      Height = 48
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
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 332
    Top = 37
  end
  object tb_cliente: TADOTable
    Connection = DM.DB
    CursorType = ctStatic
    TableName = 'clientes'
    Left = 384
    Top = 8
  end
  object Dts_cliente: TDataSource
    DataSet = tb_cliente
    Left = 416
    Top = 8
  end
  object qry_recibos: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select r.*'
      'from recibos r'
      'where 1=2')
    Left = 296
    Top = 32
    object qry_recibospk_recibo: TIntegerField
      FieldName = 'pk_recibo'
    end
    object qry_recibospk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object qry_recibosdata: TDateTimeField
      FieldName = 'data'
    end
    object qry_reciboshora: TStringField
      FieldName = 'hora'
      Size = 10
    end
    object qry_recibospk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object qry_recibosusuario_cobrador: TIntegerField
      FieldName = 'usuario_cobrador'
    end
    object qry_recibosprincipal: TBCDField
      FieldName = 'principal'
      Precision = 18
      Size = 2
    end
    object qry_recibosjuros: TBCDField
      FieldName = 'juros'
      Precision = 18
      Size = 2
    end
    object qry_recibosmulta: TBCDField
      FieldName = 'multa'
      Precision = 18
      Size = 2
    end
    object qry_recibosdesc_principal: TBCDField
      FieldName = 'desc_principal'
      Precision = 18
      Size = 2
    end
    object qry_recibosdesc_juros: TBCDField
      FieldName = 'desc_juros'
      Precision = 18
      Size = 2
    end
    object qry_recibosdesc_multa: TBCDField
      FieldName = 'desc_multa'
      Precision = 18
      Size = 2
    end
    object qry_recibosacres_protesto: TBCDField
      FieldName = 'acres_protesto'
      Precision = 18
      Size = 2
    end
    object qry_recibosacres_honorarios: TBCDField
      FieldName = 'acres_honorarios'
      Precision = 18
      Size = 2
    end
    object qry_recibosvalor_liquido: TBCDField
      FieldName = 'valor_liquido'
      Precision = 18
      Size = 2
    end
    object qry_recibostaxa_retenc: TBCDField
      FieldName = 'taxa_retenc'
      Precision = 18
      Size = 2
    end
    object qry_recibosvalor_retenc: TBCDField
      FieldName = 'valor_retenc'
      Precision = 18
      Size = 2
    end
    object qry_recibosdata_receb: TDateTimeField
      FieldName = 'data_receb'
    end
    object qry_reciboshora_receb: TStringField
      FieldName = 'hora_receb'
      Size = 10
    end
    object qry_recibosusuario_receb: TIntegerField
      FieldName = 'usuario_receb'
    end
    object qry_recibosdata_canc: TDateTimeField
      FieldName = 'data_canc'
    end
    object qry_reciboshora_canc: TStringField
      FieldName = 'hora_canc'
      Size = 10
    end
    object qry_recibosusuario_canc: TIntegerField
      FieldName = 'usuario_canc'
    end
    object qry_recibosobservacao: TStringField
      FieldName = 'observacao'
      Size = 200
    end
    object qry_recibosdata_venc: TDateTimeField
      FieldName = 'data_venc'
    end
    object qry_recibostipo: TIntegerField
      FieldName = 'tipo'
    end
    object qry_reciboschave_tabretenc: TIntegerField
      FieldName = 'chave_tabretenc'
    end
    object qry_recibosdias_atraso: TIntegerField
      FieldName = 'dias_atraso'
    end
    object qry_recibospk_prestcontas: TIntegerField
      FieldName = 'pk_prestcontas'
    end
  end
  object qry_temp: TADOQuery
    Connection = DM.DB
    Parameters = <>
    Left = 273
    Top = 257
  end
end
