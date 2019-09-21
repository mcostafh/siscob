inherited frm_permissoes: Tfrm_permissoes
  Left = 222
  Top = 84
  Width = 888
  Height = 675
  Caption = 'Permiss'#245'es'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar: TSpeedBar
    Top = 46
    Width = 872
    object Label5: TLabel [0]
      Left = 592
      Top = 9
      Width = 66
      Height = 13
      Caption = 'Copiar para'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_copiar: TSpeedButton [1]
      Left = 797
      Top = 22
      Width = 65
      Height = 21
      Caption = 'Copiar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      NumGlyphs = 2
      OnClick = btn_copiarClick
    end
    object lk_grupousuarios2: TRxDBLookupCombo [2]
      Left = 593
      Top = 24
      Width = 200
      Height = 21
      DropDownCount = 8
      LookupField = 'pk_grupo'
      LookupDisplay = 'nome'
      LookupDisplayIndex = 5
      LookupSource = dts_grupo2
      TabOrder = 0
    end
  end
  inherited Panel1: TPanel
    Top = 584
    Width = 872
  end
  inherited StatusBar1: TStatusBar
    Top = 619
    Width = 872
  end
  inherited Panel2: TPanel
    Top = 102
    Width = 872
    Height = 482
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 870
      Height = 480
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 6
        Top = 382
        Width = 31
        Height = 13
        Caption = 'Janela'
      end
      object Label3: TLabel
        Left = 5
        Top = 340
        Width = 83
        Height = 13
        Caption = 'Grupo do Usu'#225'rio'
      end
      object Label2: TLabel
        Left = 6
        Top = 423
        Width = 36
        Height = 13
        Caption = 'Palavra'
      end
      object Label4: TLabel
        Left = 323
        Top = 421
        Width = 24
        Height = 13
        Caption = 'Valor'
        FocusControl = DBEdit1
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 870
        Height = 337
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
            FieldName = 'menu'
            Width = 124
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'janela'
            Width = 242
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'palavra'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Width = 49
            Visible = True
          end>
      end
      object lb_janela: TRxDBLookupCombo
        Left = 6
        Top = 397
        Width = 307
        Height = 21
        DropDownCount = 8
        DataField = 'pk_janela'
        DataSource = DataSource1
        LookupField = 'pk_janela'
        LookupDisplay = 'nome'
        LookupDisplayIndex = 5
        LookupSource = dts_janela
        TabOrder = 2
        OnExit = lb_janelaExit
      end
      object lk_grupo: TRxDBLookupCombo
        Left = 6
        Top = 356
        Width = 200
        Height = 21
        DropDownCount = 8
        DataField = 'PK_GRUPO'
        DataSource = DataSource1
        LookupField = 'pk_grupo'
        LookupDisplay = 'nome'
        LookupDisplayIndex = 5
        LookupSource = dts_grupo
        TabOrder = 1
      end
      object RxDBLookupCombo2: TRxDBLookupCombo
        Left = 6
        Top = 438
        Width = 307
        Height = 21
        DropDownCount = 8
        DataField = 'pk_palavra'
        DataSource = DataSource1
        LookupField = 'pk_palavra'
        LookupDisplay = 'palavra'
        LookupDisplayIndex = 5
        LookupSource = dts_palavras
        TabOrder = 3
      end
      object DBEdit1: TDBEdit
        Left = 323
        Top = 437
        Width = 178
        Height = 21
        DataField = 'valor'
        DataSource = DataSource1
        TabOrder = 4
      end
    end
  end
  object Panel4: TPanel [4]
    Left = 0
    Top = 0
    Width = 872
    Height = 46
    Align = alTop
    BevelOuter = bvLowered
    Color = 3617837
    TabOrder = 4
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
    end
    object lb_totalDevedores: TLabel
      Left = 384
      Top = 14
      Width = 59
      Height = 18
      AutoSize = False
      Caption = 'Janela'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lb_usuario: TLabel
      Left = 10
      Top = 14
      Width = 143
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Grupo Usu'#225'rios'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 721
      Top = 7
      Width = 76
      Height = 32
      Hint = 'Esconde a tela'
      Caption = '&Filtrar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object lk_grupousuarios: TRxDBLookupCombo
      Left = 158
      Top = 13
      Width = 200
      Height = 21
      DropDownCount = 8
      LookupField = 'pk_grupo'
      LookupDisplay = 'nome'
      LookupDisplayIndex = 5
      LookupSource = dts_grupo
      TabOrder = 0
    end
    object lk_janela: TRxDBLookupCombo
      Left = 448
      Top = 13
      Width = 249
      Height = 21
      DropDownCount = 8
      LookupField = 'pk_janela'
      LookupDisplay = 'nome'
      LookupDisplayIndex = 5
      LookupSource = dts_janela
      TabOrder = 1
      OnExit = lb_janelaExit
    end
  end
  inherited DataSource1: TDataSource
    Left = 384
    Top = 201
  end
  inherited Query1: TADODataSet
    BeforePost = Query1BeforePost
    AfterScroll = Query1AfterScroll
    OnCalcFields = Query1CalcFields
    CommandText = 
      'select p.* , g.nome, j.nome as janela, jp.palavra,j.opcao_menu_p' +
      'rinc'#13#10'from permissoes p inner join'#13#10'gruposusu g on ( g.pk_grupo=' +
      'p.pk_grupo ) inner join'#13#10'janelas j on ( p.pk_janela=j.pk_janela)' +
      ' left join '#13#10'janelas_palavras jp on (p.pk_palavra=jp.pk_palavra)' +
      #13#10'order by g.nome, j.opcao_menu_princ, j.nome'
    Left = 384
    Top = 160
    object Query1pk_permissao: TIntegerField
      FieldName = 'pk_permissao'
    end
    object Query1pk_grupo: TIntegerField
      FieldName = 'pk_grupo'
    end
    object Query1pk_janela: TIntegerField
      FieldName = 'pk_janela'
    end
    object Query1nome: TStringField
      FieldName = 'nome'
      Size = 30
    end
    object Query1janela: TStringField
      FieldName = 'janela'
      Size = 50
    end
    object Query1valor: TStringField
      FieldName = 'valor'
      Size = 50
    end
    object Query1palavra: TStringField
      FieldName = 'palavra'
      Size = 30
    end
    object Query1pk_palavra: TIntegerField
      FieldName = 'pk_palavra'
    end
    object Query1menu: TStringField
      FieldKind = fkCalculated
      FieldName = 'menu'
      Size = 30
      Calculated = True
    end
    object Query1opcao_menu_princ: TStringField
      FieldName = 'opcao_menu_princ'
      Size = 1
    end
  end
  object qry_grupos: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from gruposusu'
      'order by nome')
    Left = 248
  end
  object dts_grupo: TDataSource
    DataSet = qry_grupos
    Left = 288
    Top = 8
  end
  object Qry_janela: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from janelas'
      'order by opcao_menu_princ')
    Left = 696
    Top = 128
  end
  object dts_janela: TDataSource
    DataSet = Qry_janela
    Left = 736
    Top = 128
  end
  object qry_palavras: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from janelas_palavras'
      'order by palavra')
    Left = 696
    Top = 176
  end
  object dts_palavras: TDataSource
    DataSet = qry_palavras
    Left = 736
    Top = 176
  end
  object qry_grupos2: TADOQuery
    Connection = DM.DB
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from gruposusu'
      'order by nome')
    Left = 656
    Top = 32
  end
  object dts_grupo2: TDataSource
    DataSet = qry_grupos2
    Left = 688
    Top = 32
  end
end
