object Frm_RenovaSenha: TFrm_RenovaSenha
  Left = 189
  Top = 97
  Width = 998
  Height = 641
  Caption = 'Cadastro e Renova'#231#227'o de Senhas de Clientes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 990
    Height = 614
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Clientes'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 197
        Height = 586
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 193
          Height = 586
          Align = alLeft
          DataSource = Dts_Cliente
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
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
      end
      object PageControl3: TPageControl
        Left = 197
        Top = 0
        Width = 785
        Height = 586
        ActivePage = TabSheet7
        Align = alClient
        TabOrder = 1
        object TabSheet5: TTabSheet
          Caption = 'Cadastro'
          object SB_Inserir: TSpeedButton
            Left = 5
            Top = 1
            Width = 65
            Height = 24
            Hint = 'F2-Incluir novo Registro'
            Caption = 'Novo'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
              0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
              33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = SB_InserirClick
          end
          object SB_Alterar: TSpeedButton
            Left = 77
            Top = 3
            Width = 65
            Height = 22
            Hint = 'F3-Editar um Registro'
            Caption = 'Alterar'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
              000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
              00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
              F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
              0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
              FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
              FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
              0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
              00333377737FFFFF773333303300000003333337337777777333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = SB_AlterarClick
          end
          object SB_Salvar: TSpeedButton
            Left = 156
            Top = 1
            Width = 82
            Height = 24
            Hint = 'F4-Gravar Opera'#231#227'o'
            Caption = 'Gravar'
            Enabled = False
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
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = SB_SalvarClick
          end
          object SB_Cancelar: TSpeedButton
            Left = 251
            Top = 1
            Width = 75
            Height = 24
            Hint = 'F5-Cancelar Opera'#231#227'o'
            Caption = 'Cancelar'
            Enabled = False
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00AAAAAAAAAAAA
              AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA1AAAAA1AAAAAAAAAAAAAA111AAAAAAA
              1AAAAA111AAAAAA1AAAAAAA111AAAA11AAAAAAAA111AA11AAAAAAAAAA11111AA
              AAAAAAAAAA111AAAAAAAAAAAA11111AAAAAAAAAA111AA1AAAAAAAA1111AAAA11
              AAAAA1111AAAAAA11AAAA11AAAAAAAAA11AAAAAAAAAAAAAAAAAA}
            ParentShowHint = False
            ShowHint = True
            OnClick = SB_CancelarClick
          end
          object pn_Cad: TPanel
            Left = 12
            Top = 37
            Width = 697
            Height = 412
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object Label3: TLabel
              Left = 24
              Top = 32
              Width = 53
              Height = 13
              Caption = 'CNPJ_CPF'
              FocusControl = edt_cnpj
            end
            object Label4: TLabel
              Left = 24
              Top = 80
              Width = 32
              Height = 13
              Caption = 'NOME'
              FocusControl = DBEdit2
            end
            object Label5: TLabel
              Left = 24
              Top = 136
              Width = 68
              Height = 13
              Caption = 'chaveLicenca'
              FocusControl = DBEdit3
            end
            object edt_cnpj: TDBEdit
              Left = 24
              Top = 48
              Width = 264
              Height = 21
              DataField = 'CNPJ_CPF'
              DataSource = Dts_Cliente
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 24
              Top = 96
              Width = 524
              Height = 21
              DataField = 'NOME'
              DataSource = Dts_Cliente
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 24
              Top = 152
              Width = 264
              Height = 21
              DataField = 'chaveLicenca'
              DataSource = Dts_Cliente
              TabOrder = 2
            end
          end
          object BitBtn2: TBitBtn
            Left = 608
            Top = 1
            Width = 82
            Height = 28
            Hint = 'Sair do Sistema'
            Caption = 'Fechar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = BitBtn2Click
            Glyph.Data = {
              0E060000424D0E06000000000000360000002800000016000000160000000100
              180000000000D8050000C40E0000C40E00000000000000000000EFF1F9445CB9
              0928A20C2AA20F2DA4112EA4122FA3112EA4112EA5102FA8102FA80C2CA80A2C
              AB082BAC072AAC0527A80326AA0225AB0024AB0021A23F56B0EFF0F80000445F
              CB0E32C31437C5193CC51F41C82142C82142C72041C81F41C81D41C81B40C919
              40CC163ECE113CCF0F3ACE0C38CC0836CF0432CF012FCD002BC50025B23F56B0
              00000A32D1153CD61E44D8264AD92C4FDA2E51DB2E50DB2C4FDA2B50DB2A51DC
              2750DC234EDE1F4DDF1B4BE01748E11245E00D42E1073CE00337DF0032D7002A
              C50020A100000E37DB1C43DE264CE02F52E13557E1385AE2385BE23659E23459
              E2335AE32F59E42B57E52655E62153E71B4FE7164CE71048E80A42E7063DE602
              37DF012FCD0023A80000123BDD2449E02F52E13659E23D5EE44061E44061E55C
              79E89FB0F2DBE2FAF7F9FEF6F8FED5DEFA8FA9F43D6BEC1A51EA144DEA0E47E9
              0841E70439E10230CF0124AA0000163EDE2B4FE13759E33F60E44565E54968E5
              8CA0EFF5F7FEFFFFFFEFF2FDE3E9FCE2E8FCF0F3FDFFFFFFECF1FD678CF11750
              EA114AEA0B44E8073DE10533CF0326AB00001B42DE3155E23D5EE44564E44B69
              E591A3EFFFFFFFF1F3FDAABAF46583EB3D66E73863E75D81EEA2B8F6F3F6FEFB
              FCFF6389F1134CE90F47E80C40E10A37CF0528AC00002046DF385AE34463E44A
              68E56B84EAF3F5FDEFF2FD7C94ED4869E64469E73F66E73964E73260E82B5CE9
              6E90F0F2F5FEE8EDFD3463EC144AE71144E10F3BD0082AAB0000244AE03E5FE4
              4967E54F6CE6AEBBF4FFFFFFA6B6F24D6CE64A6AE64568E7FFFFFFFFFFFF3360
              E82C5CE82658E89FB5F6FFFFFF8AA5F3184CE71748E1143ECF0C2EAC00002B4F
              E14564E54F6CE65470E7E5E9FBECEFFC6C84EB4E6CE6496AE64467E6FFFFFFFF
              FFFF335EE72B5AE72656E74D75ECEFF3FDD1DBFA1B4DE51B4AE01941CF0F30AB
              00003053E24B68E55470E75772E8FFFFFFD9DEFA526EE74E6BE64968E54465E6
              FFFFFFFFFFFF315BE52B57E62653E62352E6DFE6FBF5F7FE1F4EE5204CDF1D44
              CE1232AA00003356E2506DE75973E85B75E8FFFFFFD8DEF9536EE64E6BE64967
              E54364E5FFFFFFFFFFFF3159E42A55E52551E4214FE4DEE5FBF7F9FE224EE324
              4EDF2146CD1433AB0000395BE35772E85E78E85F79E8E9ECFCEAEDFC6A82E94E
              6BE54967E54363E5FFFFFFFFFFFF3157E32B53E42650E3496CE8EEF1FDD6DEFA
              254FE3284FDD2447CD1734A900003E5FE45E78E8647DE8637CE8B9C4F5FFFFFF
              A4B2F24E6AE64966E44362E4FFFFFFFFFFFF3155E22B52E2274EE29BAEF2FFFF
              FF95A8F1284FE22B50DD2748CD1936AA00003F5FE4647DE96B85EA6982EA8195
              EDF7F9FEEBEEFC788DEC4B67E54663E4405FE43A5BE33457E22F53E26681EAEE
              F1FDF0F3FD496AE62B51E12D51DD2849CC1936A900004564E56A83EA728AEB6E
              87EB6881EAA5B3F2FFFFFFECEFFCA1B0F25B75E74361E43D5DE45874E897A8F0
              EEF1FDFFFFFF7A92ED2D51E22D52E12E51DC2949CB1A37A900004866E5728AEB
              7B92EC758DEC6D86EB667FE9A4B2F2FDFDFFFFFFFFE4E8FBD4DBF9D4DBF9E7EB
              FCFFFFFFF6F8FE8196ED3154E13054E23053E13052DC2949CA1A36A800004F6D
              E67E95ED8A9EEE8398ED778FEC6C85EB6780E97F94ECB5C1F5E9ECFCFFFFFFFF
              FFFFE3E8FBA7B6F3637DE84060E43C5EE3395BE33457E23052DC2747CA1734A7
              00005672E78B9FEF98AAF18FA2EF8197ED758DEC6F88EB6A83EA667FE9627CE8
              5F79E85D78E85A75E85672E75370E74E6CE64867E54262E4395BE23052DC2445
              CA1330A600005975E892A5F0A0B0F296A8F1869BEE7991EC738CEB6E87EA6A84
              EA6881E9657EE9647EE9627CE95E79E95A76E85471E74E6DE64665E53C5DE32F
              52DC2042C9102EA50000768DEB7D94ED8EA2EF869BEE778EEC6B85EA6881EA64
              7DE9607AE95D77E85A75E85974E85672E7516FE6506DE64B6AE54666E53D5FE4
              3457E1284CDA1B3DC64A61BC0000F1F4FD768DEB5773E7526FE74B68E64766E5
              4362E53D5DE43B5CE33C5DE33B5CE3395AE33557E23456E22E52E12D51E12C50
              E1254AE01F45DE183ED54D67D1F0F1F90000}
          end
        end
        object TabSheet7: TTabSheet
          Caption = 'Senhas Geradas'
          ImageIndex = 2
          object DBGrid3: TDBGrid
            Left = 0
            Top = 0
            Width = 777
            Height = 558
            Align = alClient
            DataSource = Dts_SenhasGeradas
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
                FieldName = 'CNPJ_CPF'
                Width = 97
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'chaveLicenca'
                Width = 78
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SERIAL1'
                Width = 101
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SERIAL2'
                Width = 113
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALIDADE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RENOVACAO'
                Visible = True
              end>
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Gerar Renova'#231#227'o de Senhas'
      ImageIndex = 1
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 982
        Height = 586
        ActivePage = TabSheet3
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpBottom
        object TabSheet3: TTabSheet
          Caption = 'Cadastro'
          object sb_fecar: TSpeedButton
            Left = 656
            Top = 16
            Width = 121
            Height = 57
            Caption = 'Sair'
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
            OnClick = sb_fecarClick
          end
          object GroupBox1: TGroupBox
            Left = 8
            Top = 16
            Width = 297
            Height = 153
            Caption = 'Dados para a Renova'#231#227'o da Senha de Validade'
            TabOrder = 0
            object Label22: TLabel
              Left = 16
              Top = 30
              Width = 80
              Height = 13
              Caption = 'Senha v'#225'lida at'#233
            end
            object sbt_imprime: TSpeedButton
              Left = 15
              Top = 72
              Width = 82
              Height = 33
              Caption = 'Imprimir'
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
              NumGlyphs = 2
              OnClick = sbt_imprimeClick
            end
            object sbt_gerar: TSpeedButton
              Left = 111
              Top = 72
              Width = 130
              Height = 33
              Caption = 'Gerar para Arquivo'
              Flat = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00550000000005
                555555777777777FF5555500000000805555557777777777FF555550BBBBB008
                05555557F5FFF7777FF55550B000B03080555557F77757F777F55550BBBBB033
                00555557F55557F577555550BBBBB03305555557FFFFF7F57F55555000000033
                05555557777777F57F555550BBBBB03305555557F5FFF7F57F555550B000B033
                05555557F77757F57F555550BBBBB03305555557F55557F57F555550BBBBB033
                05555557FFFFF7FF7F55550000000003055555777777777F7F55550777777700
                05555575FF5555777F5555500B3B3B300555555775FF55577FF555555003B3B3
                005555555775FFFF77F555555570000000555555555777777755}
              NumGlyphs = 2
              OnClick = sbt_gerarClick
            end
            object edt_Validade: TDateEdit
              Left = 110
              Top = 28
              Width = 99
              Height = 21
              NumGlyphs = 2
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  object Dts_Cliente: TDataSource
    DataSet = Qry_Cliente
    OnDataChange = Dts_ClienteDataChange
    Left = 936
    Top = 66
  end
  object QRHTMLFilter1: TQRHTMLFilter
    MultiPage = False
    PageLinks = False
    FinalPage = 0
    FirstLastLinks = False
    Concat = False
    ConcatCount = 1
    LinkFontSize = 12
    LinkFontName = 'Arial'
    Left = 592
    Top = 116
  end
  object QRTextFilter1: TQRTextFilter
    Left = 592
    Top = 84
  end
  object Tb_SenhasGeradas: TADOTable
    Connection = DM.DB
    TableName = 'LICENCAS_CLIENTE'
    Left = 624
    Top = 220
    object Tb_SenhasGeradasPK_ORDEM: TBCDField
      FieldName = 'PK_ORDEM'
      Precision = 18
      Size = 0
    end
    object Tb_SenhasGeradasNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object Tb_SenhasGeradasCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
    object Tb_SenhasGeradaschaveLicenca: TStringField
      FieldName = 'chaveLicenca'
    end
    object Tb_SenhasGeradasSERIAL1: TStringField
      FieldName = 'SERIAL1'
      Size = 100
    end
    object Tb_SenhasGeradasSERIAL2: TStringField
      FieldName = 'SERIAL2'
      Size = 100
    end
    object Tb_SenhasGeradasVALIDADE: TDateTimeField
      FieldName = 'VALIDADE'
    end
    object Tb_SenhasGeradasRENOVACAO: TDateTimeField
      FieldName = 'RENOVACAO'
    end
  end
  object Dts_SenhasGeradas: TDataSource
    DataSet = Qry_SenhasGeradas
    Left = 553
    Top = 160
  end
  object Qry_SenhasGeradas: TADOQuery
    Connection = DM.DB
    BeforePost = Qry_SenhasGeradasBeforePost
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from LICENCAS_CLIENTE')
    Left = 593
    Top = 160
    object Qry_SenhasGeradasPK_ORDEM: TBCDField
      FieldName = 'PK_ORDEM'
      Precision = 18
      Size = 0
    end
    object Qry_SenhasGeradasNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object Qry_SenhasGeradasCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
    object Qry_SenhasGeradaschaveLicenca: TStringField
      FieldName = 'chaveLicenca'
    end
    object Qry_SenhasGeradasSERIAL1: TStringField
      FieldName = 'SERIAL1'
      Size = 100
    end
    object Qry_SenhasGeradasSERIAL2: TStringField
      FieldName = 'SERIAL2'
      Size = 100
    end
    object Qry_SenhasGeradasVALIDADE: TDateTimeField
      FieldName = 'VALIDADE'
    end
    object Qry_SenhasGeradasRENOVACAO: TDateTimeField
      FieldName = 'RENOVACAO'
    end
  end
  object Qry_Cliente: TADOQuery
    Connection = DM.DB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from LICENCA')
    Left = 897
    Top = 80
    object Qry_ClientePK_ORDEM: TBCDField
      FieldName = 'PK_ORDEM'
      Precision = 18
      Size = 0
    end
    object Qry_ClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object Qry_ClienteCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
    object Qry_ClientechaveLicenca: TStringField
      FieldName = 'chaveLicenca'
    end
  end
end
