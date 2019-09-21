inherited Frm_config: TFrm_config
  Left = 294
  Top = 52
  Width = 935
  Height = 667
  Caption = 'Configura'#231#227'o de e-Mails'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar: TSpeedBar
    Width = 927
  end
  inherited Panel1: TPanel
    Top = 586
    Width = 927
  end
  inherited StatusBar1: TStatusBar
    Top = 621
    Width = 927
  end
  inherited Panel2: TPanel
    Width = 927
    Height = 530
    object PageControl1: TPageControl
      Left = 233
      Top = 1
      Width = 693
      Height = 469
      ActivePage = TabSheet3
      Align = alClient
      TabOrder = 0
      object TabSheet3: TTabSheet
        Caption = 'Geral'
        ImageIndex = 2
        object Label5: TLabel
          Left = 8
          Top = 8
          Width = 130
          Height = 13
          Caption = 'Formato data Banco Dados'
          FocusControl = DBEdit6
        end
        object Label6: TLabel
          Left = 152
          Top = 5
          Width = 138
          Height = 13
          Caption = 'F'#243'rmula Calc Juros do Cart'#227'o'
          FocusControl = DBEdit7
        end
        object Label8: TLabel
          Left = 8
          Top = 64
          Width = 109
          Height = 13
          Caption = 'Ocorr'#234'ncia Pagou total'
        end
        object Label9: TLabel
          Left = 8
          Top = 112
          Width = 121
          Height = 13
          Caption = 'Ocorr'#234'ncia Pagou Parcial'
        end
        object DBEdit6: TDBEdit
          Left = 8
          Top = 24
          Width = 129
          Height = 21
          Hint = 'DD/MM/YYYY'
          DataField = 'FORMATO_DT'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object DBEdit7: TDBEdit
          Left = 152
          Top = 21
          Width = 134
          Height = 21
          Hint = 'JUROS_CARTAO'
          DataField = 'CALC_JUROS_CARTAO'
          DataSource = DataSource1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object RxDBLookupCombo3: TRxDBLookupCombo
          Left = 9
          Top = 130
          Width = 329
          Height = 21
          DropDownCount = 8
          DataField = 'OCOR_PAGOU_PARC'
          DataSource = DataSource1
          LookupField = 'pk_ocorr'
          LookupDisplay = 'Nome'
          LookupDisplayIndex = 5
          LookupSource = Dts_ocorr
          TabOrder = 2
        end
        object RxDBLookupCombo1: TRxDBLookupCombo
          Left = 10
          Top = 79
          Width = 329
          Height = 21
          DropDownCount = 8
          DataField = 'OCOR_PAGOU'
          DataSource = DataSource1
          LookupField = 'pk_ocorr'
          LookupDisplay = 'nome'
          LookupDisplayIndex = 5
          LookupSource = Dts_ocorr
          TabOrder = 3
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Conta de e-Mail'
        ImageIndex = 1
        object Label17: TLabel
          Left = 8
          Top = 233
          Width = 229
          Height = 13
          Caption = 'Ocorr'#234'ncia que ser'#225' gravada no envio de E-Mail'
        end
        object GroupBox1: TGroupBox
          Left = 4
          Top = 2
          Width = 401
          Height = 207
          Caption = 'Configura'#231#227'o Servidor SMTP/POP'
          TabOrder = 0
          object Label2: TLabel
            Left = 5
            Top = 19
            Width = 55
            Height = 13
            Caption = 'Host SMTP'
          end
          object Label4: TLabel
            Left = 10
            Top = 112
            Width = 36
            Height = 13
            Caption = 'Usu'#225'rio'
          end
          object Label7: TLabel
            Left = 239
            Top = 112
            Width = 31
            Height = 13
            Caption = 'Senha'
          end
          object Label1: TLabel
            Left = 9
            Top = 156
            Width = 28
            Height = 13
            Caption = 'Conta'
          end
          object Label11: TLabel
            Left = 238
            Top = 15
            Width = 25
            Height = 13
            Caption = 'Porta'
          end
          object DBEdit2: TDBEdit
            Left = 10
            Top = 127
            Width = 220
            Height = 21
            DataField = 'EMAIL_NOME'
            DataSource = DataSource1
            TabOrder = 0
          end
          object DBEdit3: TDBEdit
            Left = 239
            Top = 127
            Width = 89
            Height = 21
            DataField = 'EMAIL_SENHA'
            DataSource = DataSource1
            PasswordChar = '*'
            TabOrder = 1
          end
          object DBEdit4: TDBEdit
            Left = 9
            Top = 171
            Width = 219
            Height = 21
            DataField = 'EMAIL_CONTA'
            DataSource = DataSource1
            TabOrder = 2
          end
          object Panel6: TPanel
            Left = 1
            Top = 103
            Width = 399
            Height = 2
            BevelOuter = bvLowered
            TabOrder = 3
          end
          object DBRadioGroup3: TDBRadioGroup
            Left = 6
            Top = 60
            Width = 149
            Height = 37
            Caption = 'Servidor requer autentica'#231#227'o'
            Columns = 2
            DataField = 'EMAIL_REQUER_AUT'
            DataSource = DataSource1
            Items.Strings = (
              'Sim'
              'N'#227'o')
            TabOrder = 4
            Values.Strings = (
              'S'
              'N')
          end
          object DBEdit1: TDBEdit
            Left = 5
            Top = 33
            Width = 227
            Height = 21
            DataField = 'EMAIL_SMTP'
            DataSource = DataSource1
            TabOrder = 5
          end
          object DBEdit10: TDBEdit
            Left = 240
            Top = 32
            Width = 43
            Height = 21
            DataField = 'EMAIL_SMTP_PORTA'
            DataSource = DataSource1
            TabOrder = 6
          end
        end
        object RxDBLookupCombo4: TRxDBLookupCombo
          Left = 10
          Top = 248
          Width = 391
          Height = 21
          DropDownCount = 8
          DataField = 'OCOR_ENV_EMAIL'
          DataSource = DataSource1
          LookupField = 'pk_ocorr'
          LookupDisplay = 'nome'
          LookupDisplayIndex = 5
          LookupSource = Dts_ocorr
          TabOrder = 1
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Formata'#231#227'o dos e-Mails'
        ImageIndex = 2
        object Label3: TLabel
          Left = 8
          Top = 68
          Width = 75
          Height = 13
          Caption = 'Assunto Padr'#227'o'
        end
        object Label15: TLabel
          Left = 8
          Top = 16
          Width = 135
          Height = 13
          Caption = 'Caminho logotipo para e-mail'
          FocusControl = DBEdit8
        end
        object DBMemo1: TDBMemo
          Left = 8
          Top = 84
          Width = 737
          Height = 25
          DataField = 'EMAIL_ASSUNTO'
          DataSource = DataSource1
          TabOrder = 0
        end
        object GroupBox2: TGroupBox
          Left = 8
          Top = 180
          Width = 737
          Height = 259
          Caption = 'Corpo do e-Mail'
          TabOrder = 1
          object Label10: TLabel
            Left = 9
            Top = 14
            Width = 65
            Height = 13
            Caption = 'T'#237'tulo Padr'#227'o'
          end
          object Label12: TLabel
            Left = 7
            Top = 185
            Width = 75
            Height = 13
            Caption = 'Rodap'#233' Padr'#227'o'
          end
          object Label16: TLabel
            Left = 14
            Top = 79
            Width = 76
            Height = 13
            Caption = 'EMAIL_CORPO'
          end
          object DBMemo2: TDBMemo
            Left = 10
            Top = 31
            Width = 662
            Height = 43
            DataField = 'EMAIL_TITULO'
            DataSource = DataSource1
            TabOrder = 0
          end
          object DBMemo3: TDBMemo
            Left = 8
            Top = 202
            Width = 718
            Height = 49
            DataField = 'EMAIL_RODAPE'
            DataSource = DataSource1
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object DBMemo4: TDBMemo
            Left = 9
            Top = 96
            Width = 662
            Height = 85
            DataField = 'EMAIL_CORPO'
            DataSource = DataSource1
            ScrollBars = ssVertical
            TabOrder = 2
          end
        end
        object DBEdit8: TDBEdit
          Left = 8
          Top = 32
          Width = 673
          Height = 21
          DataField = 'logotipo_email'
          DataSource = DataSource1
          TabOrder = 2
        end
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 232
      Height = 469
      Align = alLeft
      DataSource = DataSource1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME'
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 470
      Width = 925
      Height = 59
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object Label13: TLabel
        Left = 7
        Top = 4
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = DBEdit5
      end
      object Label14: TLabel
        Left = 418
        Top = 0
        Width = 30
        Height = 13
        Caption = 'Ciente'
      end
      object DBEdit5: TDBEdit
        Left = 9
        Top = 21
        Width = 394
        Height = 21
        DataField = 'NOME'
        DataSource = DataSource1
        TabOrder = 0
      end
      object RxDBLookupCombo2: TRxDBLookupCombo
        Left = 419
        Top = 20
        Width = 329
        Height = 21
        DropDownCount = 8
        DataField = 'CLIENTE'
        DataSource = DataSource1
        LookupField = 'pk_cliente'
        LookupDisplay = 'Nome'
        LookupDisplayIndex = 5
        LookupSource = dts_cliente
        TabOrder = 1
      end
    end
  end
  inherited Query1: TADODataSet
    CursorType = ctStatic
    AfterInsert = Query1AfterInsert
    OnCalcFields = Query1CalcFields
    CommandText = 'select * from tb_config'
    object Query1PK_ORDEM: TBCDField
      FieldName = 'PK_ORDEM'
      Precision = 18
      Size = 0
    end
    object Query1CLIENTE: TBCDField
      FieldName = 'CLIENTE'
      Precision = 18
      Size = 0
    end
    object Query1NOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object Query1FORMATO_DT: TStringField
      FieldName = 'FORMATO_DT'
    end
    object Query1OCOR_PAGOU: TBCDField
      FieldName = 'OCOR_PAGOU'
      Precision = 18
      Size = 0
    end
    object Query1OCOR_PAGOU_PARC: TBCDField
      FieldName = 'OCOR_PAGOU_PARC'
      Precision = 18
      Size = 0
    end
    object Query1EMAIL_NOME: TStringField
      FieldName = 'EMAIL_NOME'
      Size = 30
    end
    object Query1EMAIL_CONTA: TStringField
      FieldName = 'EMAIL_CONTA'
      Size = 60
    end
    object Query1EMAIL_SENHA: TStringField
      FieldName = 'EMAIL_SENHA'
    end
    object Query1EMAIL_SMTP: TStringField
      FieldName = 'EMAIL_SMTP'
      Size = 60
    end
    object Query1EMAIL_SMTP_PORTA: TStringField
      FieldName = 'EMAIL_SMTP_PORTA'
      Size = 3
    end
    object Query1EMAIL_REQUER_AUT: TStringField
      FieldName = 'EMAIL_REQUER_AUT'
      Size = 1
    end
    object Query1EMAIL_ASSUNTO: TStringField
      FieldName = 'EMAIL_ASSUNTO'
      Size = 200
    end
    object Query1EMAIL_TITULO: TStringField
      FieldName = 'EMAIL_TITULO'
      Size = 200
    end
    object Query1EMAIL_RODAPE: TStringField
      FieldName = 'EMAIL_RODAPE'
      Size = 200
    end
    object Query1nm_cliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'nm_cliente'
      Size = 40
      Calculated = True
    end
    object Query1CALC_JUROS_CARTAO: TStringField
      FieldName = 'CALC_JUROS_CARTAO'
    end
    object Query1logotipo_email: TStringField
      FieldName = 'logotipo_email'
      Size = 150
    end
    object Query1EMAIL_CORPO: TStringField
      FieldName = 'EMAIL_CORPO'
      Size = 1000
    end
    object Query1OCOR_ENV_EMAIL: TBCDField
      FieldName = 'OCOR_ENV_EMAIL'
      Precision = 18
      Size = 0
    end
  end
  inherited Table1: TTable
    Left = 816
    Top = 8
  end
  object qry_cliente: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select * from clientes')
    Left = 661
    Top = 138
  end
  object dts_cliente: TDataSource
    DataSet = qry_cliente
    Left = 709
    Top = 146
  end
  object Qry_ocorr: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from ocorrencias'
      'order by nome')
    Left = 381
    Top = 234
  end
  object Dts_ocorr: TDataSource
    DataSet = Qry_ocorr
    Left = 429
    Top = 242
  end
end
