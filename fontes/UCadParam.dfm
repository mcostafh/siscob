inherited Frm_CadParam: TFrm_CadParam
  Left = 270
  Top = 19
  Width = 738
  Height = 598
  Caption = 'Par'#226'metros do Sistema'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar: TSpeedBar
    Width = 730
  end
  inherited Panel1: TPanel
    Top = 517
    Width = 730
  end
  inherited StatusBar1: TStatusBar
    Top = 552
    Width = 730
  end
  inherited Panel2: TPanel
    Width = 730
    Height = 461
    object Panel3: TPanel
      Left = 1
      Top = 354
      Width = 728
      Height = 106
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 2
        Top = 6
        Width = 48
        Height = 13
        Caption = 'Par'#226'metro'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 129
        Top = 6
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 2
        Top = 61
        Width = 46
        Height = 13
        Caption = 'Conte'#250'do'
        FocusControl = DBEdit3
      end
      object Label5: TLabel
        Left = 420
        Top = 4
        Width = 24
        Height = 13
        Caption = 'Valor'
        FocusControl = DBEdit4
      end
      object DBEdit1: TDBEdit
        Left = 4
        Top = 23
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME_PARAM'
        DataSource = DataSource1
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 129
        Top = 23
        Width = 272
        Height = 21
        DataField = 'DESCR_PARAM'
        DataSource = DataSource1
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 2
        Top = 76
        Width = 215
        Height = 21
        DataField = 'VALOR_PARAM'
        DataSource = DataSource1
        TabOrder = 2
      end
      object Panel4: TPanel
        Left = 0
        Top = 46
        Width = 728
        Height = 60
        Align = alBottom
        Color = 16776176
        TabOrder = 3
        object Label4: TLabel
          Left = 5
          Top = 8
          Width = 339
          Height = 13
          Caption = 'COMANDOS: FORMATO_DT (DD/MM/YY), FC,PAGOU,PAGOUPARC'
        end
      end
      object DBEdit4: TDBEdit
        Left = 416
        Top = 24
        Width = 289
        Height = 21
        DataField = 'VALOR_PARAM'
        DataSource = DataSource1
        TabOrder = 4
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 728
      Height = 353
      Align = alClient
      DataSource = DataSource1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nome_param'
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descr_param'
          Width = 229
          Visible = True
        end>
    end
  end
  inherited DataSource1: TDataSource
    Left = 280
    Top = 73
  end
  inherited Query1: TADODataSet
    CursorType = ctStatic
    BeforePost = Query1BeforePost
    CommandText = 'select *'#13#10'from Param'#13#10'order by descr_param'
    Left = 280
    Top = 40
    object Query1VALOR_PARAM: TStringField
      DisplayWidth = 100
      FieldName = 'VALOR_PARAM'
      Size = 150
    end
    object Query1PK_PARAM: TIntegerField
      FieldName = 'PK_PARAM'
    end
    object Query1nome_param: TStringField
      FieldName = 'nome_param'
      Size = 40
    end
    object Query1descr_param: TStringField
      FieldName = 'descr_param'
      Size = 150
    end
  end
end
