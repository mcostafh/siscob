object frm_cons_cobranca: Tfrm_cons_cobranca
  Left = 197
  Top = 113
  Width = 1058
  Height = 712
  Caption = 'Registrar cobran'#231'a'
  Color = 2699572
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label20: TLabel
    Left = 169
    Top = 42
    Width = 54
    Height = 13
    Caption = 'Data_Nasc'
  end
  object Label3: TLabel
    Left = 464
    Top = 82
    Width = 382
    Height = 14
    Caption = 'Defina aqui as regras para buscar os Devedores para cobrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1050
    Height = 3
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 454
    Height = 339
    BevelOuter = bvNone
    Color = clGray
    TabOrder = 1
    object Panel4: TPanel
      Left = 3
      Top = 215
      Width = 449
      Height = 122
      Color = clSilver
      TabOrder = 0
      object Label5: TLabel
        Left = 4
        Top = 2
        Width = 71
        Height = 16
        Caption = 'Ocorr'#234'ncia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 5
        Top = 48
        Width = 141
        Height = 16
        Caption = 'Di'#225'logo com o cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object edt_dialogo: TMemo
        Left = 4
        Top = 63
        Width = 437
        Height = 56
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnChange = edt_dialogoChange
        OnExit = edt_dialogoExit
      end
      object GroupBox4: TGroupBox
        Left = 306
        Top = 0
        Width = 138
        Height = 60
        Caption = 'Agendamento'
        TabOrder = 0
        object Label60: TLabel
          Left = 9
          Top = 18
          Width = 23
          Height = 13
          Caption = 'Hora'
        end
        object edt_hota: TMaskEdit
          Left = 37
          Top = 14
          Width = 39
          Height = 21
          Hint = 'Hora do Agendamento'
          EditMask = '!90:00;1;_'
          MaxLength = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = '  :  '
        end
        object cb_cobrador: TRxDBLookupCombo
          Left = 7
          Top = 36
          Width = 124
          Height = 21
          Hint = 'Redirecionar para o Cobrador'
          DropDownCount = 8
          LookupField = 'nu_usu'
          LookupDisplay = 'Nome'
          LookupDisplayIndex = 5
          LookupSource = dts_usuarios
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
      object GroupBox10: TGroupBox
        Left = 173
        Top = 0
        Width = 131
        Height = 62
        Caption = 'N'#227'o cobrar at'#233' o dia'
        TabOrder = 2
        object Label113: TLabel
          Left = 32
          Top = 18
          Width = 89
          Height = 13
          Caption = 'dias apartir de hoje'
        end
        object edt_dias: TEdit
          Left = 8
          Top = 15
          Width = 24
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnExit = edt_diasExit
        end
        object edt_data: TDateEdit
          Left = 6
          Top = 37
          Width = 115
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
      object cb_motivo: TDBLookupComboBox
        Left = 6
        Top = 18
        Width = 163
        Height = 21
        DropDownRows = 15
        KeyField = 'pk_ocorr'
        ListField = 'nome'
        ListSource = dts_ocorr
        TabOrder = 1
      end
    end
    object Panel7: TPanel
      Left = 3
      Top = 3
      Width = 448
      Height = 210
      BevelOuter = bvNone
      Color = clWindow
      TabOrder = 1
      object Label17: TLabel
        Left = 4
        Top = 3
        Width = 67
        Height = 18
        Caption = 'Devedor'
        FocusControl = DBEdit3
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton6: TSpeedButton
        Left = 24
        Top = 184
        Width = 23
        Height = 22
      end
      object DBEdit3: TDBEdit
        Left = 3
        Top = 25
        Width = 440
        Height = 26
        DataField = 'Nome'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid2: TDBGrid
        Left = 3
        Top = 54
        Width = 439
        Height = 150
        DataSource = dts_telefones
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'tipo_fone'
            Title.Caption = 'Tipo / Refer'#234'ncia'
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Telefone'
            Width = 220
            Visible = True
          end>
      end
      object DBGrid5: TDBGrid
        Left = 9
        Top = 60
        Width = 439
        Height = 150
        DataSource = dts_telefones
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'tipo_fone'
            Title.Caption = 'Tipo / Refer'#234'ncia'
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Telefone'
            Width = 220
            Visible = True
          end>
      end
      object btn_fone: TBitBtn
        Left = 335
        Top = 186
        Width = 105
        Height = 20
        Caption = 'Gravar Telefone'
        ModalResult = 1
        TabOrder = 3
        OnClick = btn_foneClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
    end
  end
  object Panel5: TPanel
    Left = 453
    Top = 50
    Width = 572
    Height = 419
    BevelOuter = bvNone
    Color = clGray
    TabOrder = 2
    object Panel6: TPanel
      Left = 2
      Top = 3
      Width = 566
      Height = 414
      Color = clWindow
      TabOrder = 0
      object PageControl2: TPageControl
        Left = 1
        Top = 1
        Width = 564
        Height = 412
        ActivePage = TabSheet4
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 0
        object TabSheet5: TTabSheet
          Caption = 'Dados Pessoais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ImageIndex = 1
          ParentFont = False
          object Label1: TLabel
            Left = 0
            Top = 4
            Width = 65
            Height = 18
            Caption = 'Cliente:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object DBEdit6: TDBEdit
            Left = 76
            Top = 1
            Width = 329
            Height = 26
            Color = cl3DLight
            DataField = 'nome'
            DataSource = DataSource2
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNone
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEdit30: TDBEdit
            Left = 424
            Top = -24
            Width = 134
            Height = 21
            DataField = 'pk_devedor'
            DataSource = DataSource1
            TabOrder = 1
          end
          object PageControl7: TPageControl
            Left = 0
            Top = 188
            Width = 556
            Height = 193
            ActivePage = TabSheet2
            Align = alBottom
            TabOrder = 2
            object TabSheet2: TTabSheet
              Caption = 'Endere'#231'o residencial'
              object GroupBox2: TGroupBox
                Left = 0
                Top = 0
                Width = 548
                Height = 165
                Align = alClient
                Enabled = False
                TabOrder = 0
                object Label22: TLabel
                  Left = 8
                  Top = 17
                  Width = 14
                  Height = 13
                  Caption = 'Tp'
                  FocusControl = DBEdit8
                end
                object Label23: TLabel
                  Left = 80
                  Top = 17
                  Width = 62
                  Height = 13
                  Caption = 'logradouro'
                  FocusControl = DBEdit9
                end
                object Label24: TLabel
                  Left = 490
                  Top = 17
                  Width = 45
                  Height = 13
                  Caption = 'N'#250'mero'
                  FocusControl = DBEdit10
                end
                object Label25: TLabel
                  Left = 8
                  Top = 57
                  Width = 80
                  Height = 13
                  Caption = 'Complemento'
                  FocusControl = DBEdit11
                end
                object Label26: TLabel
                  Left = 192
                  Top = 55
                  Width = 35
                  Height = 13
                  Caption = 'Bairro'
                  FocusControl = DBEdit12
                end
                object Label27: TLabel
                  Left = 296
                  Top = 55
                  Width = 40
                  Height = 13
                  Caption = 'Cidade'
                  FocusControl = DBEdit13
                end
                object Label28: TLabel
                  Left = 456
                  Top = 55
                  Width = 23
                  Height = 13
                  Caption = 'Cep'
                end
                object Label30: TLabel
                  Left = 8
                  Top = 103
                  Width = 115
                  Height = 13
                  Caption = 'Ponto de Refer'#234'ncia'
                end
                object DBEdit8: TDBEdit
                  Left = 8
                  Top = 33
                  Width = 70
                  Height = 21
                  DataField = 'tipo_logradouro'
                  DataSource = DataSource1
                  TabOrder = 0
                end
                object DBEdit9: TDBEdit
                  Left = 80
                  Top = 33
                  Width = 403
                  Height = 21
                  DataField = 'logradouro'
                  DataSource = DataSource1
                  TabOrder = 1
                end
                object DBEdit10: TDBEdit
                  Left = 486
                  Top = 33
                  Width = 57
                  Height = 21
                  DataField = 'Numero'
                  DataSource = DataSource1
                  TabOrder = 2
                end
                object DBEdit11: TDBEdit
                  Left = 8
                  Top = 73
                  Width = 153
                  Height = 21
                  DataField = 'Complemento'
                  DataSource = DataSource1
                  TabOrder = 3
                end
                object DBEdit12: TDBEdit
                  Left = 191
                  Top = 71
                  Width = 97
                  Height = 21
                  DataField = 'Bairro'
                  DataSource = DataSource1
                  TabOrder = 4
                end
                object DBEdit13: TDBEdit
                  Left = 296
                  Top = 71
                  Width = 153
                  Height = 21
                  DataField = 'Cidade'
                  DataSource = DataSource1
                  TabOrder = 5
                end
                object DBEdit14: TDBEdit
                  Left = 456
                  Top = 71
                  Width = 86
                  Height = 21
                  DataField = 'Cep'
                  DataSource = DataSource1
                  TabOrder = 6
                end
                object DBEdit16: TDBEdit
                  Left = 8
                  Top = 119
                  Width = 214
                  Height = 21
                  DataField = 'ponto_referencia'
                  DataSource = DataSource1
                  TabOrder = 7
                end
              end
            end
            object TabSheet15: TTabSheet
              Caption = 'Trabalho'
              ImageIndex = 1
              object GroupBox3: TGroupBox
                Left = 0
                Top = 0
                Width = 548
                Height = 165
                Align = alClient
                Enabled = False
                TabOrder = 0
                object Label31: TLabel
                  Left = 2
                  Top = 17
                  Width = 33
                  Height = 13
                  Caption = 'Nome'
                  FocusControl = DBEdit17
                end
                object Label32: TLabel
                  Left = 187
                  Top = 17
                  Width = 65
                  Height = 13
                  Caption = 'Logradouro'
                end
                object Label33: TLabel
                  Left = 413
                  Top = 17
                  Width = 45
                  Height = 13
                  Caption = 'N'#250'mero'
                end
                object Label34: TLabel
                  Left = 185
                  Top = 56
                  Width = 35
                  Height = 13
                  Caption = 'Bairro'
                end
                object Label36: TLabel
                  Left = 367
                  Top = 58
                  Width = 14
                  Height = 13
                  Caption = 'UF'
                end
                object Label35: TLabel
                  Left = 2
                  Top = 94
                  Width = 40
                  Height = 13
                  Caption = 'Cidade'
                end
                object Label37: TLabel
                  Left = 152
                  Top = 97
                  Width = 47
                  Height = 13
                  Caption = 'Telefones'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label38: TLabel
                  Left = 2
                  Top = 56
                  Width = 80
                  Height = 13
                  Caption = 'Complemento'
                end
                object DBEdit17: TDBEdit
                  Left = 2
                  Top = 32
                  Width = 177
                  Height = 21
                  DataField = 'trabalho_nome'
                  DataSource = DataSource1
                  TabOrder = 0
                end
                object DBEdit18: TDBEdit
                  Left = 184
                  Top = 32
                  Width = 220
                  Height = 21
                  DataField = 'Trab_logradouro'
                  DataSource = DataSource1
                  TabOrder = 1
                end
                object DBEdit19: TDBEdit
                  Left = 411
                  Top = 32
                  Width = 57
                  Height = 21
                  DataField = 'trab_numero'
                  DataSource = DataSource1
                  TabOrder = 2
                end
                object DBEdit20: TDBEdit
                  Left = 185
                  Top = 71
                  Width = 129
                  Height = 21
                  DataField = 'trab_bairro'
                  DataSource = DataSource1
                  TabOrder = 3
                end
                object DBEdit22: TDBEdit
                  Left = 364
                  Top = 72
                  Width = 73
                  Height = 21
                  DataField = 'Trab_uf'
                  DataSource = DataSource1
                  TabOrder = 4
                end
                object DBEdit21: TDBEdit
                  Left = 2
                  Top = 109
                  Width = 137
                  Height = 21
                  DataField = 'Trab_cidade'
                  DataSource = DataSource1
                  TabOrder = 5
                end
                object DBEdit23: TDBEdit
                  Left = 152
                  Top = 113
                  Width = 187
                  Height = 21
                  DataField = 'trab_fones'
                  DataSource = DataSource1
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 6
                end
                object DBEdit24: TDBEdit
                  Left = 2
                  Top = 71
                  Width = 177
                  Height = 21
                  DataField = 'trab_complemento'
                  DataSource = DataSource1
                  TabOrder = 7
                end
              end
            end
          end
          object GroupBox14: TGroupBox
            Left = 0
            Top = 26
            Width = 545
            Height = 103
            Enabled = False
            TabOrder = 3
            object Label16: TLabel
              Left = 4
              Top = 14
              Width = 48
              Height = 13
              Caption = 'CGC_CPF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label15: TLabel
              Left = 4
              Top = 59
              Width = 40
              Height = 13
              Caption = 'C'#243'digo'
              FocusControl = DBEdit1
            end
            object Label39: TLabel
              Left = 94
              Top = 59
              Width = 52
              Height = 13
              Caption = 'Profissao'
              FocusControl = DBEdit25
            end
            object Label18: TLabel
              Left = 156
              Top = 14
              Width = 17
              Height = 13
              Caption = 'RG'
              FocusControl = DBEdit4
            end
            object Label65: TLabel
              Left = 261
              Top = 14
              Width = 61
              Height = 13
              Caption = 'Data_Nasc'
              FocusControl = DBEdit49
            end
            object Label19: TLabel
              Left = 359
              Top = 14
              Width = 57
              Height = 13
              Caption = 'Orgao_Rg'
              FocusControl = DBEdit5
            end
            object Label4: TLabel
              Left = 433
              Top = 14
              Width = 29
              Height = 13
              Caption = 'Sexo'
              FocusControl = DBEdit15
            end
            object Label47: TLabel
              Left = 404
              Top = 81
              Width = 37
              Height = 13
              Caption = 'Chave'
              FocusControl = DBEdit31
            end
            object Label101: TLabel
              Left = 256
              Top = 59
              Width = 82
              Height = 13
              Caption = 'Nosso n'#250'mero'
              FocusControl = DBEdit31
            end
            object DBEdit1: TDBEdit
              Left = 4
              Top = 78
              Width = 81
              Height = 21
              DataField = 'codigo_no_cliente'
              DataSource = DataSource1
              TabOrder = 0
            end
            object DBEdit25: TDBEdit
              Left = 94
              Top = 78
              Width = 129
              Height = 21
              DataField = 'Profissao'
              DataSource = DataSource1
              TabOrder = 1
            end
            object DBEdit4: TDBEdit
              Left = 156
              Top = 30
              Width = 97
              Height = 21
              DataField = 'RG'
              DataSource = DataSource1
              TabOrder = 2
            end
            object DBEdit49: TDBEdit
              Left = 262
              Top = 30
              Width = 80
              Height = 21
              DataField = 'data_nasc'
              DataSource = DataSource1
              TabOrder = 3
            end
            object DBEdit5: TDBEdit
              Left = 360
              Top = 30
              Width = 49
              Height = 21
              DataField = 'Orgao_Rg'
              DataSource = DataSource1
              TabOrder = 4
            end
            object DBEdit15: TDBEdit
              Left = 430
              Top = 30
              Width = 69
              Height = 21
              DataField = 'SEXO'
              DataSource = DataSource1
              TabOrder = 5
            end
            object DBEdit31: TDBEdit
              Left = 445
              Top = 77
              Width = 92
              Height = 21
              DataField = 'pk_devedor'
              DataSource = DataSource1
              Enabled = False
              TabOrder = 6
            end
            object DBEdit69: TDBEdit
              Left = 256
              Top = 78
              Width = 81
              Height = 21
              DataField = 'nossonumero'
              DataSource = DataSource1
              TabOrder = 7
            end
            object edt_cgf: TEdit
              Left = 5
              Top = 28
              Width = 131
              Height = 21
              MaxLength = 14
              TabOrder = 8
            end
          end
          object GroupBox20: TGroupBox
            Left = 2
            Top = 130
            Width = 551
            Height = 58
            Caption = 'Anota'#231#245'es do Cliente'
            TabOrder = 4
            object btn_gravarAnot: TSpeedButton
              Left = 463
              Top = 10
              Width = 81
              Height = 44
              BiDiMode = bdRightToLeft
              Caption = 'Gravar'
              Flat = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                555555555555555555555555555555555555555555FF55555555555559055555
                55555555577FF5555555555599905555555555557777F5555555555599905555
                555555557777FF5555555559999905555555555777777F555555559999990555
                5555557777777FF5555557990599905555555777757777F55555790555599055
                55557775555777FF5555555555599905555555555557777F5555555555559905
                555555555555777FF5555555555559905555555555555777FF55555555555579
                05555555555555777FF5555555555557905555555555555777FF555555555555
                5990555555555555577755555555555555555555555555555555}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentBiDiMode = False
              OnClick = btn_gravarAnotClick
            end
            object Memo_anot: TMemo
              Left = 4
              Top = 14
              Width = 451
              Height = 38
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Definir Regras'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          ImageIndex = 1
          ParentFont = False
          object Label46: TLabel
            Left = 424
            Top = -16
            Width = 75
            Height = 14
            Caption = 'pk_devedor'
            FocusControl = DBEdit30
          end
          object PageControl5: TPageControl
            Left = 0
            Top = 36
            Width = 556
            Height = 345
            ActivePage = TabSheet10
            Align = alClient
            Style = tsButtons
            TabOrder = 0
            object TabSheet10: TTabSheet
              Caption = 'Reorganizar Fila'
              object btn_reorganizar: TSpeedButton
                Left = 23
                Top = 272
                Width = 141
                Height = 36
                Hint = 'Esconde a tela'
                Caption = 'Reorganizar Fila'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = clNone
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                  555555555555555555555555555555555555555555FF55555555555559055555
                  55555555577FF5555555555599905555555555557777F5555555555599905555
                  555555557777FF5555555559999905555555555777777F555555559999990555
                  5555557777777FF5555557990599905555555777757777F55555790555599055
                  55557775555777FF5555555555599905555555555557777F5555555555559905
                  555555555555777FF5555555555559905555555555555777FF55555555555579
                  05555555555555777FF5555555555557905555555555555777FF555555555555
                  5990555555555555577755555555555555555555555555555555}
                NumGlyphs = 2
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                OnClick = btn_reorganizarClick
              end
              object Label2: TLabel
                Left = 0
                Top = 5
                Width = 49
                Height = 14
                Caption = 'Cliente:'
              end
              object Label111: TLabel
                Left = 325
                Top = 96
                Width = 96
                Height = 14
                Caption = 'Tipo de T'#237'tulos:'
              end
              object lk_cliente: TRxDBLookupCombo
                Left = 53
                Top = 1
                Width = 268
                Height = 21
                DropDownCount = 30
                LookupField = 'pk_cliente'
                LookupDisplay = 'nome'
                LookupDisplayIndex = 5
                LookupSource = dts_clientes
                TabOrder = 0
              end
              object GroupBox5: TGroupBox
                Left = 195
                Top = 29
                Width = 353
                Height = 62
                Caption = 'Devedores em atraso no per'#237'odo '
                TabOrder = 1
                object Label8: TLabel
                  Left = 182
                  Top = 21
                  Width = 21
                  Height = 14
                  Caption = 'at'#233
                end
                object Label48: TLabel
                  Left = 4
                  Top = 23
                  Width = 17
                  Height = 14
                  Caption = 'De'
                end
                object Label61: TLabel
                  Left = 8
                  Top = 42
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
                  Top = 42
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
                  Height = 22
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
                  Height = 22
                  Hint = 'Ex: 30 a 60 dias em atraso'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
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
                  TabOrder = 2
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
              object GroupBox9: TGroupBox
                Left = 195
                Top = 91
                Width = 126
                Height = 43
                Caption = 'Dias sem contato'
                TabOrder = 2
                object Label49: TLabel
                  Left = 62
                  Top = 19
                  Width = 26
                  Height = 14
                  Caption = 'dias'
                end
                object edt_diassemcontato: TEdit
                  Left = 15
                  Top = 16
                  Width = 41
                  Height = 22
                  TabOrder = 0
                end
              end
              object GroupBox11: TGroupBox
                Left = 195
                Top = 134
                Width = 350
                Height = 93
                Caption = 'Ordenar por'
                ParentColor = False
                TabOrder = 3
                object cb_ordValor: TCheckBox
                  Left = 8
                  Top = 20
                  Width = 73
                  Height = 17
                  Caption = 'Valor'
                  Checked = True
                  State = cbChecked
                  TabOrder = 0
                end
                object cb_ordAtraso: TCheckBox
                  Left = 8
                  Top = 43
                  Width = 65
                  Height = 17
                  Caption = 'Atraso'
                  TabOrder = 1
                end
                object cb_ordDiasSemContato: TCheckBox
                  Left = 8
                  Top = 68
                  Width = 137
                  Height = 17
                  Caption = 'Dias sem contato'
                  TabOrder = 2
                end
                object cb_ordTipoValor: TComboBox
                  Left = 85
                  Top = 18
                  Width = 95
                  Height = 22
                  ItemHeight = 14
                  ItemIndex = 0
                  TabOrder = 3
                  Text = 'Decrecente'
                  Items.Strings = (
                    'Decrecente'
                    'Crescente')
                end
                object cb_TipoOrdAtraso: TComboBox
                  Left = 86
                  Top = 42
                  Width = 95
                  Height = 22
                  ItemHeight = 14
                  ItemIndex = 0
                  TabOrder = 4
                  Text = 'Decrecente'
                  Items.Strings = (
                    'Decrecente'
                    'Crescente')
                end
                object cb_ordTipoSemContato: TComboBox
                  Left = 143
                  Top = 67
                  Width = 95
                  Height = 22
                  ItemHeight = 14
                  ItemIndex = 0
                  TabOrder = 5
                  Text = 'Decrecente'
                  Items.Strings = (
                    'Decrecente'
                    'Crescente')
                end
              end
              object cb_agendaFuturos: TCheckBox
                Left = 197
                Top = 232
                Width = 209
                Height = 17
                Caption = 'Buscar Agendamentos futuros'
                TabOrder = 4
              end
              object edt_tipotitulo: TEdit
                Left = 327
                Top = 110
                Width = 57
                Height = 22
                CharCase = ecUpperCase
                MaxLength = 2
                TabOrder = 5
              end
              object GroupBox21: TGroupBox
                Left = 2
                Top = 28
                Width = 191
                Height = 235
                Caption = 'Buscar com as Ocorr'#234'ncias'
                TabOrder = 6
                object RxCheckList_ocorr: TRxCheckListBox
                  Left = 2
                  Top = 16
                  Width = 187
                  Height = 217
                  Align = alClient
                  ItemHeight = 14
                  TabOrder = 0
                  InternalVersion = 202
                  Strings = (
                    'N'#227'o acionado'
                    0
                    True)
                end
              end
              object cb_visualizaInativos: TCheckBox
                Left = 327
                Top = 3
                Width = 154
                Height = 17
                Caption = 'Visualiza Inativados'
                TabOrder = 7
                OnClick = cb_visualizaInativosClick
              end
            end
            object TabSheet11: TTabSheet
              Caption = 'Retornos de Devedores'
              ImageIndex = 1
              object SpeedButton1: TSpeedButton
                Left = 312
                Top = 52
                Width = 160
                Height = 36
                Hint = 'Esconde a tela'
                Caption = 'Pesquisar Cliente'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = clNone
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                  555555555555555555555555555555555555555555FF55555555555559055555
                  55555555577FF5555555555599905555555555557777F5555555555599905555
                  555555557777FF5555555559999905555555555777777F555555559999990555
                  5555557777777FF5555557990599905555555777757777F55555790555599055
                  55557775555777FF5555555555599905555555555557777F5555555555559905
                  555555555555777FF5555555555559905555555555555777FF55555555555579
                  05555555555555777FF5555555555557905555555555555777FF555555555555
                  5990555555555555577755555555555555555555555555555555}
                NumGlyphs = 2
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton1Click
              end
              object lb_help: TLabel
                Left = 6
                Top = 136
                Width = 306
                Height = 14
                Caption = 'Para selecionar o Devedor d'#234' um Duplo Clique'
                Color = clYellow
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Visible = False
              end
              object grid_devedores: TDBGrid
                Left = 6
                Top = 156
                Width = 537
                Height = 146
                DataSource = dts_devedores
                TabOrder = 0
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                Visible = False
                OnDblClick = grid_devedoresDblClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CGC_CPF'
                    Width = 141
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Nome'
                    Width = 349
                    Visible = True
                  end>
              end
              object GroupBox13: TGroupBox
                Left = 0
                Top = 8
                Width = 305
                Height = 126
                Caption = 'Dados para a pesquisa'
                TabOrder = 1
                object Label100: TLabel
                  Left = 6
                  Top = 23
                  Width = 107
                  Height = 14
                  Caption = 'Tipo de Pesquisa'
                end
                object Label45: TLabel
                  Left = 6
                  Top = 72
                  Width = 145
                  Height = 14
                  Caption = 'Valor a ser pesquisado'
                end
                object cb_tipoPesquisa: TComboBox
                  Left = 6
                  Top = 40
                  Width = 238
                  Height = 22
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ItemHeight = 14
                  ItemIndex = 2
                  ParentFont = False
                  TabOrder = 0
                  Text = '3 - Nome'
                  Items.Strings = (
                    '1 - Chave do Devedor'
                    '2 -CPF'
                    '3 - Nome'
                    '4 - Telefone'
                    '5 - Nome de uma Refer'#234'ncia')
                end
                object edt_devedor: TEdit
                  Left = 6
                  Top = 88
                  Width = 233
                  Height = 22
                  TabOrder = 1
                end
              end
            end
          end
          object Panel14: TPanel
            Left = 0
            Top = 0
            Width = 556
            Height = 36
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 1
            object Label11: TLabel
              Left = 9
              Top = 1
              Width = 542
              Height = 14
              Caption = 
                'Defina aqui as regras de busca dos Devedores e a forma como ser'#225 +
                ' ordenado a para '
            end
            object Label13: TLabel
              Left = 10
              Top = 15
              Width = 127
              Height = 14
              Caption = 'a busca autom'#225'tica.'
            end
          end
        end
      end
    end
  end
  object Panel9: TPanel
    Left = 0
    Top = 472
    Width = 1025
    Height = 206
    BevelOuter = bvNone
    Color = clGray
    TabOrder = 3
    object Panel10: TPanel
      Left = 2
      Top = 2
      Width = 1019
      Height = 202
      Color = clWindow
      TabOrder = 0
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 1017
        Height = 200
        ActivePage = TabSheet12
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Style = tsFlatButtons
        TabOrder = 0
        object TabSheet6: TTabSheet
          Caption = 'Hist'#243'rico'
          ImageIndex = 3
          object PageControl3: TPageControl
            Left = 0
            Top = 0
            Width = 1009
            Height = 169
            ActivePage = TabSheet3
            Align = alClient
            MultiLine = True
            TabOrder = 0
            TabPosition = tpLeft
            object TabSheet3: TTabSheet
              Caption = 'Lista'
              object DBGrid3: TDBGrid
                Left = 0
                Top = 0
                Width = 981
                Height = 161
                Align = alClient
                DataSource = dts_historicos
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'Data'
                    Width = 71
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Hora'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Texto'
                    Width = 391
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'nome_dialogo'
                    Title.Caption = 'Motivo'
                    Width = 179
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Agendado_Data'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Agendado_Hora'
                    Width = 106
                    Visible = True
                  end>
              end
            end
            object TabSheet7: TTabSheet
              Caption = 'Detalhe'
              ImageIndex = 1
              object Label9: TLabel
                Left = 0
                Top = 0
                Width = 27
                Height = 13
                Caption = 'Data'
              end
              object Label14: TLabel
                Left = 88
                Top = 0
                Width = 27
                Height = 13
                Caption = 'Hora'
                FocusControl = DBEdit26
              end
              object Label21: TLabel
                Left = 160
                Top = 0
                Width = 37
                Height = 13
                Caption = 'Motivo'
                FocusControl = DBEdit27
              end
              object Label29: TLabel
                Left = 0
                Top = 48
                Width = 91
                Height = 13
                Caption = 'Agendado_Data'
                FocusControl = DBEdit28
              end
              object Label40: TLabel
                Left = 112
                Top = 48
                Width = 91
                Height = 13
                Caption = 'Agendado_Hora'
                FocusControl = DBEdit29
              end
              object Label41: TLabel
                Left = 320
                Top = 0
                Width = 32
                Height = 13
                Caption = 'Texto'
              end
              object DBEdit7: TDBEdit
                Left = 0
                Top = 16
                Width = 81
                Height = 21
                DataField = 'Data'
                DataSource = dts_historicos
                Enabled = False
                TabOrder = 0
              end
              object DBEdit26: TDBEdit
                Left = 88
                Top = 16
                Width = 57
                Height = 21
                DataField = 'Hora'
                DataSource = dts_historicos
                Enabled = False
                TabOrder = 1
              end
              object DBEdit27: TDBEdit
                Left = 160
                Top = 16
                Width = 145
                Height = 21
                DataField = 'nome_dialogo'
                DataSource = dts_historicos
                Enabled = False
                TabOrder = 2
              end
              object DBEdit28: TDBEdit
                Left = 0
                Top = 64
                Width = 105
                Height = 21
                DataField = 'Agendado_Data'
                DataSource = dts_historicos
                Enabled = False
                TabOrder = 3
              end
              object DBEdit29: TDBEdit
                Left = 112
                Top = 64
                Width = 105
                Height = 21
                DataField = 'Agendado_Hora'
                DataSource = dts_historicos
                Enabled = False
                TabOrder = 4
              end
              object DBMemo1: TDBMemo
                Left = 320
                Top = 16
                Width = 609
                Height = 69
                DataField = 'Texto'
                DataSource = dts_historicos
                Enabled = False
                TabOrder = 5
              end
            end
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'D'#237'vida'
          object PageControl4: TPageControl
            Left = 0
            Top = 0
            Width = 1009
            Height = 169
            ActivePage = TabSheet9
            Align = alClient
            MultiLine = True
            TabOrder = 0
            TabPosition = tpLeft
            object TabSheet8: TTabSheet
              Caption = 'Lista'
              object RxDBGrid1: TRxDBGrid
                Left = 0
                Top = 0
                Width = 981
                Height = 161
                Align = alClient
                DataSource = dts_divida
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'Cheque'
                    ReadOnly = True
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Banco'
                    ReadOnly = True
                    Width = 54
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Agencia'
                    ReadOnly = True
                    Width = 49
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Conta'
                    ReadOnly = True
                    Width = 67
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'alinea_devol'
                    Title.Caption = 'Al'#237'nea'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Vencimento'
                    ReadOnly = True
                    Width = 76
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'venc_ult_extrato'
                    Title.Caption = 'Venc Ult Extrato'
                    Width = 95
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'tipo_titulo'
                    ReadOnly = True
                    Title.Caption = 'Tipo'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'valor_principal'
                    ReadOnly = True
                    Title.Caption = 'Valor Principal'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'atraso_atual'
                    ReadOnly = True
                    Title.Caption = 'Atraso Atual'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'atu_juros'
                    ReadOnly = True
                    Title.Caption = 'Juros'
                    Width = 68
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'atu_multa'
                    ReadOnly = True
                    Title.Caption = 'Multa'
                    Width = 52
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'atu_valor'
                    Title.Caption = 'Valor Atualizado'
                    Width = 97
                    Visible = True
                  end
                  item
                    DropDownRows = 2
                    Expanded = False
                    FieldName = 'atualizar'
                    ImeMode = imSAlpha
                    PickList.Strings = (
                      'Sim'
                      'N'#227'o')
                    Title.Caption = 'Atualizar'
                    Width = 72
                    Visible = True
                  end>
              end
            end
            object TabSheet9: TTabSheet
              Caption = 'Detalhes'
              ImageIndex = 1
              object Label59: TLabel
                Left = 2
                Top = 67
                Width = 79
                Height = 13
                Caption = 'numero_titulo'
                FocusControl = DBEdit45
              end
              object Label50: TLabel
                Left = 89
                Top = 67
                Width = 47
                Height = 13
                Caption = 'emissao'
                FocusControl = DBEdit36
              end
              object Label51: TLabel
                Left = 176
                Top = 67
                Width = 67
                Height = 13
                Caption = 'Vencimento'
                FocusControl = DBEdit37
              end
              object Label55: TLabel
                Left = 2
                Top = 115
                Width = 84
                Height = 13
                Caption = 'valor_principal'
                FocusControl = DBEdit41
              end
              object Label53: TLabel
                Left = 265
                Top = 67
                Width = 93
                Height = 13
                Caption = 'Atraso Remessa'
                FocusControl = DBEdit39
              end
              object Label6: TLabel
                Left = 365
                Top = 67
                Width = 70
                Height = 13
                Caption = 'Atraso Atual'
                FocusControl = DBEdit39
              end
              object Label57: TLabel
                Left = 901
                Top = 3
                Width = 56
                Height = 13
                Caption = 'tipo_titulo'
                FocusControl = DBEdit43
              end
              object Label54: TLabel
                Left = 263
                Top = 119
                Width = 56
                Height = 13
                Caption = '(%) Juros'
                FocusControl = DBEdit40
              end
              object Label73: TLabel
                Left = 344
                Top = 120
                Width = 56
                Height = 13
                Caption = '(%) Multa'
                FocusControl = DBEdit70
              end
              object Label106: TLabel
                Left = 412
                Top = 120
                Width = 30
                Height = 13
                Caption = 'Juros'
                FocusControl = DBEdit71
              end
              object Label107: TLabel
                Left = 488
                Top = 120
                Width = 30
                Height = 13
                Caption = 'Multa'
                FocusControl = DBEdit72
              end
              object Label108: TLabel
                Left = 558
                Top = 120
                Width = 93
                Height = 13
                Caption = 'Valor Atualizado'
                FocusControl = DBEdit73
              end
              object Label109: TLabel
                Left = 144
                Top = 119
                Width = 81
                Height = 13
                Caption = 'Atualizado em'
                FocusControl = DBEdit74
              end
              object lb_pag: TLabel
                Left = 917
                Top = 136
                Width = 48
                Height = 20
                AutoSize = False
                Caption = '0/0'
                Color = cl3DDkShadow
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object SpeedButton4: TSpeedButton
                Left = 466
                Top = 65
                Width = 183
                Height = 30
                Hint = 'Esconde a tela'
                Caption = 'Atualizar D'#237'vida'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = clNone
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
                  73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
                  0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
                  0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                  0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                  0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
                  0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
                  0333337F777777737F333308888888880333337F333333337F33330888888888
                  03333373FFFFFFFF733333700000000073333337777777773333}
                NumGlyphs = 2
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton3Click
              end
              object GroupBox8: TGroupBox
                Left = 0
                Top = -1
                Width = 657
                Height = 57
                Caption = 'Dados do Cheque'
                TabOrder = 0
                object Label42: TLabel
                  Left = 8
                  Top = 15
                  Width = 35
                  Height = 13
                  Caption = 'Banco'
                  FocusControl = DBEdit51
                end
                object Label43: TLabel
                  Left = 52
                  Top = 15
                  Width = 45
                  Height = 13
                  Caption = 'Agencia'
                  FocusControl = DBEdit52
                end
                object Label63: TLabel
                  Left = 95
                  Top = 15
                  Width = 34
                  Height = 13
                  Caption = 'Conta'
                  FocusControl = DBEdit53
                end
                object Label64: TLabel
                  Left = 164
                  Top = 15
                  Width = 44
                  Height = 13
                  Caption = 'Cheque'
                  FocusControl = DBEdit54
                end
                object Label66: TLabel
                  Left = 240
                  Top = 15
                  Width = 61
                  Height = 13
                  Caption = 'Endossado'
                  FocusControl = DBEdit55
                end
                object Label67: TLabel
                  Left = 370
                  Top = 15
                  Width = 90
                  Height = 13
                  Caption = 'Endossado_CPF'
                  FocusControl = DBEdit56
                end
                object Label68: TLabel
                  Left = 478
                  Top = 15
                  Width = 80
                  Height = 13
                  Caption = 'praca_cheque'
                  FocusControl = DBEdit57
                end
                object Label69: TLabel
                  Left = 616
                  Top = 15
                  Width = 34
                  Height = 13
                  Caption = 'alinea'
                  FocusControl = DBEdit58
                end
                object DBEdit51: TDBEdit
                  Left = 8
                  Top = 29
                  Width = 41
                  Height = 21
                  DataField = 'Banco'
                  DataSource = dts_divida
                  TabOrder = 0
                end
                object DBEdit52: TDBEdit
                  Left = 52
                  Top = 29
                  Width = 41
                  Height = 21
                  DataField = 'Agencia'
                  DataSource = dts_divida
                  TabOrder = 1
                end
                object DBEdit53: TDBEdit
                  Left = 95
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'Conta'
                  DataSource = dts_divida
                  TabOrder = 2
                end
                object DBEdit54: TDBEdit
                  Left = 164
                  Top = 29
                  Width = 73
                  Height = 21
                  DataField = 'Cheque'
                  DataSource = dts_divida
                  TabOrder = 3
                end
                object DBEdit55: TDBEdit
                  Left = 240
                  Top = 29
                  Width = 129
                  Height = 21
                  DataField = 'Endossado'
                  DataSource = dts_divida
                  TabOrder = 4
                end
                object DBEdit56: TDBEdit
                  Left = 370
                  Top = 29
                  Width = 105
                  Height = 21
                  DataField = 'Endossado_CPF'
                  DataSource = dts_divida
                  TabOrder = 5
                end
                object DBEdit57: TDBEdit
                  Left = 477
                  Top = 29
                  Width = 137
                  Height = 21
                  DataField = 'praca_cheque'
                  DataSource = dts_divida
                  TabOrder = 6
                end
                object DBEdit58: TDBEdit
                  Left = 617
                  Top = 29
                  Width = 30
                  Height = 21
                  DataField = 'alinea_devol'
                  DataSource = dts_divida
                  TabOrder = 7
                end
              end
              object GroupBox6: TGroupBox
                Left = 659
                Top = -2
                Width = 238
                Height = 58
                Caption = 'Dados de Fatura de Cart'#227'o'
                TabOrder = 1
                object Label56: TLabel
                  Left = 11
                  Top = 14
                  Width = 113
                  Height = 13
                  Caption = 'pagamento_minimo'
                  FocusControl = DBEdit42
                end
                object Label52: TLabel
                  Left = 128
                  Top = 14
                  Width = 96
                  Height = 13
                  Caption = 'venc_ult_extrato'
                  FocusControl = DBEdit38
                end
                object DBEdit42: TDBEdit
                  Left = 10
                  Top = 30
                  Width = 97
                  Height = 21
                  DataField = 'pagamento_minimo'
                  DataSource = dts_divida
                  TabOrder = 0
                end
                object DBEdit38: TDBEdit
                  Left = 129
                  Top = 31
                  Width = 89
                  Height = 21
                  DataField = 'venc_ult_extrato'
                  DataSource = dts_divida
                  TabOrder = 1
                end
              end
              object DBEdit45: TDBEdit
                Left = 2
                Top = 86
                Width = 79
                Height = 21
                DataField = 'numero_titulo'
                DataSource = dts_divida
                TabOrder = 2
              end
              object DBEdit36: TDBEdit
                Left = 89
                Top = 86
                Width = 81
                Height = 21
                DataField = 'emissao'
                DataSource = dts_divida
                TabOrder = 3
              end
              object DBEdit37: TDBEdit
                Left = 177
                Top = 86
                Width = 81
                Height = 21
                DataField = 'Vencimento'
                DataSource = dts_divida
                TabOrder = 4
              end
              object DBEdit41: TDBEdit
                Left = 2
                Top = 134
                Width = 105
                Height = 21
                DataField = 'valor_principal'
                DataSource = dts_divida
                TabOrder = 5
              end
              object DBEdit39: TDBEdit
                Left = 267
                Top = 86
                Width = 90
                Height = 21
                DataField = 'dias_atraso_remessa'
                DataSource = dts_divida
                TabOrder = 6
              end
              object DBEdit50: TDBEdit
                Left = 369
                Top = 84
                Width = 62
                Height = 21
                DataField = 'atraso_atual'
                DataSource = dts_divida
                TabOrder = 7
              end
              object GroupBox7: TGroupBox
                Left = 660
                Top = 59
                Width = 236
                Height = 58
                Caption = 'Sequencial do arquivo'
                TabOrder = 8
                object Label58: TLabel
                  Left = 133
                  Top = 15
                  Width = 80
                  Height = 13
                  Caption = 'Data_inclusao'
                end
                object Label62: TLabel
                  Left = 9
                  Top = 14
                  Width = 99
                  Height = 13
                  Caption = 'seq_arq_inclusao'
                end
                object DBEdit44: TDBEdit
                  Left = 8
                  Top = 30
                  Width = 97
                  Height = 21
                  DataField = 'Data_inclusao'
                  DataSource = dts_divida
                  TabOrder = 0
                end
                object DBEdit48: TDBEdit
                  Left = 128
                  Top = 30
                  Width = 89
                  Height = 21
                  DataField = 'seq_arq_inclusao'
                  DataSource = dts_divida
                  TabOrder = 1
                end
              end
              object DBEdit43: TDBEdit
                Left = 901
                Top = 20
                Width = 47
                Height = 21
                DataField = 'tipo_titulo'
                DataSource = dts_divida
                TabOrder = 9
              end
              object DBEdit40: TDBEdit
                Left = 263
                Top = 135
                Width = 73
                Height = 21
                DataField = 'atu_percjuro'
                DataSource = dts_divida
                TabOrder = 10
              end
              object DBEdit70: TDBEdit
                Left = 344
                Top = 136
                Width = 63
                Height = 21
                DataField = 'atu_percmulta'
                DataSource = dts_divida
                TabOrder = 11
              end
              object DBEdit71: TDBEdit
                Left = 412
                Top = 136
                Width = 73
                Height = 21
                DataField = 'atu_juros'
                DataSource = dts_divida
                TabOrder = 12
              end
              object DBEdit72: TDBEdit
                Left = 488
                Top = 136
                Width = 65
                Height = 21
                DataField = 'atu_multa'
                DataSource = dts_divida
                TabOrder = 13
              end
              object DBEdit73: TDBEdit
                Left = 558
                Top = 136
                Width = 97
                Height = 21
                DataField = 'atu_valor'
                DataSource = dts_divida
                TabOrder = 14
              end
              object DBEdit74: TDBEdit
                Left = 144
                Top = 136
                Width = 105
                Height = 21
                DataField = 'atu_data'
                DataSource = dts_divida
                TabOrder = 15
              end
              object DBNavigator1: TDBNavigator
                Left = 807
                Top = 136
                Width = 104
                Height = 20
                DataSource = dts_divida
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                TabOrder = 16
              end
            end
          end
        end
        object TabSheet16: TTabSheet
          Caption = 'Baixas Parcias'
          ImageIndex = 3
          object DBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 640
            Height = 169
            Align = alClient
            DataSource = dts_bxparciais
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Verdana'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'data'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'historico'
                Width = 267
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'acordo'
                Title.Caption = 'Acordo'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'pk_prestcontas'
                Title.Caption = 'Prest. Contas'
                Width = 87
                Visible = True
              end>
          end
          object GroupBox23: TGroupBox
            Left = 640
            Top = 0
            Width = 369
            Height = 169
            Align = alRight
            Caption = 'Lan'#231'ar nova Baixa Parcial'
            TabOrder = 1
            object Label84: TLabel
              Left = 8
              Top = 18
              Width = 81
              Height = 13
              Caption = 'Data da Baixa'
            end
            object Label115: TLabel
              Left = 8
              Top = 59
              Width = 49
              Height = 13
              Caption = 'Hist'#243'rico'
            end
            object Label116: TLabel
              Left = 8
              Top = 98
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object edt_bxData: TDateEdit
              Left = 8
              Top = 35
              Width = 115
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
            object edt_bxHistorico: TEdit
              Left = 8
              Top = 75
              Width = 180
              Height = 21
              TabOrder = 1
            end
            object edt_bxValor: TCurrencyEdit
              Left = 8
              Top = 114
              Width = 84
              Height = 19
              AutoSize = False
              Color = cl3DLight
              DisplayFormat = '0.00;-,0.00'
              TabOrder = 2
            end
            object btn_gravaBxParcial: TBitBtn
              Left = 229
              Top = 68
              Width = 76
              Height = 37
              Hint = 'Grava baixa parcial'
              Caption = 'Gravar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnClick = btn_gravaBxParcialClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                555555555555555555555555555555555555555555FF55555555555559055555
                55555555577FF5555555555599905555555555557777F5555555555599905555
                555555557777FF5555555559999905555555555777777F555555559999990555
                5555557777777FF5555557990599905555555777757777F55555790555599055
                55557775555777FF5555555555599905555555555557777F5555555555559905
                555555555555777FF5555555555559905555555555555777FF55555555555579
                05555555555555777FF5555555555557905555555555555777FF555555555555
                5990555555555555577755555555555555555555555555555555}
              NumGlyphs = 2
            end
          end
        end
        object TabSheet12: TTabSheet
          Caption = 'Acordos de Cobran'#231'a'
          ImageIndex = 3
          object PageControl6: TPageControl
            Left = 0
            Top = 0
            Width = 1009
            Height = 169
            ActivePage = TabSheet14
            Align = alClient
            MultiLine = True
            Style = tsButtons
            TabOrder = 0
            object TabSheet13: TTabSheet
              Caption = 'Parcelas de Acordos'
              object Panel8: TPanel
                Left = 917
                Top = 0
                Width = 84
                Height = 138
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 0
                object SpeedButton2: TSpeedButton
                  Left = 7
                  Top = 5
                  Width = 70
                  Height = 40
                  BiDiMode = bdRightToLeft
                  Caption = 'Emitir'
                  Flat = True
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000130B0000130B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
                    00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
                    8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
                    8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
                    8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
                    03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
                    03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
                    33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
                    33333337FFFF7733333333300000033333333337777773333333}
                  Layout = blGlyphTop
                  NumGlyphs = 2
                  ParentBiDiMode = False
                  OnClick = SpeedButton2Click
                end
                object btn_cancelarRec: TSpeedButton
                  Left = 6
                  Top = 50
                  Width = 70
                  Height = 40
                  BiDiMode = bdRightToLeft
                  Caption = 'Cancelar'
                  Flat = True
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000130B0000130B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
                    33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
                    993337777F777F3377F3393999707333993337F77737333337FF993399933333
                    399377F3777FF333377F993339903333399377F33737FF33377F993333707333
                    399377F333377FF3377F993333101933399377F333777FFF377F993333000993
                    399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
                    99333773FF777F777733339993707339933333773FF7FFF77333333999999999
                    3333333777333777333333333999993333333333377777333333}
                  Layout = blGlyphTop
                  NumGlyphs = 2
                  ParentBiDiMode = False
                  OnClick = btn_cancelarRecClick
                end
                object btn_receber: TSpeedButton
                  Left = 7
                  Top = 93
                  Width = 70
                  Height = 40
                  BiDiMode = bdRightToLeft
                  Caption = 'Baixar'
                  Flat = True
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000120B0000120B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00550000000005
                    555555777777777FF5555500000000805555557777777777FF555550BBBBB008
                    05555557F5FFF7777FF55550B000B030805555F7F777F7F777F550000000B033
                    005557777777F7F5775550BBBBB00033055557F5FFF777F57F5550B000B08033
                    055557F77757F7F57F5550BBBBB08033055557F55557F7F57F5550BBBBB00033
                    055557FFFFF777F57F5550000000703305555777777757F57F555550FFF77033
                    05555557FFFFF7FF7F55550000000003055555777777777F7F55550777777700
                    05555575FF5555777F55555003B3B3B00555555775FF55577FF55555500B3B3B
                    005555555775FFFF77F555555570000000555555555777777755}
                  Layout = blGlyphTop
                  NumGlyphs = 2
                  ParentBiDiMode = False
                  OnClick = btn_receberClick
                end
              end
              object DBGrid4: TDBGrid
                Left = 0
                Top = 0
                Width = 236
                Height = 138
                Align = alLeft
                DataSource = dts_recibos
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                ReadOnly = True
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'pk_recibo'
                    Title.Caption = 'Chave'
                    Width = 62
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'data_venc'
                    Title.Caption = 'Vencimento'
                    Width = 70
                    Visible = True
                  end>
              end
              object Panel15: TPanel
                Left = 236
                Top = 0
                Width = 681
                Height = 138
                Align = alClient
                BevelOuter = bvNone
                Enabled = False
                TabOrder = 2
                object Label85: TLabel
                  Left = 4
                  Top = 0
                  Width = 48
                  Height = 13
                  Caption = 'Principal'
                  FocusControl = DBEdit33
                end
                object Label86: TLabel
                  Left = 92
                  Top = 0
                  Width = 30
                  Height = 13
                  Caption = 'Juros'
                  FocusControl = DBEdit34
                end
                object Label87: TLabel
                  Left = 144
                  Top = 0
                  Width = 30
                  Height = 13
                  Caption = 'Multa'
                  FocusControl = DBEdit35
                end
                object Label88: TLabel
                  Left = 197
                  Top = 0
                  Width = 60
                  Height = 13
                  Caption = 'Desc Princ'
                  FocusControl = DBEdit46
                end
                object Label89: TLabel
                  Left = 273
                  Top = 0
                  Width = 62
                  Height = 13
                  Caption = 'Desc Juros'
                  FocusControl = DBEdit47
                end
                object Label91: TLabel
                  Left = 341
                  Top = 0
                  Width = 62
                  Height = 13
                  Caption = 'Desc Multa'
                  FocusControl = DBEdit60
                end
                object Label92: TLabel
                  Left = 412
                  Top = 0
                  Width = 79
                  Height = 13
                  Caption = 'Taxa Protesto'
                  FocusControl = DBEdit59
                end
                object Label93: TLabel
                  Left = 498
                  Top = 0
                  Width = 62
                  Height = 13
                  Caption = 'Honorarios'
                  FocusControl = DBEdit61
                end
                object Label94: TLabel
                  Left = 3
                  Top = 37
                  Width = 87
                  Height = 13
                  Caption = 'Valor Reten'#231#227'o'
                  FocusControl = DBEdit62
                end
                object Label95: TLabel
                  Left = 102
                  Top = 40
                  Width = 73
                  Height = 13
                  Caption = 'valor_liquido'
                  FocusControl = DBEdit63
                end
                object Label96: TLabel
                  Left = 218
                  Top = 37
                  Width = 154
                  Height = 13
                  Caption = 'Venc da Parcela do Acordo'
                  FocusControl = DBEdit64
                end
                object Label97: TLabel
                  Left = 5
                  Top = 116
                  Width = 66
                  Height = 13
                  Caption = 'observacao'
                  FocusControl = DBEdit65
                end
                object Label117: TLabel
                  Left = 566
                  Top = 0
                  Width = 86
                  Height = 13
                  Caption = 'Baixas parciais'
                  FocusControl = DBEdit2
                end
                object DBEdit33: TDBEdit
                  Left = 4
                  Top = 15
                  Width = 80
                  Height = 21
                  DataField = 'principal'
                  DataSource = dts_recibos
                  TabOrder = 0
                end
                object DBEdit34: TDBEdit
                  Left = 89
                  Top = 15
                  Width = 49
                  Height = 21
                  DataField = 'juros'
                  DataSource = dts_recibos
                  TabOrder = 1
                end
                object DBEdit35: TDBEdit
                  Left = 142
                  Top = 15
                  Width = 49
                  Height = 21
                  DataField = 'multa'
                  DataSource = dts_recibos
                  TabOrder = 2
                end
                object DBEdit46: TDBEdit
                  Left = 196
                  Top = 15
                  Width = 71
                  Height = 21
                  DataField = 'desc_principal'
                  DataSource = dts_recibos
                  TabOrder = 3
                end
                object DBEdit47: TDBEdit
                  Left = 272
                  Top = 15
                  Width = 62
                  Height = 21
                  DataField = 'desc_juros'
                  DataSource = dts_recibos
                  TabOrder = 4
                end
                object DBEdit60: TDBEdit
                  Left = 339
                  Top = 15
                  Width = 65
                  Height = 21
                  DataField = 'desc_multa'
                  DataSource = dts_recibos
                  TabOrder = 5
                end
                object DBEdit59: TDBEdit
                  Left = 411
                  Top = 15
                  Width = 82
                  Height = 21
                  DataField = 'acres_protesto'
                  DataSource = dts_recibos
                  TabOrder = 6
                end
                object DBEdit61: TDBEdit
                  Left = 497
                  Top = 15
                  Width = 67
                  Height = 21
                  DataField = 'acres_honorarios'
                  DataSource = dts_recibos
                  Enabled = False
                  TabOrder = 7
                end
                object DBEdit62: TDBEdit
                  Left = 3
                  Top = 53
                  Width = 89
                  Height = 21
                  DataField = 'valor_retenc'
                  DataSource = dts_recibos
                  Enabled = False
                  TabOrder = 8
                end
                object DBEdit63: TDBEdit
                  Left = 102
                  Top = 55
                  Width = 81
                  Height = 21
                  DataField = 'valor_liquido'
                  DataSource = dts_recibos
                  TabOrder = 9
                end
                object DBEdit64: TDBEdit
                  Left = 219
                  Top = 53
                  Width = 100
                  Height = 21
                  DataField = 'data_venc'
                  DataSource = dts_recibos
                  TabOrder = 10
                end
                object DBEdit65: TDBEdit
                  Left = 74
                  Top = 113
                  Width = 567
                  Height = 21
                  DataField = 'observacao'
                  DataSource = dts_recibos
                  TabOrder = 11
                end
                object GroupBox1: TGroupBox
                  Left = 376
                  Top = 36
                  Width = 271
                  Height = 56
                  TabOrder = 12
                  object Label98: TLabel
                    Left = 4
                    Top = 12
                    Width = 60
                    Height = 13
                    Caption = 'Data Canc'
                    FocusControl = DBEdit32
                  end
                  object Label99: TLabel
                    Left = 127
                    Top = 12
                    Width = 123
                    Height = 13
                    Caption = 'Data do Recebimento'
                  end
                  object DBEdit32: TDBEdit
                    Left = 2
                    Top = 28
                    Width = 76
                    Height = 21
                    Color = clScrollBar
                    DataField = 'data_canc'
                    DataSource = dts_recibos
                    TabOrder = 0
                  end
                  object DBEdit68: TDBEdit
                    Left = 81
                    Top = 28
                    Width = 40
                    Height = 21
                    Color = clScrollBar
                    DataField = 'hora_canc'
                    DataSource = dts_recibos
                    TabOrder = 1
                  end
                  object DBEdit66: TDBEdit
                    Left = 128
                    Top = 28
                    Width = 88
                    Height = 21
                    Color = cl3DDkShadow
                    DataField = 'data_receb'
                    DataSource = dts_recibos
                    TabOrder = 2
                  end
                  object DBEdit67: TDBEdit
                    Left = 219
                    Top = 28
                    Width = 47
                    Height = 21
                    Color = cl3DDkShadow
                    DataField = 'hora_receb'
                    DataSource = dts_recibos
                    TabOrder = 3
                  end
                end
                object DBEdit2: TDBEdit
                  Left = 565
                  Top = 15
                  Width = 67
                  Height = 21
                  DataField = 'baixaparcial'
                  DataSource = dts_recibos
                  Enabled = False
                  TabOrder = 13
                end
              end
            end
            object TabSheet14: TTabSheet
              Caption = 'Fazer Acordo'
              object Label90: TLabel
                Left = 600
                Top = 0
                Width = 65
                Height = 13
                Caption = 'desc_multa'
              end
              object GroupBox12: TGroupBox
                Left = 2
                Top = 0
                Width = 266
                Height = 139
                Caption = 'D'#237'vida'
                TabOrder = 0
                object Label44: TLabel
                  Left = 6
                  Top = 57
                  Width = 80
                  Height = 13
                  Caption = 'Total Principal'
                end
                object Label74: TLabel
                  Left = 96
                  Top = 57
                  Width = 30
                  Height = 13
                  Caption = 'Juros'
                end
                object Label75: TLabel
                  Left = 182
                  Top = 57
                  Width = 30
                  Height = 13
                  Caption = 'Multa'
                end
                object Label82: TLabel
                  Left = 7
                  Top = 113
                  Width = 71
                  Height = 13
                  Caption = 'Maior atraso'
                end
                object lb_mariorAtraso: TLabel
                  Left = 123
                  Top = 113
                  Width = 23
                  Height = 13
                  Caption = 'dias'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                end
                object Label78: TLabel
                  Left = 175
                  Top = 96
                  Width = 86
                  Height = 13
                  Caption = 'Total da D'#237'vida'
                end
                object SpeedButton3: TSpeedButton
                  Left = 5
                  Top = 18
                  Width = 86
                  Height = 30
                  Hint = 'Esconde a tela'
                  Caption = 'Atualizar'
                  Flat = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clNone
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000120B0000120B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
                    73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
                    0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
                    0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                    0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                    0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
                    0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
                    0333337F777777737F333308888888880333337F333333337F33330888888888
                    03333373FFFFFFFF733333700000000073333337777777773333}
                  NumGlyphs = 2
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = SpeedButton3Click
                end
                object Label83: TLabel
                  Left = 113
                  Top = 13
                  Width = 122
                  Height = 13
                  Caption = 'Data prevista p/ Pgto'
                end
                object Label112: TLabel
                  Left = 99
                  Top = 30
                  Width = 17
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'dia'
                end
                object edt_divida: TCurrencyEdit
                  Left = 7
                  Top = 73
                  Width = 84
                  Height = 19
                  AutoSize = False
                  Color = cl3DLight
                  DisplayFormat = '0.00;-,0.00'
                  ReadOnly = True
                  TabOrder = 0
                end
                object edt_juros: TCurrencyEdit
                  Left = 94
                  Top = 73
                  Width = 84
                  Height = 18
                  AutoSize = False
                  Color = cl3DLight
                  DisplayFormat = '0.00;-,0.00'
                  ReadOnly = True
                  TabOrder = 1
                end
                object edt_multa: TCurrencyEdit
                  Left = 180
                  Top = 73
                  Width = 81
                  Height = 19
                  AutoSize = False
                  Color = cl3DLight
                  DisplayFormat = '0.00;-,0.00'
                  ReadOnly = True
                  TabOrder = 2
                end
                object edt_totalDivida: TCurrencyEdit
                  Left = 175
                  Top = 112
                  Width = 84
                  Height = 18
                  AutoSize = False
                  Color = cl3DLight
                  DisplayFormat = '0.00;-,0.00'
                  ReadOnly = True
                  TabOrder = 3
                end
                object dias_atraso: TEdit
                  Left = 80
                  Top = 109
                  Width = 41
                  Height = 21
                  Color = cl3DLight
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 5
                end
                object edt_dataPgto: TDateEdit
                  Left = 144
                  Top = 27
                  Width = 113
                  Height = 22
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  NumGlyphs = 2
                  ParentFont = False
                  TabOrder = 6
                  OnExit = edt_dataPgtoExit
                end
                object edt_diasprev: TEdit
                  Left = 117
                  Top = 28
                  Width = 24
                  Height = 22
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                  OnExit = edt_diasprevExit
                end
              end
              object gb_pagamento: TGroupBox
                Left = 269
                Top = 1
                Width = 732
                Height = 137
                Caption = 'Dados do Pagamento'
                TabOrder = 1
                object btn_geraRecibo: TSpeedButton
                  Left = 629
                  Top = 43
                  Width = 98
                  Height = 55
                  BiDiMode = bdRightToLeft
                  Caption = 'Gravar Acordo'
                  Flat = True
                  Glyph.Data = {
                    76020000424D7602000000000000760000002800000020000000200000000100
                    0400000000000002000000000000000000001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F00000000000
                    0000000000000000000F087777777777777777777777777777700F8888888888
                    888888888888888888700F8888888888888888888888888888700F8888888888
                    8888FF888888888888700F8888888888888F44F88888888888700F8888888888
                    888F44F88888888888700F888888888888F4444F8888888888700F8888888888
                    8F44444FF888888888700F8888888888F4444444F888888888700F880000000F
                    444447444F88888888700F880FFFFFF44444F0744F88888888700F880FFFFF44
                    444FF07444F8888888700F880FF8888444FFF087444F888888700F880FF88888
                    4FFFF088744F888888700F880FFFFFFFFFFFF0888744F88888700F880FF88888
                    888FF08888744F8888700F880FF88888888FF088888744F888700F880FFFFFFF
                    FFFFF0888888744F88700F880FF88888888FF0888888887488700F880FF88888
                    877880888888888488700F880FFFFFFF000000888888888888700F880FF88888
                    0F8F08888888888888700F880FF8888808F088888888888888700F880FFFFFFF
                    0F0888888888888888700F880FFFFFFF008888888888888888700F8800000000
                    088888888888888888700F8888888888888888888888888888700FFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFF80F000000000000000000000000000000FFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  Layout = blGlyphTop
                  ParentBiDiMode = False
                  OnClick = btn_geraReciboClick
                end
                object GroupBox15: TGroupBox
                  Left = 492
                  Top = 12
                  Width = 128
                  Height = 119
                  ParentColor = False
                  TabOrder = 0
                  object Label77: TLabel
                    Left = 15
                    Top = 29
                    Width = 101
                    Height = 13
                    Caption = 'Valor l'#237'quido para'
                  end
                  object Label110: TLabel
                    Left = 49
                    Top = 46
                    Width = 64
                    Height = 13
                    Caption = 'Pagamento'
                  end
                  object vr_pagamento: TCurrencyEdit
                    Left = 15
                    Top = 67
                    Width = 105
                    Height = 25
                    AutoSize = False
                    DisplayFormat = '0.00;-,0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
                object GroupBox16: TGroupBox
                  Left = 7
                  Top = 13
                  Width = 130
                  Height = 56
                  Caption = 'Descontos Juros'
                  TabOrder = 1
                  object Label71: TLabel
                    Left = 86
                    Top = 13
                    Width = 15
                    Height = 13
                    Caption = 'R$'
                  end
                  object Label102: TLabel
                    Left = 22
                    Top = 13
                    Width = 12
                    Height = 13
                    Caption = '%'
                  end
                  object desc_juros: TCurrencyEdit
                    Left = 47
                    Top = 30
                    Width = 79
                    Height = 21
                    AutoSize = False
                    DisplayFormat = '0.00;-,0.00'
                    TabOrder = 1
                    OnExit = desc_jurosExit
                  end
                  object edt_percdescj: TCurrencyEdit
                    Left = 4
                    Top = 30
                    Width = 40
                    Height = 21
                    AutoSize = False
                    DecimalPlaces = 0
                    DisplayFormat = '0;-,0'
                    TabOrder = 0
                    OnExit = edt_percdescjExit
                  end
                end
                object GroupBox17: TGroupBox
                  Left = 138
                  Top = 13
                  Width = 117
                  Height = 57
                  Caption = 'Desconto de Multa'
                  TabOrder = 2
                  object Label103: TLabel
                    Left = 22
                    Top = 13
                    Width = 12
                    Height = 13
                    Caption = '%'
                  end
                  object Label72: TLabel
                    Left = 86
                    Top = 13
                    Width = 15
                    Height = 13
                    Caption = 'R$'
                  end
                  object edt_percdescm: TCurrencyEdit
                    Left = 5
                    Top = 30
                    Width = 38
                    Height = 21
                    AutoSize = False
                    DisplayFormat = '0;-,0'
                    TabOrder = 0
                    OnExit = edt_percdescmExit
                  end
                  object desc_multa: TCurrencyEdit
                    Left = 47
                    Top = 30
                    Width = 58
                    Height = 21
                    AutoSize = False
                    DisplayFormat = '0.00;-,0.00'
                    TabOrder = 1
                    OnExit = desc_multaExit
                  end
                end
                object GroupBox18: TGroupBox
                  Left = 256
                  Top = 14
                  Width = 135
                  Height = 56
                  Caption = 'Desconto de Principal'
                  TabOrder = 3
                  object Label104: TLabel
                    Left = 26
                    Top = 14
                    Width = 12
                    Height = 13
                    Caption = '%'
                  end
                  object Label105: TLabel
                    Left = 86
                    Top = 13
                    Width = 15
                    Height = 13
                    Caption = 'R$'
                  end
                  object edt_percdescp: TCurrencyEdit
                    Left = 5
                    Top = 30
                    Width = 35
                    Height = 21
                    AutoSize = False
                    DisplayFormat = '0;-,0'
                    TabOrder = 0
                    OnExit = edt_percdescpExit
                  end
                  object desc_principal: TCurrencyEdit
                    Left = 44
                    Top = 30
                    Width = 85
                    Height = 21
                    AutoSize = False
                    DisplayFormat = '0.00;-,0.00'
                    TabOrder = 1
                    OnExit = desc_principalExit
                  end
                end
                object GroupBox19: TGroupBox
                  Left = 7
                  Top = 71
                  Width = 483
                  Height = 58
                  Caption = 'Acr'#233'scimos'
                  TabOrder = 4
                  object Label79: TLabel
                    Left = 4
                    Top = 15
                    Width = 81
                    Height = 13
                    Caption = 'Valor Protesto'
                  end
                  object Label80: TLabel
                    Left = 93
                    Top = 15
                    Width = 62
                    Height = 13
                    Caption = 'Honor'#225'rios'
                  end
                  object Label81: TLabel
                    Left = 176
                    Top = 15
                    Width = 84
                    Height = 13
                    Caption = 'Valor reten'#231#227'o'
                  end
                  object Label76: TLabel
                    Left = 279
                    Top = 15
                    Width = 72
                    Height = 13
                    Caption = 'Observa'#231#227'o '
                  end
                  object vr_protesto: TCurrencyEdit
                    Left = 5
                    Top = 30
                    Width = 77
                    Height = 21
                    AutoSize = False
                    DisplayFormat = '0.00;-,0.00'
                    TabOrder = 0
                    OnExit = vr_protestoExit
                  end
                  object vr_honorario: TCurrencyEdit
                    Left = 91
                    Top = 30
                    Width = 77
                    Height = 21
                    AutoSize = False
                    DisplayFormat = '0.00;-,0.00'
                    TabOrder = 1
                    OnExit = vr_honorarioExit
                  end
                  object vr_retencao: TCurrencyEdit
                    Left = 174
                    Top = 30
                    Width = 83
                    Height = 21
                    AutoSize = False
                    DisplayFormat = '0.00;-,0.00'
                    Enabled = False
                    TabOrder = 2
                    OnExit = vr_retencaoExit
                  end
                  object obs_pgto: TEdit
                    Left = 277
                    Top = 30
                    Width = 199
                    Height = 21
                    TabOrder = 3
                  end
                end
                object GroupBox22: TGroupBox
                  Left = 392
                  Top = 14
                  Width = 99
                  Height = 56
                  Caption = 'Baixas Parciais'
                  TabOrder = 5
                  object Label114: TLabel
                    Left = 71
                    Top = 13
                    Width = 15
                    Height = 13
                    Caption = 'R$'
                  end
                  object edt_bxparcial: TCurrencyEdit
                    Left = 4
                    Top = 30
                    Width = 85
                    Height = 21
                    AutoSize = False
                    DisplayFormat = '0.00;-,0.00'
                    ReadOnly = True
                    TabOrder = 0
                    OnExit = desc_principalExit
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  object Panel11: TPanel
    Left = 2
    Top = 388
    Width = 312
    Height = 82
    BevelOuter = bvNone
    TabOrder = 4
    object pn_botoes: TPanel
      Left = 0
      Top = 0
      Width = 312
      Height = 82
      Align = alClient
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object SpeedButton5: TSpeedButton
        Left = 78
        Top = 9
        Width = 155
        Height = 67
        BiDiMode = bdRightToLeft
        Caption = 'Gravar di'#225'logo'
        Flat = True
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F00000000000
          0000000000000000000F087777777777777777777777777777700F8888888888
          888888888888888888700F8888888888888888888888888888700F8888888888
          8888FF888888888888700F8888888888888F44F88888888888700F8888888888
          888F44F88888888888700F888888888888F4444F8888888888700F8888888888
          8F44444FF888888888700F8888888888F4444444F888888888700F880000000F
          444447444F88888888700F880FFFFFF44444F0744F88888888700F880FFFFF44
          444FF07444F8888888700F880FF8888444FFF087444F888888700F880FF88888
          4FFFF088744F888888700F880FFFFFFFFFFFF0888744F88888700F880FF88888
          888FF08888744F8888700F880FF88888888FF088888744F888700F880FFFFFFF
          FFFFF0888888744F88700F880FF88888888FF0888888887488700F880FF88888
          877880888888888488700F880FFFFFFF000000888888888888700F880FF88888
          0F8F08888888888888700F880FF8888808F088888888888888700F880FFFFFFF
          0F0888888888888888700F880FFFFFFF008888888888888888700F8800000000
          088888888888888888700F8888888888888888888888888888700FFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF80F000000000000000000000000000000FFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Layout = blGlyphTop
        ParentBiDiMode = False
        OnClick = SpeedButton5Click
      end
    end
  end
  object Panel13: TPanel
    Left = 316
    Top = 388
    Width = 134
    Height = 82
    BevelOuter = bvNone
    TabOrder = 5
    object Label10: TLabel
      Left = 8
      Top = 23
      Width = 72
      Height = 13
      Caption = 'F10 - Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 8
      Top = 51
      Width = 113
      Height = 13
      Caption = 'ESC - Fechar e Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 3
    Width = 1050
    Height = 46
    Align = alTop
    BevelOuter = bvLowered
    Color = clBlack
    TabOrder = 6
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 1048
      Height = 44
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
    object lb_usuario: TLabel
      Left = 10
      Top = 14
      Width = 244
      Height = 18
      AutoSize = False
      Caption = 'Usu'#225'rio'
      Color = clNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lb_totalDevedores: TLabel
      Left = 262
      Top = 14
      Width = 171
      Height = 18
      AutoSize = False
      Caption = 'lb_totalDevedores'
      Color = clNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lb_mensagem: TLabel
      Left = 438
      Top = 15
      Width = 57
      Height = 18
      AutoSize = False
      Caption = '...'
      Color = clNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object bt_fechar: TSpeedButton
      Left = 882
      Top = 5
      Width = 131
      Height = 36
      Hint = 'Esconde a tela'
      Caption = '&Fechar e Sair'
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
    object lb_outrocobrador: TLabel
      Left = 494
      Top = 15
      Width = 206
      Height = 21
      AutoSize = False
      Caption = 'Usu'#225'rio'
      Color = clRed
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object gb_mens: TGroupBox
      Left = 709
      Top = -2
      Width = 165
      Height = 42
      Color = clNone
      ParentColor = False
      TabOrder = 0
      Visible = False
      object lb_mens: TLabel
        Left = 7
        Top = 10
        Width = 154
        Height = 13
        AutoSize = False
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Gauge1: TGauge
        Left = 5
        Top = 25
        Width = 153
        Height = 14
        Color = clNone
        ParentColor = False
        Progress = 0
      end
    end
  end
  object Dts_cliente: TDataSource
    Left = 264
    Top = 8
  end
  object qry_devedores: TADODataSet
    Connection = DM.DB
    CursorType = ctStatic
    CommandText = 
      'select *'#13#10'from DEVEDORES '#13#10'where 1=2'#13#10'order by valor_divida desc' +
      #13#10#13#10
    Parameters = <>
    Left = 216
    Top = 160
  end
  object qry_temp: TADOQuery
    Connection = DM.DB
    Parameters = <>
    Left = 577
    Top = 33
  end
  object devedor: TADODataSet
    Connection = DM.DB
    AfterOpen = devedorAfterOpen
    OnCalcFields = devedorCalcFields
    CommandText = 'select *'#13#10'from DEVEDORES '#13#10'where 1=2'#13#10#13#10
    Parameters = <>
    Left = 544
    Top = 296
    object devedorpk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object devedorpk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object devedorchave_no_cliente: TIntegerField
      FieldName = 'chave_no_cliente'
    end
    object devedorcodigo_no_cliente: TStringField
      FieldName = 'codigo_no_cliente'
      Size = 30
    end
    object devedorCGC_CPF: TStringField
      FieldName = 'CGC_CPF'
      Size = 50
    end
    object devedortitular_avalista: TStringField
      FieldName = 'titular_avalista'
      Size = 50
    end
    object devedorNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object devedorRG: TStringField
      FieldName = 'RG'
      Size = 50
    end
    object devedorOrgao_Rg: TStringField
      FieldName = 'Orgao_Rg'
      Size = 50
    end
    object devedordata_nasc: TDateTimeField
      FieldName = 'data_nasc'
    end
    object devedortelefones: TStringField
      FieldName = 'telefones'
      Size = 50
    end
    object devedortipo_logradouro: TStringField
      FieldName = 'tipo_logradouro'
      Size = 10
    end
    object devedorlogradouro: TStringField
      FieldName = 'logradouro'
      Size = 50
    end
    object devedorNumero: TStringField
      FieldName = 'Numero'
      Size = 50
    end
    object devedorComplemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object devedorBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object devedorCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object devedorCep: TStringField
      FieldName = 'Cep'
      Size = 50
    end
    object devedorUf: TStringField
      FieldName = 'Uf'
      Size = 50
    end
    object devedorponto_referencia: TStringField
      FieldName = 'ponto_referencia'
      Size = 50
    end
    object devedortrabalho_nome: TStringField
      FieldName = 'trabalho_nome'
      Size = 50
    end
    object devedorTrab_logradouro: TStringField
      FieldName = 'Trab_logradouro'
      Size = 50
    end
    object devedortrab_numero: TStringField
      FieldName = 'trab_numero'
      Size = 10
    end
    object devedortrab_bairro: TStringField
      FieldName = 'trab_bairro'
      Size = 50
    end
    object devedorTrab_cidade: TStringField
      FieldName = 'Trab_cidade'
      Size = 50
    end
    object devedorTrab_uf: TStringField
      FieldName = 'Trab_uf'
      Size = 50
    end
    object devedortrab_fones: TStringField
      FieldName = 'trab_fones'
      Size = 50
    end
    object devedortrab_complemento: TStringField
      FieldName = 'trab_complemento'
      Size = 50
    end
    object devedortrab_ponto_refer: TStringField
      FieldName = 'trab_ponto_refer'
      Size = 50
    end
    object devedortrab_cep: TStringField
      FieldName = 'trab_cep'
      Size = 50
    end
    object devedorProfissao: TStringField
      FieldName = 'Profissao'
      Size = 50
    end
    object devedorSEXO: TStringField
      FieldName = 'SEXO'
      Size = 50
    end
    object devedorprim_ref_pessoal: TStringField
      FieldName = 'prim_ref_pessoal'
      Size = 50
    end
    object devedorprim_ref_pessoal_fones: TStringField
      FieldName = 'prim_ref_pessoal_fones'
      Size = 50
    end
    object devedorseg_ref_pessoal: TStringField
      FieldName = 'seg_ref_pessoal'
      Size = 50
    end
    object devedorseg_ref_pessoal_fones: TStringField
      FieldName = 'seg_ref_pessoal_fones'
      Size = 50
    end
    object devedordata_baixa: TDateTimeField
      FieldName = 'data_baixa'
    end
    object devedoragendado_data: TDateTimeField
      FieldName = 'agendado_data'
    end
    object devedoragendado_hora: TStringField
      FieldName = 'agendado_hora'
      Size = 50
    end
    object devedoragendado_tipo: TIntegerField
      FieldName = 'agendado_tipo'
    end
    object devedorseq_arq_inclusao: TIntegerField
      FieldName = 'seq_arq_inclusao'
    end
    object devedorseq_arq_baixa: TIntegerField
      FieldName = 'seq_arq_baixa'
    end
    object devedorusuario_baixa: TIntegerField
      FieldName = 'usuario_baixa'
    end
    object devedorusuario_inclusao: TIntegerField
      FieldName = 'usuario_inclusao'
    end
    object devedormotivo_baixa: TStringField
      FieldName = 'motivo_baixa'
      Size = 2
    end
    object devedorvalor_divida: TFloatField
      FieldName = 'valor_divida'
    end
    object devedordata_dialogo: TDateTimeField
      FieldName = 'data_dialogo'
    end
    object devedormotivo_dialogo: TIntegerField
      FieldName = 'motivo_dialogo'
    end
    object devedorpk_cobrador: TIntegerField
      FieldName = 'pk_cobrador'
    end
    object devedornMotivo_baixa: TStringField
      FieldKind = fkCalculated
      FieldName = 'nMotivo_baixa'
      Size = 10
      Calculated = True
    end
    object devedoragendado_cobrador: TIntegerField
      FieldName = 'agendado_cobrador'
    end
    object devedornossonumero: TStringField
      FieldName = 'nossonumero'
      Size = 15
    end
    object devedoranotacoes: TStringField
      FieldName = 'anotacoes'
      Size = 2000
    end
  end
  object DataSource1: TDataSource
    DataSet = devedor
    Left = 584
    Top = 296
  end
  object qry_divida: TADOQuery
    Connection = DM.DB
    CursorType = ctStatic
    AfterScroll = qry_dividaAfterScroll
    OnCalcFields = qry_dividaCalcFields
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from titulos'
      'where 1=2')
    Left = 627
    Top = 478
    object qry_dividapk_titulo: TIntegerField
      FieldName = 'pk_titulo'
    end
    object qry_dividapk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object qry_dividapk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object qry_dividanome_banco: TStringField
      FieldName = 'nome_banco'
    end
    object qry_dividaBanco: TStringField
      FieldName = 'Banco'
      Size = 10
    end
    object qry_dividaAgencia: TStringField
      FieldName = 'Agencia'
      Size = 10
    end
    object qry_dividaConta: TStringField
      FieldName = 'Conta'
      Size = 15
    end
    object qry_dividaCheque: TStringField
      FieldName = 'Cheque'
      Size = 15
    end
    object qry_dividaEndossado: TStringField
      FieldName = 'Endossado'
      Size = 50
    end
    object qry_dividaEndossado_CPF: TStringField
      FieldName = 'Endossado_CPF'
      Size = 30
    end
    object qry_dividaemissao: TDateTimeField
      FieldName = 'emissao'
    end
    object qry_dividaVencimento: TDateTimeField
      FieldName = 'Vencimento'
    end
    object qry_dividavenc_ult_extrato: TDateTimeField
      FieldName = 'venc_ult_extrato'
    end
    object qry_dividadias_atraso_remessa: TIntegerField
      FieldName = 'dias_atraso_remessa'
    end
    object qry_dividaValor_titulo: TFloatField
      FieldName = 'Valor_titulo'
      DisplayFormat = '#.#0'
    end
    object qry_dividavalor_principal: TFloatField
      FieldName = 'valor_principal'
      DisplayFormat = '#.#0'
    end
    object qry_dividapagamento_minimo: TFloatField
      FieldName = 'pagamento_minimo'
    end
    object qry_dividaperc_taxa_mes_fin: TFloatField
      FieldName = 'perc_taxa_mes_fin'
    end
    object qry_dividaperc_taxa_mes_juros: TFloatField
      FieldName = 'perc_taxa_mes_juros'
    end
    object qry_dividaperc_taxa_multa: TFloatField
      FieldName = 'perc_taxa_multa'
    end
    object qry_dividavalor_avencer_remessa: TFloatField
      FieldName = 'valor_avencer_remessa'
    end
    object qry_dividamotivo_baixa: TStringField
      FieldName = 'motivo_baixa'
      Size = 2
    end
    object qry_dividausuario_baixa: TIntegerField
      FieldName = 'usuario_baixa'
    end
    object qry_dividadata_baixa: TDateTimeField
      FieldName = 'data_baixa'
    end
    object qry_dividatipo_titulo: TStringField
      FieldName = 'tipo_titulo'
      Size = 2
    end
    object qry_dividaAgenda_Data: TDateTimeField
      FieldName = 'Agenda_Data'
    end
    object qry_dividaAgenda_Hora: TStringField
      FieldName = 'Agenda_Hora'
      Size = 10
    end
    object qry_dividaAgenda_Tipo: TStringField
      FieldName = 'Agenda_Tipo'
      Size = 1
    end
    object qry_dividausuario_inclusao: TIntegerField
      FieldName = 'usuario_inclusao'
    end
    object qry_dividaData_inclusao: TDateTimeField
      FieldName = 'Data_inclusao'
    end
    object qry_dividachave_avalista: TIntegerField
      FieldName = 'chave_avalista'
    end
    object qry_dividapraca_cheque: TStringField
      FieldName = 'praca_cheque'
      Size = 25
    end
    object qry_dividaalinea_devol: TStringField
      FieldName = 'alinea_devol'
      Size = 2
    end
    object qry_dividaatraso_atual: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'atraso_atual'
      Calculated = True
    end
    object qry_dividanMotivo_baixa: TStringField
      FieldKind = fkCalculated
      FieldName = 'nMotivo_baixa'
      Size = 10
      Calculated = True
    end
    object qry_dividapk_recibo: TIntegerField
      FieldName = 'pk_recibo'
    end
    object qry_dividaatu_data: TDateTimeField
      FieldName = 'atu_data'
    end
    object qry_dividaatu_juros: TBCDField
      FieldName = 'atu_juros'
      DisplayFormat = '#0.#0'
      Precision = 18
      Size = 0
    end
    object qry_dividaatu_multa: TBCDField
      FieldName = 'atu_multa'
      DisplayFormat = '#0.#0'
      Precision = 18
      Size = 0
    end
    object qry_dividaatu_percjuro: TBCDField
      FieldName = 'atu_percjuro'
      DisplayFormat = '#0.#0'
      Precision = 18
      Size = 0
    end
    object qry_dividaatu_percmulta: TBCDField
      FieldName = 'atu_percmulta'
      DisplayFormat = '#0.#0'
      Precision = 18
      Size = 0
    end
    object qry_dividaatualizar: TStringField
      FieldName = 'atualizar'
      FixedChar = True
      Size = 3
    end
    object qry_dividaatu_retencao: TBCDField
      FieldName = 'atu_retencao'
      Precision = 18
      Size = 0
    end
    object qry_dividaatu_valor: TBCDField
      FieldName = 'atu_valor'
      DisplayFormat = '#0.#0'
      Precision = 18
      Size = 0
    end
    object qry_dividachave_contrato: TStringField
      FieldName = 'chave_contrato'
      Size = 12
    end
    object qry_dividanumero_titulo: TStringField
      FieldName = 'numero_titulo'
    end
    object qry_dividachave_titulo: TStringField
      FieldName = 'chave_titulo'
      Size = 12
    end
    object qry_dividaseq_arq_inclusao: TIntegerField
      FieldName = 'seq_arq_inclusao'
    end
    object qry_dividaseq_arq_baixa: TIntegerField
      FieldName = 'seq_arq_baixa'
    end
  end
  object dts_divida: TDataSource
    DataSet = qry_divida
    Left = 659
    Top = 478
  end
  object qry_evento: TADODataSet
    Connection = DM.DB
    CommandText = 'select *'#13#10'from EVENTOS'#13#10'where 1=2'
    Parameters = <>
    Left = 680
    Top = 32
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
    object qry_eventomarcar_nao_localiz: TStringField
      FieldName = 'marcar_nao_localiz'
      Size = 1
    end
    object qry_eventoseq_arq_inclusao: TIntegerField
      FieldName = 'seq_arq_inclusao'
    end
    object qry_eventoagendado_cobrador: TIntegerField
      FieldName = 'agendado_cobrador'
    end
    object qry_eventopk_cobrador: TIntegerField
      FieldName = 'pk_cobrador'
    end
    object qry_eventopk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
  end
  object telefones: TADODataSet
    Connection = DM.DB
    BeforePost = telefonesBeforePost
    CommandText = 'select * from telefones where 1=2'#13#10
    Parameters = <>
    Left = 464
    Top = 32
    object telefonesid: TIntegerField
      FieldName = 'id'
    end
    object telefonespk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object telefonestipo_fone: TStringField
      FieldName = 'tipo_fone'
      Size = 15
    end
    object telefonesTelefone: TStringField
      FieldName = 'Telefone'
      Size = 40
    end
  end
  object dts_telefones: TDataSource
    DataSet = telefones
    Left = 464
    Top = 65530
  end
  object qry_cliente: TADOQuery
    Connection = DM.DB
    Parameters = <
      item
        Name = 'cliente'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select *  from clientes where pk_cliente=:cliente')
    Left = 805
    Top = 57
    object qry_clientepk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object qry_clientenome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qry_clienteperc_juros_mes: TBCDField
      FieldName = 'perc_juros_mes'
      Precision = 18
      Size = 0
    end
    object qry_clienteperc_multa: TBCDField
      FieldName = 'perc_multa'
      Precision = 10
      Size = 0
    end
  end
  object DataSource2: TDataSource
    DataSet = qry_cliente
    Left = 768
    Top = 56
  end
  object qry_historico: TADOQuery
    Connection = DM.DB
    CursorType = ctStatic
    OnCalcFields = qry_historicoCalcFields
    Parameters = <>
    SQL.Strings = (
      'select e.* , o.nome as nome_dialogo'
      'from eventos e left join'
      'ocorrencias o on (e.motivo=o.pk_ocorr)'
      'where 1=2'
      'order by e.data ,e.hora desc')
    Left = 360
    Top = 490
    object qry_historicochave: TIntegerField
      FieldName = 'chave'
    end
    object qry_historicopk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object qry_historicoData: TDateTimeField
      FieldName = 'Data'
    end
    object qry_historicoHora: TStringField
      FieldName = 'Hora'
      Size = 10
    end
    object qry_historicoTexto: TStringField
      FieldName = 'Texto'
      Size = 250
    end
    object qry_historicomotivo: TIntegerField
      FieldName = 'motivo'
    end
    object qry_historicoAgendado_Data: TDateTimeField
      FieldName = 'Agendado_Data'
    end
    object qry_historicoAgendado_Hora: TStringField
      FieldName = 'Agendado_Hora'
      Size = 50
    end
    object qry_historicoseq_arq_inclusao: TIntegerField
      FieldName = 'seq_arq_inclusao'
    end
    object qry_historiconome_dialogo: TStringField
      FieldName = 'nome_dialogo'
      Size = 30
    end
  end
  object dts_historicos: TDataSource
    AutoEdit = False
    DataSet = qry_historico
    Left = 400
    Top = 490
  end
  object qry_agendamento: TADODataSet
    Connection = DM.DB
    CommandText = 
      'select *'#13#10'from devedores'#13#10' where agendado_hora is not null and a' +
      'gendado_data=:data and (pk_cobrador=:cobrador or agendado_cobrad' +
      'or=:cobrador2) and data_baixa is null'
    Parameters = <
      item
        Name = 'data'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'cobrador'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'cobrador2'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 882
    Top = 72
    object qry_agendamentopk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object qry_agendamentopk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object qry_agendamentochave_no_cliente: TIntegerField
      FieldName = 'chave_no_cliente'
    end
    object qry_agendamentocodigo_no_cliente: TStringField
      FieldName = 'codigo_no_cliente'
      Size = 30
    end
    object qry_agendamentoCGC_CPF: TStringField
      FieldName = 'CGC_CPF'
      Size = 50
    end
    object qry_agendamentotitular_avalista: TStringField
      FieldName = 'titular_avalista'
      Size = 50
    end
    object qry_agendamentoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qry_agendamentoRG: TStringField
      FieldName = 'RG'
      Size = 50
    end
    object qry_agendamentoOrgao_Rg: TStringField
      FieldName = 'Orgao_Rg'
      Size = 50
    end
    object qry_agendamentodata_nasc: TDateTimeField
      FieldName = 'data_nasc'
    end
    object qry_agendamentotelefones: TStringField
      FieldName = 'telefones'
      Size = 50
    end
    object qry_agendamentotipo_logradouro: TStringField
      FieldName = 'tipo_logradouro'
      Size = 10
    end
    object qry_agendamentologradouro: TStringField
      FieldName = 'logradouro'
      Size = 50
    end
    object qry_agendamentoNumero: TStringField
      FieldName = 'Numero'
      Size = 50
    end
    object qry_agendamentoComplemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object qry_agendamentoBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object qry_agendamentoCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qry_agendamentoCep: TStringField
      FieldName = 'Cep'
      Size = 50
    end
    object qry_agendamentoUf: TStringField
      FieldName = 'Uf'
      Size = 50
    end
    object qry_agendamentoponto_referencia: TStringField
      FieldName = 'ponto_referencia'
      Size = 50
    end
    object qry_agendamentotrabalho_nome: TStringField
      FieldName = 'trabalho_nome'
      Size = 50
    end
    object qry_agendamentoTrab_logradouro: TStringField
      FieldName = 'Trab_logradouro'
      Size = 50
    end
    object qry_agendamentotrab_numero: TStringField
      FieldName = 'trab_numero'
      Size = 10
    end
    object qry_agendamentotrab_bairro: TStringField
      FieldName = 'trab_bairro'
      Size = 50
    end
    object qry_agendamentoTrab_cidade: TStringField
      FieldName = 'Trab_cidade'
      Size = 50
    end
    object qry_agendamentoTrab_uf: TStringField
      FieldName = 'Trab_uf'
      Size = 50
    end
    object qry_agendamentotrab_fones: TStringField
      FieldName = 'trab_fones'
      Size = 50
    end
    object qry_agendamentotrab_complemento: TStringField
      FieldName = 'trab_complemento'
      Size = 50
    end
    object qry_agendamentotrab_ponto_refer: TStringField
      FieldName = 'trab_ponto_refer'
      Size = 50
    end
    object qry_agendamentotrab_cep: TStringField
      FieldName = 'trab_cep'
      Size = 50
    end
    object qry_agendamentoProfissao: TStringField
      FieldName = 'Profissao'
      Size = 50
    end
    object qry_agendamentoSEXO: TStringField
      FieldName = 'SEXO'
      Size = 50
    end
    object qry_agendamentoprim_ref_pessoal: TStringField
      FieldName = 'prim_ref_pessoal'
      Size = 50
    end
    object qry_agendamentoprim_ref_pessoal_fones: TStringField
      FieldName = 'prim_ref_pessoal_fones'
      Size = 50
    end
    object qry_agendamentoseg_ref_pessoal: TStringField
      FieldName = 'seg_ref_pessoal'
      Size = 50
    end
    object qry_agendamentoseg_ref_pessoal_fones: TStringField
      FieldName = 'seg_ref_pessoal_fones'
      Size = 50
    end
    object qry_agendamentonao_localizado: TDateTimeField
      FieldName = 'nao_localizado'
    end
    object qry_agendamentodata_baixa: TDateTimeField
      FieldName = 'data_baixa'
    end
    object qry_agendamentoagendado_data: TDateTimeField
      FieldName = 'agendado_data'
    end
    object qry_agendamentoagendado_hora: TStringField
      FieldName = 'agendado_hora'
      Size = 50
    end
    object qry_agendamentoagendado_tipo: TIntegerField
      FieldName = 'agendado_tipo'
    end
    object qry_agendamentoseq_arq_inclusao: TIntegerField
      FieldName = 'seq_arq_inclusao'
    end
    object qry_agendamentoseq_arq_baixa: TIntegerField
      FieldName = 'seq_arq_baixa'
    end
    object qry_agendamentousuario_baixa: TIntegerField
      FieldName = 'usuario_baixa'
    end
    object qry_agendamentousuario_inclusao: TIntegerField
      FieldName = 'usuario_inclusao'
    end
    object qry_agendamentomotivo_baixa: TStringField
      FieldName = 'motivo_baixa'
      Size = 2
    end
    object qry_agendamentovalor_divida: TFloatField
      FieldName = 'valor_divida'
    end
    object qry_agendamentomotivo_dialogo: TIntegerField
      FieldName = 'motivo_dialogo'
    end
    object qry_agendamentodata_dialogo: TDateTimeField
      FieldName = 'data_dialogo'
    end
    object qry_agendamentopk_cobrador: TIntegerField
      FieldName = 'pk_cobrador'
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 914
    Top = 72
  end
  object temp: TADOCommand
    Connection = DM.DB
    Parameters = <>
    Left = 64
    Top = 112
  end
  object qry_clientes: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select *  from clientes '
      'where inativado is null')
    Left = 781
    Top = 97
    object IntegerField1: TIntegerField
      FieldName = 'pk_cliente'
    end
    object StringField1: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qry_clientesperc_juros_mes: TBCDField
      FieldName = 'perc_juros_mes'
      Precision = 18
      Size = 0
    end
    object qry_clientesperc_multa: TBCDField
      FieldName = 'perc_multa'
      Precision = 10
      Size = 0
    end
  end
  object dts_clientes: TDataSource
    DataSet = qry_clientes
    Left = 632
    Top = 112
  end
  object dts_devedores: TDataSource
    DataSet = qry_devedores
    Left = 251
    Top = 164
  end
  object usuarios: TADOTable
    Connection = DM.DB
    CursorType = ctStatic
    TableName = 'usuarios'
    Left = 336
    Top = 232
  end
  object dts_usuarios: TDataSource
    DataSet = usuarios
    Left = 368
    Top = 232
  end
  object recibos: TADODataSet
    Connection = DM.DB
    CursorType = ctStatic
    CommandText = 
      'select * from recibos where pk_devedor=:devedor order by data,pk' +
      '_recibo desc'
    Parameters = <
      item
        Name = 'devedor'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 738
    Top = 476
    object recibospk_recibo: TIntegerField
      FieldName = 'pk_recibo'
    end
    object recibospk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object recibosdata: TDateTimeField
      FieldName = 'data'
    end
    object reciboshora: TStringField
      FieldName = 'hora'
      Size = 10
    end
    object recibospk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object recibosusuario_cobrador: TIntegerField
      FieldName = 'usuario_cobrador'
    end
    object recibosprincipal: TBCDField
      FieldName = 'principal'
      Precision = 18
      Size = 0
    end
    object recibosjuros: TBCDField
      FieldName = 'juros'
      Precision = 18
      Size = 0
    end
    object recibosmulta: TBCDField
      FieldName = 'multa'
      Precision = 18
      Size = 0
    end
    object recibosdesc_principal: TBCDField
      FieldName = 'desc_principal'
      Precision = 18
      Size = 0
    end
    object recibosdesc_juros: TBCDField
      FieldName = 'desc_juros'
      Precision = 18
      Size = 0
    end
    object recibosdesc_multa: TBCDField
      FieldName = 'desc_multa'
      Precision = 18
      Size = 0
    end
    object recibosacres_protesto: TBCDField
      FieldName = 'acres_protesto'
      Precision = 18
      Size = 0
    end
    object recibosacres_honorarios: TBCDField
      FieldName = 'acres_honorarios'
      Precision = 18
      Size = 0
    end
    object recibosvalor_liquido: TBCDField
      FieldName = 'valor_liquido'
      Precision = 18
      Size = 0
    end
    object recibostaxa_retenc: TBCDField
      FieldName = 'taxa_retenc'
      Precision = 18
      Size = 0
    end
    object recibosvalor_retenc: TBCDField
      FieldName = 'valor_retenc'
      Precision = 18
      Size = 0
    end
    object recibosdata_receb: TDateTimeField
      FieldName = 'data_receb'
    end
    object reciboshora_receb: TStringField
      FieldName = 'hora_receb'
      Size = 50
    end
    object recibosusuario_receb: TIntegerField
      FieldName = 'usuario_receb'
    end
    object recibosdata_canc: TDateTimeField
      FieldName = 'data_canc'
    end
    object reciboshora_canc: TStringField
      FieldName = 'hora_canc'
      Size = 50
    end
    object recibosusuario_canc: TIntegerField
      FieldName = 'usuario_canc'
    end
    object recibosobservacao: TStringField
      FieldName = 'observacao'
      Size = 100
    end
    object recibosdata_venc: TDateTimeField
      FieldName = 'data_venc'
    end
    object reciboschave_tabretenc: TIntegerField
      FieldName = 'chave_tabretenc'
    end
    object recibosdias_atraso: TIntegerField
      FieldName = 'dias_atraso'
    end
    object recibostipo: TIntegerField
      FieldName = 'tipo'
    end
    object recibospk_prestcontas: TIntegerField
      FieldName = 'pk_prestcontas'
    end
    object recibosbaixaparcial: TBCDField
      FieldName = 'baixaparcial'
      Precision = 18
      Size = 0
    end
    object recibosacordo: TIntegerField
      FieldName = 'acordo'
    end
  end
  object dts_recibos: TDataSource
    AutoEdit = False
    DataSet = recibos
    Left = 768
    Top = 473
  end
  object taxas: TADODataSet
    Connection = DM.DB
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from taxas_clientes'#13#10'where pk_cliente = :cliente'
    Parameters = <
      item
        Name = 'cliente'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 16
    Top = 432
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
  end
  object qry_ocorr: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from ocorrencias'
      'order by nome')
    Left = 35
    Top = 252
  end
  object dts_ocorr: TDataSource
    DataSet = qry_ocorr
    Left = 67
    Top = 252
  end
  object TbParam: TADOTable
    Connection = DM.DB
    TableName = 'PARAM'
    Left = 716
    Top = 97
  end
  object qry_bxparciais: TADOQuery
    Connection = DM.DB
    CursorType = ctStatic
    OnCalcFields = qry_historicoCalcFields
    Parameters = <
      item
        Name = 'devedor'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from baixasparciais where pk_devedor=:devedor'
      'order by data desc')
    Left = 72
    Top = 578
    object qry_bxparciaisPK_bxparcial: TIntegerField
      FieldName = 'PK_bxparcial'
    end
    object qry_bxparciaispk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object qry_bxparciaishistorico: TStringField
      FieldName = 'historico'
      Size = 50
    end
    object qry_bxparciaisdata: TDateTimeField
      FieldName = 'data'
    end
    object qry_bxparciaisvalor: TBCDField
      FieldName = 'valor'
      DisplayFormat = '#.#0'
      Precision = 18
      Size = 2
    end
    object qry_bxparciaispk_prestcontas: TIntegerField
      FieldName = 'pk_prestcontas'
    end
    object qry_bxparciaisacordo: TIntegerField
      FieldName = 'acordo'
    end
  end
  object dts_bxparciais: TDataSource
    AutoEdit = False
    DataSet = qry_bxparciais
    Left = 120
    Top = 578
  end
end
