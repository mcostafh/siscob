inherited Frm_cadMotivosSPC: TFrm_cadMotivosSPC
  Width = 560
  Height = 519
  Caption = 'Motivos de retorno do SPC'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar: TSpeedBar
    Width = 552
  end
  inherited Panel1: TPanel
    Top = 438
    Width = 552
  end
  inherited StatusBar1: TStatusBar
    Top = 473
    Width = 552
  end
  inherited Panel2: TPanel
    Width = 552
    Height = 382
    object Label1: TLabel
      Left = 8
      Top = 336
      Width = 32
      Height = 13
      Caption = 'codigo'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 72
      Top = 336
      Width = 26
      Height = 13
      Caption = 'nome'
      FocusControl = DBEdit2
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 550
      Height = 328
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
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 469
          Visible = True
        end>
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 352
      Width = 43
      Height = 21
      DataField = 'codigo'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 72
      Top = 352
      Width = 418
      Height = 21
      DataField = 'nome'
      DataSource = DataSource1
      TabOrder = 2
    end
  end
  inherited Query1: TADODataSet
    CursorType = ctStatic
    BeforePost = Query1BeforePost
    CommandText = 'select * from MOTIVOSSPC'
    object Query1PK_MOTIVO: TBCDField
      FieldName = 'PK_MOTIVO'
      Precision = 18
      Size = 0
    end
    object Query1CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 2
    end
    object Query1NOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
  end
end