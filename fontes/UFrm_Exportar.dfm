object Frm_Exportar: TFrm_Exportar
  Left = 252
  Top = 151
  Width = 620
  Height = 415
  Caption = 'Exportar'
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
    Width = 604
    Height = 337
    Align = alClient
    BevelOuter = bvNone
    Color = clInfoBk
    TabOrder = 1
    object Gauge_atualizando: TGauge
      Left = 424
      Top = 69
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
      Left = 424
      Top = 13
      Width = 107
      Height = 36
      Hint = 'Carrega dados da Agenda Di'#225'ria'
      Caption = 'Gerar Arquivo'
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
    object lb_status: TLabel
      Left = 696
      Top = 96
      Width = 113
      Height = 13
      AutoSize = False
    end
    object Label2: TLabel
      Left = 16
      Top = 81
      Width = 89
      Height = 13
      Caption = 'Inicio Vencimentos'
    end
    object Label3: TLabel
      Left = 224
      Top = 83
      Width = 22
      Height = 13
      Caption = 'Final'
    end
    object gb_enviar: TGroupBox
      Left = 8
      Top = 27
      Width = 369
      Height = 46
      Caption = 'Nome do arquivo'
      TabOrder = 0
      object DBEdit1: TEdit
        Left = 8
        Top = 17
        Width = 353
        Height = 21
        TabOrder = 0
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
    object Memo1: TMemo
      Left = 8
      Top = 104
      Width = 569
      Height = 217
      Enabled = False
      Lines.Strings = (
        'Memo1')
      TabOrder = 2
    end
    object edt_atraso1: TDateEdit
      Left = 111
      Top = 78
      Width = 106
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
    object edt_atraso2: TDateEdit
      Left = 257
      Top = 78
      Width = 104
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 4
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 604
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Gera arquivos'
    Color = 4210688
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 482
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
    DataSet = tb_Cliente
    Left = 416
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
      end>
    SQL.Strings = (
      'select *'
      'from devedores'
      'where cgc_cpf=:cpf')
    Left = 56
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
  object tb_Cliente: TADOTable
    Connection = DM.DB
    TableName = 'clientes'
    Left = 216
    Top = 16
  end
end
