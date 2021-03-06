unit ufrm_permissoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadPadrao, DBTables, DB, ADODB, ComCtrls, RXCtrls, ExtCtrls,
  SpeedBar, Grids, DBGrids, StdCtrls, RxLookup, Mask, DBCtrls, Buttons;

type
  Tfrm_permissoes = class(TFrm_PadCad)
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Query1pk_permissao: TIntegerField;
    Query1pk_grupo: TIntegerField;
    Query1pk_janela: TIntegerField;
    Query1nome: TStringField;
    Query1janela: TStringField;
    qry_grupos: TADOQuery;
    dts_grupo: TDataSource;
    Qry_janela: TADOQuery;
    dts_janela: TDataSource;
    Label1: TLabel;
    lb_janela: TRxDBLookupCombo;
    lk_grupo: TRxDBLookupCombo;
    Label3: TLabel;
    Query1valor: TStringField;
    Query1palavra: TStringField;
    Label2: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    qry_palavras: TADOQuery;
    dts_palavras: TDataSource;
    Query1pk_palavra: TIntegerField;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Panel4: TPanel;
    bt_fechar: TSpeedButton;
    lb_totalDevedores: TLabel;
    lb_usuario: TLabel;
    lk_grupousuarios: TRxDBLookupCombo;
    lk_janela: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    Query1menu: TStringField;
    Query1opcao_menu_princ: TStringField;
    Label5: TLabel;
    qry_grupos2: TADOQuery;
    dts_grupo2: TDataSource;
    lk_grupousuarios2: TRxDBLookupCombo;
    btn_copiar: TSpeedButton;
    procedure Query1BeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure lb_janelaExit(Sender: TObject);
    procedure Query1AfterScroll(DataSet: TDataSet);
    procedure SB_SalvarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure aplicaFiltro;
    procedure Query1CalcFields(DataSet: TDataSet);
    procedure btn_copiarClick(Sender: TObject);
    procedure SB_ExcluirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_permissoes: Tfrm_permissoes;

implementation

uses URotinas;

{$R *.dfm}

procedure Tfrm_permissoes.Query1BeforePost(DataSet: TDataSet);
begin
  inherited;
Query1pk_permissao.value := frotinas.sequencial('permissoes');
end;

procedure Tfrm_permissoes.FormCreate(Sender: TObject);
begin
  inherited;
qry_grupos.Open;
qry_grupos2.Open;
Qry_janela.Open;
qry_palavras.open;
janela:='Permisses1';
end;

procedure Tfrm_permissoes.lb_janelaExit(Sender: TObject);
begin
  inherited;
if lb_janela.KeyValue <> null then
begin
  qry_palavras.close;
  qry_palavras.SQL.Text := ' select * from janelas_palavras where pk_janela='+intToStr(lb_janela.KeyValue)+' order by palavra ';
  qry_palavras.open;
end;

end;

procedure Tfrm_permissoes.Query1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  qry_palavras.close;
  qry_palavras.open;

end;

procedure Tfrm_permissoes.SB_SalvarClick(Sender: TObject);
begin
  inherited;
  aplicaFiltro;
end;

procedure Tfrm_permissoes.aplicaFiltro;
var sql,where:string;
begin
  if (lk_grupousuarios.KeyValue>0) or (lk_janela.KeyValue > 0) then
  begin

    sql := ' select p.* , g.nome, j.nome as janela, jp.palavra, j.opcao_menu_princ ';
    sql := sql + ' from permissoes p inner join ';
    sql := sql + ' gruposusu g on ( g.pk_grupo=p.pk_grupo ) inner join ';
    sql := sql + ' janelas j on ( p.pk_janela=j.pk_janela) left join ';
    sql := sql + ' janelas_palavras jp on (p.pk_palavra=jp.pk_palavra) ';

    where := '';
    if lk_grupousuarios.KeyValue >0 then
      where := '  p.pk_grupo= '+intToStr(lk_grupousuarios.KeyValue);
    if lk_janela.KeyValue > 0 then
      where := ' p.pk_janela= '+intToStr(lk_janela.KeyValue);

    if where <> '' then
      where := ' where '+where;

    sql := sql + where;
    sql := sql + ' order by g.nome, j.opcao_menu_princ, j.nome ';


    Query1.close;
    Query1.CommandText := sql;
    Query1.open;
  end;
end;

procedure Tfrm_permissoes.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  aplicaFiltro;
end;

procedure Tfrm_permissoes.Query1CalcFields(DataSet: TDataSet);
begin
  inherited;
if Query1opcao_menu_princ.value = '1' then
  Query1menu.value := 'Cadastros'
else if Query1opcao_menu_princ.value = '2' then
  Query1menu.value := 'Cobran�a'
else if Query1opcao_menu_princ.value = '3' then
  Query1menu.value := 'Recebimento'
else if Query1opcao_menu_princ.value = '4' then
  Query1menu.value := 'Consultas'
else if Query1opcao_menu_princ.value = '5' then
  Query1menu.value := 'Ferramentas'
else if Query1opcao_menu_princ.value = '6' then
  Query1menu.value := 'Admin';



end;

procedure Tfrm_permissoes.btn_copiarClick(Sender: TObject);
begin
  inherited;

  frotinas.Qry_Livre.close;
  frotinas.Qry_Livre.CommandText := 'select * from permissoes where 1=2';
  frotinas.Qry_Livre.open;

  Query1.First;
  while not Query1.eof do
  begin

    frotinas.Qry_Livre.append;
    frotinas.Qry_Livre.fieldByName('pk_permissao').value := frotinas.Sequencial('permissoes');
    frotinas.Qry_Livre.fieldByName('pk_grupo').value := lk_grupousuarios2.KeyValue;
    frotinas.Qry_Livre.fieldByName('pk_janela').value := Query1pk_janela.value;
    frotinas.Qry_Livre.fieldByName('pk_palavra').value := Query1pk_palavra.Value;
    frotinas.Qry_Livre.fieldByName('valor').value := Query1valor.Value;
    frotinas.Qry_Livre.post;
    Query1.next;
  end;



end;

procedure Tfrm_permissoes.SB_ExcluirClick(Sender: TObject);
begin
  //inherited;

   frotinas.Qry_Livre.close;
   frotinas.Qry_Livre.CommandText := 'select * from permissoes where pk_permissao='+Query1pk_permissao.asstring;
   frotinas.Qry_Livre.open;

   frotinas.Qry_Livre.delete;

   Query1.close;
   Query1.open;




end;

end.
