inherited Frm_cadOcorr: TFrm_cadOcorr
  Width = 579
  Height = 467
  Caption = 'Frm_cadOcorr'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar: TSpeedBar
    Width = 571
  end
  inherited Panel1: TPanel
    Top = 386
    Width = 571
  end
  inherited StatusBar1: TStatusBar
    Top = 421
    Width = 571
  end
  inherited Panel2: TPanel
    Width = 571
    Height = 330
    object Label1: TLabel
      Left = 246
      Top = 7
      Width = 26
      Height = 13
      Caption = 'nome'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 250
      Top = 89
      Width = 21
      Height = 12
      Caption = 'Tipo'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 247
      Top = 50
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 240
      Height = 328
      Align = alLeft
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
          FieldName = 'nome'
          Visible = True
        end>
    end
    object DBEdit1: TDBEdit
      Left = 245
      Top = 22
      Width = 272
      Height = 21
      DataField = 'nome'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBComboBox1: TDBComboBox
      Left = 248
      Top = 107
      Width = 145
      Height = 21
      DataField = 'tipo'
      DataSource = DataSource1
      ItemHeight = 13
      Items.Strings = (
        'Ativo'
        'Inativo')
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 248
      Top = 64
      Width = 199
      Height = 21
      DataField = 'codigo'
      DataSource = DataSource1
      TabOrder = 3
    end
  end
  inherited Query1: TADODataSet
    BeforePost = Query1BeforePost
    AfterScroll = Query1AfterScroll
    CommandText = 'select *'#13#10'from ocorrencias'#13#10'order by nome'
    object Query1pk_ocorr: TIntegerField
      FieldName = 'pk_ocorr'
    end
    object Query1nome: TStringField
      FieldName = 'nome'
      Size = 30
    end
    object Query1tipo: TStringField
      FieldName = 'tipo'
      FixedChar = True
      Size = 1
    end
    object Query1codigo: TStringField
      FieldName = 'codigo'
      Size = 15
    end
  end
end
