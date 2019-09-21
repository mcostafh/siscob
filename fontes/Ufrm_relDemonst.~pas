unit Ufrm_relDemonst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, RxLookup, DB, ADODB, Buttons,
  Gauges, Grids, DBGrids, ExcelExport, jpeg, DBTables, MemTable;

type
  Tfrm_RelDemonst = class(TForm)
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
    tb_Ocorrencias: TADOTable;
    tb_Ocorrenciasnome: TStringField;
    tb_Ocorrenciaspk_ocorr: TIntegerField;
    tb_Ocorrenciastipo: TStringField;
    qry_reltag_1: TStringField;
    qry_reltag_2: TStringField;
    qry_reltag_3: TStringField;
    qry_reltag_4: TStringField;
    qry_reltag_5: TStringField;
    Image1: TImage;
    Label14: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    fx1_de: TEdit;
    fx1_ate: TEdit;
    fx2_de: TEdit;
    fx2_ate: TEdit;
    Label7: TLabel;
    fx3_de: TEdit;
    Label9: TLabel;
    fx3_ate: TEdit;
    Label16: TLabel;
    edt_tipo: TEdit;
    tb_titulos: TADOQuery;
    tb_titulosjob: TIntegerField;
    tb_titulosnome_campo: TWideStringField;
    tb_titulosvalor: TBCDField;
    tb_titulosdescricao: TWideStringField;
    tb_titulostipo: TWideStringField;
    tb_titulosmotivo_dialogo: TStringField;
    tb_titulosfx1_qtd_tit: TBCDField;
    tb_titulosfx1_valor: TBCDField;
    tb_titulosfx2_qtd_tit: TBCDField;
    tb_titulosfx2_valor: TBCDField;
    tb_titulosfx3_qtd_tit: TBCDField;
    tb_titulosfx3_valor: TBCDField;
    tb_titulospk_devedor: TIntegerField;
    tb_clientes: TADOQuery;
    cbx_mil: TCheckBox;
    tb_titulosqtd_dev: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    function pegaNomeMotivo(motivo:integer):string;
    function pegaTipoMotivo(motivo:integer):string;
    function preparaImpressaoSP() :integer;
    procedure sbt_excelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_RelDemonst: Tfrm_RelDemonst;

implementation

uses udm, Uqr_pcontas,urotinas, Uqr_demonst;

{$R *.dfm}

procedure Tfrm_RelDemonst.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure Tfrm_RelDemonst.FormShow(Sender: TObject);
begin
tb_clientes.Open;
tb_Ocorrencias.open;
usuarios.open;
end;

procedure Tfrm_RelDemonst.SpeedButton2Click(Sender: TObject);
begin
close;

end;

function Tfrm_RelDemonst.pegaTipoMotivo(motivo:integer):string;
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

function Tfrm_RelDemonst.pegaNomeMotivo(motivo:integer):string;
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

procedure Tfrm_RelDemonst.btn_imprimirClick(Sender: TObject);
var job:integer;
begin

  if lk_cliente.KeyValue = null then
  begin
    showmessage('Informe um cliente.');
    exit;
  end;

  if ( (fx1_de.text = '') or (fx1_ate.text = '') or (fx2_de.text = '') or (fx2_ate.text = '') or (fx3_de.text = '') or (fx3_ate.text = '') ) then
  begin
    showmessage('Informe as faixas de atraso.');
    exit;
  end;


  job:=preparaImpressaoSP();

  lb_mens.Visible := false;


end;

