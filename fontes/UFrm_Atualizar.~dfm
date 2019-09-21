object Frm_Atualizar: TFrm_Atualizar
  Left = 281
  Top = 106
  Width = 790
  Height = 631
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
    Width = 782
    Height = 563
    Align = alClient
    BevelOuter = bvNone
    Color = clInfoBk
    TabOrder = 1
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
    object lb_status: TLabel
      Left = 696
      Top = 96
      Width = 113
      Height = 13
      AutoSize = False
    end
    object gb_enviar: TGroupBox
      Left = 8
      Top = 27
      Width = 601
      Height = 110
      Caption = 'Arquivos'
      TabOrder = 0
      object sb_explorer: TSpeedButton
        Left = 487
        Top = 64
        Width = 101
        Height = 35
        Hint = 'Explorar pastas a procura do arquivo'
        Caption = 'Explorer pastas'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
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
        OnClick = sb_explorerClick
      end
      object Label2: TLabel
        Left = 10
        Top = 26
        Width = 90
        Height = 13
        Caption = 'Pasta dos arquivos'
      end
      object sb_PesquisarArquivos: TSpeedButton
        Left = 486
        Top = 17
        Width = 102
        Height = 36
        Hint = 'Pesquisa  arquivos na pasta informada'
        Caption = 'Listar arquivos'
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
        OnClick = sb_PesquisarArquivosClick
      end
      object DBEdit1: TEdit
        Left = 106
        Top = 25
        Width = 373
        Height = 21
        TabOrder = 0
        Text = 'DBEdit1'
      end
    end
    object lk_cliente: TRxDBLookupCombo
      Left = 48
      Top = 5
      Width = 329
      Height = 21
      DropDownCount = 20
      LookupField = 'pk_cliente'
      LookupDisplay = 'nome'
      LookupDisplayIndex = 5
      LookupSource = Dts_cliente
      TabOrder = 1
    end
    object memo_arquivos: TMemo
      Left = 6
      Top = 144
      Width = 603
      Height = 409
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object GroupBox1: TGroupBox
      Left = 616
      Top = 32
      Width = 161
      Height = 106
      TabOrder = 4
      object sb_gravarConf: TSpeedButton
        Left = 11
        Top = 45
        Width = 107
        Height = 41
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
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
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
      object Gauge_atualizando: TGauge
        Left = 132
        Top = 8
        Width = 21
        Height = 91
        Kind = gkVerticalBar
        Progress = 0
        Visible = False
      end
      object cb_gravar: TCheckBox
        Left = 13
        Top = 14
        Width = 76
        Height = 17
        Caption = 'Gravar'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
    object pn_mensagens: TPanel
      Left = 689
      Top = 144
      Width = 768
      Height = 409
      TabOrder = 2
      Visible = False
      object SpeedButton2: TSpeedButton
        Left = 519
        Top = 370
        Width = 77
        Height = 31
        Hint = 'Imprime erros'
        Caption = 'Imprimir'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton2Click
      end
      object Memo1: TMemo
        Left = 1
        Top = 1
        Width = 766
        Height = 368
        Align = alTop
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 782
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
    object SpeedButton1: TSpeedButton
      Left = 658
      Top = 5
      Width = 107
      Height = 32
      Hint = 'Esconde a tela'
      Caption = '&Fechar e Sair'
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
    Ctl3D = False
    Left = 732
    Top = 125
  end
  object Dts_cliente: TDataSource
    DataSet = qry_clientes
    Left = 392
    Top = 232
  end
  object tb_assessoria: TADOTable
    Connection = DM.DB
    CursorType = ctStatic
    TableName = 'Assessoria'
    Left = 352
    Top = 8
  end
  object qry_seqArq: TADOQuery
    Connection = DM.DB
    Parameters = <
      item
        Name = 'seq'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'seq'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select count(1) as qtde'
      'from devedores'
      'where seq_arq_baixa=:seq or seq_arq_inclusao=:seq')
    Left = 8
    Top = 8
  end
  object qry_devedor: TADOQuery
    Connection = DM.DB
    Parameters = <
      item
        Name = 'cpf'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
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
      'where cgc_cpf=:cpf and pk_cliente=:cliente')
    Left = 56
    Top = 8
  end
  object tabelas: TADOTable
    Connection = DM.DB
    TableName = 'tabela'
    Left = 104
    Top = 8
  end
  object qry_titulos: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from titulos'
      'where 1=2')
    Left = 144
    Top = 8
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
    Left = 416
    Top = 49
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
  object qry_evento: TADODataSet
    Connection = DM.DB
    CommandText = 'select *'#13#10'from EVENTOS'#13#10'where 1=2'
    Parameters = <>
    Left = 24
    Top = 272
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
    object qry_eventopk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
  end
  object recibos: TADODataSet
    Connection = DM.DB
    CursorType = ctStatic
    CommandText = 
      'select * from recibos where pk_devedor=:devedor order by data de' +
      'sc'
    Parameters = <
      item
        Name = 'devedor'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 82
    Top = 276
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
  object seq_tabelas: TADODataSet
    Connection = DM.DB
    CommandText = 'select *'#13#10'from TABELA'#13#10'where tabela=:tab'
    Parameters = <
      item
        Name = 'tab'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    Left = 120
    Top = 272
    object seq_tabelastabela: TStringField
      FieldName = 'tabela'
      Size = 15
    end
    object seq_tabelasseq: TIntegerField
      FieldName = 'seq'
    end
  end
  object qry_arqimportado: TADODataSet
    Connection = DM.DB
    CommandText = 'select * from arq_importados where 1=2'
    Parameters = <>
    Left = 160
    Top = 281
  end
  object qry_clientes: TADOQuery
    ConnectionString = 'FILE NAME=C:\sistemas\SisCob.udl'
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from clientes'
      'order by nome')
    Left = 352
    Top = 232
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
