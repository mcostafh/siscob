object frm_expurgo: Tfrm_expurgo
  Left = 484
  Top = 170
  Width = 544
  Height = 349
  Caption = 'Atualizar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 536
    Height = 281
    Align = alClient
    BevelOuter = bvNone
    Color = clInfoBk
    TabOrder = 1
    object Gauge_atualizando: TGauge
      Left = 0
      Top = 112
      Width = 337
      Height = 22
      Progress = 0
      Visible = False
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 35
      Height = 13
      Caption = 'Cliente:'
    end
    object lb_mens: TLabel
      Left = 328
      Top = 248
      Width = 145
      Height = 13
      AutoSize = False
    end
    object sb_gravarConf: TSpeedButton
      Left = 396
      Top = 10
      Width = 107
      Height = 36
      Hint = 'Carrega dados da Agenda Di'#225'ria'
      Caption = 'Executar'
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
        5555555555555555555555555555555555555555555555555555555555555555
        55555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFBFB
        0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
        0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
        0555557F555555557F55550FBFBFBFBF0555557FFFFFFFFF7555550000000000
        555555777777777755555550FBFB0555555555575FFF75555555555700007555
        5555555577775555555555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sb_gravarConfClick
    end
    object SpeedButton1: TSpeedButton
      Left = 398
      Top = 66
      Width = 107
      Height = 36
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
    object lk_cliente: TRxDBLookupCombo
      Left = 48
      Top = 5
      Width = 329
      Height = 21
      DropDownCount = 8
      LookupField = 'pk_cliente'
      LookupDisplay = 'nome'
      LookupDisplayIndex = 5
      LookupSource = Dts_cliente
      TabOrder = 0
    end
    object cb_expurgafinanceira: TCheckBox
      Left = 12
      Top = 49
      Width = 277
      Height = 17
      Caption = 'Expurga apenas informa'#231#245'es financeiras'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Carga dos arquivos'
    Color = 4210688
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object qry_devedor: TADOQuery
    Connection = DM.DB
    Parameters = <
      item
        Name = 'cliente'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select *'
      'from devedores'
      'where pk_cliente=:cliente')
    Left = 200
    Top = 96
  end
  object qry_titulos: TADOQuery
    Connection = DM.DB
    Parameters = <
      item
        Name = 'devedor'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select *'
      'from titulos'
      'where pk_devedor=:devedor')
    Left = 200
    Top = 128
  end
  object telefones: TADODataSet
    Connection = DM.DB
    CursorType = ctStatic
    CommandText = 'select * from telefones where pk_devedor=:devedor'
    Parameters = <
      item
        Name = 'devedor'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 232
    Top = 97
    object telefonesid: TIntegerField
      FieldName = 'id'
    end
    object telefonespk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object telefonestipo_fone: TStringField
      FieldName = 'tipo_fone'
      Size = 15
    end
    object telefonesTelefone: TStringField
      FieldName = 'Telefone'
      Size = 40
    end
  end
  object recibos: TADODataSet
    Connection = DM.DB
    CursorType = ctStatic
    CommandText = 'select * from recibos where pk_devedor=:devedor '
    Parameters = <
      item
        Name = 'devedor'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 194
    Top = 164
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
      Precision = 18
      Size = 0
    end
    object recibosjuros: TBCDField
      FieldName = 'juros'
      Precision = 18
      Size = 0
    end
    object recibosmulta: TBCDField
      FieldName = 'multa'
      Precision = 18
      Size = 0
    end
    object recibosdesc_principal: TBCDField
      FieldName = 'desc_principal'
      Precision = 18
      Size = 0
    end
    object recibosdesc_juros: TBCDField
      FieldName = 'desc_juros'
      Precision = 18
      Size = 0
    end
    object recibosdesc_multa: TBCDField
      FieldName = 'desc_multa'
      Precision = 18
      Size = 0
    end
    object recibosacres_protesto: TBCDField
      FieldName = 'acres_protesto'
      Precision = 18
      Size = 0
    end
    object recibosacres_honorarios: TBCDField
      FieldName = 'acres_honorarios'
      Precision = 18
      Size = 0
    end
    object recibosvalor_liquido: TBCDField
      FieldName = 'valor_liquido'
      Precision = 18
      Size = 0
    end
    object recibostaxa_retenc: TBCDField
      FieldName = 'taxa_retenc'
      Precision = 18
      Size = 0
    end
    object recibosvalor_retenc: TBCDField
      FieldName = 'valor_retenc'
      Precision = 18
      Size = 0
    end
    object recibosdata_receb: TDateTimeField
      FieldName = 'data_receb'
    end
    object reciboshora_receb: TStringField
      FieldName = 'hora_receb'
      Size = 10
    end
    object recibosusuario_receb: TIntegerField
      FieldName = 'usuario_receb'
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
    object recibosobservacao: TStringField
      FieldName = 'observacao'
      Size = 200
    end
    object recibosdata_venc: TDateTimeField
      FieldName = 'data_venc'
    end
  end
  object cliente: TADODataSet
    Connection = DM.DB
    CommandText = 'select *'#13#10'from clientes'#13#10'where pk_cliente=:cliente'
    Parameters = <
      item
        Name = 'cliente'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 192
    Top = 264
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
  object taxas: TADODataSet
    Connection = DM.DB
    CommandText = 'select *'#13#10'from TAXAS_CLIENTES'#13#10'where pk_cliente=:cliente'
    Parameters = <
      item
        Name = 'cliente'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 200
    Top = 233
  end
  object qry_evento: TADODataSet
    Connection = DM.DB
    CommandText = 'select *'#13#10'from eventos'#13#10'where pk_devedor=:devedor'
    Parameters = <
      item
        Name = 'devedor'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 208
    Top = 201
  end
end
