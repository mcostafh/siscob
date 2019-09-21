object Frm_Transferir: TFrm_Transferir
  Left = 198
  Top = 98
  Width = 991
  Height = 620
  Caption = 'Transfer'#234'ncia'
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
    Width = 975
    Height = 541
    Align = alClient
    BevelOuter = bvNone
    Color = clInfoBk
    TabOrder = 1
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 975
      Height = 147
      Align = alTop
      Color = clInfoBk
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 35
        Height = 13
        Caption = 'Cliente:'
      end
      object Label3: TLabel
        Left = 8
        Top = 32
        Width = 124
        Height = 13
        Caption = 'Carteira - Cobrador Origem'
      end
      object Label5: TLabel
        Left = 259
        Top = 32
        Width = 127
        Height = 13
        Caption = 'Carteira - Cobrador Destino'
      end
      object Gauge_atualizando: TGauge
        Left = 936
        Top = 7
        Width = 17
        Height = 85
        Kind = gkVerticalBar
        Progress = 0
        Visible = False
      end
      object lb_mens: TLabel
        Left = 681
        Top = 76
        Width = 145
        Height = 13
        AutoSize = False
      end
      object lb_total: TLabel
        Left = 368
        Top = 120
        Width = 31
        Height = 16
        Caption = 'total'
        Color = clGrayText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Visible = False
      end
      object Label2: TLabel
        Left = 366
        Top = 79
        Width = 72
        Height = 13
        Caption = 'Tipo de T'#237'tulos'
      end
      object Label4: TLabel
        Left = 456
        Top = 79
        Width = 78
        Height = 13
        Caption = 'Qtde Devedores'
      end
      object Label6: TLabel
        Left = 520
        Top = 33
        Width = 96
        Height = 13
        Caption = 'CNPJ/CPF Devedor'
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
        OnExit = lk_clienteExit
      end
      object cb_cobrador: TRxDBLookupCombo
        Left = 8
        Top = 45
        Width = 249
        Height = 21
        DropDownCount = 8
        LookupField = 'nu_usu'
        LookupDisplay = 'Nome'
        LookupDisplayIndex = 5
        LookupSource = dts_usuarios
        TabOrder = 1
      end
      object cb_cobradorDest: TRxDBLookupCombo
        Left = 259
        Top = 47
        Width = 254
        Height = 20
        DropDownCount = 8
        LookupField = 'nu_usu'
        LookupDisplay = 'Nome'
        LookupDisplayIndex = 5
        LookupSource = dts_usuarios
        TabOrder = 2
      end
      object GroupBox5: TGroupBox
        Left = 6
        Top = 73
        Width = 353
        Height = 66
        Caption = 'Devedores em atraso no per'#237'odo '
        TabOrder = 3
        object Label8: TLabel
          Left = 182
          Top = 21
          Width = 15
          Height = 13
          Caption = 'at'#233
        end
        object Label48: TLabel
          Left = 4
          Top = 23
          Width = 14
          Height = 13
          Caption = 'De'
        end
        object Label61: TLabel
          Left = 8
          Top = 43
          Width = 138
          Height = 14
          Caption = 'Ex.: 120   08/05/2009'
          Color = clWindow
          Font.Charset = ANSI_CHARSET
          Font.Color = cl3DDkShadow
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label70: TLabel
          Left = 184
          Top = 43
          Width = 138
          Height = 14
          Caption = 'Ex.: 60     07/07/2009'
          Color = clWindow
          Font.Charset = ANSI_CHARSET
          Font.Color = cl3DDkShadow
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object edt_fx1: TEdit
          Left = 27
          Top = 18
          Width = 41
          Height = 21
          Hint = 'Ex: 30 a 60 dias em atraso'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnExit = edt_fx1Exit
        end
        object edt_fx2: TEdit
          Left = 207
          Top = 18
          Width = 34
          Height = 21
          Hint = 'Ex: 30 a 60 dias em atraso'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnExit = edt_fx2Exit
        end
        object edt_atraso1: TDateEdit
          Left = 71
          Top = 18
          Width = 106
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
        object edt_atraso2: TDateEdit
          Left = 243
          Top = 18
          Width = 104
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
      end
      object GroupBox1: TGroupBox
        Left = 728
        Top = 5
        Width = 177
        Height = 129
        TabOrder = 4
        object sb_Buscar: TSpeedButton
          Left = 22
          Top = 14
          Width = 134
          Height = 36
          Hint = 'Carrega dados da Agenda Di'#225'ria'
          Caption = 'Buscar'
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
          OnClick = sb_BuscarClick
        end
        object btn_transferir: TSpeedButton
          Left = 22
          Top = 56
          Width = 134
          Height = 36
          Hint = 'Carrega dados da Agenda Di'#225'ria'
          Caption = 'Gravar Transfer'#234'ncia'
          Enabled = False
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
          OnClick = btn_transferirClick
        end
        object Gauge1: TGauge
          Left = 22
          Top = 99
          Width = 135
          Height = 22
          Progress = 0
          Visible = False
        end
      end
      object edt_tipotitulo: TEdit
        Left = 366
        Top = 94
        Width = 57
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 2
        TabOrder = 5
      end
      object cb_naoacionados: TCheckBox
        Left = 544
        Top = 79
        Width = 145
        Height = 17
        Caption = 'Somente n'#227'o acionados'
        TabOrder = 6
      end
      object edt_qtde: TEdit
        Left = 455
        Top = 94
        Width = 63
        Height = 21
        TabOrder = 7
      end
      object cpf_devedor: TEdit
        Left = 519
        Top = 47
        Width = 181
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 147
      Width = 975
      Height = 394
      Align = alClient
      DataSource = dts_devedor
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CGC_CPF'
          Width = 158
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome'
          Width = 345
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 975
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Transfer'#234'ncia entre Cobradores'
    Color = 4210688
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 779
      Top = 2
      Width = 102
      Height = 33
      Hint = 'Esconde a tela'
      Caption = 'Sair e &Fechar'
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
    Left = 860
    Top = 197
  end
  object Dts_cliente: TDataSource
    DataSet = tb_cliente
    Left = 416
    Top = 8
  end
  object qry_devedor: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select d.*'
      'from devedores d'
      'where  1=2'
      
        'and exists( select 1 from titulos t where t.pk_devedor = d.pk_de' +
        'vedor and t.data_baixa is null )')
    Left = 216
    Top = 184
    object qry_devedorCGC_CPF: TStringField
      FieldName = 'CGC_CPF'
      Size = 50
    end
    object qry_devedorNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qry_devedorpk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object qry_devedorpk_cobrador: TIntegerField
      FieldName = 'pk_cobrador'
    end
  end
  object usuarios: TADOTable
    Connection = DM.DB
    CursorType = ctStatic
    TableName = 'usuarios'
    Left = 336
    Top = 8
  end
  object dts_usuarios: TDataSource
    DataSet = usuarios
    Left = 288
    Top = 8
  end
  object qry_temp: TADOQuery
    Connection = DM.DB
    Parameters = <>
    Left = 449
    Top = 9
  end
  object dts_devedor: TDataSource
    DataSet = qry_devedor
    Left = 184
    Top = 177
  end
  object qry_evento: TADODataSet
    Connection = DM.DB
    CommandText = 'select *'#13#10'from EVENTOS'#13#10'where 1=2'
    Parameters = <>
    Left = 144
    Top = 296
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
  end
  object tb_cliente: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select * from clientes where inativado is null')
    Left = 201
    Top = 9
  end
end
