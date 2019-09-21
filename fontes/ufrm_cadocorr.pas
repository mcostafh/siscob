unit ufrm_cadocorr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadPadrao, DBTables, DB, ADODB, ComCtrls, RXCtrls, ExtCtrls,
  SpeedBar, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TFrm_cadOcorr = class(TFrm_PadCad)
    DBGrid1: TDBGrid;
    Query1pk_ocorr: TIntegerField;
    Query1nome: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Query1tipo: TStringField;
    DBComboBox1: TDBComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Query1codigo: TStringField;
    DBEdit2: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure Query1BeforePost(DataSet: TDataSet);
    procedure Query1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_cadOcorr: TFrm_cadOcorr;

implementation

uses URotinas;

{$R *.dfm}

procedure TFrm_cadOcorr.FormCreate(Sender: TObject);
begin
  inherited;
janela:='Demonstrativo1';

end;

procedure TFrm_cadOcorr.Query1BeforePost(DataSet: TDataSet);
begin
  inherited;

  if Query1pk_ocorr.asstring = '' then
    Query1pk_ocorr.value := frotinas.sequencial('ocorrencias');

end;

procedure TFrm_cadOcorr.Query1AfterScroll(DataSet: TDataSet);
begin
  inherited;
if Query1tipo.Value = 'A' then
 DBComboBox1.Text := 'Ativo'
else
 DBComboBox1.Text := 'Inativo';

end;

end.
