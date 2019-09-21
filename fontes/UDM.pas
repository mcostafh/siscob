unit UDM;

interface

uses
  SysUtils, Classes, DB, DBTables, IBDatabase, ADODB;

type
  TDM = class(TDataModule)
    DB: TADOConnection;
    qryBanco: TADODataSet;
    qryTabelas: TADODataSet;
    Ado_Exec: TADOCommand;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
