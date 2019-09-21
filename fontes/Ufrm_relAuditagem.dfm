object frm_RelAuditagem: Tfrm_RelAuditagem
  Left = 311
  Top = 104
  Width = 690
  Height = 497
  Caption = 'Auditagem dos Cobradores'
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
  object lb_mens: TLabel
    Left = 393
    Top = 397
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
  object Label3: TLabel
    Left = 7
    Top = 83
    Width = 91
    Height = 13
    Caption = 'Carteira - Cobrador:'
  end
  object Label1: TLabel
    Left = 8
    Top = 44
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object Gauge_atualizando: TGauge
    Left = 368
    Top = 416
    Width = 257
    Height = 16
    Progress = 0
    Visible = False
  end
  object Label5: TLabel
    Left = 9
    Top = 127
    Width = 102
    Height = 13
    Caption = 'Devedor (CNPJ/CPF)'
  end
  object Label6: TLabel
    Left = 137
    Top = 127
    Width = 56
    Height = 13
    Caption = 'Ordenar por'
  end
  object Label9: TLabel
    Left = 288
    Top = 44
    Width = 84
    Height = 13
    Caption = 'UF de Devedores'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 682
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Auditagem dos Cobradores'
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
      Width = 680
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
      Left = 135
      Top = 6
      Width = 284
      Height = 27
      Caption = 'Auditagem dos Cobradores'
      Color = clBlack
      ParentColor = False
    end
    object bt_fechar: TSpeedButton
      Left = 538
      Top = 5
      Width = 69
      Height = 31
      Hint = 'Esconde a tela'
      Caption = 'Sair'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Verdana'
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
      OnClick = bt_fecharClick
    end
  end
  object Panel2: TPanel
    Left = 2
    Top = 276
    Width = 154
    Height = 69
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 3
    object btn_imprimir: TSpeedButton
      Left = 9
      Top = 10
      Width = 135
      Height = 41
      AllowAllUp = True
      Caption = '&Imprimir Relat'#243'rio'
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
  end
  object cb_cobrador: TRxDBLookupCombo
    Left = 5
    Top = 100
    Width = 276
    Height = 21
    DropDownCount = 8
    LookupField = 'nu_usu'
    LookupDisplay = 'Nome'
    LookupDisplayIndex = 5
    LookupSource = dts_usuarios
    TabOrder = 2
  end
  object lk_cliente: TRxDBLookupCombo
    Left = 6
    Top = 59
    Width = 277
    Height = 21
    DropDownCount = 20
    LookupField = 'pk_cliente'
    LookupDisplay = 'nome'
    LookupDisplayIndex = 5
    LookupSource = dts_clientes
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 7
    Top = 171
    Width = 218
    Height = 65
    Caption = 'Per'#237'odo'
    TabOrder = 4
    object Label2: TLabel
      Left = 8
      Top = 18
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label4: TLabel
      Left = 110
      Top = 17
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object dt_inicial: TDateEdit
      Left = 8
      Top = 34
      Width = 93
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object dt_final: TDateEdit
      Left = 110
      Top = 34
      Width = 93
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object GroupBox21: TGroupBox
    Left = 368
    Top = 48
    Width = 258
    Height = 338
    Caption = 'Considerar apenas as ocorr'#234'ncias'
    TabOrder = 5
    object RxCheckList_ocorr: TRxCheckListBox
      Left = 2
      Top = 15
      Width = 254
      Height = 321
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
      InternalVersion = 202
      Strings = (
        'N'#227'o acionado'
        0
        True)
    end
  end
  object edt_cpf: TEdit
    Left = 8
    Top = 143
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object cb_ordenar: TComboBox
    Left = 137
    Top = 143
    Width = 113
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 7
    Text = '1-Data'
    Items.Strings = (
      '1-Data'
      '2-Devedor')
  end
  object cb_titaberto: TCheckBox
    Left = 11
    Top = 244
    Width = 230
    Height = 17
    Caption = 'Somente para t'#237'tulos em aberto'
    TabOrder = 8
  end
  object pn_nomearq: TPanel
    Left = 159
    Top = 272
    Width = 204
    Height = 162
    BevelOuter = bvLowered
    TabOrder = 9
    object Label7: TLabel
      Left = 8
      Top = 63
      Width = 135
      Height = 13
      Caption = 'Caminho e nome do arquivo:'
    end
    object SpeedButton1: TSpeedButton
      Left = 39
      Top = 110
      Width = 123
      Height = 37
      AllowAllUp = True
      Caption = 'Gerar Arquivo'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object edt_nomeArq: TEdit
      Left = 8
      Top = 78
      Width = 177
      Height = 21
      TabOrder = 0
      Text = 'C:\sistemas\acionamentos.txt'
    end
    object RadioGroup1: TRadioGroup
      Left = 5
      Top = 2
      Width = 193
      Height = 58
      Caption = 'Tipo de arquivo'
      Columns = 2
      Items.Strings = (
        'Acionamentos'
        'SMS'
        'Higieniza'#231#227'o')
      TabOrder = 1
      OnClick = RadioGroup1Click
    end
  end
  object edt_Uf: TEdit
    Left = 291
    Top = 58
    Width = 34
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 2
    TabOrder = 10
  end
  object Dts_cliente: TDataSource
    Left = 280
    Top = 160
  end
  object DataSource1: TDataSource
    Left = 472
    Top = 40
  end
  object dts_clientes: TDataSource
    DataSet = tb_clientes
    Left = 432
    Top = 48
  end
  object usuarios: TADOTable
    Connection = DM.DB
    CursorType = ctStatic
    TableName = 'usuarios'
    Left = 352
    Top = 96
  end
  object dts_usuarios: TDataSource
    DataSet = usuarios
    Left = 384
    Top = 96
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
    Top = 144
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
    Top = 144
  end
  object ADOCommand1: TADOCommand
    Connection = DM.DB
    Parameters = <>
    Left = 336
    Top = 192
  end
  object DataSource2: TDataSource
    DataSet = qry_aux
    Left = 216
    Top = 194
  end
  object qry_ocorr: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from ocorrencias'
      'order by nome')
    Left = 435
    Top = 196
    object qry_ocorrpk_ocorr: TIntegerField
      FieldName = 'pk_ocorr'
    end
    object qry_ocorrnome: TWideStringField
      FieldName = 'nome'
      Size = 30
    end
    object qry_ocorrtipo: TWideStringField
      FieldName = 'tipo'
      Size = 1
    end
  end
  object tb_clientes: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select * from clientes where inativado is null order by nome')
    Left = 368
    Top = 40
  end
  object ADOQuery1: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      
        'select e.*, d.nome as devedor,d.cgc_cpf, c.nome as nomecliente, ' +
        'd.nome as nomedevedor,o.codigo as codmotivo,o.nome as nomemotivo' +
        ', u.nome as cobrador'
      'from eventos e '
      'inner join devedores d on (d.pk_devedor=e.pk_devedor) '
      'inner join usuarios u on (u.nu_usu=e.pk_cobrador) '
      'inner join clientes c on (c.pk_cliente=e.pk_cliente) '
      'inner join ocorrencias o on ( o.pk_ocorr=e.motivo)'
      'where 1=2')
    Left = 320
    Top = 240
    object ADOQuery1chave: TIntegerField
      FieldName = 'chave'
    end
    object ADOQuery1pk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object ADOQuery1Data: TDateTimeField
      FieldName = 'Data'
    end
    object ADOQuery1Hora: TStringField
      FieldName = 'Hora'
      Size = 10
    end
    object ADOQuery1Texto: TStringField
      FieldName = 'Texto'
      Size = 250
    end
    object ADOQuery1motivo: TIntegerField
      FieldName = 'motivo'
    end
    object ADOQuery1Agendado_Data: TDateTimeField
      FieldName = 'Agendado_Data'
    end
    object ADOQuery1Agendado_Tipo: TIntegerField
      FieldName = 'Agendado_Tipo'
    end
    object ADOQuery1Agendado_Hora: TStringField
      FieldName = 'Agendado_Hora'
      Size = 50
    end
    object ADOQuery1agendado_cobrador: TIntegerField
      FieldName = 'agendado_cobrador'
    end
    object ADOQuery1marcar_nao_localiz: TStringField
      FieldName = 'marcar_nao_localiz'
      Size = 1
    end
    object ADOQuery1seq_arq_inclusao: TIntegerField
      FieldName = 'seq_arq_inclusao'
    end
    object ADOQuery1pk_cobrador: TIntegerField
      FieldName = 'pk_cobrador'
    end
    object ADOQuery1pk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object ADOQuery1cobrador: TStringField
      FieldName = 'cobrador'
      Size = 50
    end
    object ADOQuery1cgc_cpf: TStringField
      FieldName = 'cgc_cpf'
      Size = 50
    end
    object ADOQuery1nomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 50
    end
    object ADOQuery1nomemotivo: TWideStringField
      FieldName = 'nomemotivo'
      Size = 30
    end
    object ADOQuery1devedor: TStringField
      FieldName = 'devedor'
      Size = 50
    end
    object ADOQuery1codmotivo: TStringField
      FieldName = 'codmotivo'
      Size = 15
    end
    object ADOQuery1nomedevedor: TStringField
      FieldName = 'nomedevedor'
      Size = 50
    end
  end
end
