unit Ufrm_RelBordero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, RxLookup, DB, ADODB, Buttons,
  Gauges, Grids, DBGrids, ExcelExport, jpeg;

type
  Tfrm_RelBordero = class(TForm)
    Panel1: TPanel;
    Dts_cliente: TDataSource;
    DataSource1: TDataSource;
    dts_clientes: TDataSource;
    Panel2: TPanel;
    btn_imprimir: TSpeedButton;
    SpeedButton2: TSpeedButton;
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
    Image1: TImage;
    Label14: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label7: TLabel;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label48: TLabel;
    Label61: TLabel;
    Label70: TLabel;
    edt_fx1: TEdit;
    edt_fx2: TEdit;
    dt_inicial: TDateEdit;
    dt_final: TDateEdit;
    cb_motivo: TComboBox;
    edt_prestcontas: TEdit;
    DataSource2: TDataSource;
    lb_mens: TLabel;
    cbx_baixa: TCheckBox;
    cbx_previsao: TCheckBox;
    GroupBox2: TGroupBox;
    dt_prev1: TDateEdit;
    dt_prev2: TDateEdit;
    Panel3: TPanel;
    cb_bxparcial: TCheckBox;
    cb_titareceber: TCheckBox;
    Label13: TLabel;
    cb_cobrador: TRxDBLookupCombo;
    Label15: TLabel;
    edt_alinea: TEdit;
    Label16: TLabel;
    tb_clientes: TADOQuery;
    cbx_TitulosAbertoSemParcelas: TCheckBox;
    Label11: TLabel;
    edt_vencfx1: TEdit;
    Label9: TLabel;
    Edt_vencfx2: TEdit;
    Label10: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    edt_pasta: TEdit;
    cbx_prestgeradas: TCheckBox;
    edt_tipo: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    function pegaNomeMotivo(motivo:integer):string;
    function pegaTipoMotivo(motivo:integer):string;
    function preparaImpressao() :integer;
    procedure edt_fx1Exit(Sender: TObject);
    procedure edt_fx2Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_prest1Exit(Sender: TObject);
    procedure edt_prest2Exit(Sender: TObject);
    procedure cbx_previsaoClick(Sender: TObject);
    procedure cbx_baixaClick(Sender: TObject);
    procedure cb_titareceberClick(Sender: TObject);
    procedure cbx_TitulosAbertoSemParcelasClick(Sender: TObject);
    procedure edt_vencfx1Exit(Sender: TObject);
    procedure Edt_vencfx2Exit(Sender: TObject);

    procedure preparaBorderoBaixas();
    procedure preparaBorderoemAberto();

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_RelBordero: Tfrm_RelBordero;

implementation

uses udm, urotinas, Uqr_bordero,QRExport, Uqr_borderoAberto;

{$R *.dfm}

procedure Tfrm_RelBordero.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure Tfrm_RelBordero.FormShow(Sender: TObject);
begin
tb_clientes.Open;
tb_Ocorrencias.open;
usuarios.open;
if FRotinas.pk_cliente >0 then
begin
  lk_cliente.Value := IntToStr(FRotinas.pk_cliente);
  lk_cliente.Enabled := false
end;

Urotinas.tiposDeTituloCombo(edt_tipo);


end;

procedure Tfrm_RelBordero.SpeedButton2Click(Sender: TObject);
begin
close;

end;

function Tfrm_RelBordero.pegaTipoMotivo(motivo:integer):string;
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

function Tfrm_RelBordero.pegaNomeMotivo(motivo:integer):string;
begin
if tb_Ocorrencias.Locate('pk_ocorr',motivo,[]) then
  result := tb_Ocorrenciasnome.value
else
  result := 'N�o acionado';


end;

