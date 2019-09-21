unit UCadParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadPadrao, StdCtrls, Mask, DBCtrls, DB, Grids, DBGrids, ADODB,
  Buttons, ToolWin, ComCtrls, ExtCtrls, DBTables, RXCtrls, SpeedBar;

type
  TFrm_CadParam = class(TFrm_PadCad)
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Query1VALOR_PARAM: TStringField;
    Query1PK_PARAM: TIntegerField;
    Panel4: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Query1nome_param: TStringField;
    Query1descr_param: TStringField;
    procedure Query1BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadParam: TFrm_CadParam;

implementation

uses UDM, URotinas;

{$R *.dfm}

procedure TFrm_CadParam.Query1BeforePost(DataSet: TDataSet);
var iseq:smallint;
begin
  inherited;
  if Query1.State = dsInsert then
  begin
    iSeq:=FRotinas.Sequencial('PARAM');
    Query1Pk_Param.AsInteger := iSeq;
  end;

end;

end.
