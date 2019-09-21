object frm_envioEmail: Tfrm_envioEmail
  Left = 447
  Top = 145
  Width = 726
  Height = 550
  Caption = 'Envio de e-Mail'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 482
    Width = 718
    Height = 41
    Align = alBottom
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 634
      Top = 9
      Width = 71
      Height = 29
      Hint = 'Esconde a tela'
      Caption = '&Fechar'
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
    object sb_enviarEmail: TSpeedButton
      Left = 511
      Top = 9
      Width = 76
      Height = 27
      BiDiMode = bdLeftToRight
      Caption = 'Enviar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
        0000777777777777777707FFFFFFFFFFFF70773FF33333333F770F77FFFFFFFF
        77F07F773FF3333F77370FFF77FFFF77FFF07F33773FFF7733370FFFFF0000FF
        FFF07F333F77773FF3370FFF70EEEE07FFF07F3F773333773FF70F707FFFFFF7
        07F07F77333333337737007EEEEEEEEEE70077FFFFFFFFFFFF77077777777777
        77707777777777777777307EEEEEEEEEE7033773FF333333F77333707FFFFFF7
        0733333773FF33F773333333707EE707333333333773F7733333333333700733
        3333333333377333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentBiDiMode = False
      OnClick = sb_enviarEmailClick
    end
    object lb_mens: TLabel
      Left = 160
      Top = 18
      Width = 130
      Height = 13
      Caption = 'Enviando e-mail. Aguarde...'
      Visible = False
    end
  end
  object GroupBox1: TGroupBox
    Left = 1
    Top = 127
    Width = 716
    Height = 52
    Caption = 'Assunto do e-Mail'
    TabOrder = 1
    object edt_assunto: TEdit
      Left = 8
      Top = 17
      Width = 681
      Height = 21
      TabOrder = 0
      Text = 'edt_assunto'
    end
  end
  object GroupBox2: TGroupBox
    Left = 1
    Top = 182
    Width = 716
    Height = 71
    Caption = 'T'#237'tulo do e-Mail'
    TabOrder = 2
    object edt_titulo: TMemo
      Left = 8
      Top = 16
      Width = 697
      Height = 47
      Lines.Strings = (
        'edt_titulo')
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 1
    Top = 409
    Width = 716
    Height = 71
    Caption = 'Rodap'#233' do e-Mail'
    TabOrder = 3
    object edt_rodape: TMemo
      Left = 8
      Top = 16
      Width = 697
      Height = 48
      Lines.Strings = (
        'edt_rodape')
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 255
    Width = 717
    Height = 153
    Caption = 'Corpo do e-Mail'
    TabOrder = 4
    object edt_corpo: TMemo
      Left = 8
      Top = 16
      Width = 705
      Height = 129
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object GroupBox5: TGroupBox
    Left = 2
    Top = 1
    Width = 716
    Height = 125
    Caption = 'Contas de e-Mail'
    TabOrder = 5
    object Label1: TLabel
      Left = 21
      Top = 19
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object Label2: TLabel
      Left = 13
      Top = 70
      Width = 25
      Height = 13
      Caption = 'Para:'
    end
    object edt_nome_de: TDBEdit
      Left = 41
      Top = 16
      Width = 400
      Height = 21
      DataField = 'EMAIL_NOME'
      DataSource = Dts_config
      Enabled = False
      TabOrder = 0
    end
    object edt_email_de: TDBEdit
      Left = 41
      Top = 38
      Width = 400
      Height = 21
      DataField = 'EMAIL_CONTA'
      DataSource = Dts_config
      Enabled = False
      TabOrder = 1
    end
    object edt_nome_para: TDBEdit
      Left = 41
      Top = 68
      Width = 399
      Height = 21
      DataField = 'Nome'
      DataSource = frm_cons_cobranca.dts_devedores
      Enabled = False
      TabOrder = 2
    end
    object edt_email: TDBEdit
      Left = 41
      Top = 94
      Width = 400
      Height = 21
      DataField = 'email'
      DataSource = frm_cons_cobranca.DataSource1
      Enabled = False
      TabOrder = 3
    end
  end
  object Qry_config: TADOQuery
    Connection = DM.DB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from tb_config'
      'order by cliente')
    Left = 381
    Top = 306
    object Qry_configPK_ORDEM: TBCDField
      FieldName = 'PK_ORDEM'
      Precision = 18
      Size = 0
    end
    object Qry_configCLIENTE: TBCDField
      FieldName = 'CLIENTE'
      Precision = 18
      Size = 0
    end
    object Qry_configNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object Qry_configFORMATO_DT: TStringField
      FieldName = 'FORMATO_DT'
    end
    object Qry_configCALC_JUROS_CARTAO: TStringField
      FieldName = 'CALC_JUROS_CARTAO'
    end
    object Qry_configOCOR_PAGOU: TBCDField
      FieldName = 'OCOR_PAGOU'
      Precision = 18
      Size = 0
    end
    object Qry_configOCOR_PAGOU_PARC: TBCDField
      FieldName = 'OCOR_PAGOU_PARC'
      Precision = 18
      Size = 0
    end
    object Qry_configEMAIL_NOME: TStringField
      FieldName = 'EMAIL_NOME'
      Size = 30
    end
    object Qry_configEMAIL_CONTA: TStringField
      FieldName = 'EMAIL_CONTA'
      Size = 60
    end
    object Qry_configEMAIL_SENHA: TStringField
      FieldName = 'EMAIL_SENHA'
    end
    object Qry_configEMAIL_SMTP: TStringField
      FieldName = 'EMAIL_SMTP'
      Size = 60
    end
    object Qry_configEMAIL_SMTP_PORTA: TStringField
      FieldName = 'EMAIL_SMTP_PORTA'
      Size = 3
    end
    object Qry_configEMAIL_REQUER_AUT: TStringField
      FieldName = 'EMAIL_REQUER_AUT'
      Size = 1
    end
    object Qry_configEMAIL_ASSUNTO: TStringField
      FieldName = 'EMAIL_ASSUNTO'
      Size = 200
    end
    object Qry_configEMAIL_TITULO: TStringField
      FieldName = 'EMAIL_TITULO'
      Size = 200
    end
    object Qry_configEMAIL_RODAPE: TStringField
      FieldName = 'EMAIL_RODAPE'
      Size = 200
    end
    object Qry_configlogotipo_email: TStringField
      FieldName = 'logotipo_email'
      Size = 150
    end
    object Qry_configEMAIL_CORPO: TStringField
      FieldName = 'EMAIL_CORPO'
      Size = 1000
    end
    object Qry_configOCOR_ENV_EMAIL: TBCDField
      FieldName = 'OCOR_ENV_EMAIL'
      Precision = 18
      Size = 0
    end
  end
  object Dts_config: TDataSource
    DataSet = Qry_config
    Left = 416
    Top = 304
  end
  object MailReceive: TIdPOP3
    MaxLineAction = maException
    ReadTimeout = 0
    Host = 'pop.mail.yahoo.com.br'
    Password = 'deptexmaq'
    Username = 'depositotexmaq@yahoo.com.br'
    Left = 520
    Top = 16
  end
  object MSG: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 480
    Top = 48
  end
  object IdSMTP1: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Host = 'smtp.mail.yahoo.com.br'
    Port = 25
    AuthenticationType = atLogin
    Password = 'deptexmaq'
    Username = 'depositotexmaq'
    Left = 520
    Top = 48
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 552
    Top = 48
  end
end
