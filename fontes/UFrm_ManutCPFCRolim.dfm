object Frm_ManutCPFCRolim: TFrm_ManutCPFCRolim
  Left = 223
  Top = 63
  Width = 833
  Height = 552
  Caption = 'Corre'#231#227'o CPF C Rolim'
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
    Width = 817
    Height = 484
    Align = alLeft
    BevelOuter = bvNone
    Color = clInfoBk
    TabOrder = 1
    object Gauge_atualizando: TGauge
      Left = 696
      Top = 117
      Width = 108
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
      Left = 696
      Top = 53
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
    object SpeedButton2: TSpeedButton
      Left = 614
      Top = 451
      Width = 74
      Height = 21
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
      Width = 681
      Height = 120
      Caption = 'Arquivos'
      TabOrder = 0
      object sb_PesquisarArquivos: TSpeedButton
        Left = 349
        Top = 14
        Width = 22
        Height = 24
        Hint = 'Pesquisar arquivo'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
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
      object DBEdit1: TDBEdit
        Left = 8
        Top = 17
        Width = 337
        Height = 21
        DataField = 'nomeArquivoEnviar'
        TabOrder = 0
      end
      object memo_arquivos: TMemo
        Left = 9
        Top = 40
        Width = 664
        Height = 73
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object Memo1: TMemo
      Left = 2
      Top = 152
      Width = 687
      Height = 289
      ScrollBars = ssVertical
      TabOrder = 1
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
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 825
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Corre'#231#227'o de CPF - layout c rolim'
    Color = 4210688
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 690
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
  object tb_cliente: TADOTable
    Connection = DM.DB
    CursorType = ctStatic
    TableName = 'clientes'
    Left = 384
    Top = 8
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
  end
  object Dts_cliente: TDataSource
    DataSet = tb_cliente
    Left = 416
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
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from devedores'
      'where 1=2')
    Left = 56
    Top = 8
    object qry_devedorpk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object qry_devedorpk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object qry_devedornossonumero: TStringField
      FieldName = 'nossonumero'
    end
    object qry_devedorchave_no_cliente: TIntegerField
      FieldName = 'chave_no_cliente'
    end
    object qry_devedorCGC_CPF: TStringField
      FieldName = 'CGC_CPF'
      Size = 50
    end
    object qry_devedortitular_avalista: TStringField
      FieldName = 'titular_avalista'
      Size = 50
    end
    object qry_devedorNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qry_devedorRG: TStringField
      FieldName = 'RG'
      Size = 50
    end
    object qry_devedorOrgao_Rg: TStringField
      FieldName = 'Orgao_Rg'
      Size = 50
    end
    object qry_devedordata_nasc: TDateTimeField
      FieldName = 'data_nasc'
    end
    object qry_devedortelefones: TStringField
      FieldName = 'telefones'
      Size = 50
    end
    object qry_devedortipo_logradouro: TStringField
      FieldName = 'tipo_logradouro'
      Size = 10
    end
    object qry_devedorlogradouro: TStringField
      FieldName = 'logradouro'
      Size = 50
    end
    object qry_devedorNumero: TStringField
      FieldName = 'Numero'
      Size = 50
    end
    object qry_devedorComplemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object qry_devedorBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object qry_devedorCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qry_devedorCep: TStringField
      FieldName = 'Cep'
      Size = 50
    end
    object qry_devedorUf: TStringField
      FieldName = 'Uf'
      Size = 50
    end
    object qry_devedorponto_referencia: TStringField
      FieldName = 'ponto_referencia'
      Size = 50
    end
    object qry_devedortrabalho_nome: TStringField
      FieldName = 'trabalho_nome'
      Size = 50
    end
    object qry_devedorTrab_logradouro: TStringField
      FieldName = 'Trab_logradouro'
      Size = 50
    end
    object qry_devedortrab_numero: TStringField
      FieldName = 'trab_numero'
      Size = 10
    end
    object qry_devedortrab_bairro: TStringField
      FieldName = 'trab_bairro'
      Size = 50
    end
    object qry_devedorTrab_cidade: TStringField
      FieldName = 'Trab_cidade'
      Size = 50
    end
    object qry_devedorTrab_uf: TStringField
      FieldName = 'Trab_uf'
      Size = 50
    end
    object qry_devedortrab_fones: TStringField
      FieldName = 'trab_fones'
      Size = 50
    end
    object qry_devedortrab_complemento: TStringField
      FieldName = 'trab_complemento'
      Size = 50
    end
    object qry_devedortrab_ponto_refer: TStringField
      FieldName = 'trab_ponto_refer'
      Size = 50
    end
    object qry_devedortrab_cep: TStringField
      FieldName = 'trab_cep'
      Size = 50
    end
    object qry_devedorProfissao: TStringField
      FieldName = 'Profissao'
      Size = 50
    end
    object qry_devedorSEXO: TStringField
      FieldName = 'SEXO'
      Size = 50
    end
    object qry_devedorprim_ref_pessoal: TStringField
      FieldName = 'prim_ref_pessoal'
      Size = 50
    end
    object qry_devedorprim_ref_pessoal_fones: TStringField
      FieldName = 'prim_ref_pessoal_fones'
      Size = 50
    end
    object qry_devedorseg_ref_pessoal: TStringField
      FieldName = 'seg_ref_pessoal'
      Size = 50
    end
    object qry_devedorseg_ref_pessoal_fones: TStringField
      FieldName = 'seg_ref_pessoal_fones'
      Size = 50
    end
    object qry_devedornao_localizado: TDateTimeField
      FieldName = 'nao_localizado'
    end
    object qry_devedordata_baixa: TDateTimeField
      FieldName = 'data_baixa'
    end
    object qry_devedoragendado_data: TDateTimeField
      FieldName = 'agendado_data'
    end
    object qry_devedoragendado_hora: TStringField
      FieldName = 'agendado_hora'
      Size = 50
    end
    object qry_devedoragendado_tipo: TIntegerField
      FieldName = 'agendado_tipo'
    end
    object qry_devedoragendado_cobrador: TIntegerField
      FieldName = 'agendado_cobrador'
    end
    object qry_devedorseq_arq_inclusao: TIntegerField
      FieldName = 'seq_arq_inclusao'
    end
    object qry_devedorseq_arq_baixa: TIntegerField
      FieldName = 'seq_arq_baixa'
    end
    object qry_devedorusuario_baixa: TIntegerField
      FieldName = 'usuario_baixa'
    end
    object qry_devedorusuario_inclusao: TIntegerField
      FieldName = 'usuario_inclusao'
    end
    object qry_devedormotivo_baixa: TStringField
      FieldName = 'motivo_baixa'
      Size = 2
    end
    object qry_devedorvalor_divida: TFloatField
      FieldName = 'valor_divida'
    end
    object qry_devedormotivo_dialogo: TIntegerField
      FieldName = 'motivo_dialogo'
    end
    object qry_devedordata_dialogo: TDateTimeField
      FieldName = 'data_dialogo'
    end
    object qry_devedorpk_cobrador: TIntegerField
      FieldName = 'pk_cobrador'
    end
    object qry_devedoranotacoes: TStringField
      FieldName = 'anotacoes'
      Size = 2000
    end
    object qry_devedoremail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object qry_devedorcodigo_no_cliente: TStringField
      FieldName = 'codigo_no_cliente'
      Size = 50
    end
  end
  object tabelas: TADOTable
    Connection = DM.DB
    TableName = 'tabela'
    Left = 104
    Top = 8
  end
end
