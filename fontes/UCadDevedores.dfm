inherited Frm_Devedores: TFrm_Devedores
  Left = 138
  Top = 1
  Width = 1105
  Height = 698
  Caption = 'Manuten'#231#227'o de Devedores'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar: TSpeedBar
    Top = 41
    Width = 1097
    inherited SB_Salvar: TSpeedItem [3]
    end
    inherited SB_Cancelar: TSpeedItem [4]
    end
    inherited SB_Excluir: TSpeedItem [5]
    end
    inherited SB_Fechar: TSpeedItem [6]
      Left = 666
    end
    inherited SB_Buscar: TSpeedItem [7]
      Enabled = False
    end
    object sb_retirar: TSpeedItem
      BtnCaption = 'Retirar Assessoria'
      Caption = 'Retirar Devedor da Assessoria'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      Hint = 'Retirar Devedor da Assessoria|'
      NumGlyphs = 2
      Spacing = 1
      Left = 497
      Top = 3
      Visible = True
      WordWrap = True
      OnClick = sb_retirarClick
      SectionName = 'Untitled (0)'
    end
  end
  inherited Panel1: TPanel
    Top = 617
    Width = 1097
    object Label71: TLabel [1]
      Left = 912
      Top = 6
      Width = 26
      Height = 13
      Caption = 'Titulo'
    end
    object DBEdit74: TDBEdit
      Left = 942
      Top = 2
      Width = 65
      Height = 21
      Color = cl3DLight
      DataField = 'pk_titulo'
      DataSource = dts_divida
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 652
    Width = 1097
  end
  inherited Panel2: TPanel
    Top = 97
    Width = 1097
    Height = 520
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 1095
      Height = 518
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      OnChange = PageControl1Change
      object TabSheet1: TTabSheet
        Caption = 'Dados do Devedor'
        object Label39: TLabel
          Left = 292
          Top = 50
          Width = 43
          Height = 13
          Caption = 'Profissao'
          FocusControl = DBEdit25
        end
        object Label15: TLabel
          Left = 427
          Top = 6
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = DBEdit1
        end
        object Label16: TLabel
          Left = 0
          Top = 11
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
        object Label18: TLabel
          Left = 0
          Top = 55
          Width = 16
          Height = 13
          Caption = 'RG'
          FocusControl = DBEdit4
        end
        object Label65: TLabel
          Left = 102
          Top = 55
          Width = 54
          Height = 13
          Caption = 'Data_Nasc'
          FocusControl = DBEdit49
        end
        object Label19: TLabel
          Left = 175
          Top = 55
          Width = 49
          Height = 13
          Caption = 'Orgao_Rg'
          FocusControl = DBEdit5
        end
        object Label4: TLabel
          Left = 232
          Top = 55
          Width = 24
          Height = 13
          Caption = 'Sexo'
          FocusControl = DBEdit15
        end
        object Label3: TLabel
          Left = 130
          Top = 11
          Width = 28
          Height = 13
          Caption = 'Nome'
          FocusControl = DBEdit5
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 260
          Width = 556
          Height = 135
          Caption = 'Trabalho'
          TabOrder = 10
          object Label31: TLabel
            Left = 2
            Top = 17
            Width = 28
            Height = 13
            Caption = 'Nome'
            FocusControl = DBEdit17
          end
          object Label32: TLabel
            Left = 187
            Top = 17
            Width = 54
            Height = 13
            Caption = 'Logradouro'
          end
          object Label33: TLabel
            Left = 413
            Top = 17
            Width = 37
            Height = 13
            Caption = 'N'#250'mero'
          end
          object Label34: TLabel
            Left = 2
            Top = 52
            Width = 27
            Height = 13
            Caption = 'Bairro'
          end
          object Label36: TLabel
            Left = 184
            Top = 54
            Width = 14
            Height = 13
            Caption = 'UF'
          end
          object Label35: TLabel
            Left = 2
            Top = 87
            Width = 33
            Height = 13
            Caption = 'Cidade'
          end
          object Label38: TLabel
            Left = 178
            Top = 88
            Width = 64
            Height = 13
            Caption = 'Complemento'
          end
          object Label74: TLabel
            Left = 367
            Top = 87
            Width = 102
            Height = 13
            Caption = 'Pode enviar ao SPC?'
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
            Left = 2
            Top = 67
            Width = 129
            Height = 21
            DataField = 'trab_bairro'
            DataSource = DataSource1
            TabOrder = 3
          end
          object DBEdit22: TDBEdit
            Left = 181
            Top = 68
            Width = 73
            Height = 21
            DataField = 'Trab_uf'
            DataSource = DataSource1
            TabOrder = 4
          end
          object DBEdit21: TDBEdit
            Left = 2
            Top = 102
            Width = 137
            Height = 21
            DataField = 'Trab_cidade'
            DataSource = DataSource1
            TabOrder = 5
          end
          object DBEdit24: TDBEdit
            Left = 178
            Top = 104
            Width = 177
            Height = 21
            DataField = 'trab_complemento'
            DataSource = DataSource1
            TabOrder = 6
          end
          object DBCb_spc: TDBComboBox
            Left = 364
            Top = 103
            Width = 85
            Height = 21
            CharCase = ecUpperCase
            DataField = 'enviaaospc'
            DataSource = DataSource1
            ItemHeight = 13
            Items.Strings = (
              'SIM'
              'N'#195'O')
            TabOrder = 7
          end
        end
        object GroupBox2: TGroupBox
          Left = 1
          Top = 102
          Width = 555
          Height = 147
          Caption = 'Endere'#231'o '
          TabOrder = 9
          object Label22: TLabel
            Left = 8
            Top = 17
            Width = 13
            Height = 13
            Caption = 'Tp'
            FocusControl = DBEdit8
          end
          object Label23: TLabel
            Left = 102
            Top = 17
            Width = 50
            Height = 13
            Caption = 'logradouro'
            FocusControl = DBEdit9
          end
          object Label24: TLabel
            Left = 495
            Top = 17
            Width = 37
            Height = 13
            Caption = 'N'#250'mero'
            FocusControl = DBEdit10
          end
          object Label25: TLabel
            Left = 8
            Top = 57
            Width = 64
            Height = 13
            Caption = 'Complemento'
            FocusControl = DBEdit11
          end
          object Label26: TLabel
            Left = 163
            Top = 56
            Width = 27
            Height = 13
            Caption = 'Bairro'
            FocusControl = DBEdit12
          end
          object Label27: TLabel
            Left = 260
            Top = 56
            Width = 33
            Height = 13
            Caption = 'Cidade'
            FocusControl = DBEdit13
          end
          object Label28: TLabel
            Left = 456
            Top = 55
            Width = 19
            Height = 13
            Caption = 'Cep'
          end
          object Label30: TLabel
            Left = 8
            Top = 103
            Width = 98
            Height = 13
            Caption = 'Ponto de Refer'#234'ncia'
          end
          object Label43: TLabel
            Left = 256
            Top = 102
            Width = 28
            Height = 13
            Caption = 'e-Mail'
          end
          object Label64: TLabel
            Left = 417
            Top = 56
            Width = 11
            Height = 13
            Caption = 'Uf'
            FocusControl = DBEdit69
          end
          object DBEdit8: TDBEdit
            Left = 8
            Top = 33
            Width = 89
            Height = 21
            DataField = 'tipo_logradouro'
            DataSource = DataSource1
            TabOrder = 0
          end
          object DBEdit9: TDBEdit
            Left = 102
            Top = 33
            Width = 371
            Height = 21
            DataField = 'logradouro'
            DataSource = DataSource1
            TabOrder = 1
          end
          object DBEdit10: TDBEdit
            Left = 491
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
            Left = 162
            Top = 72
            Width = 97
            Height = 21
            DataField = 'Bairro'
            DataSource = DataSource1
            TabOrder = 4
          end
          object DBEdit13: TDBEdit
            Left = 260
            Top = 72
            Width = 153
            Height = 21
            DataField = 'Cidade'
            DataSource = DataSource1
            TabOrder = 5
          end
          object DBEdit14: TDBEdit
            Left = 456
            Top = 71
            Width = 91
            Height = 21
            DataField = 'Cep'
            DataSource = DataSource1
            TabOrder = 6
          end
          object DBEdit16: TDBEdit
            Left = 8
            Top = 119
            Width = 233
            Height = 21
            DataField = 'ponto_referencia'
            DataSource = DataSource1
            TabOrder = 7
          end
          object DBEdit56: TDBEdit
            Left = 257
            Top = 118
            Width = 293
            Height = 21
            DataField = 'email'
            DataSource = DataSource1
            TabOrder = 8
          end
          object DBEdit69: TDBEdit
            Left = 415
            Top = 72
            Width = 38
            Height = 21
            DataField = 'Uf'
            DataSource = DataSource1
            TabOrder = 9
          end
        end
        object DBEdit25: TDBEdit
          Left = 292
          Top = 70
          Width = 129
          Height = 21
          DataField = 'Profissao'
          DataSource = DataSource1
          TabOrder = 8
        end
        object DBEdit1: TDBEdit
          Left = 427
          Top = 25
          Width = 110
          Height = 21
          CharCase = ecUpperCase
          DataField = 'codigo'
          DataSource = DataSource1
          TabOrder = 7
        end
        object DBEdit4: TDBEdit
          Left = 0
          Top = 70
          Width = 97
          Height = 21
          DataField = 'RG'
          DataSource = DataSource1
          TabOrder = 3
        end
        object DBEdit49: TDBEdit
          Left = 103
          Top = 70
          Width = 65
          Height = 21
          DataField = 'data_nasc'
          DataSource = DataSource1
          TabOrder = 4
        end
        object DBEdit5: TDBEdit
          Left = 176
          Top = 70
          Width = 49
          Height = 21
          DataField = 'Orgao_Rg'
          DataSource = DataSource1
          TabOrder = 5
        end
        object DBEdit15: TDBEdit
          Left = 229
          Top = 70
          Width = 57
          Height = 21
          DataField = 'SEXO'
          DataSource = DataSource1
          TabOrder = 6
        end
        object DBEdit3: TDBEdit
          Left = 131
          Top = 26
          Width = 294
          Height = 21
          DataField = 'Nome'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object grid_fones: TDBGrid
          Left = 560
          Top = 64
          Width = 513
          Height = 185
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
          OnExit = grid_fonesExit
          Columns = <
            item
              Expanded = False
              FieldName = 'tipo_fone'
              Title.Caption = 'Tipo'
              Width = 123
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DDD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Telefone'
              Width = 303
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sms'
              PickList.Strings = (
                'S'
                'N')
              Visible = True
            end>
        end
        object GroupBox1: TGroupBox
          Left = 681
          Top = 402
          Width = 336
          Height = 78
          Caption = 'Baixa do Devedor na Cobran'#231'a'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 11
          Visible = False
          object Label7: TLabel
            Left = 9
            Top = 16
            Width = 67
            Height = 13
            Caption = 'Data da Baixa'
          end
          object Label8: TLabel
            Left = 138
            Top = 17
            Width = 61
            Height = 13
            Caption = 'Motivo Baixa'
            Color = clBtnFace
            ParentColor = False
          end
          object edt_dtPgto: TDBDateEdit
            Left = 9
            Top = 34
            Width = 121
            Height = 24
            DataField = 'data_baixa'
            DataSource = DataSource1
            NumGlyphs = 2
            TabOrder = 0
          end
          object cb_motivo: TComboBox
            Left = 137
            Top = 35
            Width = 188
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
            Items.Strings = (
              'PG-Pagamento'
              'TR-Retirada')
          end
        end
        object GroupBox4: TGroupBox
          Left = 560
          Top = 0
          Width = 525
          Height = 57
          TabOrder = 12
          object Label5: TLabel
            Left = 6
            Top = 11
            Width = 43
            Height = 13
            Caption = 'Cobrador'
          end
          object Label9: TLabel
            Left = 229
            Top = 11
            Width = 32
            Height = 13
            Caption = 'Cliente'
          end
          object RxDBLookupCombo1: TRxDBLookupCombo
            Left = 4
            Top = 28
            Width = 189
            Height = 21
            DropDownCount = 8
            DataField = 'pk_cobrador'
            DataSource = DataSource1
            LookupField = 'nu_usu'
            LookupDisplay = 'Nome'
            LookupDisplayIndex = 5
            LookupSource = dts_cobrador
            TabOrder = 0
          end
          object RxDBLookupCombo2: TRxDBLookupCombo
            Left = 229
            Top = 25
            Width = 228
            Height = 21
            DropDownCount = 8
            DataField = 'pk_cliente'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHotLight
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            LookupField = 'pk_cliente'
            LookupDisplay = 'Nome'
            LookupDisplayIndex = 5
            LookupSource = dts_cliente
            ParentFont = False
            TabOrder = 1
          end
        end
        object GroupBox8: TGroupBox
          Left = 558
          Top = 419
          Width = 121
          Height = 48
          Caption = 'Chave do Devedor'
          TabOrder = 13
          object DBEdit7: TDBEdit
            Left = 4
            Top = 16
            Width = 113
            Height = 28
            DataField = 'pk_devedor'
            DataSource = DataSource1
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object DBMemo2: TDBMemo
          Left = 0
          Top = 408
          Width = 553
          Height = 78
          DataField = 'anotacoes'
          DataSource = DataSource1
          ScrollBars = ssVertical
          TabOrder = 14
        end
        object edt_cgf: TEdit
          Left = 0
          Top = 25
          Width = 123
          Height = 21
          MaxLength = 14
          TabOrder = 0
          OnExit = edt_cgfExit
        end
        object GroupBox12: TGroupBox
          Left = 561
          Top = 260
          Width = 523
          Height = 135
          Caption = 'Inquilino'
          TabOrder = 15
          object Label75: TLabel
            Left = 133
            Top = 16
            Width = 28
            Height = 13
            Caption = 'Nome'
            FocusControl = DBEdit75
          end
          object Label76: TLabel
            Left = 139
            Top = 51
            Width = 54
            Height = 13
            Caption = 'Logradouro'
          end
          object Label77: TLabel
            Left = 43
            Top = 89
            Width = 37
            Height = 13
            Caption = 'N'#250'mero'
          end
          object Label78: TLabel
            Left = 2
            Top = 52
            Width = 27
            Height = 13
            Caption = 'Bairro'
          end
          object Label79: TLabel
            Left = 3
            Top = 91
            Width = 14
            Height = 13
            Caption = 'UF'
          end
          object Label80: TLabel
            Left = 362
            Top = 51
            Width = 33
            Height = 13
            Caption = 'Cidade'
          end
          object Label81: TLabel
            Left = 105
            Top = 88
            Width = 64
            Height = 13
            Caption = 'Complemento'
          end
          object Label82: TLabel
            Left = 3
            Top = 16
            Width = 20
            Height = 13
            Caption = 'CPF'
          end
          object Label83: TLabel
            Left = 209
            Top = 88
            Width = 28
            Height = 13
            Caption = 'e-Mail'
          end
          object DBEdit75: TDBEdit
            Left = 133
            Top = 31
            Width = 276
            Height = 21
            DataField = 'nome_inq'
            DataSource = DataSource1
            TabOrder = 0
          end
          object DBEdit77: TDBEdit
            Left = 136
            Top = 66
            Width = 220
            Height = 21
            DataField = 'logradouro_inq'
            DataSource = DataSource1
            TabOrder = 1
          end
          object DBEdit78: TDBEdit
            Left = 42
            Top = 106
            Width = 57
            Height = 21
            DataField = 'Numero_inq'
            DataSource = DataSource1
            TabOrder = 2
          end
          object DBEdit79: TDBEdit
            Left = 2
            Top = 67
            Width = 129
            Height = 21
            DataField = 'bairro_inq'
            DataSource = DataSource1
            TabOrder = 3
          end
          object DBEdit80: TDBEdit
            Left = 4
            Top = 106
            Width = 36
            Height = 21
            DataField = 'uf_inq'
            DataSource = DataSource1
            TabOrder = 4
          end
          object DBEdit81: TDBEdit
            Left = 362
            Top = 68
            Width = 137
            Height = 21
            DataField = 'cidade_inq'
            DataSource = DataSource1
            TabOrder = 5
          end
          object DBEdit82: TDBEdit
            Left = 102
            Top = 105
            Width = 103
            Height = 21
            DataField = 'Compl_inq'
            DataSource = DataSource1
            TabOrder = 6
          end
          object DBEdit83: TDBEdit
            Left = 3
            Top = 31
            Width = 129
            Height = 21
            DataField = 'cpf_inq'
            DataSource = DataSource1
            TabOrder = 7
          end
          object DBEdit84: TDBEdit
            Left = 211
            Top = 105
            Width = 286
            Height = 21
            DataField = 'email_inq'
            DataSource = DataSource1
            TabOrder = 8
          end
        end
        object grid_devedores: TDBGrid
          Left = 734
          Top = 70
          Width = 817
          Height = 124
          Color = clMoneyGreen
          DataSource = dts_devedores
          TabOrder = 16
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Visible = False
          OnDblClick = grid_devedoresDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'CGC_CPF'
              Width = 108
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nome'
              Width = 258
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'codigo'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cpf_inq'
              Title.Caption = 'CPF Inq'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nome_inq'
              Title.Caption = 'Nome Inq'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'telefones'
              Width = 209
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'R/AV'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'logradouro'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Numero'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Complemento'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Bairro'
              Width = 148
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cidade'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cep'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Uf'
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ponto_referencia'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'email'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nomeCliente'
              Visible = True
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'D'#237'vida'
        ImageIndex = 1
        object Label57: TLabel
          Left = 436
          Top = 386
          Width = 67
          Height = 13
          Caption = 'Tipo do T'#237'tulo'
        end
        object Label53: TLabel
          Left = 559
          Top = 386
          Width = 77
          Height = 13
          Caption = 'Atraso Remessa'
          FocusControl = DBEdit39
        end
        object Label55: TLabel
          Left = 324
          Top = 386
          Width = 40
          Height = 13
          Caption = 'Principal'
          FocusControl = DBEdit41
        end
        object Label51: TLabel
          Left = 230
          Top = 386
          Width = 56
          Height = 13
          Caption = 'Vencimento'
        end
        object Label50: TLabel
          Left = 143
          Top = 386
          Width = 39
          Height = 13
          Caption = 'Emiss'#227'o'
        end
        object Label59: TLabel
          Left = 2
          Top = 386
          Width = 40
          Height = 13
          Caption = 'N'#250'mero '
          FocusControl = DBEdit45
        end
        object Label6: TLabel
          Left = 1
          Top = 9
          Width = 72
          Height = 24
          Caption = 'Devedor'
          FocusControl = DBEdit5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 1
          Top = 429
          Width = 58
          Height = 13
          Caption = 'chave_titulo'
          FocusControl = DBEdit2
        end
        object Label63: TLabel
          Left = 168
          Top = 431
          Width = 107
          Height = 13
          Caption = 'Contrato/Compet'#234'ncia'
          FocusControl = DBEdit58
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 96
          Width = 705
          Height = 222
          DataSource = dts_divida
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'Cheque'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Banco'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Ag'#234'ncia'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Conta'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'numero_titulo'
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Vencimento'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tipo_titulo'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Valor_titulo'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'atraso_atual'
              Title.Caption = 'Atraso Atual'
              Visible = True
            end>
        end
        object GroupBox5: TGroupBox
          Left = 0
          Top = 323
          Width = 657
          Height = 58
          Caption = 'Dados do Cheque'
          TabOrder = 1
          object Label44: TLabel
            Left = 8
            Top = 15
            Width = 31
            Height = 13
            Caption = 'Banco'
            FocusControl = edt_banco
          end
          object Label45: TLabel
            Left = 52
            Top = 15
            Width = 39
            Height = 13
            Caption = 'Agencia'
            FocusControl = DBEdit31
          end
          object Label46: TLabel
            Left = 95
            Top = 15
            Width = 28
            Height = 13
            Caption = 'Conta'
            FocusControl = DBEdit32
          end
          object Label47: TLabel
            Left = 164
            Top = 15
            Width = 37
            Height = 13
            Caption = 'Cheque'
            FocusControl = DBEdit33
          end
          object Label48: TLabel
            Left = 240
            Top = 15
            Width = 53
            Height = 13
            Caption = 'Endossado'
            FocusControl = DBEdit34
          end
          object Label49: TLabel
            Left = 370
            Top = 15
            Width = 79
            Height = 13
            Caption = 'Endossado_CPF'
            FocusControl = DBEdit35
          end
          object Label60: TLabel
            Left = 478
            Top = 15
            Width = 83
            Height = 13
            Caption = 'Pra'#231'a do Cheque'
            FocusControl = DBEdit46
          end
          object Label61: TLabel
            Left = 616
            Top = 15
            Width = 31
            Height = 13
            Caption = 'Al'#237'nea'
            FocusControl = DBEdit47
          end
          object edt_banco: TDBEdit
            Left = 8
            Top = 29
            Width = 41
            Height = 21
            DataField = 'Banco'
            DataSource = dts_divida
            TabOrder = 0
          end
          object DBEdit31: TDBEdit
            Left = 52
            Top = 29
            Width = 41
            Height = 21
            DataField = 'Agencia'
            DataSource = dts_divida
            TabOrder = 1
          end
          object DBEdit32: TDBEdit
            Left = 95
            Top = 29
            Width = 65
            Height = 21
            DataField = 'Conta'
            DataSource = dts_divida
            TabOrder = 2
          end
          object DBEdit33: TDBEdit
            Left = 164
            Top = 29
            Width = 73
            Height = 21
            DataField = 'Cheque'
            DataSource = dts_divida
            TabOrder = 3
          end
          object DBEdit34: TDBEdit
            Left = 240
            Top = 29
            Width = 129
            Height = 21
            DataField = 'Endossado'
            DataSource = dts_divida
            TabOrder = 4
          end
          object DBEdit35: TDBEdit
            Left = 370
            Top = 29
            Width = 105
            Height = 21
            DataField = 'Endossado_CPF'
            DataSource = dts_divida
            TabOrder = 5
          end
          object DBEdit46: TDBEdit
            Left = 477
            Top = 29
            Width = 137
            Height = 21
            DataField = 'praca_cheque'
            DataSource = dts_divida
            TabOrder = 6
          end
          object DBEdit47: TDBEdit
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
          Top = 322
          Width = 236
          Height = 59
          Caption = 'Dados de Fatura de Cart'#227'o'
          TabOrder = 6
          Visible = False
          object Label56: TLabel
            Left = 11
            Top = 14
            Width = 91
            Height = 13
            Caption = 'pagamento_minimo'
            FocusControl = DBEdit42
          end
          object Label52: TLabel
            Left = 128
            Top = 14
            Width = 79
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
        object GroupBox7: TGroupBox
          Left = 660
          Top = 385
          Width = 236
          Height = 90
          Caption = 'Sequencial do arquivo'
          TabOrder = 7
          object Label58: TLabel
            Left = 133
            Top = 15
            Width = 86
            Height = 13
            Caption = 'Seq. arq. Inclus'#227'o'
          end
          object Label62: TLabel
            Left = 9
            Top = 14
            Width = 66
            Height = 13
            Caption = 'Data Inclusao'
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
        object DBEdit39: TDBEdit
          Left = 560
          Top = 405
          Width = 90
          Height = 21
          DataField = 'dias_atraso_remessa'
          DataSource = dts_divida
          TabOrder = 8
        end
        object DBEdit41: TDBEdit
          Left = 324
          Top = 405
          Width = 105
          Height = 21
          DataField = 'valor_principal'
          DataSource = dts_divida
          TabOrder = 5
        end
        object DBEdit45: TDBEdit
          Left = 2
          Top = 403
          Width = 121
          Height = 21
          DataField = 'numero_titulo'
          DataSource = dts_divida
          TabOrder = 2
        end
        object DBDateEdit1: TDBDateEdit
          Left = 141
          Top = 404
          Width = 85
          Height = 21
          DataField = 'emissao'
          DataSource = dts_divida
          NumGlyphs = 2
          TabOrder = 3
        end
        object DBDateEdit2: TDBDateEdit
          Left = 229
          Top = 403
          Width = 89
          Height = 21
          DataField = 'Vencimento'
          DataSource = dts_divida
          NumGlyphs = 2
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 81
          Top = 6
          Width = 399
          Height = 32
          DataField = 'Nome'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object GroupBox9: TGroupBox
          Left = 914
          Top = 318
          Width = 167
          Height = 157
          Caption = 'Baixa'
          TabOrder = 10
          object Label10: TLabel
            Left = 6
            Top = 15
            Width = 23
            Height = 13
            Caption = 'Data'
          end
          object Label11: TLabel
            Left = 6
            Top = 52
            Width = 32
            Height = 13
            Caption = 'Motivo'
          end
          object Label54: TLabel
            Left = 8
            Top = 101
            Width = 34
            Height = 13
            Caption = 'Recibo'
            FocusControl = DBEdit57
          end
          object cbx_motivoBx: TComboBox
            Left = 6
            Top = 65
            Width = 108
            Height = 22
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Verdana'
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            TabOrder = 0
            Items.Strings = (
              'Pago'
              'Retirada')
          end
          object DBDateEdit3: TDBDateEdit
            Left = 6
            Top = 28
            Width = 109
            Height = 24
            DataField = 'data_baixa'
            DataSource = dts_divida
            Enabled = False
            NumGlyphs = 2
            TabOrder = 1
          end
          object DBEdit57: TDBEdit
            Left = 8
            Top = 117
            Width = 92
            Height = 21
            DataField = 'pk_recibo'
            DataSource = dts_divida
            Enabled = False
            TabOrder = 2
          end
        end
        object DBEdit2: TDBEdit
          Left = 1
          Top = 445
          Width = 160
          Height = 21
          DataField = 'chave_titulo'
          DataSource = dts_divida
          Enabled = False
          TabOrder = 11
        end
        object DBEdit58: TDBEdit
          Left = 168
          Top = 447
          Width = 394
          Height = 21
          DataField = 'chave_contrato'
          DataSource = dts_divida
          TabOrder = 12
        end
        object Panel4: TPanel
          Left = 8
          Top = 48
          Width = 697
          Height = 49
          BevelOuter = bvLowered
          TabOrder = 13
          object btn_incluir: TSpeedButton
            Left = 6
            Top = 4
            Width = 85
            Height = 42
            Caption = 'Incluir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              76020000424D7602000000000000760000002800000020000000200000000100
              0400000000000002000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF00000000
              00000000000000000FFFFFFF0777777777777777777777770FFFFF0000000000
              00000000078888870FFFFF077777777777777777007888870FFFFF0F77777777
              77777777080788870FFFFF0FF888888888888888088078870FFFFF0FF8888888
              88888888088807870FFFFF0FF887778777777778088880770FFFFF0FF8888F88
              FFFFFF88000000070FFFFF0FF887778777777778777877070FFFFF0FF888FF88
              FFFFFF88FF8877070FFFFF0FF887778777777778777877070FFFFF0FF888FF88
              FFFFFF88FF8877070FFFFF0FF887778777777778777877070FFFFF0FF888FF88
              FFFFFF88FF8877070FFFFF0FF887778777777778777877070FFFFF0FF888FF88
              FFFFFF88FF8877070FFFFF0FF887778777777778777877070FFFFF0FF888FF88
              FFFFFF88FF8877070FFFFF0FF887778777777778777877070FFFFF0FF888FF88
              FFFFFF88FF8877070FFFFF0FF887778777777778777877070FFFFF0FF888FF88
              FFFFFF88FF8877070FFFFF0FF887778777777778777877070FFFFF0FF888FF88
              FFFFFF88FF8877070FFFFF0FF887778777777778777877070FFFFF0FF888FF88
              FFFFFF88FF8877070FFFFF0FF888888888888888888877070FFFFF0FF8888888
              88888888888877070FFFFF0FFFFFFFFFFFFFFFFFFFFFF7000FFFFF0FFFFFFFFF
              FFFFFFFFFFFFFF0FFFFFFF0000000000000000000000000FFFFF}
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btn_incluirClick
          end
          object btn_alterar: TSpeedButton
            Left = 95
            Top = 4
            Width = 85
            Height = 42
            Caption = 'Alterar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              76020000424D7602000000000000760000002800000020000000200000000100
              0400000000000002000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00CFFFFFFFFFFFFFFFFFFFFFFFFFFFC
              08800CFFFFFFFFFFFFFFFFFFFFFFFFC08008800CFFFFFFFFFFFFFFFFFFFFFC08
              0FF008800CFFFFFFFFFFFFFFFFFFC080FFFFF008800CFFFFFFFFFFFFFFFC080F
              FFFFFFF008800CFFFFFFFFFFFFC080FFF66FFFFFF00880FFFFFFFFFFFC080FFF
              FFF66FFFFFF000FFFFFFFFFFC080FF66FFFFF66FFFFFF0FFFFFFFFFC080FFFFF
              66FFFFF66FFF0FFFFFFFFFC080FFFFFFFF66FFFFFFF0FFFFFFFFFC080FFFFFFF
              FFFF66FFFF0FFF0000FFC0807FFFFF08FFFF888880FFF00C0C0F080F877FFFF0
              0F888000000FF000C0C000FFFF877FF0D00008888FF007700CC00FF707FF877F
              00888FFFFFFFFFF70CC0F00F0FFFFF87700000088FFFFFFF0CC0F0F00FFFFFFF
              800D0F0888FFFFFF04C0F8FF000FF707F080D00888FFFFFF0CC0FF008FF00F0F
              F0F80D088FFFFFF0000FFFFFFFF0F00FF00F80D0FFFFF00FFFFFFFFFFFF8FF00
              0FF0F80D0FFF0FFFFFFFFFFFFFFF008FFFFF0FF0D000FFFFFFFFFFFFFFFFFFFF
              FFFFF0000D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btn_alterarClick
          end
          object btn_cancelar: TSpeedButton
            Left = 184
            Top = 4
            Width = 85
            Height = 42
            Caption = 'Cancelar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              96010000424D9601000000000000760000002800000018000000180000000100
              0400000000002001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333333337777777777777733333333000000000000000773333330BB
              BBBBBBBBBBBBB073333330B0000000000000B073333330B0F9FFFFFFFFF0B073
              333330B04444444444F0B033333330B0F9FFFFFFFFF0B393333330B0F9FFFFFF
              FFF0B399333330B044444444FFFFF399933330B0F9FFFFFFF9999999993330B0
              F9FFFFFFF9999999999330B044444444F9999999993330B0F9FFFFFFFFFFF399
              933330B0F9FFFFFFFFF0B399333330B04444444444F0B393333330B0F9FFFFFF
              FFF0B033333330B0F9FFFFFFFFF0B073333330B0F90000000FF0B073333330B0
              0008F8880000B073333330BBBBB08F80BBBBB033333333000000080000000333
              333333333330F880333333333333333333300000333333333333}
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btn_cancelarClick
          end
          object btn_gravar: TSpeedButton
            Left = 275
            Top = 4
            Width = 85
            Height = 42
            Caption = 'Gravar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
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
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btn_gravarClick
          end
          object btn_excluir: TSpeedButton
            Left = 364
            Top = 4
            Width = 85
            Height = 42
            Caption = 'Excluir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              76020000424D7602000000000000760000002800000020000000200000000100
              0400000000000002000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000777777777777
              7777777777777777777078888888887788888888888888888870787FFFFF7777
              7FFFFFFF77FFFFFFF870787FFFFF00777FFFFFF7777FFFFFF870787FFFD99007
              77FFFFD07777FFFFF870787FFFD99907777FFD9007777FFFF870787FFFD99900
              7777FD99007777FFF870787FFFD999900777D99990077FFFF870787FFFDD9999
              007D99999900FFFFF870787FFFFD999990099999990FFFFFF870787FFFFDD999
              9999999990FFFFFFF870787FFFFFDD99999999990FFFFFFFF870787FFFFFFDD9
              999999907FFFFFFFF870787FFFFFFFDD9999990777FFFFFFF870787FFFFFFFFD
              99999907777FFFFFF870787FFFFFFFFD99999900777FFFFFF870787FFFFFFFFD
              999999900777FFFFF870787FFFFFFFD99999999907777FFFF870787FFFFFFFD9
              999DD999007777FFF870787FFFFFFD999907DD999007777FF870787777777D99
              90777DD999007777787078888888D999907888DD99900777887078444444D999
              0744444DD999007000707844444DDD9904444444DD9990088070784444444DDD
              444444444DD9980880707844444444444444444444DD44444470788888888888
              888888888888888888707777777777777777777777777777777FFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btn_excluirClick
          end
          object btn_retirar: TSpeedButton
            Left = 512
            Top = 4
            Width = 85
            Height = 42
            Hint = 'Retirar da Carteira'
            Caption = 'Retirar'
            Flat = True
            Glyph.Data = {
              76020000424D7602000000000000760000002800000020000000200000000100
              0400000000000002000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000777777777777
              7777777777777777777078888888887788888888888888888870787FFFFF7777
              7FFFFFFF77FFFFFFF870787FFFFF00777FFFFFF7777FFFFFF870787FFFD99007
              77FFFFD07777FFFFF870787FFFD99907777FFD9007777FFFF870787FFFD99900
              7777FD99007777FFF870787FFFD999900777D99990077FFFF870787FFFDD9999
              007D99999900FFFFF870787FFFFD999990099999990FFFFFF870787FFFFDD999
              9999999990FFFFFFF870787FFFFFDD99999999990FFFFFFFF870787FFFFFFDD9
              999999907FFFFFFFF870787FFFFFFFDD9999990777FFFFFFF870787FFFFFFFFD
              99999907777FFFFFF870787FFFFFFFFD99999900777FFFFFF870787FFFFFFFFD
              999999900777FFFFF870787FFFFFFFD99999999907777FFFF870787FFFFFFFD9
              999DD999007777FFF870787FFFFFFD999907DD999007777FF870787777777D99
              90777DD999007777787078888888D999907888DD99900777887078444444D999
              0744444DD999007000707844444DDD9904444444DD9990088070784444444DDD
              444444444DD9980880707844444444444444444444DD44444470788888888888
              888888888888888888707777777777777777777777777777777FFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ParentShowHint = False
            ShowHint = True
            OnClick = btn_retirarClick
          end
          object btn_rotornar: TSpeedButton
            Left = 601
            Top = 4
            Width = 85
            Height = 42
            Hint = 'Retornar da Carteira'
            Caption = 'Retornar'
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
            ParentShowHint = False
            ShowHint = True
            OnClick = btn_rotornarClick
          end
        end
        object GroupBox11: TGroupBox
          Left = 708
          Top = 44
          Width = 372
          Height = 275
          Caption = 'Baixas parciais do t'#237'tulo'
          TabOrder = 14
          object DBGrid5: TDBGrid
            Left = 2
            Top = 15
            Width = 368
            Height = 145
            Align = alClient
            DataSource = dts_bxparcTitulo
            Enabled = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'data'
                Width = 63
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor'
                Width = 77
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'pk_prestcontas'
                Title.Caption = 'P.Contas'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'taxa_retenc'
                Title.Caption = 'T.Retenc'
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor_retenc'
                Title.Caption = 'Vlr_Retenc'
                Width = 81
                Visible = True
              end>
          end
          object Panel5: TPanel
            Left = 2
            Top = 160
            Width = 368
            Height = 113
            Align = alBottom
            TabOrder = 1
            object Label68: TLabel
              Left = 3
              Top = 47
              Width = 36
              Height = 13
              Caption = 'Arquivo'
            end
            object Label66: TLabel
              Left = 3
              Top = 73
              Width = 115
              Height = 13
              Caption = 'Total de Baixas parciais:'
            end
            object Label69: TLabel
              Left = 136
              Top = 69
              Width = 30
              Height = 13
              Caption = 'Atraso'
            end
            object Label72: TLabel
              Left = 3
              Top = 14
              Width = 41
              Height = 13
              Caption = 'Hist'#243'rico'
            end
            object DBEdit71: TDBEdit
              Left = 48
              Top = 45
              Width = 313
              Height = 21
              DataField = 'arquivo'
              DataSource = dts_bxparcTitulo
              Enabled = False
              TabOrder = 0
            end
            object edt_totbxparciais: TMaskEdit
              Left = 4
              Top = 88
              Width = 121
              Height = 21
              TabOrder = 1
              Text = '0.00'
            end
            object DBEdit72: TDBEdit
              Left = 137
              Top = 86
              Width = 62
              Height = 21
              DataField = 'atraso'
              DataSource = dts_bxparcTitulo
              Enabled = False
              TabOrder = 2
            end
            object DBEdit43: TDBEdit
              Left = 47
              Top = 3
              Width = 314
              Height = 21
              DataField = 'historico'
              DataSource = dts_bxparcTitulo
              Enabled = False
              TabOrder = 3
            end
          end
        end
        object cbox_tipoTitulo: TDBComboBox
          Left = 436
          Top = 403
          Width = 85
          Height = 21
          CharCase = ecUpperCase
          DataField = 'tipo_titulo'
          DataSource = dts_divida
          ItemHeight = 13
          TabOrder = 15
        end
        object cb_titaberto: TCheckBox
          Left = 496
          Top = 16
          Width = 249
          Height = 17
          Caption = 'Filtrar somente t'#237'tulos em aberto'
          TabOrder = 16
          OnClick = cb_titabertoClick
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Hist'#243'rico'
        ImageIndex = 2
        object PageControl3: TPageControl
          Left = 0
          Top = 0
          Width = 1087
          Height = 490
          ActivePage = TabSheet4
          Align = alClient
          MultiLine = True
          TabOrder = 0
          TabPosition = tpLeft
          object TabSheet4: TTabSheet
            Caption = 'Lista'
            object DBGrid3: TDBGrid
              Left = 0
              Top = 0
              Width = 1058
              Height = 471
              Align = alClient
              DataSource = dts_historicos
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
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
            object Label12: TLabel
              Left = 0
              Top = 0
              Width = 23
              Height = 13
              Caption = 'Data'
            end
            object Label14: TLabel
              Left = 88
              Top = 0
              Width = 23
              Height = 13
              Caption = 'Hora'
              FocusControl = DBEdit26
            end
            object Label21: TLabel
              Left = 160
              Top = 0
              Width = 32
              Height = 13
              Caption = 'Motivo'
              FocusControl = DBEdit27
            end
            object Label29: TLabel
              Left = 0
              Top = 48
              Width = 78
              Height = 13
              Caption = 'Agendado_Data'
              FocusControl = DBEdit28
            end
            object Label40: TLabel
              Left = 112
              Top = 48
              Width = 78
              Height = 13
              Caption = 'Agendado_Hora'
              FocusControl = DBEdit29
            end
            object Label41: TLabel
              Left = 320
              Top = 0
              Width = 27
              Height = 13
              Caption = 'Texto'
            end
            object DBEdit23: TDBEdit
              Left = 0
              Top = 16
              Width = 81
              Height = 21
              DataField = 'Data'
              DataSource = dts_historicos
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'Recibos'
        ImageIndex = 3
        object PageControl6: TPageControl
          Left = 233
          Top = 0
          Width = 854
          Height = 490
          Align = alClient
          MultiLine = True
          Style = tsButtons
          TabOrder = 0
        end
        object Panel15: TPanel
          Left = 233
          Top = 0
          Width = 854
          Height = 490
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Label85: TLabel
            Left = 4
            Top = 0
            Width = 40
            Height = 13
            Caption = 'Principal'
            FocusControl = DBEdit30
          end
          object Label86: TLabel
            Left = 92
            Top = 0
            Width = 25
            Height = 13
            Caption = 'Juros'
            FocusControl = DBEdit36
          end
          object Label87: TLabel
            Left = 144
            Top = 0
            Width = 26
            Height = 13
            Caption = 'Multa'
            FocusControl = DBEdit37
          end
          object Label88: TLabel
            Left = 197
            Top = 0
            Width = 52
            Height = 13
            Caption = 'Desc Princ'
            FocusControl = DBEdit40
          end
          object Label89: TLabel
            Left = 273
            Top = 0
            Width = 53
            Height = 13
            Caption = 'Desc Juros'
            FocusControl = DBEdit50
          end
          object Label91: TLabel
            Left = 341
            Top = 0
            Width = 54
            Height = 13
            Caption = 'Desc Multa'
            FocusControl = DBEdit60
          end
          object Label92: TLabel
            Left = 412
            Top = 0
            Width = 66
            Height = 13
            Caption = 'Taxa Protesto'
            FocusControl = DBEdit59
          end
          object Label93: TLabel
            Left = 498
            Top = 0
            Width = 51
            Height = 13
            Caption = 'Honorarios'
            FocusControl = DBEdit61
          end
          object Label94: TLabel
            Left = 3
            Top = 37
            Width = 74
            Height = 13
            Caption = 'Valor Reten'#231#227'o'
            FocusControl = DBEdit62
          end
          object Label95: TLabel
            Left = 566
            Top = 2
            Width = 59
            Height = 13
            Caption = 'valor_liquido'
            FocusControl = DBEdit63
          end
          object Label96: TLabel
            Left = 99
            Top = 37
            Width = 85
            Height = 13
            Caption = 'Data limite p/Pgto'
            FocusControl = DBEdit64
          end
          object Label97: TLabel
            Left = 5
            Top = 80
            Width = 56
            Height = 13
            Caption = 'observacao'
            FocusControl = DBEdit65
          end
          object Label98: TLabel
            Left = 208
            Top = 38
            Width = 51
            Height = 13
            Caption = 'Data Canc'
            FocusControl = DBEdit51
          end
          object Label99: TLabel
            Left = 339
            Top = 37
            Width = 89
            Height = 13
            Caption = 'Data Recebimento'
            FocusControl = DBEdit66
          end
          object SpeedButton1: TSpeedButton
            Left = 16
            Top = 192
            Width = 137
            Height = 41
            Hint = 'Retirar da Carteira'
            Caption = 'Excluir Recibo'
            Flat = True
            Glyph.Data = {
              76020000424D7602000000000000760000002800000020000000200000000100
              0400000000000002000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000777777777777
              7777777777777777777078888888887788888888888888888870787FFFFF7777
              7FFFFFFF77FFFFFFF870787FFFFF00777FFFFFF7777FFFFFF870787FFFD99007
              77FFFFD07777FFFFF870787FFFD99907777FFD9007777FFFF870787FFFD99900
              7777FD99007777FFF870787FFFD999900777D99990077FFFF870787FFFDD9999
              007D99999900FFFFF870787FFFFD999990099999990FFFFFF870787FFFFDD999
              9999999990FFFFFFF870787FFFFFDD99999999990FFFFFFFF870787FFFFFFDD9
              999999907FFFFFFFF870787FFFFFFFDD9999990777FFFFFFF870787FFFFFFFFD
              99999907777FFFFFF870787FFFFFFFFD99999900777FFFFFF870787FFFFFFFFD
              999999900777FFFFF870787FFFFFFFD99999999907777FFFF870787FFFFFFFD9
              999DD999007777FFF870787FFFFFFD999907DD999007777FF870787777777D99
              90777DD999007777787078888888D999907888DD99900777887078444444D999
              0744444DD999007000707844444DDD9904444444DD9990088070784444444DDD
              444444444DD9980880707844444444444444444444DD44444470788888888888
              888888888888888888707777777777777777777777777777777FFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton1Click
          end
          object Label42: TLabel
            Left = 496
            Top = 36
            Width = 59
            Height = 13
            Caption = 'Prest contas'
            FocusControl = DBEdit55
          end
          object DBEdit30: TDBEdit
            Left = 4
            Top = 15
            Width = 80
            Height = 21
            DataField = 'principal'
            DataSource = dts_recibos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEdit36: TDBEdit
            Left = 89
            Top = 15
            Width = 49
            Height = 21
            DataField = 'juros'
            DataSource = dts_recibos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBEdit37: TDBEdit
            Left = 142
            Top = 15
            Width = 49
            Height = 21
            DataField = 'multa'
            DataSource = dts_recibos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBEdit40: TDBEdit
            Left = 196
            Top = 15
            Width = 71
            Height = 21
            DataField = 'desc_principal'
            DataSource = dts_recibos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object DBEdit50: TDBEdit
            Left = 272
            Top = 15
            Width = 62
            Height = 21
            DataField = 'desc_juros'
            DataSource = dts_recibos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object DBEdit60: TDBEdit
            Left = 339
            Top = 15
            Width = 65
            Height = 21
            DataField = 'desc_multa'
            DataSource = dts_recibos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object DBEdit59: TDBEdit
            Left = 411
            Top = 15
            Width = 82
            Height = 21
            DataField = 'acres_protesto'
            DataSource = dts_recibos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object DBEdit63: TDBEdit
            Left = 566
            Top = 17
            Width = 81
            Height = 21
            DataField = 'valor_liquido'
            DataSource = dts_recibos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
          end
          object DBEdit64: TDBEdit
            Left = 99
            Top = 53
            Width = 100
            Height = 21
            DataField = 'data_venc'
            DataSource = dts_recibos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
          end
          object DBEdit65: TDBEdit
            Left = 74
            Top = 77
            Width = 512
            Height = 21
            DataField = 'observacao'
            DataSource = dts_recibos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
          end
          object DBEdit51: TDBEdit
            Left = 208
            Top = 52
            Width = 76
            Height = 21
            Color = clScrollBar
            DataField = 'data_canc'
            DataSource = dts_recibos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
          end
          object DBEdit66: TDBEdit
            Left = 339
            Top = 51
            Width = 88
            Height = 21
            Color = cl3DDkShadow
            DataField = 'data_receb'
            DataSource = dts_recibos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
          end
          object DBEdit67: TDBEdit
            Left = 430
            Top = 51
            Width = 47
            Height = 21
            Color = cl3DDkShadow
            DataField = 'hora_receb'
            DataSource = dts_recibos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
          end
          object DBEdit68: TDBEdit
            Left = 285
            Top = 52
            Width = 40
            Height = 21
            Color = clScrollBar
            DataField = 'hora_canc'
            DataSource = dts_recibos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
          end
          object DBEdit55: TDBEdit
            Left = 496
            Top = 52
            Width = 75
            Height = 21
            DataField = 'pk_prestcontas'
            DataSource = dts_recibos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 16
          end
        end
        object DBGrid4: TDBGrid
          Left = 0
          Top = 0
          Width = 233
          Height = 490
          Align = alLeft
          DataSource = dts_recibos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'pk_recibo'
              Title.Caption = 'Recibo'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data'
              Title.Caption = 'Data'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'hora'
              Title.Caption = 'Hora'
              Width = 51
              Visible = True
            end>
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Pagamentos avulsos'
        ImageIndex = 4
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 281
          Height = 493
          DataSource = dts_bxparciais
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
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
              FieldName = 'valor'
              Width = 70
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
        object GroupBox10: TGroupBox
          Left = 288
          Top = 16
          Width = 609
          Height = 441
          TabOrder = 1
          object Label17: TLabel
            Left = 16
            Top = 24
            Width = 23
            Height = 13
            Caption = 'Data'
            FocusControl = DBEdit52
          end
          object Label20: TLabel
            Left = 16
            Top = 72
            Width = 24
            Height = 13
            Caption = 'Valor'
            FocusControl = DBEdit53
          end
          object Label37: TLabel
            Left = 16
            Top = 120
            Width = 41
            Height = 13
            Caption = 'Hist'#243'rico'
            FocusControl = DBEdit54
          end
          object btn_excluirBXParcial: TSpeedButton
            Left = 8
            Top = 368
            Width = 137
            Height = 41
            Hint = 'Retirar da Carteira'
            Caption = 'Excluir Baixa Parcial'
            Flat = True
            Glyph.Data = {
              76020000424D7602000000000000760000002800000020000000200000000100
              0400000000000002000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000777777777777
              7777777777777777777078888888887788888888888888888870787FFFFF7777
              7FFFFFFF77FFFFFFF870787FFFFF00777FFFFFF7777FFFFFF870787FFFD99007
              77FFFFD07777FFFFF870787FFFD99907777FFD9007777FFFF870787FFFD99900
              7777FD99007777FFF870787FFFD999900777D99990077FFFF870787FFFDD9999
              007D99999900FFFFF870787FFFFD999990099999990FFFFFF870787FFFFDD999
              9999999990FFFFFFF870787FFFFFDD99999999990FFFFFFFF870787FFFFFFDD9
              999999907FFFFFFFF870787FFFFFFFDD9999990777FFFFFFF870787FFFFFFFFD
              99999907777FFFFFF870787FFFFFFFFD99999900777FFFFFF870787FFFFFFFFD
              999999900777FFFFF870787FFFFFFFD99999999907777FFFF870787FFFFFFFD9
              999DD999007777FFF870787FFFFFFD999907DD999007777FF870787777777D99
              90777DD999007777787078888888D999907888DD99900777887078444444D999
              0744444DD999007000707844444DDD9904444444DD9990088070784444444DDD
              444444444DD9980880707844444444444444444444DD44444470788888888888
              888888888888888888707777777777777777777777777777777FFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ParentShowHint = False
            ShowHint = True
            OnClick = btn_excluirBXParcialClick
          end
          object Label67: TLabel
            Left = 8
            Top = 240
            Width = 47
            Height = 13
            Caption = 'Reten'#231#227'o'
            FocusControl = DBEdit70
          end
          object Label70: TLabel
            Left = 112
            Top = 240
            Width = 63
            Height = 13
            Caption = 'Prest. Contas'
            FocusControl = DBEdit73
          end
          object Label73: TLabel
            Left = 16
            Top = 176
            Width = 36
            Height = 13
            Caption = 'Arquivo'
          end
          object DBEdit52: TDBEdit
            Left = 16
            Top = 40
            Width = 105
            Height = 21
            DataField = 'data'
            DataSource = dts_bxparciais
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit53: TDBEdit
            Left = 16
            Top = 88
            Width = 113
            Height = 21
            DataField = 'valor'
            DataSource = dts_bxparciais
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit54: TDBEdit
            Left = 16
            Top = 136
            Width = 556
            Height = 21
            DataField = 'historico'
            DataSource = dts_bxparciais
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBEdit70: TDBEdit
            Left = 8
            Top = 256
            Width = 73
            Height = 21
            DataField = 'valor_retenc'
            DataSource = dts_bxparciais
            TabOrder = 3
          end
          object DBEdit73: TDBEdit
            Left = 112
            Top = 256
            Width = 134
            Height = 21
            DataField = 'pk_prestcontas'
            DataSource = dts_bxparciais
            Enabled = False
            TabOrder = 4
          end
          object DBEdit76: TDBEdit
            Left = 16
            Top = 192
            Width = 457
            Height = 21
            DataField = 'arquivo'
            DataSource = dts_bxparciais
            TabOrder = 5
          end
        end
      end
    end
  end
  object Panel3: TPanel [4]
    Left = 0
    Top = 0
    Width = 1097
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    Color = clBlack
    TabOrder = 4
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 32
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 632
      Top = 11
      Width = 46
      Height = 13
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btn_buscar: TSpeedButton
      Left = 900
      Top = 5
      Width = 94
      Height = 32
      Hint = 'Esconde a tela'
      Caption = 'Buscar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuBar
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        76020000424D7602000000000000760000002800000020000000200000000100
        0400000000000002000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF0110FFFFFFFFFFFFFFFFFFFFFFFFFFF01910FFFFFFFFFFFFFFFF
        FFFFFFFFFF01910FFFFFFFFFFFFFFFFFFFFFFFFFF01910FFFFFFFFFFFFFFFFFF
        FFFFFFFF01910FFFFFFFFFFFFFFFFFFFFF000FF01910FFFFFFFFFFFFFFFFFFFF
        00999001910FFFFFFFFFFFFFFFFFFFF01977799010FFFFFFFFFFFFFF00000001
        8888888900000000FFFFFFF08777770100000009077777770FFFFFF0F888801E
        6E6E6E6E908888870FFFFFF0F7000016EFE6E6E6900000870FFFFFF0F70EC01E
        6FFEFE6E90CEC0870FFFFFF0F70CEC01E6FFF6E90CECE0870FFFFFF0F70ECE01
        6E6E6E610ECEC0870FFFFFF0F70CECE011E6E110ECECE0870FFFFFF0F70ECECE
        0011100ECECEC0870FFFFFF0F70CECECEC000CECECECE0870FFFFFF0F70ECECE
        CECECECECECEC0870FFFFFF0F70CECECECECECECECEFE0870FFFFFF0F70ECECE
        CECECECECEFEC0870FFFFFF0F70CECECECECECECEFEFE0870FFFFFF0F70ECECE
        CECECECEFEFEC0870FFFFFF0F70CECECECECECEFEFECE0870FFFFFF0F70ECECE
        CECECECECECEC0870FFFFFF0F700000000000000000000870FFFFFF0F7777777
        77777777777777870FFFFFF0FFFFFFFFFFFFFFFFFFFFFFF80FFFFFFF00000000
        0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_buscarClick
    end
    object cpf_devedor: TEdit
      Left = 700
      Top = 8
      Width = 181
      Height = 21
      Hint = 'codigo/nome/cpf/nomeInquilino/cpfInquilino'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object lk_cliente: TRxDBLookupCombo
      Left = 48
      Top = 7
      Width = 329
      Height = 24
      DropDownCount = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookupField = 'pk_cliente'
      LookupDisplay = 'nome'
      LookupDisplayIndex = 5
      LookupSource = dts_cliente
      ParentFont = False
      TabOrder = 0
    end
    object cb_visualizaInativos: TCheckBox
      Left = 385
      Top = 11
      Width = 112
      Height = 17
      Caption = 'Visualiza Inativados'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      OnClick = cb_visualizaInativosClick
    end
  end
  inherited DataSource1: TDataSource
    Left = 616
    Top = 57
  end
  inherited Query1: TADODataSet
    CursorType = ctStatic
    AfterOpen = Query1AfterOpen
    BeforePost = Query1BeforePost
    CommandText = 'select * from devedores where 1=2'
    Left = 520
    Top = 112
    object Query1pk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object Query1pk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object Query1chave_no_cliente: TIntegerField
      FieldName = 'chave_no_cliente'
    end
    object Query1codigo_no_cliente: TStringField
      FieldName = 'codigo_no_cliente'
      Size = 30
    end
    object Query1CGC_CPF: TStringField
      FieldName = 'CGC_CPF'
      Size = 50
    end
    object Query1titular_avalista: TStringField
      FieldName = 'titular_avalista'
      Size = 50
    end
    object Query1Nome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object Query1RG: TStringField
      FieldName = 'RG'
      Size = 50
    end
    object Query1Orgao_Rg: TStringField
      FieldName = 'Orgao_Rg'
      Size = 50
    end
    object Query1data_nasc: TDateTimeField
      FieldName = 'data_nasc'
    end
    object Query1telefones: TStringField
      FieldName = 'telefones'
      Size = 50
    end
    object Query1tipo_logradouro: TStringField
      FieldName = 'tipo_logradouro'
      Size = 10
    end
    object Query1logradouro: TStringField
      FieldName = 'logradouro'
      Size = 50
    end
    object Query1Numero: TStringField
      FieldName = 'Numero'
      Size = 50
    end
    object Query1Complemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object Query1Bairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object Query1Cidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object Query1Cep: TStringField
      FieldName = 'Cep'
      Size = 50
    end
    object Query1Uf: TStringField
      FieldName = 'Uf'
      Size = 50
    end
    object Query1ponto_referencia: TStringField
      FieldName = 'ponto_referencia'
      Size = 50
    end
    object Query1trabalho_nome: TStringField
      FieldName = 'trabalho_nome'
      Size = 50
    end
    object Query1Trab_logradouro: TStringField
      FieldName = 'Trab_logradouro'
      Size = 50
    end
    object Query1trab_numero: TStringField
      FieldName = 'trab_numero'
      Size = 10
    end
    object Query1trab_bairro: TStringField
      FieldName = 'trab_bairro'
      Size = 50
    end
    object Query1Trab_cidade: TStringField
      FieldName = 'Trab_cidade'
      Size = 50
    end
    object Query1Trab_uf: TStringField
      FieldName = 'Trab_uf'
      Size = 50
    end
    object Query1trab_fones: TStringField
      FieldName = 'trab_fones'
      Size = 50
    end
    object Query1trab_complemento: TStringField
      FieldName = 'trab_complemento'
      Size = 50
    end
    object Query1trab_ponto_refer: TStringField
      FieldName = 'trab_ponto_refer'
      Size = 50
    end
    object Query1trab_cep: TStringField
      FieldName = 'trab_cep'
      Size = 50
    end
    object Query1Profissao: TStringField
      FieldName = 'Profissao'
      Size = 50
    end
    object Query1SEXO: TStringField
      FieldName = 'SEXO'
      Size = 50
    end
    object Query1prim_ref_pessoal: TStringField
      FieldName = 'prim_ref_pessoal'
      Size = 50
    end
    object Query1prim_ref_pessoal_fones: TStringField
      FieldName = 'prim_ref_pessoal_fones'
      Size = 50
    end
    object Query1seg_ref_pessoal: TStringField
      FieldName = 'seg_ref_pessoal'
      Size = 50
    end
    object Query1seg_ref_pessoal_fones: TStringField
      FieldName = 'seg_ref_pessoal_fones'
      Size = 50
    end
    object Query1nao_localizado: TDateTimeField
      FieldName = 'nao_localizado'
    end
    object Query1data_baixa: TDateTimeField
      FieldName = 'data_baixa'
    end
    object Query1agendado_data: TDateTimeField
      FieldName = 'agendado_data'
    end
    object Query1agendado_hora: TStringField
      FieldName = 'agendado_hora'
      Size = 50
    end
    object Query1agendado_tipo: TIntegerField
      FieldName = 'agendado_tipo'
    end
    object Query1seq_arq_inclusao: TIntegerField
      FieldName = 'seq_arq_inclusao'
    end
    object Query1seq_arq_baixa: TIntegerField
      FieldName = 'seq_arq_baixa'
    end
    object Query1usuario_baixa: TIntegerField
      FieldName = 'usuario_baixa'
    end
    object Query1usuario_inclusao: TIntegerField
      FieldName = 'usuario_inclusao'
    end
    object Query1motivo_baixa: TStringField
      FieldName = 'motivo_baixa'
      Size = 2
    end
    object Query1valor_divida: TFloatField
      FieldName = 'valor_divida'
    end
    object Query1motivo_dialogo: TIntegerField
      FieldName = 'motivo_dialogo'
    end
    object Query1data_dialogo: TDateTimeField
      FieldName = 'data_dialogo'
    end
    object Query1pk_cobrador: TIntegerField
      FieldName = 'pk_cobrador'
    end
    object Query1anotacoes: TStringField
      FieldName = 'anotacoes'
      Size = 2000
    end
    object Query1nossonumero: TStringField
      FieldName = 'nossonumero'
    end
    object Query1agendado_cobrador: TIntegerField
      FieldName = 'agendado_cobrador'
    end
    object Query1email: TStringField
      FieldName = 'email'
      Size = 100
    end
    object Query1enviaaospc: TStringField
      FieldName = 'enviaaospc'
      Size = 1
    end
    object Query1cpf_inq: TStringField
      FieldName = 'cpf_inq'
      Size = 18
    end
    object Query1nome_inq: TStringField
      FieldName = 'nome_inq'
      Size = 50
    end
    object Query1codigo: TStringField
      FieldName = 'codigo'
    end
    object Query1tipologradouro_inq: TStringField
      FieldName = 'tipologradouro_inq'
      Size = 5
    end
    object Query1logradouro_inq: TStringField
      FieldName = 'logradouro_inq'
      Size = 100
    end
    object Query1Numero_inq: TStringField
      FieldName = 'Numero_inq'
      Size = 10
    end
    object Query1bairro_inq: TStringField
      FieldName = 'bairro_inq'
      Size = 50
    end
    object Query1Compl_inq: TStringField
      FieldName = 'Compl_inq'
      Size = 50
    end
    object Query1cidade_inq: TStringField
      FieldName = 'cidade_inq'
      Size = 50
    end
    object Query1uf_inq: TStringField
      FieldName = 'uf_inq'
      Size = 50
    end
    object Query1email_inq: TStringField
      FieldName = 'email_inq'
      Size = 100
    end
  end
  inherited Table1: TTable
    Left = 896
    Top = 64
  end
  object qry_cliente: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select *  from clientes'
      'where inativado is null'
      'order by nome')
    Left = 421
    Top = 113
    object qry_clientepk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object qry_clientenome: TStringField
      FieldName = 'nome'
      Size = 50
    end
  end
  object dts_cliente: TDataSource
    DataSet = qry_cliente
    Left = 760
    Top = 72
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
    Left = 680
    Top = 328
    object seq_tabelastabela: TStringField
      FieldName = 'tabela'
      Size = 15
    end
    object seq_tabelasseq: TIntegerField
      FieldName = 'seq'
    end
  end
  object telefones: TADODataSet
    Connection = DM.DB
    BeforePost = telefonesBeforePost
    CommandText = 'select * from telefones where 1=2'#13#10
    Parameters = <>
    Left = 920
    Top = 320
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
    object telefonessms: TStringField
      FieldName = 'sms'
      Size = 1
    end
    object telefonesDDD: TStringField
      FieldName = 'DDD'
      Size = 3
    end
  end
  object dts_telefones: TDataSource
    DataSet = telefones
    Left = 920
    Top = 291
  end
  object dts_divida: TDataSource
    DataSet = qry_divida
    Left = 171
    Top = 310
  end
  object qry_cobrador: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select * from usuarios')
    Left = 589
    Top = 98
  end
  object dts_cobrador: TDataSource
    DataSet = qry_cobrador
    Left = 621
    Top = 98
  end
  object eventos: TADODataSet
    Connection = DM.DB
    CommandText = 'select * from eventos where 1=2'
    Parameters = <>
    Left = 373
    Top = 446
    object eventoschave: TIntegerField
      FieldName = 'chave'
    end
    object eventospk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object eventosData: TDateTimeField
      FieldName = 'Data'
    end
    object eventosHora: TStringField
      FieldName = 'Hora'
      Size = 10
    end
    object eventosTexto: TStringField
      FieldName = 'Texto'
      Size = 250
    end
    object eventosmotivo: TIntegerField
      FieldName = 'motivo'
    end
    object eventosAgendado_Data: TDateTimeField
      FieldName = 'Agendado_Data'
    end
    object eventosAgendado_Tipo: TIntegerField
      FieldName = 'Agendado_Tipo'
    end
    object eventosAgendado_Hora: TStringField
      FieldName = 'Agendado_Hora'
      Size = 50
    end
    object eventosmarcar_nao_localiz: TStringField
      FieldName = 'marcar_nao_localiz'
      Size = 1
    end
    object eventosseq_arq_inclusao: TIntegerField
      FieldName = 'seq_arq_inclusao'
    end
  end
  object log: TADODataSet
    Connection = DM.DB
    CommandText = 'select * from log where 1=2'
    Parameters = <>
    Left = 453
    Top = 454
    object logdata: TDateTimeField
      FieldName = 'data'
    end
    object logtexto: TStringField
      FieldName = 'texto'
      Size = 2000
    end
    object logusuario_chave: TIntegerField
      FieldName = 'usuario_chave'
    end
    object logusuario_nome: TStringField
      FieldName = 'usuario_nome'
      FixedChar = True
      Size = 60
    end
    object logdevedor_chave: TIntegerField
      FieldName = 'devedor_chave'
    end
    object logdevedor_nome: TStringField
      FieldName = 'devedor_nome'
      FixedChar = True
      Size = 10
    end
    object logtipo: TStringField
      FieldName = 'tipo'
      Size = 30
    end
    object logcgc_cpf: TStringField
      FieldName = 'cgc_cpf'
      Size = 30
    end
    object lognumero_titulo: TStringField
      FieldName = 'numero_titulo'
      Size = 30
    end
  end
  object dts_historicos: TDataSource
    AutoEdit = False
    DataSet = qry_historico
    Left = 224
    Top = 626
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
    Left = 264
    Top = 626
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
  object ADODataSet1: TADODataSet
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
    Left = 24
    Top = 544
    object StringField1: TStringField
      FieldName = 'tabela'
      Size = 15
    end
    object IntegerField1: TIntegerField
      FieldName = 'seq'
    end
  end
  object qry_divida: TADODataSet
    Connection = DM.DB
    CursorType = ctStatic
    BeforePost = qry_dividaBeforePost
    AfterScroll = qry_dividaAfterScroll
    CommandText = 'select * from titulos where 1=2'
    Parameters = <>
    Left = 141
    Top = 304
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
    object qry_dividavalor_principal: TFloatField
      FieldName = 'valor_principal'
      DisplayFormat = '#,0.00'
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
    object qry_dividapk_recibo: TIntegerField
      FieldName = 'pk_recibo'
    end
    object qry_dividanumero_titulo: TStringField
      FieldName = 'numero_titulo'
    end
    object qry_dividaseq_arq_inclusao: TIntegerField
      FieldName = 'seq_arq_inclusao'
    end
    object qry_dividaseq_arq_baixa: TIntegerField
      FieldName = 'seq_arq_baixa'
    end
    object qry_dividachave_titulo: TStringField
      FieldName = 'chave_titulo'
      Size = 12
    end
    object qry_dividaatualizar: TStringField
      FieldName = 'atualizar'
      Size = 3
    end
    object qry_dividaValor_titulo: TFloatField
      FieldName = 'Valor_titulo'
      DisplayFormat = '#,0.00'
    end
    object qry_dividaatu_data: TDateTimeField
      FieldName = 'atu_data'
    end
    object qry_dividaatu_juros: TBCDField
      FieldName = 'atu_juros'
      Precision = 18
      Size = 0
    end
    object qry_dividaatu_multa: TBCDField
      FieldName = 'atu_multa'
      Precision = 18
      Size = 0
    end
    object qry_dividaatu_percjuro: TBCDField
      FieldName = 'atu_percjuro'
      Precision = 18
      Size = 0
    end
    object qry_dividaatu_percmulta: TBCDField
      FieldName = 'atu_percmulta'
      Precision = 18
      Size = 0
    end
    object qry_dividaatu_retencao: TBCDField
      FieldName = 'atu_retencao'
      Precision = 18
      Size = 0
    end
    object qry_dividaatu_valor: TBCDField
      FieldName = 'atu_valor'
      Precision = 18
      Size = 0
    end
    object qry_dividadesc_principal: TBCDField
      FieldName = 'desc_principal'
      Precision = 18
      Size = 2
    end
    object qry_dividadesc_juros: TBCDField
      FieldName = 'desc_juros'
      Precision = 18
      Size = 2
    end
    object qry_dividadesc_multa: TBCDField
      FieldName = 'desc_multa'
      Precision = 18
      Size = 2
    end
    object qry_dividaacres_protesto: TBCDField
      FieldName = 'acres_protesto'
      Precision = 18
      Size = 2
    end
    object qry_dividaacres_honorarios: TBCDField
      FieldName = 'acres_honorarios'
      Precision = 18
      Size = 2
    end
    object qry_dividavalor_retenc: TBCDField
      FieldName = 'valor_retenc'
      Precision = 18
      Size = 2
    end
    object qry_dividavalor_liquido: TBCDField
      FieldName = 'valor_liquido'
      Precision = 18
      Size = 2
    end
    object qry_dividachave_contrato: TStringField
      FieldName = 'chave_contrato'
      Size = 30
    end
  end
  object qry_evento: TADODataSet
    Connection = DM.DB
    CommandText = 'select *'#13#10'from EVENTOS'#13#10'where 1=2'
    Parameters = <>
    Left = 104
    Top = 312
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
    Left = 370
    Top = 260
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
    object recibospk_prestcontas: TIntegerField
      FieldName = 'pk_prestcontas'
    end
  end
  object dts_recibos: TDataSource
    AutoEdit = False
    DataSet = recibos
    Left = 328
    Top = 270
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
      
        'select * from baixasparciais where pk_titulo is null and pk_deve' +
        'dor=:devedor'
      'order by data desc')
    Left = 32
    Top = 114
    object qry_bxparciaisPK_bxparcial: TIntegerField
      FieldName = 'PK_bxparcial'
    end
    object qry_bxparciaispk_devedor: TIntegerField
      FieldName = 'pk_devedor'
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
    object qry_bxparciaisvalor_retenc: TBCDField
      FieldName = 'valor_retenc'
      Precision = 18
      Size = 2
    end
    object qry_bxparciaistaxa_retenc: TBCDField
      FieldName = 'taxa_retenc'
      Precision = 18
      Size = 2
    end
    object qry_bxparciaisatraso: TIntegerField
      FieldName = 'atraso'
    end
    object qry_bxparciaisarquivo: TStringField
      FieldName = 'arquivo'
      Size = 200
    end
    object qry_bxparciaispk_titulo: TIntegerField
      FieldName = 'pk_titulo'
    end
    object qry_bxparciaishistorico: TStringField
      FieldName = 'historico'
      Size = 200
    end
  end
  object dts_bxparciais: TDataSource
    AutoEdit = False
    DataSet = qry_bxparciais
    Left = 72
    Top = 114
  end
  object qry_bxparctitulo: TADODataSet
    Connection = DM.DB
    CursorType = ctStatic
    CommandText = 'select * from baixasparciais where 1=2'#13#10
    Parameters = <>
    Left = 824
    Top = 216
    object qry_bxparctitulodata: TDateTimeField
      FieldName = 'data'
    end
    object qry_bxparctitulovalor: TBCDField
      FieldName = 'valor'
      Precision = 18
      Size = 2
    end
    object qry_bxparctituloarquivo: TStringField
      FieldName = 'arquivo'
      Size = 200
    end
    object qry_bxparctitulopk_prestcontas: TIntegerField
      FieldName = 'pk_prestcontas'
    end
    object qry_bxparctitulovalor_retenc: TBCDField
      FieldName = 'valor_retenc'
      Precision = 18
      Size = 2
    end
    object qry_bxparctitulotaxa_retenc: TBCDField
      FieldName = 'taxa_retenc'
      Precision = 18
      Size = 2
    end
    object qry_bxparctituloatraso: TIntegerField
      FieldName = 'atraso'
    end
    object qry_bxparctituloPK_bxparcial: TIntegerField
      FieldName = 'PK_bxparcial'
    end
    object qry_bxparctitulopk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object qry_bxparctituloacordo: TIntegerField
      FieldName = 'acordo'
    end
    object qry_bxparctitulopk_titulo: TIntegerField
      FieldName = 'pk_titulo'
    end
    object qry_bxparctitulohistorico: TStringField
      FieldName = 'historico'
      Size = 200
    end
  end
  object dts_bxparcTitulo: TDataSource
    DataSet = qry_bxparctitulo
    Left = 880
    Top = 211
  end
  object qry_devedores: TADODataSet
    Connection = DM.DB
    CursorType = ctStatic
    CommandText = 
      'select d.*, c.nome as nomeCliente'#13#10'from DEVEDORES d '#13#10'inner join' +
      ' CLIENTES c on ( c.pk_cliente=d.pk_cliente)'#13#10'where 1=2'#13#10'order by' +
      ' d.valor_divida desc'#13#10#13#10
    Parameters = <>
    Left = 800
    Top = 320
    object qry_devedoresCGC_CPF: TStringField
      FieldName = 'CGC_CPF'
      Size = 50
    end
    object qry_devedoresNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qry_devedorestipo_logradouro: TStringField
      FieldName = 'tipo_logradouro'
      Size = 10
    end
    object qry_devedoreslogradouro: TStringField
      FieldName = 'logradouro'
      Size = 50
    end
    object qry_devedoresNumero: TStringField
      FieldName = 'Numero'
      Size = 50
    end
    object qry_devedoresComplemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object qry_devedoresBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object qry_devedoresCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qry_devedoresCep: TStringField
      FieldName = 'Cep'
      Size = 50
    end
    object qry_devedoresUf: TStringField
      FieldName = 'Uf'
      Size = 50
    end
    object qry_devedoresponto_referencia: TStringField
      FieldName = 'ponto_referencia'
      Size = 50
    end
    object qry_devedoresemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object qry_devedorespk_devedor: TIntegerField
      FieldName = 'pk_devedor'
    end
    object qry_devedorespk_cliente: TIntegerField
      FieldName = 'pk_cliente'
    end
    object qry_devedorestelefones: TStringField
      FieldKind = fkCalculated
      FieldName = 'telefones'
      Size = 50
      Calculated = True
    end
    object qry_devedoresnomeCliente: TStringField
      FieldName = 'nomeCliente'
      Size = 50
    end
    object qry_devedorescpf_inq: TStringField
      FieldName = 'cpf_inq'
      Size = 18
    end
    object qry_devedoresnome_inq: TStringField
      FieldName = 'nome_inq'
      Size = 50
    end
    object qry_devedorescodigo: TStringField
      FieldName = 'codigo'
    end
  end
  object dts_devedores: TDataSource
    DataSet = qry_devedores
    Left = 795
    Top = 348
  end
end