procedure Tfrm_RelBordero.btn_imprimirClick(Sender: TObject);
var job:integer;
begin


  if (cbx_baixa.Checked) and  (cb_motivo.Text = '') then
  begin
    showmessage('N�o informado o Moivo da Baixa');
    exit;
  end;

  //if ( cbx_previsao.Checked ) and (dt_prev1.date=0 ) and (dt_prev2.date=0 ) then
  //begin
  //  showmessage('N�o informado o o Per�odo da previs�o de recebimento');
  //  exit;
  //end;

  job:=preparaImpressao();

  lb_mens.Visible := false;

  //qr_demonst.close;


end;

procedure Tfrm_RelBordero.preparaBorderoBaixas();
var comando,select,from,join,where,group,order:string;
var select2,from2,where2,group2, nome:string;
var  gjuros, gmulta, gPrinc, gdescp, gdescj, gdescm, gvalorliq, gvalorret, gprot, ghonor,gacres,iQtdTitulos,iQtdDevedores:real;
var  gacresc,gtxSegVia,gtxAdm,gtxBanc,tjuros, tmulta, tPrinc, tdescp, gDescBxParcial,tdescj, tdescm,gdesctxbanc,gbxParcial, gdesctxadm, tvalorliq, tvalorret, tacres:real;


