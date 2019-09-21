inherited frm_grupousu: Tfrm_grupousu
  Top = 178
  Caption = 'Grupos de usu'#225'rios'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 224
      Height = 273
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
  end
  inherited Query1: TADODataSet
    CursorType = ctStatic
    BeforePost = Query1BeforePost
    CommandText = 'select * from gruposusu'
    object Query1pk_grupo: TIntegerField
      FieldName = 'pk_grupo'
    end
    object Query1nome: TStringField
      FieldName = 'nome'
      Size = 30
    end
  end
  inherited Table1: TTable
    Left = 504
    Top = 160
  end
end
