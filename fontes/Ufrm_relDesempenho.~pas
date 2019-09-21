unit Ufrm_RelDesempenho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, RxLookup, DB, ADODB, Buttons,
  Gauges, Grids, DBGrids, ExcelExport, jpeg;

type
  Tfrm_RelDesempenho = class(TForm)
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
    Label3: TLabel;
    cb_cobrador: TRxDBLookupCombo;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    fx1_de: TEdit;
    Label4: TLabel;
    fx1_ate: TEdit;
    Label5: TLabel;
    fx2_de: TEdit;
    Label6: TLabel;
    fx2_ate: TEdit;
    fx3_de: TEdit;
    Label7: TLabel;
    Label9: TLabel;
    fx3_ate: TEdit;
    Label10: TLabel;
    fx4_de: TEdit;
    Label11: TLabel;
    fx4_ate: TEdit;
    Label12: TLabel;
    fx5_de: TEdit;
    fx5_ate: TEdit;
    Label13: TLabel;
    Image1: TImage;
    Label14: TLabel;
    qry_job1: TADODataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    BCDField1: TBCDField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField2: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    qry_reldec_1: TBCDField;
    qry_reldec_2: TBCDField;
    qry_reldec_3: TBCDField;
    qry_reldec_4: TBCDField;
    qry_reldec_5: TBCDField;
    qry_reldec_6: TBCDField;
    qry_job1dec_1: TBCDField;
    qry_job1dec_2: TBCDField;
    qry_job1dec_3: TBCDField;
    qry_job1dec_4: TBCDField;
    qry_job1dec_5: TBCDField;
    qry_job1dec_6: TBCDField;
    cbx_ativo: TCheckBox;
    Label16: TLabel;
    edt_tipo: TEdit;
    tb_clientes: TADOQuery;
    GroupBox2: TGroupBox;
    edt_atraso1: TDateEdit;
    edt_atraso2: TDateEdit;
    a: TLabel;
    qry_qtdev: TADODataSet;
    qry_bxparciais: TADODataSet;
    qry_baixastotais: TADODataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    function pegaNomeMotivo(motivo:integer):string;
    function pegaTipoMotivo(motivo:integer):string;
    function preparaImpressao() :integer;
    function preparaImpressao2():integer;
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_RelDesempenho: Tfrm_RelDesempenho;

implementation

uses udm, Uqr_pcontas,urotinas, Uqr_desempenho, StrUtils, Math;

{$R *.dfm}

procedure Tfrm_RelDesempenho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure Tfrm_RelDesempenho.FormShow(Sender: TObject);
begin
tb_clientes.Open;
tb_Ocorrencias.open;
usuarios.open;
end;

procedure Tfrm_RelDesempenho.SpeedButton2Click(Sender: TObject);
begin
close;

end;

function Tfrm_RelDesempenho.pegaTipoMotivo(motivo:integer):string;
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

function Tfrm_RelDesempenho.pegaNomeMotivo(motivo:integer):string;
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

procedure Tfrm_RelDesempenho.btn_imprimirClick(Sender: TObject);
var job:integer;
begin

  job:=preparaImpressao2();

  if job>0 then
  begin

    qr_desempenho.tdevedores := 0;
    qr_desempenho.tacionados := 0;
    qr_desempenho.tnaoacionados := 0;
    qr_desempenho.tvaloratraso := 0;
    qr_desempenho.tpago := 0;
    qr_desempenho.tsaldo := 0;


    qry_qtdev.close;
    qry_qtdev.CommandText := 'select dec_2, sum(dec_1) as dec_1, sum(dec_3) as dec_3 from jobs where categoria=''6'' and job='+inttostr(job)+' group by dec_2';
    qry_qtdev.open;

  //  qry_reldec_1 = qtde devedores
  //  qry_reldec_2 = qtde devedores acionados
  //  qry_reldec_4 = valor pago
  //  qry_reldec_3 = valor em aberto
  //  categoria 3 = relatório


    with qr_desempenho do
    begin
      ADOQuery1.First;
      while not ADOQuery1.eof do
      begin

        if qry_qtdev.locate('dec_2', ADOQuery1chave.AsString, []) then
        begin
          ADOQuery1.edit;
          ADOQuery1dec_1.value := qry_qtdev.fieldByName('dec_1').value;   // qtde devedores
          ADOQuery1dec_2.value := qry_qtdev.fieldByName('dec_3').asfloat; // valor titulos
          ADOQuery1.post;

        end;

        tdevedores   := tdevedores + ADOQuery1dec_1.asfloat;
        tacionados   := tacionados + ADOQuery1dec_2.asfloat;
        tnaoacionados:= tnaoacionados + (ADOQuery1dec_1.asfloat - ADOQuery1dec_2.asfloat);
        tvaloratraso := tvaloratraso + ADOQuery1dec_3.asfloat;
        tpago        := tpago + ADOQuery1dec_4.asfloat;
        ADOQuery1.next;

      end;
    end;

    qr_desempenho.preview;
    qr_desempenho.destroy;
  end;

  lb_mens.Visible := false;

  //qr_demonst.close;


  ADOCommand1.Prepared := true;
  ADOCommand1.CommandText := 'delete from jobs where job='+intToStr(job);
  ADOCommand1.Execute;