begin

  select := '';
  from   := '';
  join   := '';
  where  := '';

  iQtdTitulos := 0;
  iQtdDevedores := 0 ;


  if lk_cliente.KeyValue = null then
  begin
    showmessage('Informe um cliente.');
    exit;
  end;

  lb_mens.Caption := 'Pesquisando...';
  lb_mens.Visible := true;

  select := select + ' SELECT t.pk_devedor,t.pk_cliente,t.pk_titulo,t.banco,t.agencia,t.conta,t.cheque,t.emissao,t.numero_titulo,t.vencimento, ';
  select := select + '  r.data_venc  , t.valor_principal, t.motivo_baixa, t.tipo_titulo, t.chave_titulo, t.alinea_devol, t.pk_recibo, t.data_baixa,';
  select := select + '  u.nome as cobrador  ';

  select := select + ',t.atu_juros,t.atu_multa,t.atu_percjuro, t.atu_percmulta, 0.00 as atu_retencao, t.atu_valor';

  select := select + '  ,d.nome as nome_devedor, d.codigo as codigo_devedor,c.nome as nome_cliente, d.cgc_cpf , r.desc_principal , r.desc_juros , r.desc_multa , r.acres_protesto  ,  r.acres_honorarios ';

  { valor reten��o }
  select := select + ', case '+
                     '  when r.valor_retenc>0 then r.valor_retenc '+
                     '  else b.valor_retenc '+
                     ' end valor_retenc  ';

  { valor pago}
  select := select + ', case '+
                     '  when r.valor_liquido>0 then r.valor_liquido '+
                     '  else b.valor  '+
                     '  end valor_liquido ' ;

  { prest contas}
  select := select + ', case '+
                     '  when r.pk_prestcontas>0 then r.pk_prestcontas '+
                     '  else b.pk_prestcontas'+
                     '  end pk_prestcontas ' ;

  { data da baixa}
  select := select + ', case '+
                     '  when r.data is not null then r.data '+
                     '  else b.data '+
                     '  end data_recibo ' ;

  select := select + ',r.VrTxAdm , r.VrTxBancaria, r.VrTxSegVia,r.acrescimo,r.DescTxAdm,r.DescTxBancaria , r.principal, r.juros, r.multa, t.chave_contrato  ';
  select := select  + ', (CAST( t.pk_recibo as varchar(15) ) + d.nome) as nome_recibo, r.baixaparcial, r.observacao as obsRecibo ' ;

  from   := ' from titulos t  ';
  join   := ' inner join devedores d on (d.pk_devedor=t.pk_devedor)';
  join   := join + ' inner join clientes c on (c.pk_cliente=t.pk_cliente)';


  join   := join + ' left join baixasparciais b on (b.pk_titulo=t.pk_titulo and b.pk_devedor=t.pk_devedor) ';

  join   := join + ' left join recibos r on (r.pk_recibo=t.pk_recibo and r.data_canc is null) ';
  join   := join + ' left join usuarios u on (d.pk_cobrador=u.nu_usu)';

  select2 := '';
  from2   := '';
  where2  := '';
  group2  := '';




  where  := ' where (t.motivo_baixa is not null and t.motivo_baixa <>'''') and t.pk_cliente='+intToStr(lk_cliente.KeyValue);

  if cbx_prestgeradas.Checked then
  begin
    where := where + ' and ( r.pk_prestcontas is not null or b.pk_prestcontas is not null';
  end;

  if edt_prestcontas.Text <> '' then
    where := where + ' and r.pk_prestcontas in ('+edt_prestcontas.Text+') or b.pk_prestcontas in ('+edt_prestcontas.Text+')';


  if dt_inicial.Date >0 then
    where := where + ' and t.data_baixa >= '''+FormatDateTime(frotinas.formato_data_banco(),dt_inicial.Date)+'''';

  if dt_final.Date >0 then
    where := where + ' and t.data_baixa <= '''+FormatDateTime(frotinas.formato_data_banco(),dt_final.Date)+'''';

  {
   *****
     baixas parciais a vulso na conta do cliente, n�o foi identificado o titulo
   ****
  }
  select2 := ' union  ';
  select2 := select2 + ' SELECT b.pk_devedor, d.pk_cliente, 0 as pk_titulo, '''' as banco, '''' as agencia, '''' as conta, '''' as cheque, cast(null as DateTime) as emissao,';
  select2 := select2 + '''Bx Parc nIdent'' as numero_titulo, cast(null as DateTime) as vencimento, b.data as data_venc, b.valor as valor_principal,';
  select2 := select2 + '''BX'' as motivo_baixa,'''' as tipo_titulo, '''' as chave_titulo, '''' as alinea_devol, 0 as pk_recibo,';
  select2 := select2 + 'b.data as data_baixa, u.nome as cobrador, 0 as atu_juros, 0 as atu_multa, 0 as atu_percjuro, 0 as atu_percmulta,';
  select2 := select2 + '0 as atu_retencao, 0 as atu_valor ,d.codigo as codigo_devedor, d.nome as nome_devedor, c.nome as nome_cliente, d.cgc_cpf , 0 as desc_principal ,';
  select2 := select2 + '0 as desc_juros , 0 as desc_multa , 0.00 as acres_protesto,0 as acres_honorarios , ';
  select2 := select2 + 'b.valor_retenc , b.valor as valor_liquido, b.pk_prestcontas, b.data as data_recibo';

  select2 := select2 + ',0.00 as VrTxAdm,   0.00 as VrTxBancaria,  0.00 as VrTxSegVia, 0.00 as acrescimo, 0.00 as DescTxAdm, 0.00 as DescTxBancaria, 0.00 as principal, 0.00 as juros, 0.00 as multa ,''''  as chave_contrato  ' ;
  select2 := select2 + ', d.nome as nome_recibo , 0.00 as baixaparcial, ''''  as obsRecibo  ' ;



  from2   := ' from baixasparciais b ';
  from2   := from2 +' inner join devedores d on (d.pk_devedor=b.pk_devedor) ';
  from2   := from2 +' inner join clientes c on ( c.pk_cliente = d.pk_cliente) ';
  from2   := from2 +' left join usuarios u on (d.pk_cobrador=u.nu_usu) ';
  where2  := ' where (b.pk_titulo is null or not exists(select 1 from titulos t where t.pk_titulo=b.pk_titulo) )and d.pk_cliente='+inttostr(lk_cliente.KeyValue);

  if edt_prestcontas.Text <> '' then
    where2 := where2 + ' and b.pk_prestcontas in ('+edt_prestcontas.Text+') ';

  if dt_inicial.Date >0 then
    where2 := where2 + ' and b.data >= '''+FormatDateTime(frotinas.formato_data_banco(),dt_inicial.Date)+'''';

  if dt_final.Date >0 then
    where2 := where2 + ' and b.data <= '''+FormatDateTime(frotinas.formato_data_banco(),dt_final.Date)+'''';




  if edt_alinea.text <> '' then
    where := where + ' and t.alinea_devol = '''+edt_alinea.text+'''';

  if edt_tipo.Text <> '' then
    where := where + ' and t.tipo_titulo = '''+edt_tipo.text+'''';


  if dt_prev1.Date >0 then
    where := where + ' and t.vencimento >= '''+FormatDateTime(frotinas.formato_data_banco(),dt_prev1.Date)+'''';

  if dt_prev2.Date >0 then
    where := where + ' and t.vencimento <= '''+FormatDateTime(frotinas.formato_data_banco(),dt_prev2.Date)+'''';

  if cbx_baixa.Checked then
  begin
    if cb_motivo.ItemIndex = 0 then
      where := where + ' and t.motivo_baixa = ''PG'''
    else
      where := where + ' and t.motivo_baixa = ''TR''';
  end;


  if cb_cobrador.KeyValue >0 then
  begin
    where := where + ' and d.pk_cobrador = '+intToStr(cb_cobrador.KeyValue);
    where2 := where2 + ' and d.pk_cobrador = '+intToStr(cb_cobrador.KeyValue);
  end;


  order  := ' order by nome_recibo ';


  Application.CreateForm(Tqr_bordero, qr_bordero);
  try
    lb_mens.caption := 'Pesquisando informa��es...';



    qr_bordero.ADOQuery1.close;            //
    qr_bordero.ADOQuery1.sql.Text := select+from+join+where + select2+from2+where2 +order;
    urotinas.log('border�# '+qr_bordero.ADOQuery1.sql.Text);
    qr_bordero.ADOQuery1.open;

    if qr_bordero.ADOQuery1.recordCount = 0 then
    begin
      showmessage('N�o foi localizado nenhum registro');
      qr_bordero.Destroy;
      exit
    end;
    
      gjuros := 0.00;
      gmulta := 0.00;
      gPrinc := 0.00;
      gdescp := 0.00;
      gdescj := 0.00;
      gdescm := 0.00;
      gDescBxParcial:=0.00;
      gBxParcial:=0.00;

      gtxBanc := 0.00;
      gtxAdm :=0.00;
      gtxSegVia :=0.00;
      gacresc :=0.00;

      gprot :=0.00;
      ghonor :=0.00;

      gdesctxbanc:=  0.00;
      gdesctxadm:= 0.00;

      gvalorliq := 0.00;
      gvalorret := 0.00;
      gacres := 0.00;

    nome:= '';
    qr_bordero.ADOQuery1.first();
    while not qr_bordero.ADOQuery1.eof do
    begin

      if nome <> qr_bordero.ADOQuery1nome_recibo.asstring then
      begin
        nome := qr_bordero.ADOQuery1nome_recibo.asstring;

        gjuros := gjuros + qr_bordero.ADOQuery1juros.asfloat;
        gmulta := gmulta + qr_bordero.ADOQuery1multa.asfloat;
        gPrinc := gPrinc + qr_bordero.ADOQuery1principal.asfloat;
        gdescp := gdescp + qr_bordero.ADOQuery1desc_principal.asfloat;
        gdescj := gdescj + qr_bordero.ADOQuery1desc_juros.asfloat;
        gdescm := gdescm + qr_bordero.ADOQuery1desc_multa.asfloat;

        gDescBxParcial := gDescBxParcial + qr_bordero.ADOQuery1baixaparcial.asfloat;

        if qr_bordero.ADOQuery1principal.asfloat=0 then
          gBxParcial := gBxParcial + qr_bordero.ADOQuery1valor_liquido.asfloat;

        gtxBanc := gtxBanc + qr_bordero.ADOQuery1VrTxBancaria.asfloat;
        gtxAdm :=gtxAdm + qr_bordero.ADOQuery1VrTxAdm.asfloat;
        gtxSegVia :=gtxSegVia + qr_bordero.ADOQuery1VrTxSegVia.asfloat;
        gacresc :=gacresc + qr_bordero.ADOQuery1acrescimo.asfloat;

        gprot :=gprot + qr_bordero.ADOQuery1acres_protesto.asfloat;
        ghonor :=ghonor + qr_bordero.ADOQuery1acres_honorarios.asfloat;

        gdesctxbanc:=  gdesctxbanc + qr_bordero.ADOQuery1DescTxBancaria.asfloat;
        gdesctxadm:= gdesctxadm + qr_bordero.ADOQuery1DescTxAdm.asfloat;

        gvalorliq := gvalorliq + qr_bordero.ADOQuery1valor_liquido.asfloat;
        gvalorret := gvalorret + qr_bordero.ADOQuery1valor_retenc.asfloat;
        gacres := gacres+qr_bordero.ADOQuery1acrescimo.AsFloat;

        iQtdDevedores:=iQtdDevedores+1;


      end;
      iQtdTitulos:= iQtdTitulos+1;


      qr_bordero.ADOQuery1.next;
    end;


    qr_bordero.qrlb_gprinc.Caption := FormatFloat('#,###,##0.00',gPrinc);
    //qrlb_descp.Caption := FormatFloat('#,###,##0.00',tdescp);

    qr_bordero.qrlb_gjuros.Caption := FormatFloat('#,###,##0.00',gjuros);
    qr_bordero.qrlb_gmulta.Caption := FormatFloat('#,###,##0.00',gmulta);
    qr_bordero.qrlb_gdescjuros.Caption := FormatFloat('#,###,##0.00',gdescj);
    qr_bordero.qrlb_gdescmulta.Caption := FormatFloat('#,###,##0.00',gdescm);
    qr_bordero.qrlb_gvrliq.Caption := FormatFloat('#,###,##0.00',gvalorliq);
    qr_bordero.qrlb_gret.Caption := FormatFloat('#,###,##0.00', gvalorret);
    qr_bordero.qrlb_gacres.Caption := FormatFloat('#,###,##0.00',gacres);

    qr_bordero.qrlb_qtd.caption := FormatFloat('#,###,##0',iQtdTitulos);
    qr_bordero.qrlb_qtdev.caption := FormatFloat('#,###,##0',iQtdDevedores);


    qr_bordero.qrlb_gtxADM.Caption := FormatFloat('#,###,##0.00',gtxAdm);
    qr_bordero.qrlb_gacres.Caption := FormatFloat('#,###,##0.00',gacresc);
    qr_bordero.qrlb_gtxBanc.Caption := FormatFloat('#,###,##0.00',gtxBanc);
    qr_bordero.qrlb_gtxSegVia.Caption := FormatFloat('#,###,##0.00',gtxSegVia);
    qr_bordero.qrlb_gacres.caption:= FormatFloat('#,###,##0.00',gacresc);

    qr_bordero.qrlb_gtxProtesto.caption:= FormatFloat('#,###,##0.00',gprot);

    qr_bordero.qrlb_gtxHonorario.caption:= FormatFloat('#,###,##0.00',ghonor);

    qr_bordero.qrlb_gdescprinc.caption:= FormatFloat('#,###,##0.00',gdescp);

    qr_bordero.qrlb_gret.caption:= FormatFloat('#,###,##0.00',gvalorret);

    qr_bordero.qrlb_gdescTxBanc.caption:= FormatFloat('#,###,##0.00',gdesctxbanc);
    qr_bordero.qrlb_gdescTxADM.caption:= FormatFloat('#,###,##0.00',gdesctxadm);

    qr_bordero.qr_totBxParc.caption := FormatFloat('#,###,##0.00',gBxParcial);

    qr_bordero.QRL_DescBxParc.Caption:= FormatFloat('#,###,##0.00',gDescBxParcial);


    //qr_bordero.qr_bordero.qlb_cliente.caption  := lk_cliente.Text;


    //qr_bordero.qr_bordero.borderoBaixas := cbx_baixa.Checked;


    if cbx_baixa.Checked then
    begin
      if cb_motivo.ItemIndex = 0 then
        qr_bordero.qrlb_tipoBordero.Caption := ' - Pagamentos'
      else
        qr_bordero.qrlb_tipoBordero.Caption := ' - Retiradas';
    end
    else
    begin
      if cb_titareceber.Checked then
        qr_bordero.qrlb_tipoBordero.Caption := ' T�tulos em aberto'
      else
        qr_bordero.qrlb_tipoBordero.Caption := ' - Previs�o Recebimento';
    end;

    if cbx_previsao.Checked then
      qr_bordero.previsao := false;

    qr_bordero.qrlb_periodo.caption := '';
    if (DateToStr(dt_inicial.Date) <> '30/12/1899') or ( DateToStr(dt_final.Date) <> '30/12/1899' ) then
      qr_bordero.qrlb_periodo.caption := 'De '+dt_inicial.text+' a '+dt_final.text;

    if (DateToStr(dt_prev1.Date) <> '30/12/1899') or ( DateToStr(dt_prev2.Date) <> '30/12/1899' ) then
      qr_bordero.qrlb_periodo.caption := 'De '+dt_prev1.text+' a '+dt_prev2.text;


    if cb_cobrador.KeyValue >0 then
      qr_bordero.qrlb_periodo.Caption := qr_bordero.qrlb_periodo.Caption + 'Carteira: '+cb_cobrador.Text;

    if edt_prestcontas.Text <> '' then
      qr_bordero.qrlb_periodo.caption := qr_bordero.qrlb_periodo.caption + ' Presta��es: '+edt_prestcontas.Text;

  Except
      on E: Exception do
      begin
      showmessage('ocorreu um erro ao gerar relat�rio: '+'#13'+E.Message) ;
      qr_borderoAberto.Destroy;
      exit;
      end;

   End;


  try
    urotinas.reportToCsv(edt_pasta.text, 'bordero.csv' , qr_bordero.ADOQuery1);
  finally

    qr_bordero.preview;
    qr_bordero.destroy;
  end;

