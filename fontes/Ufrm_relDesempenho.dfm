object frm_RelDesempenho: Tfrm_RelDesempenho
  Left = 309
  Top = 176
  Width = 579
  Height = 298
  Caption = 'Desempenho de Cobran'#231'a'
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
    Left = 81
    Top = 205
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
  object Label1: TLabel
    Left = 7
    Top = 47
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object Gauge_atualizando: TGauge
    Left = 104
    Top = 220
    Width = 233
    Height = 16
    Progress = 0
    Visible = False
  end
  object Label3: TLabel
    Left = 6
    Top = 89
    Width = 91
    Height = 13
    Caption = 'Carteira - Cobrador:'
  end
  object Label16: TLabel
    Left = 111
    Top = 138
    Width = 67
    Height = 13
    Caption = 'Tipo do T'#237'tulo'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 571
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
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
      Width = 569
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
      Left = 143
      Top = 22
      Width = 276
      Height = 27
      Caption = 'Desempenho de Cobran'#231'a'
      Color = clBlack
      ParentColor = False
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 162
    Width = 351
    Height = 47
    BevelOuter = bvNone
    TabOrder = 1
    object btn_imprimir: TSpeedButton
      Left = -2
      Top = 2
      Width = 108
      Height = 41
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
      Left = 229
      Top = 2
      Width = 108
      Height = 41
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
    Left = 5
    Top = 62
    Width = 331
    Height = 21
    DropDownCount = 20
    LookupField = 'pk_cliente'
    LookupDisplay = 'nome'
    LookupDisplayIndex = 5
    LookupSource = dts_clientes
    TabOrder = 2
  end
  object cb_cobrador: TRxDBLookupCombo
    Left = 6
    Top = 104
    Width = 329
    Height = 21
    DropDownCount = 8
    LookupField = 'nu_usu'
    LookupDisplay = 'Nome'
    LookupDisplayIndex = 5
    LookupSource = dts_usuarios
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 354
    Top = 64
    Width = 153
    Height = 129
    Caption = 'Faixas de Atraso'
    TabOrder = 4
    object Label2: TLabel
      Left = 6
      Top = 19
      Width = 26
      Height = 13
      Caption = '1. De'
    end
    object Label4: TLabel
      Left = 81
      Top = 19
      Width = 15
      Height = 13
      Caption = 'at'#233
    end
    object Label5: TLabel
      Left = 6
      Top = 41
      Width = 26
      Height = 13
      Caption = '2. De'
    end
    object Label6: TLabel
      Left = 81
      Top = 41
      Width = 15
      Height = 13
      Caption = 'at'#233
    end
    object Label7: TLabel
      Left = 6
      Top = 63
      Width = 26
      Height = 13
      Caption = '3. De'
    end
    object Label9: TLabel
      Left = 81
      Top = 63
      Width = 15
      Height = 13
      Caption = 'at'#233
    end
    object Label10: TLabel
      Left = 6
      Top = 85
      Width = 26
      Height = 13
      Caption = '4. De'
    end
    object Label11: TLabel
      Left = 81
      Top = 85
      Width = 15
      Height = 13
      Caption = 'at'#233
    end
    object Label12: TLabel
      Left = 6
      Top = 107
      Width = 26
      Height = 13
      Caption = '5. De'
    end
    object Label13: TLabel
      Left = 82
      Top = 105
      Width = 15
      Height = 13
      Caption = 'at'#233
    end
    object fx1_de: TEdit
      Left = 37
      Top = 15
      Width = 41
      Height = 21
      TabOrder = 0
      Text = '1'
    end
    object fx1_ate: TEdit
      Left = 102
      Top = 14
      Width = 41
      Height = 21
      TabOrder = 1
      Text = '30'
    end
    object fx2_de: TEdit
      Left = 37
      Top = 37
      Width = 41
      Height = 21
      TabOrder = 2
      Text = '31'
    end
    object fx2_ate: TEdit
      Left = 102
      Top = 36
      Width = 41
      Height = 21
      TabOrder = 3
      Text = '60'
    end
    object fx3_de: TEdit
      Left = 37
      Top = 59
      Width = 41
      Height = 21
      TabOrder = 4
      Text = '61'
    end
    object fx3_ate: TEdit
      Left = 102
      Top = 58
      Width = 41
      Height = 21
      TabOrder = 5
      Text = '90'
    end
    object fx4_de: TEdit
      Left = 37
      Top = 81
      Width = 41
      Height = 21
      TabOrder = 6
      Text = '91'
    end
    object fx4_ate: TEdit
      Left = 102
      Top = 80
      Width = 41
      Height = 21
      TabOrder = 7
      Text = '120'
    end
    object fx5_de: TEdit
      Left = 37
      Top = 103
      Width = 41
      Height = 21
      TabOrder = 8
      Text = '121'
    end
    object fx5_ate: TEdit
      Left = 102
      Top = 102
      Width = 41
      Height = 21
      TabOrder = 9
      Text = '130'
    end
  end
  object cbx_ativo: TCheckBox
    Left = 7
    Top = 137
    Width = 97
    Height = 17
    Caption = 'Somente Ativo'
    TabOrder = 5
  end
  object edt_tipo: TEdit
    Left = 183
    Top = 130
    Width = 47
    Height = 21
    TabOrder = 6
  end
  object GroupBox2: TGroupBox
    Left = 355
    Top = 193
    Width = 206
    Height = 48
    Caption = 'Per'#237'odo Baixas'
    TabOrder = 7
    object a: TLabel
      Left = 98
      Top = 20
      Width = 6
      Height = 13
      Caption = 'a'
    end
    object edt_atraso1: TDateEdit
      Left = 5
      Top = 16
      Width = 89
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
    object edt_atraso2: TDateEdit
      Left = 111
      Top = 15
      Width = 87
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
    Left = 272
    Top = 88
  end
  object dts_usuarios: TDataSource
    DataSet = usuarios
    Left = 232
    Top = 88
  end
  object qry_rel: TADODataSet
    Connection = DM.DB
    CommandText = 'select *'#13#10'from jobs '#13#10'where 1=2'
    Parameters = <>
    Left = 520
    Top = 88
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
    object qry_reldec_1: TBCDField
      FieldName = 'dec_1'
      Precision = 18
      Size = 2
    end
    object qry_reldec_2: TBCDField
      FieldName = 'dec_2'
      Precision = 18
      Size = 2
    end
    object qry_reldec_3: TBCDField
      FieldName = 'dec_3'
      Precision = 18
      Size = 2
    end
    object qry_reldec_4: TBCDField
      FieldName = 'dec_4'
      Precision = 18
      Size = 2
    end
    object qry_reldec_5: TBCDField
      FieldName = 'dec_5'
      Precision = 18
      Size = 2
    end
    object qry_reldec_6: TBCDField
      FieldName = 'dec_6'
      Precision = 18
      Size = 2
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
    Left = 152
    Top = 136
  end
  object DataSource2: TDataSource
    DataSet = qry_aux
    Left = 208
    Top = 104
  end
  object tb_Ocorrencias: TADOTable
    Connection = DM.DB
    TableName = 'ocorrencias'
    Left = 16
    Top = 216
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
  object qry_job1: TADODataSet
    Connection = DM.DB
    CommandText = 'select *'#13#10'from jobs '#13#10'where job=:job and categoria=:cat'
    Parameters = <
      item
        Name = 'job'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'cat'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end>
    Left = 520
    Top = 48
    object IntegerField1: TIntegerField
      FieldName = 'job'
    end
    object StringField1: TStringField
      FieldName = 'nome_campo'
      Size = 50
    end
    object BCDField1: TBCDField
      FieldName = 'valor'
      Precision = 18
      Size = 2
    end
    object StringField2: TStringField
      FieldName = 'descricao'
      Size = 70
    end
    object StringField3: TStringField
      FieldName = 'categoria'
      FixedChar = True
      Size = 1
    end
    object IntegerField2: TIntegerField
      FieldName = 'chave'
    end
    object StringField4: TStringField
      FieldName = 'tag_1'
      Size = 50
    end
    object StringField5: TStringField
      FieldName = 'tag_2'
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'tag_3'
      Size = 50
    end
    object StringField7: TStringField
      FieldName = 'tag_4'
      Size = 50
    end
    object StringField8: TStringField
      FieldName = 'tag_5'
      Size = 50
    end
    object qry_job1dec_1: TBCDField
      FieldName = 'dec_1'
      Precision = 18
      Size = 2
    end
    object qry_job1dec_2: TBCDField
      FieldName = 'dec_2'
      Precision = 18
      Size = 2
    end
    object qry_job1dec_3: TBCDField
      FieldName = 'dec_3'
      Precision = 18
      Size = 2
    end
    object qry_job1dec_4: TBCDField
      FieldName = 'dec_4'
      Precision = 18
      Size = 2
    end
    object qry_job1dec_5: TBCDField
      FieldName = 'dec_5'
      Precision = 18
      Size = 2
    end
    object qry_job1dec_6: TBCDField
      FieldName = 'dec_6'
      Precision = 18
      Size = 2
    end
  end
  object tb_clientes: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select * from clientes where inativado is null')
    Left = 304
    Top = 8
  end
  object qry_qtdev: TADODataSet
    Connection = DM.DB
    CommandText = 'select *'#13#10'from jobs '#13#10'where 1=2'
    Parameters = <>
    Left = 232
    Top = 136
  end
  object qry_bxparciais: TADODataSet
    Connection = DM.DB
    CommandText = 'select *'#13#10'from baixasparciais '#13#10'where 1=2'
    Parameters = <>
    Left = 192
    Top = 136
  end
  object qry_baixastotais: TADODataSet
    Connection = DM.DB
    CommandText = 'select *'#13#10'from titulos t'#13#10'where 1=2'
    Parameters = <>
    Left = 192
    Top = 168
  end
end