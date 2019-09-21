unit Ufrm_relAcordos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, RxLookup, DB, ADODB, Buttons,
  Gauges, Grids, DBGrids, RXCtrls, jpeg;

type
  Tfrm_RelAcordos = class(TForm)
    Panel1: TPanel;
    Dts_cliente: TDataSource;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    tb_clientes: TADOTable;
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
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    dt_inicial: TDateEdit;
    dt_final: TDateEdit;
    GroupBox21: TGroupBox;
    RxCheckList_ocorr: TRxCheckListBox;
    qry_ocorr: TADOQuery;
    qry_ocorrpk_ocorr: TIntegerField;
    qry_ocorrnome: TWideStringField;
    qry_ocorrtipo: TWideStringField;
    Image1: TImage;
    Label14: TLabel;
    tb_cliente: TADOQuery;
    tb_clientepk_cliente: TIntegerField;
    tb_clientenome: TStringField;
    tb_clienteperc_juros_mes: TBCDField;
    tb_clienteperc_multa: TBCDField;
    tb_clientecnpj: TStringField;
    tb_clientelayout_Inteq: TStringField;
    tb_clientebaixaTit_Carga: TStringField;
    tb_clienteTELEFONE: TStringField;
    tb_clienteFAX: TStringField;
    tb_clienteZERO_OITOCENTOS: TStringField;
    tb_clienteRESP_COBRANA: TStringField;
    tb_clientearquivabxparcial: TStringField;
    tb_clientebanco1: TStringField;
    tb_clienteagencia1: TStringField;
    tb_clienteconta1: TStringField;
    tb_clientebanco2: TStringField;
    tb_clienteagencia2: TStringField;
    tb_clienteconta2: TStringField;
    tb_clienteinativado: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    function pegaNomeMotivo(motivo:integer):string;
    function pegaTipoMotivo(motivo:integer):string;
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_RelAcordos: Tfrm_RelAcordos;

implementation

uses udm, urotinas,  Uqr_relAcordos;

{$R *.dfm}

procedure Tfrm_RelAcordos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure Tfrm_RelAcordos.FormShow(Sender: TObject);
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

procedure Tfrm_RelAcordos.SpeedButton2Click(Sender: TObject);
begin
close;

end;

function Tfrm_RelAcordos.pegaTipoMotivo(motivo:integer):string;
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

function Tfrm_RelAcordos.pegaNomeMotivo(motivo:integer):string;
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

procedure Tfrm_RelAcordos.btn_imprimirClick(Sender: TObject);
var comando,select,from,join,where,group,order:string;
var tprinc, tjuros, tmulta, tdescprinc,tdescjuros,tdescmulta,thonor, tprotesto,tretenc, trepasse:real;
var conta,job:integer;
var total:integer;
var gtotPrincipal,itotPrincipal,atotPrincipal : real;
var aqtdTitulos, aqtdDevedores , iqtdTitulos, iqtdDevedores : integer;
var seq:integer;
var sql,motivo,cpf : string;
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

  if lk_cliente.KeyValue = 0 then
  begin
    showmessage('Informe pelo menos uma data inicial para a buscas das informações.');
    exit;
  end;

  if dt_inicial.Date =0 then
  begin
    showmessage('Informe a data inicial');
    exit;
  end;
  if dt_final.Date =0 then
  begin
    showmessage('Informe a data final');
    exit;
  end;

  {
select e.*, d.nome as devedor,d.cgc_cpf, c.nome as nomecliente, o.nome as nomemotivo, u.nome as cobrador
from eventos e
inner join devedores d on (d.pk_devedor=e.pk_devedor)
inner join usuarios u on (u.nu_usu=e.pk_cobrador)
inner join clientes c on (c.pk_cliente=e.pk_cliente)
inner join ocorrencias o on ( o.pk_ocorr=e.motivo)
  }

  try
    Application.CreateForm(Tqr_prevRetornos, qr_prevRetornos);

    lb_mens.caption := 'Pesquisando informações...';

    select := ' select e.*, d.nome as devedor,d.cgc_cpf, c.nome as nomecliente,o.nome as nomemotivo, u.nome as nomecobrador';
    from   := ' from eventos e ';
    join   := ' inner join devedores d on (d.pk_devedor=e.pk_devedor) ';
    join   := join + ' inner join clientes c on (c.pk_cliente=e.pk_cliente) ';
    join   := join + ' inner join usuarios u on (d.pk_cobrador=u.nu_usu) ';
    join   := join + ' inner join ocorrencias o on ( o.pk_ocorr=d.motivo_dialogo) ';

    if (cb_cobrador.KeyValue <> null) then
      where  := ' where e.pk_cobrador='+intToStr(cb_cobrador.KeyValue);

    if dt_inicial.Date >0 then
      where := where + ' and e.agendado_data >= '''+FormatDateTime(frotinas.formato_data_banco(),dt_inicial.Date)+'''';

    if dt_final.Date >0 then
      where := where + ' and e.agendado_data <= '''+FormatDateTime(frotinas.formato_data_banco(),dt_final.Date)+'''';

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

    if motivo = '' then
    begin
      showmessage('Não foi informado nenhuma ocorrência');
      exit;
    end;

    if lk_cliente.KeyValue >0 then
    begin
      where := where+ ' and e.pk_cliente = '+intToStr(lk_cliente.KeyValue);
    end;

    if sql<>'' then
      where := where+' and ('+sql+' ) ';


    group  := '';
    order  := ' order by c.nome, e.agendado_data,e.hora ';

    qr_prevRetornos.ADOQuery1.close;
    qr_prevRetornos.ADOQuery1.sql.Text := select+from+join+where+group+order;
    qr_prevRetornos.ADOQuery1.open;

    if qr_prevRetornos.ADOQuery1.recordCount = 0 then
    begin
      showmessage('Não foi localizado nenhum registro');
      //qr_auditagem.Destroy;
      exit;
    end;


    qr_prevRetornos.qlb_cliente.caption   := lk_cliente.text;
    qr_prevRetornos.qlb_cobrador.caption  := '';

    if cb_cobrador.KeyValue >0 then
      qr_prevRetornos.qlb_cobrador.caption := cb_cobrador.text;
    if cb_cobrador.Text <> '' then
      qr_prevRetornos.qlb_cobrador.caption := 'Cobrador: '+cb_cobrador.Text;

    qr_prevRetornos.qrlb_periodo.caption := 'Período: '+dt_inicial.text+' a '+dt_final.Text;

    qr_prevRetornos.preview;
  finally
    qr_prevRetornos.destroy;
  end;

  lb_mens.Visible := false;


end;

procedure Tfrm_RelAcordos.FormKeyPress(Sender: TObject; var Key: Char);
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
