unit Ufrm_relDefasagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, RxLookup, DB, ADODB, Buttons,
  Gauges, Grids, DBGrids, RXCtrls, jpeg;

type
  Tfrm_RelDefasagem = class(TForm)
    Panel1: TPanel;
    Dts_cliente: TDataSource;
    DataSource1: TDataSource;
    dts_clientes: TDataSource;
    Panel2: TPanel;
    btn_imprimir: TSpeedButton;
    SpeedButton2: TSpeedButton;
    lb_mens: TLabel;
    usuarios: TADOTable;
    dts_usuarios: TDataSource;
    cb_cobrador: TRxDBLookupCombo;
    Label3: TLabel;
    lk_cliente: TRxDBLookupCombo;
    Label1: TLabel;
    qry_rel: TADODataSet;
    Gauge_atualizando: TGauge;
    qry_aux: TADOQuery;
    qry_reljob: TIntegerField;
    qry_relnome_campo: TStringField;
    qry_relvalor: TBCDField;
    qry_reldescricao: TStringField;
    ADOCommand1: TADOCommand;
    qry_relcategoria: TStringField;
    DataSource2: TDataSource;
    qry_relchave: TIntegerField;
    qry_reltag_1: TStringField;
    qry_reltag_2: TStringField;
    qry_reltag_3: TStringField;
    qry_reltag_4: TStringField;
    qry_reltag_5: TStringField;
    qry_ocorr: TADOQuery;
    qry_ocorrpk_ocorr: TIntegerField;
    qry_ocorrnome: TWideStringField;
    qry_ocorrtipo: TWideStringField;
    GroupBox21: TGroupBox;
    RxCheckList_ocorr: TRxCheckListBox;
    Image1: TImage;
    Label14: TLabel;
    tb_clientes: TADOQuery;
    cb_situacao: TComboBox;
    Label2: TLabel;
    Label4: TLabel;
    edt_dias: TEdit;
    cb_negociacao: TCheckBox;
    Label17: TLabel;
    edt_pasta: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    function pegaNomeMotivo(motivo:integer):string;
    function pegaTipoMotivo(motivo:integer):string;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure rel_analitico;
    procedure rel_sintetico;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_RelDefasagem: Tfrm_RelDefasagem;

implementation

uses udm, Uqr_pcontas,urotinas, Uqr_demonst, Uqr_defasagem,
  Uqr_defas_sintetico,QRExport  ;

{$R *.dfm}

procedure Tfrm_RelDefasagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure Tfrm_RelDefasagem.FormShow(Sender: TObject);
begin
tb_clientes.Open;
qry_ocorr.open;
usuarios.open;

RxCheckList_ocorr.Items.Clear;
RxCheckList_ocorr.Items.add('Não acionado');

while not qry_ocorr.eof do
begin
  RxCheckList_ocorr.Items.Add(qry_ocorr.fieldbyName('nome').value);
  qry_ocorr.next;
end;


end;

procedure Tfrm_RelDefasagem.SpeedButton2Click(Sender: TObject);
begin
close;

end;

function Tfrm_RelDefasagem.pegaTipoMotivo(motivo:integer):string;
begin

if qry_ocorr.Locate('pk_ocorr',motivo,[]) then
begin
  if qry_ocorrtipo.value = 'A' then
    result := 'Ativo'
  else
    result := 'Incobrável';
end
else
  result := 'Ativo';
end;

function Tfrm_RelDefasagem.pegaNomeMotivo(motivo:integer):string;
begin
if qry_ocorr.Locate('pk_ocorr',motivo,[]) then
  result := qry_ocorrnome.value
else
  result := 'Não acionado';

{
if motivo = 0 then
  result := 'Falou com o Cliente'
else if motivo = 1 then
  result := 'Deixou Recado'
else if motivo = 2 then
  result := 'Não Atende'
else if motivo = 3 then
  result := 'Número Errado'
else if motivo = 4 then
  result := 'Não Localizado'
else if motivo = 5 then
  result := 'Marcou Pagamento'
else if motivo = 6 then
  result := 'Falecido'
else if motivo = 9 then
  result := 'Outros';
}

end;