end;

function Tfrm_RelDesempenho.preparaImpressao2():integer;
var comando,select,from,join,where,group,order,select2,from2,join2,where2,group2,order2:string;
var conta,job:integer;
var total,iaux:integer;
var principal : real;
var aqtdTitulos, aqtdDevedores , iqtdTitulos, iqtdDevedores : integer;
var faixa,devedor, diasAtraso:integer;
var hj,atraso:TdateTime;
var ultFaixa,descr,bx1,bx2:string;
var fx3_dt_ini,fx3_dt_ate,fx2_dt_ini, fx2_dt_ate, fx1_dt_ini, fx1_dt_ate, dt1, dt2:tdatetime;
begin
//

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

  hj := date;

  fx3_dt_ini := hj - strToInt(fx3_de.text);
  fx3_dt_ate := hj - strToInt(fx3_ate.text);

  fx2_dt_ini := hj - strToInt(fx2_de.text);
  fx2_dt_ate := hj - strToInt(fx2_ate.text);

  fx1_dt_ini := hj - strToInt(fx1_de.text);
  fx1_dt_ate := hj - strToInt(fx1_ate.text);

  dt1 := hj - strToInt(fx5_ate.text);
  dt2 := hj - strToInt(fx1_de.text);

  bx1 := FormatDateTime(frotinas.formato_data_banco(), edt_atraso1.date);
  bx2 := FormatDateTime(frotinas.formato_data_banco(), edt_atraso2.date);


  // busca os titulos
  select  := ' select t.*, d.pk_devedor, d.motivo_dialogo ';
  select2 := ' select t.*, d.pk_devedor, d.motivo_dialogo ';

  from   := ' from titulos t ';
  from2  := ' from titulos t ';

  join   := ' inner join devedores d on (d.pk_devedor=t.pk_devedor) ';
  join2  := ' inner join devedores d on (d.pk_devedor=t.pk_devedor) ';

  where  := ' where (t.motivo_baixa is null or t.motivo_baixa='''') and t.vencimento >='''+FormatDateTime(frotinas.formato_data_banco(),dt1)+'''';
  where  := where + ' and t.vencimento <='''+FormatDateTime(frotinas.formato_data_banco(), dt2)+'''';

  where2 := ' where t.motivo_baixa is not null and t.motivo_baixa <> '''' and t.data_baixa >='''+bx1+'''';
  where2 := where2 + ' and t.data_baixa <='''+bx2+'''';


  hj := date;

  fx3_dt_ini := hj - strToInt(fx3_de.text);
  fx3_dt_ate := hj - strToInt(fx3_ate.text);

  fx2_dt_ini := hj - strToInt(fx2_de.text);
  fx2_dt_ate := hj - strToInt(fx2_ate.text);

  fx1_dt_ini := hj - strToInt(fx1_de.text);
  fx1_dt_ate := hj - strToInt(fx5_ate.text);

  dt1 := hj - strToInt(fx3_ate.text);
  dt2 := hj - strToInt(fx1_de.text);


  where  := where +' and d.pk_cliente= '+inttostr(lk_cliente.KeyValue);
  where2 := where2 +' and d.pk_cliente= '+inttostr(lk_cliente.KeyValue);

  if cb_cobrador.KeyValue >0 then
  begin
     where := where + ' and d.pk_cobrador= '+inttostr(cb_cobrador.KeyValue);
     where2:= where2+ ' and d.pk_cobrador= '+inttostr(cb_cobrador.KeyValue);
  end;

  if cbx_ativo.Checked then
  begin
     where  := where + ' and (d.motivo_dialogo is null or exists( select 1 from ocorrencias o where o.pk_ocorr=d.motivo_dialogo and o.tipo=''A'') ) ';
     where2 := where2 + ' and (d.motivo_dialogo is null or exists( select 1 from ocorrencias o where o.pk_ocorr=d.motivo_dialogo and o.tipo=''A'') ) ';
  end;

  if edt_tipo.text <> '' then
  begin
     where  := where + ' and t.tipo_titulo = '''+edt_tipo.text+'''';
     where2 := where2 + ' and t.tipo_titulo = '''+edt_tipo.text+'''';
  end;


  lb_mens.caption := 'Buscando dados no servidor...';
  lb_mens.Visible := true;

  // titulos em Aberto
  frotinas.Qry_Livre.close;
  frotinas.Qry_Livre.CommandText := select+from+join+where+' order by  t.pk_devedor ';
  frotinas.Qry_Livre.open;

  // baixas totais
  qry_baixastotais.Close;
  qry_baixastotais.CommandText := select2+from2+join2+where2+' order by  t.pk_devedor ';
  qry_baixastotais.open;

  // baixas parciais no pediodod
  qry_bxparciais.close;
  qry_bxparciais.CommandText := 'select pk_devedor, sum(b.valor) as valor, '''' as lido from baixasparciais b where b.data>='''+bx1+''' and b.data <= '''+bx2+''' group by pk_devedor';
  qry_bxparciais.open;


  frotinas.Qry_Livre.first;

  job := frotinas.Sequencial('jobs');

  qry_job1.close;
  qry_job1.Parameters.ParamByName('job').value := job;
  qry_job1.Parameters.ParamByName('cat').value := '1';
  //qry_job1.ParamByName('chave').value := qry_aux.fieldByName('pk_devedor').AsInteger;
  qry_job1.open;


  //
  // Busca nome dos motivos e seta qtd de titulos
  //
  Gauge_atualizando.MinValue := 0;
  Gauge_atualizando.MaxValue := 0;

  // calcula pendencia

  devedor := 0;
  while not frotinas.Qry_Livre.eof do
  begin
    Gauge_atualizando.AddProgress(1);
    refresh;

    diasAtraso := 0 ;
    faixa      := 0 ;
    diasAtraso := hj - frotinas.Qry_Livre.fieldByName('vencimento').value;

    if (diasAtraso >= strtoint(fx1_de.text)) and (diasAtraso<= strtoint(fx1_ate.text)) then
      faixa := 1
    else if (diasAtraso >= strtoInt(fx2_de.text)) and (diasAtraso <= strtoInt(fx2_ate.text)) then
      faixa := 2
    else if (diasAtraso >= strtoInt(fx3_de.text)) and (diasAtraso <= strtoint(fx3_ate.text)) then
      faixa := 3
    else if (diasAtraso >= strtoInt(fx4_de.text)) and (diasAtraso <= strtoint(fx4_ate.text)) then
      faixa := 4
    else if (diasAtraso >= strtoint(fx5_de.text)) and (diasAtraso <= strtoint(fx5_ate.text)) then
      faixa := 5
    else
      faixa := 6;

    descr      := '';
    if faixa = 1 then
      descr := fx1_de.text + ' a '+fx1_ate.text
    else if faixa = 2 then
      descr := fx2_de.text + ' a '+fx2_ate.text
    else if faixa = 3 then
      descr := fx3_de.text + ' a '+fx3_ate.text
    else if faixa = 4 then
      descr := fx4_de.text + ' a '+fx4_ate.text
    else if faixa = 5 then
      descr := fx5_de.text + ' a '+fx5_ate.text
    else
      descr := 'apartir';


    qry_rel.close;
    qry_rel.CommandText := 'select * from jobs where job='+intToStr(job)+' and categoria=''3'' and chave='+intToStr(faixa) ;
    qry_rel.open;
    if qry_rel.recordCount = 0 then
    begin
      qry_rel.append;
      qry_relchave.value := faixa;
      //qry_reldescricao.value := pegaNomeMotivo(qry_relchave.value);
      qry_reljob.value := job;
      qry_relcategoria.value := '3';
      qry_reldescricao.value := descr;
      qry_rel.post;
    end;
    qry_rel.edit;

    devedor := frotinas.Qry_Livre.fieldByName('pk_devedor').AsInteger;
    if ( qry_bxparciais.Locate('pk_devedor',inttostr(devedor), []) ) then
    begin
      qry_reldec_4.value := qry_reldec_4.asfloat + qry_bxparciais.fieldByName('valor').asfloat; // principal pago
      qry_bxparciais.edit;
      qry_bxparciais.fieldByName('lido').value := 'S';
      qry_bxparciais.post;
    end;

    // qtde de devedores
    qry_qtdev.close;
    qry_qtdev.CommandText := 'select * from jobs where categoria=''6'' and job='+inttostr(job)+' and chave= '+inttostr(devedor)+' and dec_2='+intToStr(faixa);
    qry_qtdev.open;

    if qry_qtdev.recordCount = 0 then
    begin
      qry_qtdev.append;
      qry_qtdev.fieldByName('job').value := job;
      qry_qtdev.fieldByName('categoria').value := '6';
      qry_qtdev.fieldByName('chave').value := frotinas.Qry_Livre.fieldByName('pk_devedor').value;
      qry_qtdev.fieldByName('dec_1').value := 1; // qtde devedores
      qry_qtdev.fieldByName('dec_2').value := faixa;
      qry_qtdev.post;

    end;

    if frotinas.Qry_Livre.fieldByName('motivo_dialogo').value >0 then
    begin
      qry_qtdev.edit;
      qry_qtdev.fieldByName('dec_3').value := 1; //qry_qtdev.fieldByName('dec_1').asinteger; // qtde acionados
      qry_qtdev.edit;
      //qry_qtdev.fieldByName('dec_2').value := faixa;
      qry_qtdev.post;
    end;

    qry_job1.locate('chave', frotinas.Qry_Livre.fieldByName('pk_devedor').AsInteger,[]);

    qry_reldec_1.value := qry_qtdev.fieldByName('dec_1').asinteger; // qtde devedores
    qry_reldec_3.value := qry_reldec_3.asfloat + frotinas.Qry_Livre.fieldByName('valor_titulo').asfloat; // valor principal

    // posterior
    //if frotinas.Qry_Livre.fieldByName('motivo_baixa').value <> null then
    //  qry_reldec_4.value := qry_reldec_4.asfloat + frotinas.Qry_Livre.fieldByName('valor_pago').asfloat; // principal pago

    qry_rel.post;


    //devedor := frotinas.Qry_Livre.fieldByName('pk_devedor').AsInteger;
    //while (frotinas.Qry_Livre.fieldByName('pk_devedor').AsInteger = devedor) and (not frotinas.Qry_Livre.eof) do
    //begin
      frotinas.Qry_Livre.next;
    //end;

  end;

  //  qry_reldec_1 = qtde devedores
  //  qry_reldec_4 = valor pago
  //  qry_reldec_3 = valor em aberto
  //  categoria 3 = relatório

  qry_bxparciais.first;
  while not qry_bxparciais.eof do
  begin
     if qry_bxparciais.fieldByName('lido').asstring <> 'S'  then
     begin
      qry_rel.edit;
      qry_reldec_4.value := qry_reldec_4.asfloat + qry_bxparciais.fieldByName('valor').asfloat; // principal pago
      qry_reldec_3.value := qry_reldec_3.asfloat + qry_bxparciais.fieldByName('valor').asfloat;  // valor principal
      qry_rel.post;
     end;
     qry_bxparciais.next;
  end;


  //
  // baixas totais
  //
  Gauge_atualizando.MinValue := 0;
  Gauge_atualizando.MaxValue := 0;

  devedor := 0;
  while not qry_baixastotais.eof do
  begin
    Gauge_atualizando.AddProgress(1);
    refresh;

    diasAtraso := 0 ;
    faixa      := 0 ;
    diasAtraso := hj - qry_baixastotais.fieldByName('vencimento').value;

    if (diasAtraso >= strtoint(fx1_de.text)) and (diasAtraso<= strtoint(fx1_ate.text)) then
      faixa := 1
    else if (diasAtraso >= strtoInt(fx2_de.text)) and (diasAtraso <= strtoInt(fx2_ate.text)) then
      faixa := 2
    else if (diasAtraso >= strtoInt(fx3_de.text)) and (diasAtraso <= strtoint(fx3_ate.text)) then
      faixa := 3
    else if (diasAtraso >= strtoInt(fx4_de.text)) and (diasAtraso <= strtoint(fx4_ate.text)) then
      faixa := 4
    else if (diasAtraso >= strtoint(fx5_de.text)) and (diasAtraso <= strtoint(fx5_ate.text)) then
      faixa := 5
    else
      faixa := 6;

    descr      := '';
    if faixa = 1 then
      descr := fx1_de.text + ' a '+fx1_ate.text
    else if faixa = 2 then
      descr := fx2_de.text + ' a '+fx2_ate.text
    else if faixa = 3 then
      descr := fx3_de.text + ' a '+fx3_ate.text
    else if faixa = 4 then
      descr := fx4_de.text + ' a '+fx4_ate.text
    else if faixa = 5 then
      descr := fx5_de.text + ' a '+fx5_ate.text
    else
      descr := 'apartir';


    qry_rel.close;
    qry_rel.CommandText := 'select * from jobs where job='+intToStr(job)+' and categoria=''3'' and chave='+intToStr(faixa) ;
    qry_rel.open;
    if qry_rel.recordCount = 0 then
    begin
      qry_rel.append;
      qry_rel.fieldByName('chave').value := faixa;
      //qry_reldescricao.value := pegaNomeMotivo(qry_relchave.value);
      qry_rel.fieldByName('job').value := job;
      qry_rel.fieldByName('categoria').value := '3';
      qry_rel.fieldByName('descricao').value := descr;
      qry_rel.post;
    end;
    qry_rel.edit;

    // qtde de devedores
    qry_qtdev.close;
    qry_qtdev.CommandText := 'select * from jobs where categoria=''6'' and job='+inttostr(job)+' and chave= '+inttostr(devedor)+' and dec_2='+intToStr(faixa);
    qry_qtdev.open;

    if qry_qtdev.recordCount = 0 then
    begin
      qry_qtdev.append;
      qry_qtdev.fieldByName('job').value := job;
      qry_qtdev.fieldByName('categoria').value := '6';
      qry_qtdev.fieldByName('chave').value := qry_baixastotais.fieldByName('pk_devedor').value;
      qry_qtdev.fieldByName('dec_1').value := 1; // qtde devedores
      qry_qtdev.fieldByName('dec_2').value := faixa;
      qry_qtdev.post;

    end;

    if qry_baixastotais.fieldByName('motivo_dialogo').value >0 then
    begin
      qry_qtdev.edit;
      qry_qtdev.fieldByName('dec_3').value := 1; //qry_qtdev.fieldByName('dec_1').asinteger; // qtde acionados
      qry_qtdev.edit;
      //qry_qtdev.fieldByName('dec_2').value := faixa;
      qry_qtdev.post;
    end;

    qry_reldec_1.value := qry_reldec_1.asinteger; // qtde devedores
    qry_reldec_3.value := qry_reldec_3.asfloat + qry_baixastotais.fieldByName('valor_titulo').asfloat; // valor principal
    qry_reldec_4.value := qry_reldec_4.asfloat + qry_baixastotais.fieldByName('valor_titulo').asfloat; // valor principal

    // posterior
    //if frotinas.Qry_Livre.fieldByName('motivo_baixa').value <> null then
    //  qry_reldec_4.value := qry_reldec_4.asfloat + frotinas.Qry_Livre.fieldByName('valor_pago').asfloat; // principal pago

    qry_rel.post;


    //devedor := frotinas.Qry_Livre.fieldByName('pk_devedor').AsInteger;
    //while (frotinas.Qry_Livre.fieldByName('pk_devedor').AsInteger = devedor) and (not frotinas.Qry_Livre.eof) do
    //begin
    //  frotinas.Qry_Livre.next;
    //end;

    qry_baixastotais.next;
  end;


  //
  // Busca dados para o relatório
  //



  Application.CreateForm(Tqr_desempenho, qr_desempenho);

  lb_mens.caption := 'Pesquisando informações...';


  qr_desempenho.ADOQuery1.close;            //
  qr_desempenho.ADOQuery1.Parameters.ParamByName('job').value := job;
  qr_desempenho.ADOQuery1.Parameters.ParamByName('cat').value := '3';
  qr_desempenho.ADOQuery1.open;

  if qr_desempenho.ADOQuery1.recordCount = 0 then
  begin
    showmessage('Não foi localizado nenhum registro');
    qr_desempenho.destroy;
    result:=0;
    //qr_demonst.Destroy;
    exit
  end;

  qr_desempenho.qlb_cliente.caption  := lk_cliente.Text;

  if cbx_ativo.Checked then
    qr_desempenho.qrlb_periodo.caption := 'Somente Ativo';


  aqtdTitulos := 0;
  aqtdDevedores := 0;


  Gauge_atualizando.MinValue := 0;
  Gauge_atualizando.MaxValue := qr_desempenho.ADOQuery1.recordCount;
  Gauge_atualizando.Visible := true;
  lb_mens.caption := 'Calculando totais';
{
  qr_desempenho.ADOQuery1.first;
  while not qr_demonst.ADOQuery1.eof do
  begin
    Gauge_atualizando.AddProgress(1);

    if qr_demonst.ADOQuery1.fieldByName('tag_1').value = 'Inativo' then
    begin
  8    iqtdTitulos   := iqtdTitulos + qr_demonst.ADOQuery1.fieldByName('qtdTtulos').value;
      iqtdDevedores := iqtdDevedores + qr_demonst.ADOQuery1.fieldByName('qtdDevedores').value;
      itotPrincipal := itotPrincipal + qr_demonst.ADOQuery1.fieldByName('total').value;
    end
    else
    begin
      aqtdTitulos   := aqtdTitulos + qr_demonst.ADOQuery1.fieldByName('qtdTtulos').value;
      aqtdDevedores := aqtdDevedores + qr_demonst.ADOQuery1.fieldByName('qtdDevedores').value;
      atotPrincipal := atotPrincipal + qr_demonst.ADOQuery1.fieldByName('total').value;
    end;

    qr_demonst.ADOQuery1.next;
  end;

  qr_demonst.gQtdDevedores := aqtdDevedores+iqtdDevedores;
  qr_demonst.gQtdTitulos   := aqtdTitulos+iqtdTitulos;
  qr_demonst.gValorTitulos  := atotPrincipal+itotPrincipal;

  qr_demonst.aQtdDevedores := aqtdDevedores;
  qr_demonst.aQtdTitulos   := aqtdTitulos;
  qr_demonst.aValorTitulos  := atotPrincipal;

  qr_demonst.iQtdDevedores := iqtdDevedores;
  qr_demonst.iQtdTitulos   := iqtdTitulos;
  qr_demonst.iValorTitulos  := itotPrincipal;

  Gauge_atualizando.MinValue := 0;
  Gauge_atualizando.MaxValue := qr_demonst.ADOQuery1.recordCount;
  Gauge_atualizando.Visible := true;
  lb_mens.caption := 'Calculando percentuais';

  qr_demonst.ADOQuery1.first;
  while not qr_demonst.ADOQuery1.eof do
  begin
    Gauge_atualizando.AddProgress(1);
    qr_demonst.ADOQuery1.edit;
    if qr_demonst.ADOQuery1tag_1.value = 'Inativo' then
    begin
      qr_demonst.ADOQuery1percDevedores.value := (qr_demonst.ADOQuery1qtddevedores.Value / qr_demonst.iqtdDevedores) * 100;
      qr_demonst.ADOQuery1perctitulos.value   := (qr_demonst.ADOQuery1qtdTtulos.value / qr_demonst.iqtdTitulos) * 100;
      qr_demonst.ADOQuery1percValores.value   := (qr_demonst.ADOQuery1total.value / qr_demonst.ivalorTitulos)*100;
    end
    else
    begin
      qr_demonst.ADOQuery1percdevedores.value := (qr_demonst.ADOQuery1qtddevedores.Value / qr_demonst.aqtdDevedores) * 100;
      qr_demonst.ADOQuery1perctitulos.value   := (qr_demonst.ADOQuery1qtdTtulos.value / qr_demonst.aQtdTitulos) * 100;
      qr_demonst.ADOQuery1percValores.value   := (qr_demonst.ADOQuery1total.value / qr_demonst.avalorTitulos)*100;
    end;
    qr_demonst.ADOQuery1.post;
    qr_demonst.ADOQuery1.next;
  end;



  qr_demonst.qrtot_princ.Caption := FormatFloat('###,###,##0.00',itotPrincipal + atotPrincipal);
  qr_demonst.qrtot_titulos.Caption := intToStr(iqtdTitulos+aqtdTitulos);
  qr_demonst.qrtot_devedores.Caption := intToStr(iqtdDevedores+aqtdDevedores);


  if (DateToStr(edt_atraso1.Date) <> '30/12/1899') or ( DateToStr(edt_atraso2.Date) <> '30/12/1899' ) then
    qr_demonst.qrlb_periodo.caption := 'De '+edt_atraso1.text+' a '+edt_atraso2.text;

  //qr_demonst.qr_repasse.caption := 'Valor líquido a ser repassado a '+tb_clientes.fieldByName('nome').value;
  //qr_demonst.totrepasse.caption := FormatFloat('#,0.00',trepasse);
 }
  result := job;

end;


function Tfrm_RelDesempenho.preparaImpressao():integer;
var comando,select,from,join,where,group,order:string;
var conta,job:integer;
var total,iaux:integer;
var principal : real;
var aqtdTitulos, aqtdDevedores , iqtdTitulos, iqtdDevedores : integer;
var faixa,devedor, diasAtraso:integer;
var hj,atraso:TdateTime;
var ultFaixa,descr:string;
begin

  hj := date;

  select := '';
  from   := '';
  join   := '';
  where  := '';

  if lk_cliente.KeyValue = null then
  begin
    showmessage('Informe um cliente.');
    exit;
  end;

  job := frotinas.Sequencial('jobs');

  comando := 'insert into jobs (job, categoria, nome_campo,chave, dec_1, dec_2 ) ';
  comando := comando + ' (select '+intToStr(job)+' , ''1'',''pk_devedor'',d.pk_devedor, (select sum(t.valor_principal) from titulos t where t.pk_devedor=d.pk_devedor), (select sum(b.valor) as valor from baixasparciais b where b.pk_devedor = d.pk_devedor  ';
  comando := comando +  '  and b.data >='''+FormatDateTime(frotinas.formato_data_banco(),edt_atraso1.Date)+'''';
  comando := comando +  '  and b.data <='''+FormatDateTime(frotinas.formato_data_banco(),edt_atraso2.Date)+'''';
  comando := comando + ' )';

  comando := comando + ' from devedores d ';
  comando := comando + ' where d.pk_cliente= '+inttostr(lk_cliente.KeyValue);

  if cbx_ativo.Checked then
    where := where + ' and (d.motivo_dialogo is null or exists( select 1 from ocorrencias o where o.pk_ocorr=d.motivo_dialogo and o.tipo=''A'') ) ';


  comando := comando + ' and exists(select 1 from titulos t where t.pk_devedor=d.pk_devedor  ';

  ultFaixa := fx5_ate.text;
  if ultFaixa = '' then
    ultFaixa := fx4_ate.text;
  if ultFaixa = '' then
    ultFaixa := fx3_ate.text;
  if ultFaixa = '' then
    ultFaixa := fx2_ate.text;


  atraso := hj - strtoint(ultFaixa);
  comando := comando + '  and t.vencimento >='''+FormatDateTime(frotinas.formato_data_banco(),atraso)+'''';

  atraso := hj - strtoint(fx1_de.text);
  comando := comando + ' and t.vencimento <='''+FormatDateTime(frotinas.formato_data_banco(),atraso)+'''';

  comando := comando + ') ';

  if cb_cobrador.KeyValue >0 then
    comando := comando + ' and d.pk_cobrador= '+inttostr(cb_cobrador.KeyValue);

  comando := comando + ') ';


  lb_mens.caption := 'Buscando dados no servidor...';
  lb_mens.Visible := true;

  ADOCommand1.CommandText := comando;
  ADOCommand1.Execute;

  //
  // busca titulos dos devedores selecionados, totalizando qtd e total titulos
  //


  select := ' select d.pk_devedor, d.motivo_dialogo, t.vencimento, t.valor_principal, t.motivo_baixa,t.data_baixa, t.pk_titulo, t.pk_recibo ';
  from   := ' from devedores d  ';
  join   := join + ' inner join jobs j on ( j.chave = d.pk_devedor ) ';
  join   := join + ' left join titulos t on ( t.pk_devedor = d.pk_devedor ) ';
  where  := ' where j.job= '+intToStr(job);
  order  := ' order by d.pk_devedor, t.vencimento';

  qry_aux.close;
  qry_aux.SQL.Text := select+from+join+where+order;
  qry_aux.open;
  if qry_aux.recordCount = 0 then
  begin
    job := 0;
    showmessage('Não foi localizado nenhum devedor');
    result:=0;
    exit;
  end;



  conta:=0;
  total:=qry_aux.recordCount;

  Gauge_atualizando.MinValue := 0;
  Gauge_atualizando.MaxValue := total;
  Gauge_atualizando.Visible := true;

  lb_mens.caption := 'Calculando...';


  qry_job1.close;
  qry_job1.Parameters.ParamByName('job').value := job;
  qry_job1.Parameters.ParamByName('cat').value := '1';
  //qry_job1.ParamByName('chave').value := qry_aux.fieldByName('pk_devedor').AsInteger;
  qry_job1.open;


  //
  // Busca nome dos motivos e seta qtd de titulos
  //

  while not qry_aux.eof do
  begin
    Gauge_atualizando.AddProgress(1);
    refresh;

    diasAtraso := 0 ;
    faixa      := 0 ;
    if ( qry_aux.fieldByName('data_baixa').value >0 ) then
      diasAtraso := qry_aux.fieldByName('data_baixa').value - qry_aux.fieldByName('vencimento').value
    else
      diasAtraso := hj - qry_aux.fieldByName('vencimento').value;

    if (diasAtraso >= strtoint(fx1_de.text)) and (diasAtraso<= strtoint(fx1_ate.text)) then
      faixa := 1
    else if (diasAtraso >= strtoInt(fx2_de.text)) and (diasAtraso <= strtoInt(fx2_ate.text)) then
      faixa := 2
    else if (diasAtraso >= strtoInt(fx3_de.text)) and (diasAtraso <= strtoint(fx3_ate.text)) then
      faixa := 3
    else if (diasAtraso >= strtoInt(fx4_de.text)) and (diasAtraso <= strtoint(fx4_ate.text)) then
      faixa := 4
    else if (diasAtraso >= strtoint(fx5_de.text)) and (diasAtraso <= strtoint(fx5_ate.text)) then
      faixa := 5
    else
      faixa := 6;

    descr      := '';
    if faixa = 1 then
      descr := fx1_de.text + ' a '+fx1_ate.text
    else if faixa = 2 then
      descr := fx2_de.text + ' a '+fx2_ate.text
    else if faixa = 3 then
      descr := fx3_de.text + ' a '+fx3_ate.text
    else if faixa = 4 then
      descr := fx4_de.text + ' a '+fx4_ate.text
    else if faixa = 5 then
      descr := fx5_de.text + ' a '+fx5_ate.text
    else
      descr := 'apartir';


    qry_rel.close;
    qry_rel.CommandText := 'select * from jobs where job='+intToStr(job)+' and categoria=''3'' and chave='+intToStr(faixa) ;
    qry_rel.open;
    if qry_rel.recordCount = 0 then
    begin
      qry_rel.append;
      qry_relchave.value := faixa;
      //qry_reldescricao.value := pegaNomeMotivo(qry_relchave.value);
      qry_reljob.value := job;
      qry_relcategoria.value := '3';
      qry_reldescricao.value := descr;
      qry_rel.post;
    end;

    qry_rel.edit;
    qry_reldec_1.value := qry_reldec_1.asfloat + 1; // qtde devedores

    if qry_aux.fieldByName('motivo_dialogo').value >0 then
    begin
      qry_reldec_2.value := qry_reldec_2.asfloat + 1; // qtde acionados
    end;

    qry_job1.locate('chave', qry_aux.fieldByName('pk_devedor').AsInteger,[]);

    qry_reldec_3.value := qry_reldec_3.asfloat + qry_job1.fieldByName('dec_1').asfloat; // valor principal

    if qry_aux.fieldByName('motivo_baixa').value <> null then
      qry_reldec_4.value := qry_reldec_4.asfloat + qry_job1.fieldByName('dec_1').asfloat; // principal pago

    qry_reldec_4.value := qry_reldec_4.asfloat + qry_job1.fieldByName('dec_2').asfloat; // principal pago

    qry_rel.post;


    devedor := qry_aux.fieldByName('pk_devedor').AsInteger;
    while (qry_aux.fieldByName('pk_devedor').AsInteger = devedor) and (not qry_aux.eof) do
    begin
      qry_aux.next;
    end;

  end;


  //
  // Busca dados para o relatório
  //



  Application.CreateForm(Tqr_desempenho, qr_desempenho);

  lb_mens.caption := 'Pesquisando informações...';


  qr_desempenho.ADOQuery1.close;            //
  qr_desempenho.ADOQuery1.Parameters.ParamByName('job').value := job;
  qr_desempenho.ADOQuery1.Parameters.ParamByName('cat').value := '3';
  qr_desempenho.ADOQuery1.open;

  if qr_desempenho.ADOQuery1.recordCount = 0 then
  begin
    showmessage('Não foi localizado nenhum registro');
    qr_desempenho.destroy;
    result:=0;
    //qr_demonst.Destroy;
    exit
  end;

  qr_desempenho.qlb_cliente.caption  := lk_cliente.Text;

  if cbx_ativo.Checked then
    qr_desempenho.qrlb_periodo.caption := 'Somente Ativo';


  aqtdTitulos := 0;
  aqtdDevedores := 0;


  Gauge_atualizando.MinValue := 0;
  Gauge_atualizando.MaxValue := qr_desempenho.ADOQuery1.recordCount;
  Gauge_atualizando.Visible := true;
  lb_mens.caption := 'Calculando totais';
{
  qr_desempenho.ADOQuery1.first;
  while not qr_demonst.ADOQuery1.eof do
  begin
    Gauge_atualizando.AddProgress(1);

    if qr_demonst.ADOQuery1.fieldByName('tag_1').value = 'Inativo' then
    begin
  8    iqtdTitulos   := iqtdTitulos + qr_demonst.ADOQuery1.fieldByName('qtdTtulos').value;
      iqtdDevedores := iqtdDevedores + qr_demonst.ADOQuery1.fieldByName('qtdDevedores').value;
      itotPrincipal := itotPrincipal + qr_demonst.ADOQuery1.fieldByName('total').value;
    end
    else
    begin
      aqtdTitulos   := aqtdTitulos + qr_demonst.ADOQuery1.fieldByName('qtdTtulos').value;
      aqtdDevedores := aqtdDevedores + qr_demonst.ADOQuery1.fieldByName('qtdDevedores').value;
      atotPrincipal := atotPrincipal + qr_demonst.ADOQuery1.fieldByName('total').value;
    end;

    qr_demonst.ADOQuery1.next;
  end;

  qr_demonst.gQtdDevedores := aqtdDevedores+iqtdDevedores;
  qr_demonst.gQtdTitulos   := aqtdTitulos+iqtdTitulos;
  qr_demonst.gValorTitulos  := atotPrincipal+itotPrincipal;

  qr_demonst.aQtdDevedores := aqtdDevedores;
  qr_demonst.aQtdTitulos   := aqtdTitulos;
  qr_demonst.aValorTitulos  := atotPrincipal;

  qr_demonst.iQtdDevedores := iqtdDevedores;
  qr_demonst.iQtdTitulos   := iqtdTitulos;
  qr_demonst.iValorTitulos  := itotPrincipal;

  Gauge_atualizando.MinValue := 0;
  Gauge_atualizando.MaxValue := qr_demonst.ADOQuery1.recordCount;
  Gauge_atualizando.Visible := true;
  lb_mens.caption := 'Calculando percentuais';

  qr_demonst.ADOQuery1.first;
  while not qr_demonst.ADOQuery1.eof do
  begin
    Gauge_atualizando.AddProgress(1);
    qr_demonst.ADOQuery1.edit;
    if qr_demonst.ADOQuery1tag_1.value = 'Inativo' then
    begin
      qr_demonst.ADOQuery1percDevedores.value := (qr_demonst.ADOQuery1qtddevedores.Value / qr_demonst.iqtdDevedores) * 100;
      qr_demonst.ADOQuery1perctitulos.value   := (qr_demonst.ADOQuery1qtdTtulos.value / qr_demonst.iqtdTitulos) * 100;
      qr_demonst.ADOQuery1percValores.value   := (qr_demonst.ADOQuery1total.value / qr_demonst.ivalorTitulos)*100;
    end
    else
    begin
      qr_demonst.ADOQuery1percdevedores.value := (qr_demonst.ADOQuery1qtddevedores.Value / qr_demonst.aqtdDevedores) * 100;
      qr_demonst.ADOQuery1perctitulos.value   := (qr_demonst.ADOQuery1qtdTtulos.value / qr_demonst.aQtdTitulos) * 100;
      qr_demonst.ADOQuery1percValores.value   := (qr_demonst.ADOQuery1total.value / qr_demonst.avalorTitulos)*100;
    end;
    qr_demonst.ADOQuery1.post;
    qr_demonst.ADOQuery1.next;
  end;



  qr_demonst.qrtot_princ.Caption := FormatFloat('###,###,##0.00',itotPrincipal + atotPrincipal);
  qr_demonst.qrtot_titulos.Caption := intToStr(iqtdTitulos+aqtdTitulos);
  qr_demonst.qrtot_devedores.Caption := intToStr(iqtdDevedores+aqtdDevedores);


  if (DateToStr(edt_atraso1.Date) <> '30/12/1899') or ( DateToStr(edt_atraso2.Date) <> '30/12/1899' ) then
    qr_demonst.qrlb_periodo.caption := 'De '+edt_atraso1.text+' a '+edt_atraso2.text;

  //qr_demonst.qr_repasse.caption := 'Valor líquido a ser repassado a '+tb_clientes.fieldByName('nome').value;
  //qr_demonst.totrepasse.caption := FormatFloat('#,0.00',trepasse);
 }
  result := job;
end;

procedure Tfrm_RelDesempenho.FormKeyPress(Sender: TObject; var Key: Char);
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
