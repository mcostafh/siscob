object DM: TDM
  OldCreateOrder = False
  Left = 515
  Top = 231
  Height = 332
  Width = 320
  object DB: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyRead
    Provider = 'C:\sistemas\siscob.udl'
    Left = 64
    Top = 16
  end
  object qryBanco: TADODataSet
    Connection = DB
    Parameters = <>
    Left = 200
    Top = 16
  end
  object qryTabelas: TADODataSet
    Connection = DB
    Parameters = <>
    Left = 144
    Top = 16
  end
  object Ado_Exec: TADOCommand
    Connection = DB
    Parameters = <>
    Left = 264
    Top = 16
  end
end
