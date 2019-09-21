unit Ufrm_gerarPrestContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, DB, ADODB, RxLookup, StdCtrls, Grids, DBGrids,
  Mask, DBCtrls, ToolEdit, CurrEdit, jpeg;

type
  Tfrm_GerarPrestContas = class(TForm)
    Panel1: TPanel;
    Dts_cliente: TDataSource;
    Panel2: TPanel;
    Label1: TLabel;
    lk_cliente: TRxDBLookupCombo;
    btn_busca: TSpeedButton;
    SpeedButton1: TSpeedButton;
    qry_pendencia: TADOQuery;
    dts_pendencia: TDataSource;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    qry_prestcontas: TADODataSet;
    qry_prestcontaspk_prestcontas: TIntegerField;
    qry_prestcontasdata: TDateTimeField;
    qry_prestcontaspk_cliente: TIntegerField;
    qry_prestcontasprincipal: TBCDField;
    qry_prestcontasjuros: TBCDField;
    qry_prestcontasmulta: TBCDField;
    qry_prestcontasdescjuros: TBCDField;
    qry_prestcontasdescmulta: TBCDField;
    qry_prestcontasdescprincipal: TBCDField;
    qry_prestcontaspdescjuros: TBCDField;
    qry_prestcontaspdescmulta: TBCDField;
    qry_prestcontasretencao: TBCDField;
    qry_prestcontasacrescimos: TBCDField;
    qry_prestcontasliquido: TBCDField;
    qry_recibo: TADODataSet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Image1: TImage;
    Label14: TLabel;
    qry_pendenciapk_recibo: TIntegerField;
    qry_pendenciapk_devedor: TIntegerField;
    qry_pendenciadata: TDateTimeField;
    qry_pendenciahora: TStringField;
    qry_pendenciapk_cliente: TIntegerField;
    qry_pendenciaprincipal: TBCDField;
    qry_pendenciajuros: TBCDField;
    qry_pendenciamulta: TBCDField;
    qry_pendenciadesc_principal: TBCDField;
    qry_pendenciadesc_juros: TBCDField;
    qry_pendenciadesc_multa: TBCDField;
    qry_pendenciaacres_protesto: TBCDField;
    qry_pendenciaacres_honorarios: TBCDField;
    qry_pendenciavalor_liquido: TBCDField;
    qry_pendenciataxa_retenc: TBCDField;
    qry_pendenciavalor_retenc: TBCDField;
    qry_pendenciabaixaparcial: TBCDField;
    qry_pendencianome: TStringField;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    qry_pendenciapk_bxparcial: TIntegerField;
    qry_prestcontasbaixaparcial: TBCDField;
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
    qry_recibopk_recibo: TIntegerField;
    qry_recibopk_devedor: TIntegerField;
    qry_recibodata: TDateTimeField;
    qry_recibohora: TStringField;
    qry_recibopk_cliente: TIntegerField;
    qry_recibousuario_cobrador: TIntegerField;
    qry_reciboprincipal: TBCDField;
    qry_recibojuros: TBCDField;
    qry_recibomulta: TBCDField;
    qry_recibodesc_principal: TBCDField;
    qry_recibodesc_juros: TBCDField;
    qry_recibodesc_multa: TBCDField;
    qry_reciboacres_protesto: TBCDField;
    qry_reciboacres_honorarios: TBCDField;
    qry_recibovalor_liquido: TBCDField;
    qry_recibotaxa_retenc: TBCDField;
    qry_recibovalor_retenc: TBCDField;
    qry_recibodata_receb: TDateTimeField;
    qry_recibohora_receb: TStringField;
    qry_recibousuario_receb: TIntegerField;
    qry_recibodata_canc: TDateTimeField;
    qry_recibohora_canc: TStringField;
    qry_recibousuario_canc: TIntegerField;
    qry_reciboobservacao: TStringField;
    qry_recibodata_venc: TDateTimeField;
    qry_recibotipo: TIntegerField;
    qry_recibochave_tabretenc: TIntegerField;
    qry_recibodias_atraso: TIntegerField;
    qry_recibopk_prestcontas: TIntegerField;
    qry_recibobaixaparcial: TBCDField;
    qry_reciboacordo: TIntegerField;
    qry_reciboVrTxAdm: TBCDField;
    qry_reciboVrTxBancaria: TBCDField;
    qry_reciboVrTxSegVia: TBCDField;
    qry_reciboCobJuridica: TStringField;
    qry_reciboDescTxAdm: TBCDField;
    qry_reciboDescTxBancaria: TBCDField;
    qry_pendenciaVrTxAdm: TBCDField;
    qry_pendenciaVrTxBancaria: TBCDField;
    qry_pendenciaVrTxSegVia: TBCDField;
    qry_pendenciaDescTxAdm: TBCDField;
    qry_pendenciaDescTxBancaria: TBCDField;
    SpeedButton3: TSpeedButton;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    Label24: TLabel;
    DBEdit9: TDBEdit;
    Label25: TLabel;
    DBEdit10: TDBEdit;
    Label26: TLabel;
    DBEdit13: TDBEdit;
    Label27: TLabel;
    DBEdit14: TDBEdit;
    Label28: TLabel;
    DBEdit15: TDBEdit;
    qry_prestcontasfaixa: TIntegerField;
    qry_prestcontasdescricao: TStringField;
    qry_prestcontasVrTxAdm: TBCDField;
    qry_prestcontasVrTxBancaria: TBCDField;
    qry_prestcontasVrTxSegVia: TBCDField;
    qry_prestcontasDescTxAdm: TBCDField;
    qry_prestcontasDescTxBancaria: TBCDField;
    Label29: TLabel;
    DBEdit16: TDBEdit;
    DataSource1: TDataSource;
    qry_prestcontasVrProtesto: TBCDField;
    qry_prestcontasVrHonorarios: TBCDField;
    GroupBox2: TGroupBox;
    Label21: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label30: TLabel;
    Label23: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label8: TLabel;
    Label20: TLabel;
    edt_divida: TCurrencyEdit;
    edt_juros: TCurrencyEdit;
    edt_multa: TCurrencyEdit;
    edt_descjuros: TCurrencyEdit;
    edt_descmulta: TCurrencyEdit;
    edt_acrescimos: TCurrencyEdit;
    edt_liquido: TCurrencyEdit;
    edt_retencao: TCurrencyEdit;
    edt_descprinciapl: TCurrencyEdit;
    edt_bxParcial: TCurrencyEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    edt_taxaADM: TCurrencyEdit;
    edt_taxaBancaria: TCurrencyEdit;
    edt_taxaSegVia: TCurrencyEdit;
    edt_descTxADM: TCurrencyEdit;
    edt_DescTxBancaria: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_buscaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_GerarPrestContas: Tfrm_GerarPrestContas;

