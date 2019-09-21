inherited Frm_CadUsu: TFrm_CadUsu
  Width = 650
  Height = 493
  Caption = 'Cadastro de Usu'#225'rios'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar: TSpeedBar
    Width = 642
    object SpeedbarSection3: TSpeedbarSection [1]
      Caption = 'Untitled (1)'
    end
  end
  inherited Panel1: TPanel
    Top = 412
    Width = 642
  end
  inherited StatusBar1: TStatusBar
    Top = 447
    Width = 642
  end
  inherited Panel2: TPanel
    Width = 642
    Height = 356
    object Label1: TLabel
      Left = 8
      Top = 288
      Width = 31
      Height = 13
      Caption = 'Senha'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 299
      Top = 259
      Width = 83
      Height = 13
      Caption = 'Grupo do Usu'#225'rio'
    end
    object Label5: TLabel
      Left = 3
      Top = 240
      Width = 22
      Height = 13
      Caption = 'login'
      FocusControl = DBEdit2
    end
    object Label4: TLabel
      Left = 104
      Top = 240
      Width = 28
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit3
    end
    object Label2: TLabel
      Left = 110
      Top = 277
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 640
      Height = 239
      Align = alTop
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
          FieldName = 'login'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome'
          Visible = True
        end>
    end
    object DBEdit1: TDBEdit
      Left = 48
      Top = 288
      Width = 57
      Height = 21
      DataField = 'Senha'
      DataSource = DataSource1
      PasswordChar = '*'
      TabOrder = 1
    end
    object lk_grupo: TRxDBLookupCombo
      Left = 389
      Top = 256
      Width = 144
      Height = 21
      DropDownCount = 8
      DataField = 'PK_GRUPO'
      DataSource = DataSource1
      LookupField = 'pk_grupo'
      LookupDisplay = 'nome'
      LookupDisplayIndex = 5
      LookupSource = dts_grupo
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 3
      Top = 255
      Width = 101
      Height = 21
      DataField = 'login'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 104
      Top = 255
      Width = 187
      Height = 21
      DataField = 'Nome'
      DataSource = DataSource1
      TabOrder = 4
    end
    object cb_logado: TCheckBox
      Left = 472
      Top = 304
      Width = 57
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Logado'
      Enabled = False
      TabOrder = 5
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 109
      Top = 289
      Width = 144
      Height = 21
      DropDownCount = 8
      DataField = 'pk_cliente'
      DataSource = DataSource1
      LookupField = 'pk_cliente'
      LookupDisplay = 'nome'
      LookupDisplayIndex = 5
      LookupSource = dts_clientes
      TabOrder = 6
    end
    object cb_limparCliente: TCheckBox
      Left = 264
      Top = 296
      Width = 89
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Limpar Cliente'
      TabOrder = 7
      OnClick = cb_limparClienteClick
    end
  end
  inherited Query1: TADODataSet
    BeforeInsert = Query1BeforeInsert
    BeforeEdit = Query1BeforeEdit
    BeforePost = Query1BeforePost
    AfterScroll = Query1AfterScroll
    CommandText = 'select * from usuarios'
    object Query1nu_usu: TIntegerField
      FieldName = 'nu_usu'
    end
    object Query1login: TWideStringField
      FieldName = 'login'
      Size = 15
    end
    object Query1Senha: TWideStringField
      FieldName = 'Senha'
      Size = 10
    end
    object Query1Nome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object Query1PK_GRUPO: TIntegerField
      FieldName = 'PK_GRUPO'
    end
    object Query1logado: TStringField
      FieldName = 'logado'
      Size = 1
    end
    object Query1nivel_acesso: TIntegerField
      FieldName = 'nivel_acesso'
    end
    object Query1pk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
  end
  object tabelas: TADODataSet
    Connection = DM.DB
    CommandText = 'select * from tabela where tabela=:tb'
    Parameters = <
      item
        Name = 'tb'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    Left = 488
    Top = 200
    object tabelastabela: TStringField
      FieldName = 'tabela'
      Size = 15
    end
    object tabelasseq: TIntegerField
      FieldName = 'seq'
    end
  end
  object qry_grupos: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from gruposusu'
      'order by nome')
    Left = 376
    Top = 272
  end
  object dts_grupo: TDataSource
    DataSet = qry_grupos
    Left = 416
    Top = 272
  end
  object Qry_clientes: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from clientes'
      'order by nome')
    Left = 264
    Top = 256
  end
  object dts_clientes: TDataSource
    DataSet = Qry_clientes
    Left = 304
    Top = 256
  end
end
