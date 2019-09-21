object frm_GerarRemessaSPC: Tfrm_GerarRemessaSPC
  Left = 264
  Top = 67
  Width = 1022
  Height = 751
  Caption = 'Gerar remessa para o SPC'
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
    Width = 1014
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
      Width = 1012
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
      Width = 275
      Height = 27
      Caption = 'Gerar remessa para o SPC'
      Color = clBlack
      ParentColor = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 1014
    Height = 96
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 17
      Width = 35
      Height = 13
      Caption = 'Cliente:'
    end
    object btn_busca: TSpeedButton
      Left = 386
      Top = 7
      Width = 71
      Height = 31
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
      Left = 888
      Top = 9
      Width = 113
      Height = 64
      Hint = 'Esconde a tela'
      Caption = '&Fechar'
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
    object Label2: TLabel
      Left = 16
      Top = 43
      Width = 27
      Height = 13
      Caption = 'CNPJ'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 158
      Top = 43
      Width = 61
      Height = 13
      Caption = 'Raz'#227'o social'
      FocusControl = DBEdit2
    end
    object Label4: TLabel
      Left = 493
      Top = 43
      Width = 68
      Height = 13
      Caption = 'Dias de atraso'
      FocusControl = DBEdit3
    end
    object Label5: TLabel
      Left = 567
      Top = 43
      Width = 75
      Height = 13
      Caption = 'Tipos de Titulos'
      FocusControl = DBEdit4
    end
    object lk_cliente: TRxDBLookupCombo
      Left = 48
      Top = 14
      Width = 329
      Height = 21
      DropDownCount = 30
      LookupField = 'pk_cliente'
      LookupDisplay = 'nome'
      LookupDisplayIndex = 30
      LookupSource = Dts_cliente
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 59
      Width = 134
      Height = 21
      Color = clSilver
      DataField = 'cnpj'
      DataSource = Dts_cliente
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 158
      Top = 59
      Width = 329
      Height = 21
      Color = clSilver
      DataField = 'razaosocial'
      DataSource = Dts_cliente
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 493
      Top = 59
      Width = 65
      Height = 21
      Color = clSilver
      DataField = 'diasatrasoremessaspc'
      DataSource = Dts_cliente
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 565
      Top = 59
      Width = 193
      Height = 21
      Color = clSilver
      DataField = 'tiposDeTitulos'
      DataSource = Dts_cliente
      ReadOnly = True
      TabOrder = 4
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 137
    Width = 1014
    Height = 503
    Align = alClient
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
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 224
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'emissao'
        Title.Caption = 'Emiss'#227'o'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numero_titulo'
        Title.Caption = 'N'#250'mero'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipo_titulo'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vencimento'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_titulo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_principal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome_banco'
        Title.Caption = 'Banco'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Banco'
        Title.Caption = 'C'#243'd.Bco'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Agencia'
        Title.Caption = 'Ag'#234'ncia'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Conta'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cheque'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Endossado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Endossado_CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'praca_cheque'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'alinea_devol'
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 640
    Width = 1014
    Height = 84
    Align = alBottom
    Color = clMenu
    TabOrder = 3
    object sb_gerar: TSpeedButton
      Left = 856
      Top = 16
      Width = 137
      Height = 57
      Caption = 'Gerar remessa'
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
    end
    object btn_imprimir: TSpeedButton
      Left = 698
      Top = 13
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
    end
  end
  object Dts_cliente: TDataSource
    DataSet = tb_cliente
    Left = 152
    Top = 144
  end
  object dts_pendencia: TDataSource
    DataSet = qry_pendencia
    Left = 472
    Top = 184
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
      Precision = 18
      Size = 0
    end
    object qry_prestcontasjuros: TBCDField
      FieldName = 'juros'
      Precision = 18
      Size = 0
    end
    object qry_prestcontasmulta: TBCDField
      FieldName = 'multa'
      Precision = 18
      Size = 0
    end
    object qry_prestcontasdescjuros: TBCDField
      FieldName = 'descjuros'
      Precision = 18
      Size = 0
    end
    object qry_prestcontasdescmulta: TBCDField
      FieldName = 'descmulta'
      Precision = 18
      Size = 0
    end
    object qry_prestcontasdescprincipal: TBCDField
      FieldName = 'descprincipal'
      Precision = 18
      Size = 0
    end
    object qry_prestcontaspdescjuros: TBCDField
      FieldName = 'pdescjuros'
      Precision = 18
      Size = 0
    end
    object qry_prestcontaspdescmulta: TBCDField
      FieldName = 'pdescmulta'
      Precision = 18
      Size = 0
    end
    object qry_prestcontasretencao: TBCDField
      FieldName = 'retencao'
      Precision = 18
      Size = 0
    end
    object qry_prestcontasacrescimos: TBCDField
      FieldName = 'acrescimos'
      Precision = 18
      Size = 0
    end
    object qry_prestcontasliquido: TBCDField
      FieldName = 'liquido'
      Precision = 18
      Size = 0
    end
    object qry_prestcontasbaixaparcial: TBCDField
      FieldName = 'baixaparcial'
      Precision = 18
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
  end
  object tb_cliente: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select * from clientes where inativado is null')
    Left = 184
    Top = 176
    object tb_clientepk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object tb_clientecnpj: TStringField
      FieldName = 'cnpj'
    end
    object tb_clientenome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object tb_clienteinativado: TDateTimeField
      FieldName = 'inativado'
    end
    object tb_clientecodsocio: TStringField
      FieldName = 'codsocio'
      Size = 4
    end
    object tb_clientecodentidade: TStringField
      FieldName = 'codentidade'
      Size = 8
    end
    object tb_clienterazaosocial: TStringField
      FieldName = 'razaosocial'
      Size = 120
    end
    object tb_clientediasatrasoremessaspc: TIntegerField
      FieldName = 'diasatrasoremessaspc'
    end
    object tb_clientenaturezainclusaospc: TStringField
      FieldName = 'naturezainclusaospc'
      Size = 2
    end
    object tb_clienteretirarPorNegociacao: TStringField
      FieldName = 'retirarPorNegociacao'
      Size = 1
    end
    object tb_clientetiposDeTitulos: TStringField
      FieldName = 'tiposDeTitulos'
      Size = 200
    end
  end
  object qry_pendencia: TADODataSet
    Active = True
    ConnectionString = 'FILE NAME=C:\sistemas\SisCob.udl'
    CursorType = ctStatic
    CommandText = 
      'SELECT t.*, d.nome '#13#10' FROM titulos t '#13#10' inner join devedores d o' +
      'n ( d.pk_devedor = t.pk_devedor and d.pk_cliente = t.pk_cliente)' +
      #13#10'where 1=2'
    Parameters = <>
    Left = 432
    Top = 184
  end
end
