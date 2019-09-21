unit ufrm_cadgruusu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadPadrao, DBTables, DB, ADODB, ComCtrls, RXCtrls, ExtCtrls,
  SpeedBar, Grids, DBGrids;

type
  Tfrm_grupousu = class(TFrm_PadCad)
    DBGrid1: TDBGrid;
    Query1pk_grupo: TIntegerField;
    Query1nome: TStringField;
    procedure Query1BeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_grupousu: Tfrm_grupousu;

implementation

uses URotinas;

{$R *.dfm}

procedure Tfrm_grupousu.Query1BeforePost(DataSet: TDataSet);
begin
  inherited;
Query1pk_grupo.Value := frotinas.sequencial('gruposusu');
end;

procedure Tfrm_grupousu.FormCreate(Sender: TObject);
begin
  inherited;
janela:='Gruposdeusurios1';
end;

end.