function Tfrm_RelDemonst.preparaImpressaoSP():integer;
var tipoMotivo,comando,select,from,join,where,group,order:string;
var tprinc, tjuros, tmulta, tdescprinc,tdescjuros,tdescmulta,thonor, tprotesto,tretenc, trepasse:real;
var conta,job, job2:integer;
var total,faixa:integer;
var gtotPrincipal,itotPrincipal,atotPrincipal : real;
var gtotPrincipal2,itotPrincipal2,atotPrincipal2 : real;
var gtotPrincipal3,itotPrincipal3,atotPrincipal3 : real;
var aqtdTitulos, aqtdDevedores , iqtdTitulos, iqtdDevedores : integer;
var aqtdTitulos2, aqtdDevedores2 , iqtdTitulos2, iqtdDevedores2 : integer;
var aqtdTitulos3, aqtdDevedores3 , iqtdTitulos3, iqtdDevedores3 : integer;
var dt1, dt2 ,hj: TDatetime;
var motivo : integer;
var nmocorr:string;
var fx1_dt_ini, fx1_dt_ate, fx2_dt_ini, fx2_dt_ate, fx3_dt_ini, fx3_dt_ate:Tdatetime;
var valor : real;
begin

  hj := date;

  fx3_dt_ini := hj - strToInt(fx3_de.text);
  fx3_dt_ate := hj - strToInt(fx3_ate.text);

  fx2_dt_ini := hj - strToInt(fx2_de.text);
  fx2_dt_ate := hj - strToInt(fx2_ate.text);

  fx1_dt_ini := hj - strToInt(fx1_de.text);
  fx1_dt_ate := hj - strToInt(fx1_ate.text);

  dt1 := hj - strToInt(fx3_ate.text);
  dt2 := hj - strToInt(fx1_de.text);

  where := where + '  and t.vencimento >='''+FormatDateTime(frotinas.formato_data_banco(),dt1)+'''';
  where := where + ' and t.vencimento <='''+FormatDateTime(frotinas.formato_data_banco(), dt2)+'''';


  if cb_cobrador.KeyValue >0 then
    where := where + ' and exists( select 1 from devedores d where d.pk_devedor = t.pk_devedor and d.pk_cobrador= '+inttostr(cb_cobrador.KeyValue)+') ';


  if edt_tipo.text <> '' then
     where := where + ' and t.tipo_titulo = '''+edt_tipo.text+'''';

  lb_mens.caption := 'Buscando dados no servidor...';
  lb_mens.Visible := true;


  //
  // Busca dados para o relatório
  //

  Application.CreateForm(Tqr_demonst, qr_demonst);

  job2 := frotinas.Sequencial('jobs');

  qr_demonst.sp_calculaDemonst.Parameters.ParamByName('@cliente').Value := lk_cliente.KeyValue;

  if cb_cobrador.KeyValue >0 then
    qr_demonst.sp_calculaDemonst.Parameters.ParamByName('@cobrador').Value := cb_cobrador.KeyValue;

  if edt_tipo.Text <> '' then
    qr_demonst.sp_calculaDemonst.Parameters.ParamByName('@tipo').Value := edt_tipo.Text;

  qr_demonst.sp_calculaDemonst.Parameters.ParamByName('@fx1_de').Value := fx1_de.Text;
  qr_demonst.sp_calculaDemonst.Parameters.ParamByName('@fx1_ate').Value := fx1_ate.Text;
  qr_demonst.sp_calculaDemonst.Parameters.ParamByName('@fx2_de').Value := fx2_de.Text;
  qr_demonst.sp_calculaDemonst.Parameters.ParamByName('@fx2_ate').Value := fx2_ate.Text;
  qr_demonst.sp_calculaDemonst.Parameters.ParamByName('@fx3_de').Value := fx3_de.Text;
  qr_demonst.sp_calculaDemonst.Parameters.ParamByName('@fx3_ate').Value := fx3_ate.Text;

  qr_demonst.sp_calculaDemonst.Prepared;
  qr_demonst.sp_calculaDemonst.Open;


  if qr_demonst.sp_calculaDemonst.RecordCount=0 then
  begin
      showmessage('Não foi localizado nenhum registro');
    exit
  end;


  qr_demonst.tb_rel.close;
  qr_demonst.tb_rel.Parameters.ParamByName('job').value := job2;
  qr_demonst.tb_rel.open;

  Gauge_atualizando.MinValue := 0;
  Gauge_atualizando.MaxValue := qr_demonst.sp_calculaDemonst.RecordCount;
  Gauge_atualizando.Visible := true;

  qr_demonst.sp_calculaDemonst.first;
  while not qr_demonst.sp_calculaDemonst.eof do
  begin
    Gauge_atualizando.AddProgress(1);

    if not qr_demonst.tb_rel.Locate('motivo_dialogo', qr_demonst.sp_calculaDemonstmotivo_dialogo.value , []) then
    begin

      nmocorr:= 'Não acionado';
      if qr_demonst.sp_calculaDemonstmotivo_dialogo.asstring <> '' then
      begin
        tb_Ocorrencias.Locate('pk_ocorr',qr_demonst.sp_calculaDemonstmotivo_dialogo.asstring, []);
        nmocorr := tb_Ocorrenciasnome.asstring;
      end;

      qr_demonst.tb_rel.append;
      qr_demonst.tb_reljob.value := job2;
      qr_demonst.tb_reltipo.value := qr_demonst.sp_calculaDemonsttipo.Value;
      qr_demonst.tb_relmotivo_dialogo.value := qr_demonst.sp_calculaDemonstmotivo_dialogo.asString;
      qr_demonst.tb_reldescricao.value := nmocorr;
      qr_demonst.tb_rel.post;

      qr_demonst.tb_rel.edit;
      qr_demonst.tb_relqtd_dev.value     := qr_demonst.tb_relqtd_dev.asinteger + qr_demonst.sp_calculaDemonstqtd_dev.asinteger;
      qr_demonst.tb_relvalor_total.value := qr_demonst.tb_relvalor_total.asFloat + qr_demonst.sp_calculaDemonstfx1_valor.asFloat +
                                            qr_demonst.sp_calculaDemonstfx2_valor.asFloat + qr_demonst.sp_calculaDemonstfx3_valor.asFloat;

      qr_demonst.tb_relfx1_qtd_tit.value := qr_demonst.tb_relfx1_qtd_tit.asinteger + qr_demonst.sp_calculaDemonstfx1_qtd_tit.asinteger;
      qr_demonst.tb_relfx1_valor.value   := qr_demonst.tb_relfx1_valor.asFloat   + qr_demonst.sp_calculaDemonstfx1_valor.asFloat;

      qr_demonst.tb_relfx2_qtd_tit.value := qr_demonst.tb_relfx2_qtd_tit.asinteger + qr_demonst.sp_calculaDemonstfx2_qtd_tit.asinteger;
      qr_demonst.tb_relfx2_valor.value   := qr_demonst.tb_relfx2_valor.asFloat   + qr_demonst.sp_calculaDemonstfx2_valor.asFloat;


      qr_demonst.tb_relfx3_qtd_tit.value := qr_demonst.tb_relfx3_qtd_tit.asinteger + qr_demonst.sp_calculaDemonstfx3_qtd_tit.asinteger;
      qr_demonst.tb_relfx3_valor.value   := qr_demonst.tb_relfx3_valor.asFloat   + qr_demonst.sp_calculaDemonstfx3_valor.asFloat;



    end;

    qr_demonst.tb_rel.Post;

    qr_demonst.sp_calculaDemonst.Next;
  end;

  qr_demonst.sp_calculaDemonst.Destroy;

  if qr_demonst.tb_rel.recordCount = 0 then
  begin
    showmessage('Não foi localizado nenhum registro');
    //qr_demonst.Destroy;
    exit
  end;

  qr_demonst.qlb_cliente.caption  := lk_cliente.Text;

  if cb_cobrador.KeyValue >0 then
    qr_demonst.qlb_cobrador.caption := cb_cobrador.text;


  aqtdTitulos := 0;
  aqtdDevedores := 0;
  atotPrincipal := 0;

  iqtdTitulos := 0;
  iqtdDevedores := 0;
  itotPrincipal := 0;

  gtotPrincipal:=0;
  //avalorTotal := 0;

  aqtdTitulos2 := 0;
  atotPrincipal2 := 0;

  iqtdTitulos2 := 0;
  itotPrincipal2 := 0;

  aqtdTitulos3 := 0;
  atotPrincipal3 := 0;

  iqtdTitulos3 := 0;
  itotPrincipal3 := 0;

  qr_demonst.sinatValorTotal :=0;
  qr_demonst.sativoValorTotal :=0;
  qr_demonst.gValorTotal :=0;

  qr_demonst.siqtdDevedores :=0;
  qr_demonst.siQtdTitulos := 0;
  qr_demonst.siValorTitulos:=0;

  qr_demonst.siQtdTitulos2:=0;
  qr_demonst.siValorTitulos2:=0;

  qr_demonst.siQtdTitulos3:=0;
  qr_demonst.siValorTitulos3:=0;

  qr_demonst.saqtdDevedores :=0;
  qr_demonst.saQtdTitulos := 0;
  qr_demonst.saValorTitulos:=0;

  qr_demonst.saQtdTitulos2:=0;
  qr_demonst.saValorTitulos2:=0;

  qr_demonst.saQtdTitulos3:=0;
  qr_demonst.saValorTitulos3:=0;

  Gauge_atualizando.MinValue := 0;
  Gauge_atualizando.MaxValue := qr_demonst.tb_rel.recordCount;
  Gauge_atualizando.Visible := true;
  lb_mens.caption := 'Calculando totais';

  qr_demonst.tb_rel.first;
  while not qr_demonst.tb_rel.eof do
  begin
    Gauge_atualizando.AddProgress(1);

    gtotPrincipal:= gtotPrincipal+ qr_demonst.tb_relfx1_valor.asfloat+qr_demonst.tb_relfx2_valor.asfloat+qr_demonst.tb_relfx3_valor.asfloat;


    if qr_demonst.tb_reltipo.value = 'Inativo' then
    begin

      iqtdDevedores := iqtdDevedores + qr_demonst.tb_relqtd_dev.asInteger;

      iqtdTitulos   := iqtdTitulos   + qr_demonst.tb_relfx1_qtd_tit.asInteger;
      itotPrincipal := itotPrincipal + qr_demonst.tb_relfx1_valor.asfloat;

      iqtdTitulos2   := iqtdTitulos2   + qr_demonst.tb_relfx2_qtd_tit.asInteger;;
      itotPrincipal2 := itotPrincipal2 + qr_demonst.tb_relfx2_valor.asfloat;

      iqtdTitulos3   := iqtdTitulos3   + qr_demonst.tb_relfx3_qtd_tit.asInteger;
      itotPrincipal3 := itotPrincipal3 + qr_demonst.tb_relfx3_valor.asfloat;

      qr_demonst.siqtdDevedores := qr_demonst.siqtdDevedores + qr_demonst.tb_relqtd_dev.asInteger;

      qr_demonst.siQtdTitulos   := qr_demonst.siQtdTitulos   + qr_demonst.tb_relfx1_qtd_tit.asInteger;
      qr_demonst.siValorTitulos := qr_demonst.siValorTitulos + qr_demonst.tb_relfx1_valor.asfloat;

      qr_demonst.siQtdTitulos2  :=qr_demonst.siQtdTitulos2   + qr_demonst.tb_relfx2_qtd_tit.asInteger;
      qr_demonst.siValorTitulos2:=qr_demonst.siValorTitulos2 + qr_demonst.tb_relfx2_valor.asfloat;

      qr_demonst.siQtdTitulos3  :=qr_demonst.siQtdTitulos3   + qr_demonst.tb_relfx3_qtd_tit.asInteger;
      qr_demonst.siValorTitulos3:=qr_demonst.siValorTitulos3 + qr_demonst.tb_relfx3_valor.asfloat;

      qr_demonst.sinatValorTotal:= qr_demonst.sinatValorTotal + qr_demonst.tb_relfx1_valor.asfloat+qr_demonst.tb_relfx2_valor.asfloat+qr_demonst.tb_relfx3_valor.asfloat;

    end
    else
    begin

      aqtdDevedores := aqtdDevedores + qr_demonst.tb_relqtd_dev.asInteger;

      aqtdTitulos   := aqtdTitulos   + qr_demonst.tb_relfx1_qtd_tit.asInteger;
      atotPrincipal := atotPrincipal + qr_demonst.tb_relfx1_valor.asFloat;

      aqtdTitulos2   := aqtdTitulos2   + qr_demonst.tb_relfx2_qtd_tit.asInteger;;
      atotPrincipal2 := atotPrincipal2 + qr_demonst.tb_relfx2_valor.asFloat;

      aqtdTitulos3   := aqtdTitulos3   + qr_demonst.tb_relfx3_qtd_tit.asInteger;
      atotPrincipal3 := atotPrincipal3 + qr_demonst.tb_relfx3_valor.asFloat;

      qr_demonst.saqtdDevedores := qr_demonst.tb_relqtd_dev.asInteger + qr_demonst.saqtdDevedores;

      qr_demonst.saQtdTitulos   := qr_demonst.tb_relfx1_qtd_tit.asInteger + qr_demonst.saQtdTitulos;
      qr_demonst.saValorTitulos :=qr_demonst.tb_relfx1_valor.asFloat + qr_demonst.saValorTitulos;

      qr_demonst.saQtdTitulos2  :=qr_demonst.tb_relfx2_qtd_tit.asInteger + qr_demonst.saQtdTitulos2;
      qr_demonst.saValorTitulos2:=qr_demonst.tb_relfx2_valor.asFloat + qr_demonst.saValorTitulos2;

      qr_demonst.saQtdTitulos3  :=qr_demonst.tb_relfx3_qtd_tit.asInteger + qr_demonst.saQtdTitulos3;
      qr_demonst.saValorTitulos3:=qr_demonst.tb_relfx3_valor.asFloat + qr_demonst.saValorTitulos3;

      qr_demonst.sativoValorTotal:= qr_demonst.sativoValorTotal + qr_demonst.tb_relfx1_valor.asfloat+qr_demonst.tb_relfx2_valor.asfloat+qr_demonst.tb_relfx3_valor.asfloat;

    end;


    qr_demonst.tb_rel.next;
  end;

//  qr_demonst.gvalorTotal:=gtotPrincipal;

  //qr_demonst.gvalorTotal:=gtotPrincipal;


  qr_demonst.gQtdDevedores := aqtdDevedores+iqtdDevedores;
  qr_demonst.gQtdTitulos   := aqtdTitulos+iqtdTitulos;
  qr_demonst.gValorTitulos  := atotPrincipal+itotPrincipal;

  qr_demonst.aQtdDevedores := aqtdDevedores;
  qr_demonst.aQtdTitulos   := aqtdTitulos;
  qr_demonst.aValorTitulos  := atotPrincipal;

  qr_demonst.iQtdDevedores := iqtdDevedores;
  qr_demonst.iQtdTitulos   := iqtdTitulos;
  qr_demonst.iValorTitulos  := itotPrincipal;

  qr_demonst.gQtdTitulos2   := aqtdTitulos2+iqtdTitulos2;
  qr_demonst.gValorTitulos2  := atotPrincipal2+itotPrincipal2;

  qr_demonst.aQtdTitulos2   := aqtdTitulos2;
  qr_demonst.aValorTitulos2  := atotPrincipal2;

  qr_demonst.iQtdTitulos2   := iqtdTitulos2;
  qr_demonst.iValorTitulos2  := itotPrincipal2;

  qr_demonst.gQtdTitulos3   := aqtdTitulos3+iqtdTitulos3;
  qr_demonst.gValorTitulos3  := atotPrincipal3+itotPrincipal3;

  qr_demonst.aQtdTitulos3   := aqtdTitulos3;
  qr_demonst.aValorTitulos3  := atotPrincipal3;

  qr_demonst.iQtdTitulos3   := iqtdTitulos3;
  qr_demonst.iValorTitulos3  := itotPrincipal3;


  qr_demonst.qrlb_fx1.caption := fx1_de.Text + ' até '+fx1_ate.Text;
  qr_demonst.qrlb_fx2.caption := fx2_de.Text + ' até '+fx2_ate.Text;

  qr_demonst.qrlb_fx3.caption := fx3_de.Text + ' até '+fx3_ate.Text;


  Gauge_atualizando.MinValue := 0;
  Gauge_atualizando.MaxValue := qr_demonst.tb_rel.recordCount;
  Gauge_atualizando.Visible := true;
  lb_mens.caption := 'Calculando percentuais';

  qr_demonst.tb_rel.first;
  while not qr_demonst.tb_rel.eof do
  begin
    Gauge_atualizando.AddProgress(1);
    qr_demonst.tb_rel.edit;
    if qr_demonst.tb_reltipo.value = 'Inativo' then
    begin
      qr_demonst.tb_relpercDevedores.value := divide(qr_demonst.tb_relpercDevedores.Value , qr_demonst.iqtdDevedores) * 100;
      qr_demonst.tb_relperctitulos.value   := divide(qr_demonst.tb_relperctitulos.value , qr_demonst.iqtdTitulos) * 100;
      qr_demonst.tb_relpercValores.value   := divide(qr_demonst.tb_relpercValores.value , qr_demonst.ivalorTitulos)*100;
    end
    else
    begin
      qr_demonst.tb_relpercDevedores.value := divide(qr_demonst.tb_relpercDevedores.Value , qr_demonst.aqtdDevedores) * 100;
      qr_demonst.tb_relperctitulos.value   := divide(qr_demonst.tb_relperctitulos.value , qr_demonst.aQtdTitulos) * 100;
      qr_demonst.tb_relpercValores.value   := divide(qr_demonst.tb_relpercValores.value , qr_demonst.avalorTitulos)*100;
    end;
    qr_demonst.tb_rel.post;
    qr_demonst.tb_rel.next;
  end;

  qr_demonst.gValorTotal:= gtotPrincipal;
  qr_demonst.qrl_gsaldo.Caption := FormatFloat('##,###,###,##0.00',gtotPrincipal);


  qr_demonst.qrtot_princ.Caption := FormatFloat('##,###,###,##0.00',itotPrincipal + atotPrincipal);
  qr_demonst.qrtot_titulos.Caption := intToStr(iqtdTitulos+aqtdTitulos);
  qr_demonst.qrtot_devedores.Caption := intToStr(iqtdDevedores+aqtdDevedores);

  qr_demonst.qrtot_princ2.Caption := FormatFloat('##,###,###,##0.00',itotPrincipal2 + atotPrincipal2);
  qr_demonst.qrtot_titulos2.Caption := intToStr(iqtdTitulos2+aqtdTitulos2);

  qr_demonst.qrtot_princ3.Caption := FormatFloat('##,###,###,##0.00',itotPrincipal3 + atotPrincipal3);
  qr_demonst.qrtot_titulos3.Caption := intToStr(iqtdTitulos3+aqtdTitulos3);

  if cb_cobrador.Text <> '' then
    qr_demonst.qlb_cobrador.caption := 'Cobrador: '+cb_cobrador.Text;

  //if (DateToStr(edt_atraso1.Date) <> '30/12/1899') or ( DateToStr(edt_atraso2.Date) <> '30/12/1899' ) then
  //  qr_demonst.qrlb_periodo.caption := 'De '+edt_atraso1.text+' a '+edt_atraso2.text;

  //qr_demonst.qr_repasse.caption := 'Valor líquido a ser repassado a '+tb_clientes.fieldByName('nome').value;
  //qr_demonst.totrepasse.caption := FormatFloat('#,0.00',trepasse);

  qr_demonst.tb_rel.close;
  qr_demonst.tb_rel.open;

  qr_demonst.preview;
  qr_demonst.destroy;


  ADOCommand1.Prepared := true;
  ADOCommand1.CommandText := 'delete from jobs where job='+intToStr(job);
  ADOCommand1.Execute;



  result := job;
end;



procedure Tfrm_RelDemonst.sbt_excelClick(Sender: TObject);
var job:integer;
begin
  //job:=preparaImpressao();


  //ExcelExport1.Dataset := qr_demonst.ADOQuery1;
  //ExcelExport1.ExcelVisible := true;
  //ExcelExport1.ExportDataset;
  //ExcelExport1.Disconnect;

  qr_demonst.destroy;
  lb_mens.Visible := false;

  //qr_demonst.close;


  ADOCommand1.Prepared := true;
  ADOCommand1.CommandText := 'delete from jobs where job='+intToStr(job);
  ADOCommand1.Execute;

end;

procedure Tfrm_RelDemonst.FormKeyPress(Sender: TObject; var Key: Char);
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
