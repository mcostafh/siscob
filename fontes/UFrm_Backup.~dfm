object Frm_Backup: TFrm_Backup
  Left = 254
  Top = 153
  Width = 504
  Height = 298
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
    Width = 496
    Height = 230
    Align = alClient
    BevelOuter = bvNone
    Color = clInfoBk
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 199
      Height = 13
      Caption = 'Pasta\arquivo (Ex: C:\cobr04062015.bkp)'
    end
    object lb_mens: TLabel
      Left = 328
      Top = 248
      Width = 145
      Height = 13
      AutoSize = False
    end
    object sb_backup: TSpeedButton
      Left = 54
      Top = 135
      Width = 161
      Height = 36
      Hint = 'Carrega dados da Agenda Di'#225'ria'
      Caption = 'Realizar backup'
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
      OnClick = sb_backupClick
    end
    object lb_status: TLabel
      Left = 696
      Top = 96
      Width = 113
      Height = 13
      AutoSize = False
    end
    object SpeedButton1: TSpeedButton
      Left = 302
      Top = 135
      Width = 129
      Height = 36
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
    object lb_backup: TLabel
      Left = 59
      Top = 180
      Width = 200
      Height = 13
      Caption = 'Fazendo backup - aguarde um momento...'
      Visible = False
    end
    object lb_realizado: TLabel
      Left = 59
      Top = 193
      Width = 91
      Height = 13
      Caption = 'Backup realizado...'
      Visible = False
    end
    object edt_pastaArq: TEdit
      Left = 8
      Top = 25
      Width = 481
      Height = 21
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 496
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Backup do banco de dados'
    Color = 4210688
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object ADOCommand1: TADOCommand
    Connection = DM.DB
    Parameters = <>
    Left = 112
    Top = 105
  end
end