procedure Tfrm_RelDefasagem.rel_sintetico;
var comando,select,from,join,where,group,order:string;
var tprinc, tjuros, tmulta, tdescprinc,tdescjuros,tdescmulta,thonor, tprotesto,tretenc, trepasse:real;
var conta,job:integer;
var total:integer;
var gtotPrincipal,itotPrincipal,atotPrincipal : real;
var aqtdTitulos, aqtdDevedores , iqtdTitulos, iqtdDevedores : integer;
var seq:integer;
var sql,motivo,joinWere : string;
begin
  tprinc := 0.00;
  tjuros := 0.00;
  tmulta := 0.00;
  tdescprinc := 0.00;
  tdescjuros := 0.00;
  tdescmulta := 0.00;
  thonor     := 0.00;
  tprotesto  := 0.00;
  tretenc    := 0.00;
  trepasse   := 0.00;

  select := '';
  from   := '';
  join   := '';
  where  := '';

  if (cb_cobrador.KeyValue = null) and (lk_cliente.KeyValue = null ) then
  begin
    showmessage('Informe um Cobrador ou um cliente.');
    exit;
  end;

  lb_mens.caption := 'Buscando dados no servidor...';
  lb_mens.Visible := true;

  {
  select max( d.data_dialogo) as data_dialogo , max(d.agendado_data) as agendado_data, o.nome as nome_motivo, u.nome as nome_cobrador, cast(0 as numeric) as defasagem
from devedores d
inner join clientes c on (c.pk_cliente=d.pk_cliente)
inner join ocorrencias o on ( o.pk_ocorr=d.motivo_dialogo)
inner join usuarios u on (u.nu_usu=d.pk_cobrador)
where  d.pk_cliente = 15 and
( d.motivo_dialogo is null  or  d.motivo_dialogo= 0 or  d.motivo_dialogo= 1 or  d.motivo_dialogo= 2 or  d.motivo_dialogo= 3 )
and exists(select 1 from titulos t4 where t4.pk_devedor=d.pk_devedor and (t4.motivo_baixa is null or t4.motivo_baixa=''''))
group  by o.nome, u.nome
  }


  try
    Application.CreateForm(Tqr_defas_sintetico, qr_defas_sintetico);

    lb_mens.caption := 'Pesquisando informações...';

    select := ' select min( d.data_dialogo) as data_dialogo, max(d.agendado_data) as agendado_data,d.motivo_dialogo, d.agendado_data, o.nome as nome_motivo, u.nome as nome_cobrador ';

    select := select + ', count(d.pk_devedor) as qtdevedores ';

    from   := ' from devedores d ';

    sql := '';
    if lk_cliente.KeyValue >0 then
      sql := ' d.pk_cliente = '+intToStr(lk_cliente.KeyValue);

    if cb_cobrador.KeyValue >0 then
    begin
      if sql<>'' then
        sql := sql + ' and ';
      sql := sql + ' d.pk_cobrador = '+intToStr(cb_cobrador.KeyValue);
    end;

    if sql<>'' then
      where := ' where '+sql;

    join   := join + ' inner join clientes c on (c.pk_cliente=d.pk_cliente) ';
    join   := join + ' inner join ocorrencias o on ( o.pk_ocorr=d.motivo_dialogo) ';
    join   := join + ' inner join usuarios u on (u.nu_usu=d.pk_cobrador) ';

    sql := '';
    if lk_cliente.KeyValue >0 then
      sql := ' d.pk_cliente = '+intToStr(lk_cliente.KeyValue);

    if cb_cobrador.KeyValue >0 then
    begin
      if sql<>'' then
        sql := sql + ' and ';
      sql := sql + ' d.pk_cobrador = '+intToStr(cb_cobrador.KeyValue);
    end;

    if sql<>'' then
      where := ' where '+sql;

    sql := '';
    seq := 0;
    while seq<RxCheckList_ocorr.Items.Count do
    begin

       if RxCheckList_ocorr.State[seq]  = cbChecked then
       begin
          motivo := RxCheckList_ocorr.items[seq];
          if qry_ocorr.Locate('nome',motivo,[]) then
          begin
            if sql<>'' then
              sql := sql + ' or ';
            sql := sql+' d.motivo_dialogo= '+qry_ocorr.fieldByName('pk_ocorr').asstring;
          end
          else  // Não acionado
          begin
            if sql <>'' then
              sql := sql + ' or ';
            sql := sql +' d.motivo_dialogo is null ';
          end;

       end;

       inc(seq);
    end;

    if sql<>'' then
      where := where+'and ('+sql+' ) ';


    group  := ' group  by o.nome, u.nome , d.motivo_dialogo,d.agendado_data';
    order  := ' order by o.nome ';

    qr_defas_sintetico.hoje := date;

    where := where + ' and exists(select 1 from titulos t4 where t4.pk_devedor=d.pk_devedor and t4.motivo_baixa is null)';
    where := where + ' and d.data_dialogo = (select min(d2.data_dialogo) from devedores d2 where d2.motivo_dialogo = d.motivo_dialogo and d2.pk_cliente=d.pk_cliente and d2.pk_cobrador=d.pk_cobrador) '    ;


    qr_defas_sintetico.ADOQuery1.close;
    qr_defas_sintetico.ADOQuery1.sql.Text := select+from+join+where+group+order;
    qr_defas_sintetico.ADOQuery1.open;

    if qr_defas_sintetico.ADOQuery1.recordCount = 0 then
    begin
      showmessage('Não foi localizado nenhum registro');
    end
    else
    begin

      qr_defas_sintetico.qlb_cobrador.caption  := 'Cobrador: '+cb_cobrador.Text;

      qr_defas_sintetico.qrlb_cliente.caption := 'Cliente: '+lk_cliente.text;

      if cb_cobrador.KeyValue >0 then
        qr_defas_sintetico.qlb_cobrador.caption := cb_cobrador.text;
      if cb_cobrador.Text <> '' then
        qr_defas_sintetico.qlb_cobrador.caption := cb_cobrador.Text;

      qr_defas_sintetico.diasMaxdefasagem := ValInt(edt_dias.text);

      qr_defas_sintetico.ExportToFilter(TQRXLSFilter.Create(  ExtractFilePath(ParamStr(0))+'\\defasagem.xls'));
      qr_defas_sintetico.preview;
    end;

  finally
    qr_defas_sintetico.destroy;
  end;



end;

procedure Tfrm_RelDefasagem.rel_analitico;
var comando,select,from,join,where,group,order:string;
var tprinc, tjuros, tmulta, tdescprinc,tdescjuros,tdescmulta,thonor, tprotesto,tretenc, trepasse:real;
var conta,job:integer;
var total:integer;
var gtotPrincipal,itotPrincipal,atotPrincipal : real;
var aqtdTitulos, aqtdDevedores , iqtdTitulos, iqtdDevedores : integer;
var seq:integer;
var sql,motivo,joinWere : string;

begin
  tprinc := 0.00;
  tjuros := 0.00;
  tmulta := 0.00;
  tdescprinc := 0.00;
  tdescjuros := 0.00;
  tdescmulta := 0.00;
  thonor     := 0.00;
  tprotesto  := 0.00;
  tretenc    := 0.00;
  trepasse   := 0.00;

  select := '';
  from   := '';
  join   := '';
  where  := '';

  if (cb_cobrador.KeyValue = null) and (lk_cliente.KeyValue = null ) then
  begin
    showmessage('Informe um Cobrador ou um cliente.');
    exit;
  end;

  lb_mens.caption := 'Buscando dados no servidor...';
  lb_mens.Visible := true;

  try
    Application.CreateForm(Tqr_defasagem, qr_defasagem);

    lb_mens.caption := 'Pesquisando informações...';

    select := ' select d.pk_devedor, d.pk_cliente, d.cgc_cpf, d.nome, d.motivo_dialogo, d.data_dialogo, d.agendado_data, d.pk_cobrador ,  c.nome as nome_cliente, o.nome as nome_motivo, u.nome as nome_cobrador, ';

    select := select + ' (select min(t.vencimento) from titulos t where t.pk_devedor=d.pk_devedor) as maiorvenc, cast(0 as integer) as defasagem';

    select := select + ', ( select min(e.data) as data from eventos e where e.pk_devedor=d.pk_devedor and e.pk_cliente=d.pk_cliente)   as prim_dialogo ';

    from   := ' from devedores d ';

    sql := '';
    if lk_cliente.KeyValue >0 then
      sql := ' d.pk_cliente = '+intToStr(lk_cliente.KeyValue);

    if cb_cobrador.KeyValue >0 then
    begin
      if sql<>'' then
        sql := sql + ' and ';
      sql := sql + ' d.pk_cobrador = '+intToStr(cb_cobrador.KeyValue);
    end;

    if sql<>'' then
      where := ' where '+sql;

    join   := join + ' inner join clientes c on (c.pk_cliente=d.pk_cliente) ';
    join   := join + ' inner join ocorrencias o on ( o.pk_ocorr=d.motivo_dialogo) ';
    join   := join + ' inner join usuarios u on (u.nu_usu=d.pk_cobrador) ';

    sql := '';
    if lk_cliente.KeyValue >0 then
      sql := ' d.pk_cliente = '+intToStr(lk_cliente.KeyValue);

    if cb_cobrador.KeyValue >0 then
    begin
      if sql<>'' then
        sql := sql + ' and ';
      sql := sql + ' d.pk_cobrador = '+intToStr(cb_cobrador.KeyValue);
    end;

    if sql<>'' then
      where := ' where '+sql;

    sql := '';
    seq := 0;
    while seq<RxCheckList_ocorr.Items.Count do
    begin

       if RxCheckList_ocorr.State[seq]  = cbChecked then
       begin
          motivo := RxCheckList_ocorr.items[seq];
          if qry_ocorr.Locate('nome',motivo,[]) then
          begin
            if sql<>'' then
              sql := sql + ' or ';
            sql := sql+' d.motivo_dialogo= '+qry_ocorr.fieldByName('pk_ocorr').asstring;
          end
          else  // Não acionado
          begin
            if sql <>'' then
              sql := sql + ' or ';
            sql := sql +' d.motivo_dialogo is null ';
          end;

       end;

       inc(seq);
    end;

    if sql<>'' then
      where := where+'and ('+sql+' ) ';

    if ( cb_negociacao.Checked ) then
    begin
      where := where+' and ( not exists( SELECT 1 FROM baixasparciais b where b.pk_devedor=d.pk_devedor ) AND ';
      where := where+'       not exists( SELECT 1 FROM parcelas_acordo a WHERE a.pk_devedor=d.pk_devedor AND pagamento is null ';
      where := where+'               AND a.vencimento < '''+FormatDateTime(frotinas.formato_data_banco(),Date)+''') ';
      where := where+' )';
    end;


    group  := '';
    order  := ' order by u.nome, d.data_dialogo ';

    qr_defasagem.hoje := date;

    where := where + ' and exists(select 1 from titulos t4 where t4.pk_devedor=d.pk_devedor and (t4.motivo_baixa is null or t4.motivo_baixa=''''))';

    qr_defasagem.ADOQuery1.close;
    qr_defasagem.ADOQuery1.sql.Text := select+from+join+where+group+order;
    qr_defasagem.ADOQuery1.open;


    if qr_defasagem.ADOQuery1.recordCount = 0 then
    begin
      showmessage('Não foi localizado nenhum registro');
      //qr_defasagem.Destroy;
    end
    else
    begin

      qr_defasagem.qlb_cobrador.caption  := cb_cobrador.Text;

      qr_defasagem.qrlb_cliente.caption := lk_cliente.text;

      if cb_cobrador.KeyValue >0 then
        qr_defasagem.qlb_cobrador.caption := cb_cobrador.text;
      if cb_cobrador.Text <> '' then
        qr_defasagem.qlb_cobrador.caption := cb_cobrador.Text;

      qr_defasagem.diasMaxdefasagem := ValInt(edt_dias.text);


      urotinas.reportToCsv(edt_pasta.text, 'defasagem.csv' , qr_defasagem.ADOQuery1);

      //qr_defasagem.ExportToFilter(TQRXLSFilter.Create( ExtractFilePath(ParamStr(0))+'\\defasagem.xls'));

      qr_defasagem.preview;
    end;
  finally
    qr_defasagem.destroy;
  end;


end;

procedure Tfrm_RelDefasagem.btn_imprimirClick(Sender: TObject);
var comando,select,from,join,where,group,order:string;
var tprinc, tjuros, tmulta, tdescprinc,tdescjuros,tdescmulta,thonor, tprotesto,tretenc, trepasse:real;
var conta,job:integer;
var total:integer;
var gtotPrincipal,itotPrincipal,atotPrincipal : real;
var aqtdTitulos, aqtdDevedores , iqtdTitulos, iqtdDevedores : integer;
var seq:integer;
var sql,motivo,joinWere : string;
begin

  if cb_situacao.ItemIndex = 1 then
    rel_analitico
  else
    rel_sintetico;

  lb_mens.Visible := false;


end;

procedure Tfrm_RelDefasagem.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
      begin
         key := #0;
         PerForm (cm_dialogKey,vk_tab,0);
      end;
{Trocando Virgula por Ponto}
if Key in [',','.'] then
  Key := DecimalSeparator;

end;

end.
