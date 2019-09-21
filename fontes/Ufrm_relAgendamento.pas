unit Ufrm_relAgendamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, RxLookup, DB, ADODB, Buttons,
  Gauges, Grids, DBGrids, ExcelExport, jpeg;

type
  Tfrm_RelAgendamento = class(TForm)
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
    tb_Ocorrencias: TADOTable;
    tb_Ocorrenciasnome: TStringField;
    tb_Ocorrenciaspk_ocorr: TIntegerField;
    tb_Ocorrenciastipo: TStringField;
    qry_reltag_1: TStringField;
    qry_reltag_2: TStringField;
    qry_reltag_3: TStringField;
    qry_reltag_4: TStringField;
    qry_reltag_5: TStringField;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label48: TLabel;
    edt_fx1: TEdit;
    edt_fx2: TEdit;
    edt_atraso1: TDateEdit;
    edt_atraso2: TDateEdit;
    Image1: TImage;
    Label14: TLabel;
    tb_clientes: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    function pegaNomeMotivo(motivo:integer):string;
    function pegaTipoMotivo(motivo:integer):string;
    function preparaImpressao() :integer;
    procedure sbt_excelClick(Sender: TObject);
    procedure edt_fx1Exit(Sender: TObject);
    procedure edt_fx2Exit(Sender: TObject);
    procedure cb_cobradorKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_RelAgendamento: Tfrm_RelAgendamento;

implementation

uses udm, urotinas, Uqr_agendamentos;

{$R *.dfm}

procedure Tfrm_RelAgendamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure Tfrm_RelAgendamento.SpeedButton2Click(Sender: TObject);
begin
close;

end;

function Tfrm_RelAgendamento.pegaTipoMotivo(motivo:integer):string;
begin

if tb_Ocorrencias.Locate('pk_ocorr',motivo,[]) then
begin
  if tb_Ocorrenciastipo.value = 'A' then
    result := 'Ativo'
  else
    result := 'Inativo';
end
else
  result := 'Ativo';
end;

function Tfrm_RelAgendamento.pegaNomeMotivo(motivo:integer):string;
begin
if tb_Ocorrencias.Locate('pk_ocorr',motivo,[]) then
  result := tb_Ocorrenciasnome.value
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

procedure Tfrm_RelAgendamento.btn_imprimirClick(Sender: TObject);
var job:integer;
begin

  try
    job:=preparaImpressao();
    if job >0 then qr_agendamentos.preview;
  finally
    qr_agendamentos.destroy;
  end;
  lb_mens.Visible := false;

end;

