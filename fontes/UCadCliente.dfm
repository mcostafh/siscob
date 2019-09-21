inherited Frm_CadCliente: TFrm_CadCliente
  Left = 234
  Top = 76
  Width = 851
  Height = 690
  Caption = 'Cadastro de Clientes'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar: TSpeedBar
    Width = 843
  end
  inherited Panel1: TPanel
    Top = 609
    Width = 843
  end
  inherited StatusBar1: TStatusBar
    Top = 644
    Width = 843
  end
  inherited Panel2: TPanel
    Width = 843
    Height = 553
    Color = clMenuBar
    object Label3: TLabel
      Left = 314
      Top = 1
      Width = 28
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 652
      Top = 3
      Width = 27
      Height = 13
      Caption = 'CNPJ'
      FocusControl = DBEdit4
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 312
      Height = 377
      Align = alLeft
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Width = 271
          Visible = True
        end>
    end
    object gb_regras: TGroupBox
      Left = 1
      Top = 378
      Width = 841
      Height = 174
      Align = alBottom
      Caption = 'Regras de c'#225'lculos'
      TabOrder = 1
      object Label5: TLabel
        Left = 664
        Top = 20
        Width = 163
        Height = 13
        Caption = 'Baixa Titulos na carga de arquivos'
      end
      object GroupBox1: TGroupBox
        Left = 6
        Top = 15
        Width = 275
        Height = 60
        Caption = 'Percentuais e taxas'
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 79
          Height = 13
          Caption = 'Juros ao m'#234's (%)'
        end
        object Label2: TLabel
          Left = 104
          Top = 16
          Width = 43
          Height = 13
          Caption = 'Multa (%)'
        end
        object Label41: TLabel
          Left = 200
          Top = 16
          Width = 68
          Height = 13
          Caption = 'Taxa ADM (%)'
        end
        object DBEdit2: TDBEdit
          Left = 104
          Top = 31
          Width = 89
          Height = 21
          DataField = 'perc_multa'
          DataSource = DataSource1
          TabOrder = 1
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 31
          Width = 89
          Height = 21
          DataField = 'perc_juros_mes'
          DataSource = DataSource1
          TabOrder = 0
        end
        object DBEdit34: TDBEdit
          Left = 197
          Top = 31
          Width = 71
          Height = 21
          DataField = 'taxaAdm'
          DataSource = DataSource1
          TabOrder = 2
        end
      end
      object db_bxtituloscarga: TDBComboBox
        Left = 663
        Top = 36
        Width = 162
        Height = 21
        DataField = 'baixaTit_Carga'
        DataSource = DataSource1
        ItemHeight = 13
        Items.Strings = (
          'Sim'
          'N'#227'o'
          'Baixa como Retirada')
        TabOrder = 2
      end
      object dbgird_faixas: TRxDBGrid
        Left = 2
        Top = 81
        Width = 837
        Height = 91
        Align = alBottom
        DataSource = dts_taxas
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnExit = RxDBGrid1Exit
        Columns = <
          item
            Expanded = False
            FieldName = 'codigo'
            Title.Caption = 'C'#243'digo'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'faixa1'
            Title.Caption = 'Faixa1'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'faixa2'
            Title.Caption = 'Faixa2'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'perc_desc_juros'
            Title.Caption = '(%) Desc Juros'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'perc_desc_multa'
            Title.Caption = '(%) Desc Multa'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'perc_desc_princ'
            Title.Caption = '(%) Desc Principal'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'perc_desc_tx_ADM'
            Title.Caption = '% Desc TX ADM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'perc_ret'
            Title.Caption = '(%) Reten'#231#227'o'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'forma_ret'
            PickList.Strings = (
              'Total Recebido'
              'Sobre Juros e Multa'
              'Sobre Principal')
            Title.Caption = 'Forma Reten'#231#227'o'
            Width = 125
            Visible = True
          end>
      end
      object GroupBox6: TGroupBox
        Left = 286
        Top = 15
        Width = 195
        Height = 60
        Caption = 'Valores Monet'#225'rios para cobran'#231'a'
        TabOrder = 1
        object Label42: TLabel
          Left = 56
          Top = 16
          Width = 77
          Height = 13
          Caption = 'Vr taxa banc'#225'ria'
        end
        object DBEdit35: TDBEdit
          Left = 58
          Top = 32
          Width = 73
          Height = 21
          DataField = 'vr_taxa_bancaria'
          DataSource = DataSource1
          TabOrder = 0
        end
      end
    end
    object DBEdit3: TDBEdit
      Left = 313
      Top = 17
      Width = 328
      Height = 24
      DataField = 'nome'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 651
      Top = 17
      Width = 178
      Height = 24
      DataField = 'cnpj'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object PageControl1: TPageControl
      Left = 316
      Top = 49
      Width = 517
      Height = 328
      ActivePage = TabSheet3
      TabOrder = 4
      object TabSheet1: TTabSheet
        Caption = 'Endere'#231'o'
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 509
          Height = 300
          Align = alClient
          TabOrder = 0
          object Label7: TLabel
            Left = 8
            Top = 15
            Width = 21
            Height = 13
            Caption = 'Tipo'
            FocusControl = DBEdit5
          end
          object Label8: TLabel
            Left = 48
            Top = 16
            Width = 54
            Height = 13
            Caption = 'Logradouro'
            FocusControl = DBEdit6
          end
          object Label9: TLabel
            Left = 426
            Top = 15
            Width = 37
            Height = 13
            Caption = 'N'#250'mero'
            FocusControl = DBEdit7
          end
          object Label10: TLabel
            Left = 8
            Top = 54
            Width = 64
            Height = 13
            Caption = 'Complemento'
            FocusControl = DBEdit8
          end
          object Label11: TLabel
            Left = 146
            Top = 56
            Width = 27
            Height = 13
            Caption = 'Bairro'
            FocusControl = DBEdit9
          end
          object Label12: TLabel
            Left = 301
            Top = 54
            Width = 33
            Height = 13
            Caption = 'Cidade'
            FocusControl = DBEdit10
          end
          object Label13: TLabel
            Left = 147
            Top = 91
            Width = 21
            Height = 13
            Caption = 'CEP'
            FocusControl = DBEdit11
          end
          object Label14: TLabel
            Left = 8
            Top = 94
            Width = 14
            Height = 13
            Caption = 'UF'
            FocusControl = DBEdit12
          end
          object Label15: TLabel
            Left = 221
            Top = 91
            Width = 93
            Height = 13
            Caption = 'Ponto de refer'#234'ncia'
            FocusControl = DBEdit13
          end
          object Label16: TLabel
            Left = 8
            Top = 130
            Width = 42
            Height = 13
            Caption = 'Telefone'
            FocusControl = DBEdit14
          end
          object Label17: TLabel
            Left = 149
            Top = 131
            Width = 20
            Height = 13
            Caption = 'FAX'
            FocusControl = DBEdit15
          end
          object Label18: TLabel
            Left = 252
            Top = 130
            Width = 24
            Height = 13
            Caption = '0800'
            FocusControl = DBEdit16
          end
          object Label19: TLabel
            Left = 8
            Top = 168
            Width = 28
            Height = 13
            Caption = 'e-Mail'
            FocusControl = DBEdit17
          end
          object Label20: TLabel
            Left = 8
            Top = 208
            Width = 35
            Height = 13
            Caption = 'SKYPE'
            FocusControl = DBEdit18
          end
          object Label21: TLabel
            Left = 287
            Top = 211
            Width = 24
            Height = 13
            Caption = 'MSN'
            FocusControl = DBEdit19
          end
          object Label22: TLabel
            Left = 8
            Top = 248
            Width = 231
            Height = 13
            Caption = 'Respons'#225'vel pela Cobran'#231'a Iinterna na Empresa'
            FocusControl = DBEdit20
          end
          object DBEdit5: TDBEdit
            Left = 8
            Top = 29
            Width = 39
            Height = 21
            DataField = 'TIPO_LOGRADOURO'
            DataSource = DataSource1
            TabOrder = 0
          end
          object DBEdit6: TDBEdit
            Left = 49
            Top = 31
            Width = 373
            Height = 21
            DataField = 'LOGRADOURO'
            DataSource = DataSource1
            TabOrder = 1
          end
          object DBEdit7: TDBEdit
            Left = 425
            Top = 30
            Width = 49
            Height = 21
            DataField = 'NUMERO'
            DataSource = DataSource1
            TabOrder = 2
          end
          object DBEdit8: TDBEdit
            Left = 8
            Top = 69
            Width = 137
            Height = 21
            DataField = 'COMPLEMENTO'
            DataSource = DataSource1
            TabOrder = 3
          end
          object DBEdit9: TDBEdit
            Left = 144
            Top = 69
            Width = 154
            Height = 21
            DataField = 'BAIRRO'
            DataSource = DataSource1
            TabOrder = 4
          end
          object DBEdit10: TDBEdit
            Left = 301
            Top = 68
            Width = 169
            Height = 21
            DataField = 'CIDADE'
            DataSource = DataSource1
            TabOrder = 5
          end
          object DBEdit11: TDBEdit
            Left = 146
            Top = 106
            Width = 65
            Height = 21
            DataField = 'CEP'
            DataSource = DataSource1
            TabOrder = 6
          end
          object DBEdit12: TDBEdit
            Left = 8
            Top = 106
            Width = 134
            Height = 21
            DataField = 'UF'
            DataSource = DataSource1
            TabOrder = 7
          end
          object DBEdit13: TDBEdit
            Left = 216
            Top = 105
            Width = 181
            Height = 21
            DataField = 'PONTO_REF'
            DataSource = DataSource1
            TabOrder = 8
          end
          object DBEdit14: TDBEdit
            Left = 8
            Top = 145
            Width = 131
            Height = 21
            DataField = 'TELEFONE'
            DataSource = DataSource1
            TabOrder = 9
          end
          object DBEdit15: TDBEdit
            Left = 148
            Top = 145
            Width = 98
            Height = 21
            DataField = 'FAX'
            DataSource = DataSource1
            TabOrder = 10
          end
          object DBEdit16: TDBEdit
            Left = 251
            Top = 144
            Width = 199
            Height = 21
            DataField = 'ZERO_OITOCENTOS'
            DataSource = DataSource1
            TabOrder = 11
          end
          object DBEdit17: TDBEdit
            Left = 8
            Top = 184
            Width = 469
            Height = 21
            DataField = 'EMAIL'
            DataSource = DataSource1
            TabOrder = 12
          end
          object DBEdit18: TDBEdit
            Left = 8
            Top = 224
            Width = 273
            Height = 21
            DataField = 'SKYPE'
            DataSource = DataSource1
            TabOrder = 13
          end
          object DBEdit19: TDBEdit
            Left = 288
            Top = 227
            Width = 190
            Height = 21
            DataField = 'MSN'
            DataSource = DataSource1
            TabOrder = 14
          end
          object DBEdit20: TDBEdit
            Left = 7
            Top = 262
            Width = 247
            Height = 21
            DataField = 'RESP_COBRAN'#199'A'
            DataSource = DataSource1
            TabOrder = 15
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Contas banc'#225'rias'
        ImageIndex = 1
        object GroupBox3: TGroupBox
          Left = 8
          Top = 8
          Width = 406
          Height = 97
          Caption = 'Primeiro Favorecido'
          TabOrder = 0
          object Label29: TLabel
            Left = 3
            Top = 14
            Width = 53
            Height = 13
            Caption = 'Favorecido'
            FocusControl = DBEdit19
          end
          object Label23: TLabel
            Left = 3
            Top = 55
            Width = 31
            Height = 13
            Caption = 'Banco'
            FocusControl = DBEdit21
          end
          object Label24: TLabel
            Left = 92
            Top = 55
            Width = 39
            Height = 13
            Caption = 'Ag'#234'ncia'
            FocusControl = DBEdit22
          end
          object Label25: TLabel
            Left = 188
            Top = 55
            Width = 28
            Height = 13
            Caption = 'Conta'
            FocusControl = DBEdit23
          end
          object DBEdit21: TDBEdit
            Left = 3
            Top = 70
            Width = 89
            Height = 21
            DataField = 'banco1'
            DataSource = DataSource1
            TabOrder = 0
          end
          object DBEdit22: TDBEdit
            Left = 94
            Top = 70
            Width = 82
            Height = 21
            DataField = 'agencia1'
            DataSource = DataSource1
            TabOrder = 1
          end
          object DBEdit23: TDBEdit
            Left = 188
            Top = 70
            Width = 134
            Height = 21
            DataField = 'conta1'
            DataSource = DataSource1
            TabOrder = 2
          end
          object DBEdit27: TDBEdit
            Left = 4
            Top = 30
            Width = 281
            Height = 21
            DataField = 'favorecido1'
            DataSource = DataSource1
            TabOrder = 3
          end
        end
        object GroupBox4: TGroupBox
          Left = 8
          Top = 112
          Width = 401
          Height = 113
          Caption = 'Segundo Favorecido'
          TabOrder = 1
          object Label26: TLabel
            Left = 8
            Top = 62
            Width = 31
            Height = 13
            Caption = 'Banco'
            FocusControl = DBEdit24
          end
          object Label27: TLabel
            Left = 98
            Top = 62
            Width = 39
            Height = 13
            Caption = 'Ag'#234'ncia'
            FocusControl = DBEdit25
          end
          object Label28: TLabel
            Left = 194
            Top = 62
            Width = 28
            Height = 13
            Caption = 'Conta'
            FocusControl = DBEdit26
          end
          object Label31: TLabel
            Left = 8
            Top = 16
            Width = 53
            Height = 13
            Caption = 'Favorecido'
            FocusControl = DBEdit24
          end
          object DBEdit24: TDBEdit
            Left = 8
            Top = 77
            Width = 89
            Height = 21
            DataField = 'banco2'
            DataSource = DataSource1
            TabOrder = 0
          end
          object DBEdit25: TDBEdit
            Left = 99
            Top = 77
            Width = 82
            Height = 21
            DataField = 'agencia2'
            DataSource = DataSource1
            TabOrder = 1
          end
          object DBEdit26: TDBEdit
            Left = 194
            Top = 77
            Width = 134
            Height = 21
            DataField = 'conta2'
            DataSource = DataSource1
            TabOrder = 2
          end
          object DBEdit28: TDBEdit
            Left = 8
            Top = 34
            Width = 260
            Height = 21
            DataField = 'favorecido2'
            DataSource = DataSource1
            TabOrder = 3
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Outros'
        ImageIndex = 2
        object Label30: TLabel
          Left = 16
          Top = 16
          Width = 32
          Height = 13
          Caption = 'Inativo'
        end
        object Label32: TLabel
          Left = 146
          Top = 15
          Width = 189
          Height = 13
          Caption = 'Tipo de atraso para reten'#231#227'o/comiss'#227'o:'
        end
        object DBDateEdit1: TDBDateEdit
          Left = 13
          Top = 33
          Width = 121
          Height = 21
          DataField = 'inativado'
          DataSource = DataSource1
          NumGlyphs = 2
          TabOrder = 0
        end
        object DBComboBox1: TDBComboBox
          Left = 145
          Top = 31
          Width = 181
          Height = 21
          DataField = 'tipoatraso'
          DataSource = DataSource1
          ItemHeight = 13
          Items.Strings = (
            'A-Atraso no t'#237'tulo'
            'M-Maior atraso devedor')
          TabOrder = 1
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 16
          Top = 88
          Width = 417
          Height = 113
          Caption = 'Tipo de layout'
          Columns = 3
          DataField = 'layout_Inteq'
          DataSource = DataSource1
          Items.Strings = (
            'I-Inteq'
            'P-Pr'#243'prio'
            'S-Secrel'
            'E-Esplanada'
            'C-Excel (CSV-DOS)'
            'R-Redesplan'
            'M-Maresia'
            'O-Casa Pio'
            '1-Arruda')
          TabOrder = 2
          Values.Strings = (
            'I'
            'P'
            'S'
            'E'
            'C'
            'R'
            'M'
            'O'
            '1')
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'SPC'
        ImageIndex = 3
        object Label33: TLabel
          Left = 8
          Top = 8
          Width = 61
          Height = 13
          Caption = 'Raz'#227'o social'
          FocusControl = DBEdit29
        end
        object Label34: TLabel
          Left = 8
          Top = 49
          Width = 76
          Height = 13
          Caption = 'C'#243'digo do s'#243'cio'
          FocusControl = DBEdit30
        end
        object Label35: TLabel
          Left = 112
          Top = 47
          Width = 92
          Height = 13
          Caption = 'C'#243'digo de entidade'
          FocusControl = DBEdit31
        end
        object Label36: TLabel
          Left = 7
          Top = 91
          Width = 134
          Height = 13
          Caption = 'Dias de atraso para remessa'
          FocusControl = DBEdit32
        end
        object Label37: TLabel
          Left = 8
          Top = 140
          Width = 100
          Height = 13
          Caption = 'Natureza de inclus'#227'o'
        end
        object Label38: TLabel
          Left = 9
          Top = 191
          Width = 114
          Height = 13
          Caption = 'Retirar por negocia'#231#227'o?'
        end
        object DBEdit29: TDBEdit
          Left = 8
          Top = 24
          Width = 457
          Height = 21
          DataField = 'razaosocial'
          DataSource = DataSource1
          TabOrder = 0
        end
        object DBEdit30: TDBEdit
          Left = 8
          Top = 64
          Width = 56
          Height = 21
          DataField = 'codsocio'
          DataSource = DataSource1
          TabOrder = 1
        end
        object DBEdit31: TDBEdit
          Left = 114
          Top = 62
          Width = 108
          Height = 21
          DataField = 'codentidade'
          DataSource = DataSource1
          TabOrder = 2
        end
        object DBEdit32: TDBEdit
          Left = 7
          Top = 107
          Width = 134
          Height = 21
          DataField = 'diasatrasoremessaspc'
          DataSource = DataSource1
          TabOrder = 3
        end
        object cbox_naturezainclusao: TDBComboBox
          Left = 8
          Top = 155
          Width = 489
          Height = 21
          CharCase = ecUpperCase
          DataField = 'naturezainclusaospc'
          DataSource = DataSource1
          ItemHeight = 13
          TabOrder = 4
        end
        object RxDBComboBox1: TRxDBComboBox
          Left = 8
          Top = 208
          Width = 145
          Height = 21
          DataField = 'retirarPorNegociacao'
          DataSource = DataSource1
          EnableValues = False
          ItemHeight = 13
          Items.Strings = (
            'S-Sim'
            'N- N'#227'o')
          TabOrder = 5
        end
        object GroupBox5: TGroupBox
          Left = 168
          Top = 184
          Width = 329
          Height = 105
          Caption = 'Tipos de t'#237'tulos para enviar ao SPC'
          TabOrder = 6
          object Label39: TLabel
            Left = 8
            Top = 48
            Width = 77
            Height = 13
            Caption = 'Tipos de T'#237'tulos'
            FocusControl = DBEdit33
          end
          object Label40: TLabel
            Left = 8
            Top = 24
            Width = 21
            Height = 13
            Caption = 'Tipo'
            FocusControl = DBEdit33
          end
          object SpeedButton1: TSpeedButton
            Left = 84
            Top = 19
            Width = 20
            Height = 23
            Caption = 'ok'
            OnClick = SpeedButton1Click
          end
          object edt_tipo: TComboBox
            Left = 34
            Top = 20
            Width = 47
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            OnExit = edt_tipoExit
          end
          object DBEdit33: TDBEdit
            Left = 8
            Top = 64
            Width = 313
            Height = 21
            DataField = 'tiposDeTitulos'
            DataSource = DataSource1
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    Left = 544
    Top = 81
  end
  inherited Query1: TADODataSet
    CursorType = ctStatic
    BeforePost = Query1BeforePost
    AfterScroll = Query1AfterScroll
    CommandText = 'select * from clientes order by nome'
    object Query1pk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object Query1nome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object Query1cnpj: TStringField
      FieldName = 'cnpj'
    end
    object Query1layout_Inteq: TStringField
      FieldName = 'layout_Inteq'
      Size = 1
    end
    object Query1baixaTit_Carga: TStringField
      FieldName = 'baixaTit_Carga'
      Size = 1
    end
    object Query1arquivaBxParcial: TStringField
      FieldName = 'arquivaBxParcial'
      FixedChar = True
      Size = 1
    end
    object Query1TIPO_LOGRADOURO: TStringField
      FieldName = 'TIPO_LOGRADOURO'
      Size = 10
    end
    object Query1LOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 50
    end
    object Query1NUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object Query1COMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object Query1BAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object Query1CIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object Query1CEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object Query1UF: TStringField
      FieldName = 'UF'
      Size = 50
    end
    object Query1PONTO_REF: TStringField
      FieldName = 'PONTO_REF'
      Size = 30
    end
    object Query1TELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
    object Query1FAX: TStringField
      FieldName = 'FAX'
    end
    object Query1ZERO_OITOCENTOS: TStringField
      FieldName = 'ZERO_OITOCENTOS'
      Size = 15
    end
    object Query1EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object Query1SKYPE: TStringField
      FieldName = 'SKYPE'
      Size = 40
    end
    object Query1MSN: TStringField
      FieldName = 'MSN'
      Size = 60
    end
    object Query1RESP_COBRANA: TStringField
      FieldName = 'RESP_COBRAN'#199'A'
      Size = 60
    end
    object Query1banco1: TStringField
      FieldName = 'banco1'
      Size = 10
    end
    object Query1agencia1: TStringField
      FieldName = 'agencia1'
      Size = 6
    end
    object Query1conta1: TStringField
      FieldName = 'conta1'
      Size = 10
    end
    object Query1banco2: TStringField
      FieldName = 'banco2'
      Size = 10
    end
    object Query1agencia2: TStringField
      FieldName = 'agencia2'
      Size = 6
    end
    object Query1conta2: TStringField
      FieldName = 'conta2'
      Size = 10
    end
    object Query1favorecido1: TStringField
      FieldName = 'favorecido1'
      Size = 40
    end
    object Query1favorecido2: TStringField
      FieldName = 'favorecido2'
      Size = 40
    end
    object Query1inativado: TDateTimeField
      FieldName = 'inativado'
    end
    object Query1perc_juros_mes: TBCDField
      FieldName = 'perc_juros_mes'
      Precision = 18
      Size = 0
    end
    object Query1perc_multa: TBCDField
      FieldName = 'perc_multa'
      Precision = 18
      Size = 0
    end
    object Query1tipoatraso: TStringField
      FieldName = 'tipoatraso'
      Size = 1
    end
    object Query1codsocio: TStringField
      FieldName = 'codsocio'
      Size = 4
    end
    object Query1codentidade: TStringField
      FieldName = 'codentidade'
      Size = 8
    end
    object Query1razaosocial: TStringField
      FieldName = 'razaosocial'
      Size = 120
    end
    object Query1diasatrasoremessaspc: TIntegerField
      FieldName = 'diasatrasoremessaspc'
    end
    object Query1naturezainclusaospc: TStringField
      FieldName = 'naturezainclusaospc'
      Size = 2
    end
    object Query1retirarPorNegociacao: TStringField
      FieldName = 'retirarPorNegociacao'
      Size = 1
    end
    object Query1tiposDeTitulos: TStringField
      FieldName = 'tiposDeTitulos'
      Size = 200
    end
    object Query1taxaAdm: TBCDField
      FieldName = 'taxaAdm'
      Precision = 12
      Size = 2
    end
    object Query1vr_taxa_bancaria: TBCDField
      FieldName = 'vr_taxa_bancaria'
      Precision = 12
      Size = 2
    end
    object Query1vr_segunda_via: TBCDField
      FieldName = 'vr_segunda_via'
      Precision = 12
      Size = 2
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
    Left = 176
    Top = 112
    object seq_tabelastabela: TStringField
      FieldName = 'tabela'
      Size = 15
    end
    object seq_tabelasseq: TIntegerField
      FieldName = 'seq'
    end
  end
  object taxas: TADODataSet
    Connection = DM.DB
    CursorType = ctStatic
    BeforePost = taxasBeforePost
    CommandText = 
      'select *'#13#10'from taxas_clientes'#13#10'where pk_cliente = :cliente'#13#10'orde' +
      'r by codigo'
    Parameters = <
      item
        Name = 'cliente'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 152
    Top = 168
    object taxaspk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object taxaspk_faixa: TIntegerField
      FieldName = 'pk_faixa'
    end
    object taxascodigo: TStringField
      FieldName = 'codigo'
      Size = 3
    end
    object taxasfaixa1: TIntegerField
      FieldName = 'faixa1'
    end
    object taxasfaixa2: TIntegerField
      FieldName = 'faixa2'
    end
    object taxasperc_desc_juros: TBCDField
      FieldName = 'perc_desc_juros'
      Precision = 18
      Size = 0
    end
    object taxasperc_desc_multa: TBCDField
      FieldName = 'perc_desc_multa'
      Precision = 18
      Size = 0
    end
    object taxasperc_desc_princ: TBCDField
      FieldName = 'perc_desc_princ'
      Precision = 18
      Size = 0
    end
    object taxasperc_ret: TBCDField
      FieldName = 'perc_ret'
      Precision = 18
      Size = 0
    end
    object taxasforma_ret: TStringField
      FieldName = 'forma_ret'
      Size = 30
    end
    object taxasperc_desc_tx_ADM: TBCDField
      FieldName = 'perc_desc_tx_ADM'
      Precision = 12
      Size = 2
    end
  end
  object dts_taxas: TDataSource
    DataSet = taxas
    Left = 192
    Top = 176
  end
end