end;

procedure Tfrm_RelBordero.preparaBorderoemAberto();
var comando,select,from,join,where,group,order:string;
var select2,from2,where2,group2:string;
begin


  lb_mens.Caption := 'Pesquisando...';
  lb_mens.Visible := true;

  select := select + ' SELECT t.pk_devedor,t.pk_cliente,t.pk_titulo,t.banco,t.agencia,t.conta,t.cheque,t.emissao,t.numero_titulo,t.vencimento, ';
  select := select + '  r.data_venc  , t.valor_principal, t.motivo_baixa, t.tipo_titulo, t.chave_titulo, t.alinea_devol, t.pk_recibo, t.data_baixa,';
  select := select + '  u.nome as cobrador  ';

  select := select + ',0.00 as atu_juros, 0.00 as atu_multa, 0.00 as atu_percjuro, 0.00 as atu_percmulta, 0.00 as atu_retencao, 0.00 as atu_valor';

  select := select + '  , d.nome as nome_devedor, d.codigo as codigo_devedor,c.nome as nome_cliente, d.cgc_cpf , t.desc_principal , t.desc_juros , t.desc_multa , t.acres_protesto  ,  t.acres_honorarios ';

  select := select + ', 0.00 as valor_retenc, 0.00 as valor_liquido, 0 as pk_prestcontas, cast(null as Datetime) as data_recibo ';



  from   := ' from titulos t  ';
  join   := ' inner join devedores d on (d.pk_devedor=t.pk_devedor)';
  join   := join + ' inner join clientes c on (c.pk_cliente=t.pk_cliente)';


  join   := join + ' left join recibos r on (r.pk_recibo=t.pk_recibo and r.data_canc is null) ';
  join   := join + ' left join usuarios u on (d.pk_cobrador=u.nu_usu)';

  select2 := '';
  from2   := '';
  where2  := '';
  group2  := '';



  where  := ' where (t.motivo_baixa is null or t.motivo_baixa ='''') and t.pk_cliente='+intToStr(lk_cliente.KeyValue);
  if cbx_TitulosAbertoSemParcelas.Checked then
    where  := where + ' and not exists(select 1 from parcelas_acordo p where p.pagamento is null and p.pk_devedor=t.pk_devedor) ';


  if edt_alinea.text <> '' then
    where := where + ' and t.alinea_devol = '''+edt_alinea.text+'''';

  if edt_tipo.Text <> '' then
    where := where + ' and t.tipo_titulo = '''+edt_tipo.text+'''';


  if dt_prev1.Date >0 then
    where := where + ' and t.vencimento >= '''+FormatDateTime(frotinas.formato_data_banco(),dt_prev1.Date)+'''';

  if dt_prev2.Date >0 then
    where := where + ' and t.vencimento <= '''+FormatDateTime(frotinas.formato_data_banco(),dt_prev2.Date)+'''';


  if cb_cobrador.KeyValue >0 then
  begin
    where := where + ' and d.pk_cobrador = '+intToStr(cb_cobrador.KeyValue);
    where2 := where2 + ' and d.pk_cobrador = '+intToStr(cb_cobrador.KeyValue);
  end;


  order  := ' order by d.nome ';



  Application.CreateForm(Tqr_borderoAberto, qr_borderoAberto);
  lb_mens.caption := 'Pesquisando informa��es...';

  try

    qr_borderoAberto.ADOQuery1.close;            //
    qr_borderoAberto.ADOQuery1.sql.Text := select+from+join+where + select2+from2+where2 +order;
    urotinas.log('border�# '+qr_borderoAberto.ADOQuery1.sql.Text);
    qr_borderoAberto.ADOQuery1.open;

    if qr_borderoAberto.ADOQuery1.recordCount = 0 then
    begin
      showmessage('N�o foi localizado nenhum registro');
      qr_borderoAberto.Destroy;
      exit
    end;


    qr_borderoAberto.qlb_cliente.caption  := lk_cliente.Text;


    qr_borderoAberto.borderoBaixas := cbx_baixa.Checked;


     if cb_titareceber.Checked then
        qr_borderoAberto.qrlb_tipoBordero.Caption := ' T�tulos em aberto'
      else
        qr_borderoAberto.qrlb_tipoBordero.Caption := ' - Previs�o Recebimento';
   

    if cbx_previsao.Checked then
      qr_borderoAberto.previsao := false;

    qr_borderoAberto.qrlb_periodo.caption := '';
    if (DateToStr(dt_inicial.Date) <> '30/12/1899') or ( DateToStr(dt_final.Date) <> '30/12/1899' ) then
      qr_borderoAberto.qrlb_periodo.caption := 'De '+dt_inicial.text+' a '+dt_final.text;

    if (DateToStr(dt_prev1.Date) <> '30/12/1899') or ( DateToStr(dt_prev2.Date) <> '30/12/1899' ) then
      qr_borderoAberto.qrlb_periodo.caption := 'De '+dt_prev1.text+' a '+dt_prev2.text;


    if cb_cobrador.KeyValue >0 then
      qr_borderoAberto.qrlb_periodo.Caption := qr_borderoAberto.qrlb_periodo.Caption + 'Carteira: '+cb_cobrador.Text;

    if edt_prestcontas.Text <> '' then
      qr_borderoAberto.qrlb_periodo.caption := qr_borderoAberto.qrlb_periodo.caption + ' Presta��es: '+edt_prestcontas.Text;

  Except
      on E: Exception do
      begin
      showmessage('ocorreu um erro ao gerar relat�rio: '+'#13'+E.Message) ;
      qr_borderoAberto.Destroy;
      exit;
      end;

   End;


  try
    urotinas.reportToCsv(edt_pasta.text, 'bordero.csv' , qr_borderoAberto.ADOQuery1);
  finally

    qr_borderoAberto.preview;
    qr_borderoAberto.destroy;
  end;


end;

function Tfrm_RelBordero.preparaImpressao():integer;
var comando,select,from,join,where,group,order:string;
var select2,from2,where2,group2:string;
begin


  select := '';
  from   := '';
  join   := '';
  where  := '';

  if lk_cliente.KeyValue = null then
  begin
    showmessage('Informe um cliente.');
    exit;
  end;

  if cbx_baixa.Checked then
    preparaBorderoBaixas()
  else
    preparaBorderoemAberto();



end;


procedure Tfrm_RelBordero.edt_fx1Exit(Sender: TObject);
var hj:TDatetime;
begin

if edt_fx1.Text <> '' then
begin
  hj:= Date;
  dt_inicial.Date := hj - StrToInt(edt_fx1.Text);
end
else
  dt_inicial.text := '';

end;

procedure Tfrm_RelBordero.edt_fx2Exit(Sender: TObject);
var hj:TDatetime;
begin

if edt_fx2.Text <> '' then
begin
  hj:= Date;
  dt_final.Date := hj - StrToInt(edt_fx2.Text);
end
else
  dt_final.text := '';

end;

procedure Tfrm_RelBordero.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrm_RelBordero.edt_prest1Exit(Sender: TObject);
var hj:TDatetime;
begin


end;

procedure Tfrm_RelBordero.edt_prest2Exit(Sender: TObject);
var hj:TDatetime;
begin

end;

procedure Tfrm_RelBordero.cbx_previsaoClick(Sender: TObject);
begin
if cbx_previsao.Checked then
begin
  cbx_baixa.Checked := false;
  cbx_TitulosAbertoSemParcelas.Checked:=false;
  cb_titareceber.Checked := false;
end;

end;

procedure Tfrm_RelBordero.cbx_baixaClick(Sender: TObject);
begin

if cbx_baixa.Checked then
begin
  cbx_previsao.Checked := false;
  cb_titareceber.Checked := false;
  cbx_TitulosAbertoSemParcelas.Checked:=false;
  
end;

end;

procedure Tfrm_RelBordero.cb_titareceberClick(Sender: TObject);
begin
if cb_titareceber.Checked then
begin
  cbx_previsao.Checked := false;
  cbx_baixa.Checked := false;
  cbx_TitulosAbertoSemParcelas.Checked := false;
end;


end;


procedure Tfrm_RelBordero.cbx_TitulosAbertoSemParcelasClick(Sender: TObject);
begin
  if cbx_TitulosAbertoSemParcelas.Checked then
  begin
    cbx_previsao.Checked := false;
    cb_titareceber.Checked := false;
    cbx_baixa.Checked := false;
  end;

end;

procedure Tfrm_RelBordero.edt_vencfx1Exit(Sender: TObject);
var hj:TDatetime;
begin

  if edt_vencfx1.Text <> '' then
  begin
    hj:= Date;
    dt_prev1.Date := hj - StrToInt(edt_vencfx1.Text);
  end
  else
    dt_prev1.text := '';

end;

procedure Tfrm_RelBordero.Edt_vencfx2Exit(Sender: TObject);
var hj:TDatetime;
begin

  if edt_vencfx2.Text <> '' then
  begin
    hj:= Date;
    dt_prev2.Date := hj - StrToInt(edt_vencfx2.Text);
  end
  else
    dt_prev2.text := '';
end;

end.