implementation
uses UDM, URotinas;
{$R *.dfm}

procedure Tfrm_GerarPrestContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure Tfrm_GerarPrestContas.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure Tfrm_GerarPrestContas.btn_buscaClick(Sender: TObject);
var tbaixaparcial,tprincipal,tjuros,tmulta,tdescmulta,tdescjuros,tdescprincipal, tacrescimo, tliquido, tretencao,pdescjuros,pdescmulta,protesto,honorarios,ttxADM, ttxBancaria, tsegViaBoleto, tDescTxADM, tDescTxGancaria : real;
begin

if lk_cliente.KeyValue = null then
begin
  showmessage('Não foi informado o cliente.');
  exit;
end;

qry_pendencia.close;
qry_pendencia.Parameters.ParamByName('cliente').value := lk_cliente.KeyValue;
qry_pendencia.Parameters.ParamByName('cliente2').value := lk_cliente.KeyValue;
urotinas.log('gerar Prestação: '+qry_pendencia.SQL.Text);
qry_pendencia.open;

ttxADM:=0;
ttxBancaria:=0;
tsegViaBoleto:=0;
tDescTxADM:=0;
tDescTxGancaria:=0;

tprincipal := 0;
tjuros:=0;
tmulta:=0;
tdescmulta:=0;
tdescjuros:=0;
tdescprincipal:=0;
pdescmulta:=0;
tacrescimo:=0;
tliquido:=0;
tretencao :=0.00;
protesto := 0.0;
honorarios:=0.0;
tretencao:=0.0;
tbaixaparcial:=0.0;

while not qry_pendencia.eof do
begin
  tbaixaparcial := tbaixaparcial + qry_pendenciabaixaparcial.asfloat;
  tprincipal := tprincipal + qry_pendenciaprincipal.asfloat;
  tdescprincipal := tdescprincipal + qry_pendenciadesc_principal.AsFloat;
  tjuros     := tjuros + qry_pendenciajuros.asfloat;
  tmulta     := tmulta + qry_pendenciamulta.asfloat;

  ttxADM:=ttxADM + qry_pendenciaVrTxAdm.asfloat;
  ttxBancaria:= ttxBancaria + qry_pendenciaVrTxBancaria.asfloat;
  tsegViaBoleto:= tsegViaBoleto + qry_pendenciaVrTxSegVia.asfloat;
  tDescTxADM:=tDescTxADM+qry_pendenciaDescTxAdm.asfloat;
  tDescTxGancaria:=tDescTxGancaria+qry_pendenciaDescTxBancaria.asfloat;


  tdescjuros := tdescjuros + qry_pendenciadesc_juros.AsFloat;
  tdescmulta := tdescmulta + qry_pendenciadesc_multa.AsFloat;
  protesto   := protesto + qry_pendenciaacres_protesto.asfloat;
  honorarios := honorarios + qry_pendenciaacres_honorarios.AsFloat;
  tliquido   := tliquido + qry_pendenciavalor_liquido.asfloat +qry_pendenciabaixaparcial.asfloat;
  tretencao  := tretencao + qry_pendenciavalor_retenc.AsFloat;

  qry_pendencia.next;