function Tfrm_RelAgendamento.preparaImpressao():integer;
var comando,select,from,join,where,group,order:string;
var tprinc, tjuros, tmulta, tdescprinc,tdescjuros,tdescmulta,thonor, tprotesto,tretenc, trepasse:real;
var conta,job:integer;
var total:integer;
var gtotPrincipal,itotPrincipal,atotPrincipal : real;
var aqtdTitulos, aqtdDevedores , iqtdTitulos, iqtdDevedores : integer;
begin
  Application.CreateForm(Tqr_agendamentos, qr_agendamentos);

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


  lb_mens.caption := 'Buscando dados no servidor...';
  lb_mens.Visible := true;

  //
  // busca titulos dos devedores selecionados, totalizando qtd e total titulos
  //

  {
  select d.pk_devedor, d.nome, d.agendado_data, d.agendado_hora, u2.nome as nomcobrador2,
u.nome as nomeCobrador,d.agendado_tipo, d.motivo_dialogo , c.nome as nomecliente
from devedores d  inner join
clientes c on (c.pk_cliente = d.pk_cliente)
left join usuarios u on (d.pk_cobrador = u.nu_usu)
left join usuarios u2 on (d.agendado_cobrador=u.nu_usu)
where 1=2

  }

  select := 'select d.cgc_cpf,d.pk_devedor, d.nome, d.agendado_data, d.agendado_hora, d.agendado_tipo, d.motivo_dialogo, c.nome as nomecliente, d.pk_cobrador, d.agendado_cobrador';
  from   := ' from devedores d  inner join clientes c on (c.pk_cliente = d.pk_cliente)  ';
  where  := ' where data_baixa is null and agendado_data is not null and agendado_hora is not null and agendado_hora <> '''' ';

  if (DateToStr(edt_atraso1.Date) <> '30/12/1899') or ( DateToStr(edt_atraso2.Date) <> '30/12/1899' ) then
  begin

  if (DateToStr(edt_atraso1.Date) <> '30/12/1899') then
  begin
       where  := where + '  and agendado_data >='''+FormatDateTime(frotinas.formato_data_banco(),edt_atraso1.Date)+'''';
    end;

    if DateToStr(edt_atraso2.Date) <> '30/12/1899' then
    begin
       where  := where + ' and agendado_data <='''+FormatDateTime(frotinas.formato_data_banco(),edt_atraso2.Date)+'''';
    end;

  end;

  if cb_cobrador.KeyValue >0 then
    where := where + ' and  ( pk_cobrador= '+inttostr(cb_cobrador.KeyValue)+' or agendado_cobrador= '+inttostr(cb_cobrador.KeyValue)+') ';

  where := where+ ' and exists ( select (1) from titulos t where t.pk_devedor = d.pk_devedor and (t.motivo_baixa is null or t.motivo_baixa='''') ) ';


  //join := ' left join usuarios u on (d.pk_cobrador = u.nu_usu) ';
  //join := join + ' left join usuarios u2 on (d.agendado_cobrador=u.nu_usu) ';



  lb_mens.caption := 'Pesquisando informações...';

  qr_agendamentos.ADOQuery1.close;            //
  qr_agendamentos.ADOQuery1.sql.Text := select+from+join+where+group;
  qr_agendamentos.ADOQuery1.open;

  if qr_agendamentos.ADOQuery1.recordCount = 0 then
  begin
    showmessage('Não foi localizado nenhum registro');
    //qr_agendamentos.Destroy;
    exit
  end;

  //qr_agendamentos.qlb_cliente.caption  := lk_cliente.Text;


  aqtdTitulos := 0;
  aqtdDevedores := 0;
  atotPrincipal := 0;

  iqtdTitulos := 0;
  iqtdDevedores := 0;
  itotPrincipal := 0;

  if cb_cobrador.Text <> '' then
    qr_agendamentos.qlb_cobrador.caption := 'Cobrador: '+cb_cobrador.Text;

  if (DateToStr(edt_atraso1.Date) <> '30/12/1899') or ( DateToStr(edt_atraso2.Date) <> '30/12/1899' ) then
    qr_agendamentos.qrlb_periodo.caption := 'De '+edt_atraso1.text+' a '+edt_atraso2.text;

  if lk_cliente.KeyValue >0 then
    qr_agendamentos.qlb_cliente.caption := tb_clientes.fieldByName('nome').value;

  if cb_cobrador.KeyValue >0 then
    qr_agendamentos.qlb_cobrador.caption := 'Cobrador: '+usuarios.fieldByName('nome').value
  else
    qr_agendamentos.qlb_cobrador.caption := '';

  //qr_demonst.qr_repasse.caption := 'Valor líquido a ser repassado a '+tb_clientes.fieldByName('nome').value;
  //qr_demonst.totrepasse.caption := FormatFloat('#,0.00',trepasse);

  result := job;
end;

procedure Tfrm_RelAgendamento.sbt_excelClick(Sender: TObject);
var job:integer;
begin
  job:=preparaImpressao();


  //ExcelExport1.Dataset := qr_demonst.ADOQuery1;

  //qr_demonst.destroy;
  lb_mens.Visible := false;

  //qr_demonst.close;


  ADOCommand1.Prepared := true;
  ADOCommand1.CommandText := 'delete from jobs where job='+intToStr(job);
  ADOCommand1.Execute;

end;

procedure Tfrm_RelAgendamento.edt_fx1Exit(Sender: TObject);
var hj:TDatetime;
begin

if edt_fx1.Text <> '' then
begin
  hj:= Date;
  edt_atraso1.Date := hj - StrToInt(edt_fx1.Text);
end
else
  edt_atraso1.text := '';

end;

procedure Tfrm_RelAgendamento.edt_fx2Exit(Sender: TObject);
var hj:TDatetime;
begin

if edt_fx2.Text <> '' then
begin
  hj:= Date;
  edt_atraso2.Date := hj - StrToInt(edt_fx2.Text);
end
else
  edt_atraso2.text := '';

end;

procedure Tfrm_RelAgendamento.cb_cobradorKeyPress(Sender: TObject;
  var Key: Char);
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

procedure Tfrm_RelAgendamento.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrm_RelAgendamento.FormShow(Sender: TObject);
begin


tb_clientes.Open;
tb_Ocorrencias.open;
usuarios.open;

if FRotinas.pk_cliente >0 then
begin
  lk_cliente.Value := IntToStr(FRotinas.pk_cliente);
  lk_cliente.Enabled := false
end;

end;

end.