end;

edt_divida.Value := tprincipal;
edt_descprinciapl.value := tdescprincipal;
edt_juros.value := tjuros;
edt_multa.value := tmulta;
edt_descmulta.value := tdescmulta;
edt_descjuros.value := tdescjuros;
edt_acrescimos.value := protesto + honorarios;
edt_liquido.value := tliquido;
edt_retencao.value := tretencao;
edt_bxParcial.value := tbaixaparcial;

edt_taxaADM.Value := ttxADM;
edt_taxaBancaria.value := ttxBancaria;
edt_taxaSegVia.value := tsegViaBoleto;
edt_descTxADM.value := tDescTxADM;
edt_DescTxBancaria.value := tDescTxGancaria;


end;

procedure Tfrm_GerarPrestContas.FormShow(Sender: TObject);
begin
tb_cliente.Open;
end;

procedure Tfrm_GerarPrestContas.SpeedButton3Click(Sender: TObject);
begin

dm.DB.BeginTrans;
try

  qry_prestcontas.close;
  qry_prestcontas.open;

  if MessageDlg('Deseja Gerar a prestação de contas agora ?',
     mtConfirmation, [mbYes, mbNo],0) = mrYes then
  begin

    qry_prestcontas.append;
    qry_prestcontaspk_prestcontas.value  := frotinas.Sequencial('prestcontas');
    qry_prestcontasdata.value := date;
    qry_prestcontaspk_cliente.value := lk_cliente.KeyValue;
    qry_prestcontasprincipal.value := edt_divida.value;
    qry_prestcontasdescprincipal.value := edt_descprinciapl.value;
    qry_prestcontasjuros.value:= edt_juros.value;
    qry_prestcontasmulta.value := edt_multa.value;
    qry_prestcontasdescjuros.value := edt_descjuros.value;
    qry_prestcontasdescmulta.value := edt_descmulta.value;
    qry_prestcontasacrescimos.value:= edt_acrescimos.value;
    qry_prestcontasliquido.value := edt_liquido.value;
    qry_prestcontasretencao.value := edt_retencao.value;
    qry_prestcontasbaixaparcial.value := edt_bxParcial.value;

    qry_prestcontasVrTxAdm.value := edt_taxaADM.Value ;
    qry_prestcontasVrTxBancaria.value := edt_taxaBancaria.value;
    qry_prestcontasVrTxSegVia.value := edt_taxaSegVia.value;
    qry_prestcontasDescTxAdm.value := edt_descTxADM.value ;
    qry_prestcontasDescTxBancaria.value := edt_DescTxBancaria.value ;

    qry_prestcontas.post;
   {
   join

  select
  from baixasparciais b
  where b.pk_prestcontas is null and b.pk_devedor + :cliente

   }


    qry_pendencia.first;
    while not qry_pendencia.eof do
    begin
      qry_recibo.close;
      qry_recibo.Parameters.ParamByName('recibo').value := qry_pendenciapk_recibo.value;
      qry_recibo.open;
      if qry_recibo.recordcount>0 then
      begin
        qry_recibo.edit;
        qry_recibo.fieldbyname('pk_prestcontas').Value := qry_prestcontaspk_prestcontas.Value;
        qry_recibo.post;
      end;

      frotinas.Qry_Livre.close;
      frotinas.Qry_Livre.CommandText := 'select * from baixasparciais where pk_prestContas is null and pk_bxparcial='+qry_pendenciapk_bxparcial.asstring;
      frotinas.Qry_Livre.open;
      if frotinas.Qry_Livre.recordCount>0 then
      begin
        while not frotinas.Qry_Livre.eof do
        begin
          frotinas.Qry_Livre.edit;
          frotinas.Qry_Livre.fieldByName('pk_prestcontas').value := qry_prestcontaspk_prestcontas.Value;
          frotinas.Qry_Livre.post;
          frotinas.Qry_Livre.next;
        end;
      end;

      qry_pendencia.next;
    end;

  end;

  dm.DB.CommitTrans;
  showmessage('Prestação de contas gerada com sucesso! '+inttostr(qry_prestcontaspk_prestcontas.asinteger));
except

  dm.DB.RollbackTrans;
  showmessage('Não foi possível gerar Prestação de contas, ocorreu um erro no banco de dados !');
end;




btn_busca.Click;

end;

end.
