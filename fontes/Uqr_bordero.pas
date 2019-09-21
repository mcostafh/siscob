unit Uqr_bordero;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB, QRExport;

type
  Tqr_bordero = class(TQuickRep)
    ADOQuery1: TADOQuery;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qlb_cliente: TQRLabel;
    QRGroup1: TQRGroup;
    Label1: TLabel;
    QRImage2: TQRImage;
    QRDB_JUROS: TQRDBText;
    qrlb_atraso: TQRLabel;
    qrlb_numero: TQRLabel;
    qrlb_periodo: TQRLabel;
    qrlb_devedor: TQRLabel;
    QRDBText3: TQRDBText;
    qrlb_cheque: TQRLabel;
    QRDBMulta: TQRDBText;
    QRDBText1: TQRDBText;
    qrlb_tipoBordero: TQRLabel;
    qrlb_dtprev: TQRLabel;
    QRBand5: TQRBand;
    QRLabel23: TQRLabel;
    qrlb_gprinc: TQRLabel;
    qrlb_gjuros: TQRLabel;
    qrlb_gmulta: TQRLabel;
    qrlb_gacres: TQRLabel;
    qrlb_gdescprinc: TQRLabel;
    qrlb_gdescjuros: TQRLabel;
    qrlb_gdescmulta: TQRLabel;
    qrlb_gvrliq: TQRLabel;
    qrlb_gret: TQRLabel;
    qrlb_qtd: TQRLabel;
    qrlb_qtdev: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRExcelFilter1: TQRExcelFilter;
    qrlb_cobrador: TQRLabel;
    ADOQuery1pk_devedor: TIntegerField;
    ADOQuery1pk_cliente: TIntegerField;
    ADOQuery1pk_titulo: TIntegerField;
    ADOQuery1banco: TStringField;
    ADOQuery1agencia: TStringField;
    ADOQuery1conta: TStringField;
    ADOQuery1cheque: TStringField;
    ADOQuery1emissao: TDateTimeField;
    ADOQuery1numero_titulo: TStringField;
    ADOQuery1vencimento: TDateTimeField;
    ADOQuery1data_venc: TDateTimeField;
    ADOQuery1valor_principal: TBCDField;
    ADOQuery1motivo_baixa: TStringField;
    ADOQuery1tipo_titulo: TStringField;
    ADOQuery1chave_titulo: TStringField;
    ADOQuery1alinea_devol: TStringField;
    ADOQuery1pk_recibo: TIntegerField;
    ADOQuery1data_baixa: TDateTimeField;
    ADOQuery1cobrador: TWideStringField;
    ADOQuery1atu_juros: TBCDField;
    ADOQuery1atu_multa: TBCDField;
    ADOQuery1atu_percjuro: TBCDField;
    ADOQuery1atu_percmulta: TBCDField;
    ADOQuery1atu_retencao: TBCDField;
    ADOQuery1atu_valor: TBCDField;
    ADOQuery1nome_devedor: TStringField;
    ADOQuery1nome_cliente: TStringField;
    ADOQuery1cgc_cpf: TStringField;
    ADOQuery1desc_principal: TBCDField;
    ADOQuery1desc_juros: TBCDField;
    ADOQuery1desc_multa: TBCDField;
    ADOQuery1acres_protesto: TBCDField;
    ADOQuery1acres_honorarios: TBCDField;
    ADOQuery1valor_retenc: TBCDField;
    ADOQuery1valor_liquido: TBCDField;
    ADOQuery1pk_prestcontas: TIntegerField;
    ADOQuery1data_recibo: TDateTimeField;
    ADOQuery1codigo_devedor: TStringField;
    ADOQuery1VrTxAdm: TBCDField;
    ADOQuery1VrTxBancaria: TBCDField;
    ADOQuery1VrTxSegVia: TBCDField;
    ADOQuery1acrescimo: TBCDField;
    ADOQuery1DescTxAdm: TBCDField;
    ADOQuery1DescTxBancaria: TBCDField;
    QRLabel26: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText20: TQRDBText;
    ADOQuery1principal: TBCDField;
    ADOQuery1juros: TBCDField;
    ADOQuery1multa: TBCDField;
    QRShape7: TQRShape;
    QRLabel14: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel24: TQRLabel;
    QRShape8: TQRShape;
    QRLabel21: TQRLabel;
    ADOQuery1chave_contrato: TStringField;
    QRDBText22: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    qrlb_gtxBanc: TQRLabel;
    qrlb_gtxADM: TQRLabel;
    qrlb_gtxSegVia: TQRLabel;
    qrlb_gtxProtesto: TQRLabel;
    qrlb_gtxHonorario: TQRLabel;
    qrlb_gdescTxBanc: TQRLabel;
    qrlb_gdescTxADM: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    ADOQuery1nome_recibo: TStringField;
    ADOQuery1baixaparcial: TBCDField;
    QRLabel2: TQRLabel;
    QRDBText23: TQRDBText;
    ADOQuery1obsRecibo: TStringField;
    QRDBText24: TQRDBText;
    qr_totBxParc: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel13: TQRLabel;
    QRL_DescBxParc: TQRLabel;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private

  public
    icontaGrupo,iqtdDevedores, iQtdTitulos,  aqtdDevedores, aQtdTitulos,gQtdDevedores, gQtdTitulos : integer;
    iValorTitulos, aValorTitulos, gValorTitulos : real;
    hoje: TdateTime;
    gjuros, gmulta, gPrinc, gdescp, gdescj, gdescm, gvalorliq, gvalorret, gprot, ghonor,gacres:real;
    gacresc,gtxSegVia,gtxAdm,gtxBanc,tjuros, tmulta, tPrinc, tdescp, tdescj, tdescm,gdesctxbanc,gbxParcial, gdesctxadm, tvalorliq, tvalorret, tacres:real;

    borderoBaixas:boolean;
    previsao:boolean;
    sDevedores:string;
  end;

var
  qr_bordero: Tqr_bordero;

implementation

{$R *.DFM}
uses Urotinas,UDM;

procedure Tqr_bordero.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//
if icontaGrupo>1 then
  PrintBand:=  true
else
  PrintBand:=  false;

//grlb_princ.Caption := FormatFloat('#,###,##0.00',gPrinc);
//qrlb_descp.Caption := FormatFloat('#,###,##0.00',gdescp);

//grl_juros.Caption := FormatFloat('#,###,##0.00',gjuros);
//grl_multa.Caption := FormatFloat('#,###,##0.00',gmulta);
//grlb_descj.Caption := FormatFloat('#,###,##0.00',gdescj);
//grlb_descm.Caption := FormatFloat('#,###,##0.00',gdescm);
//grlb_valorliq.Caption := FormatFloat('#,###,##0.00',gvalorliq);
//grlb_valorret.Caption := FormatFloat('#,###,##0.00',gvalorret);
//grlb_acres.Caption := FormatFloat('#,###,##0.00',gacres);



end;

procedure Tqr_bordero.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var pathImagens:string;
  var achouLogo : boolean;
begin
iQtdTitulos := 0;
iQtdDevedores := 0;
sDevedores:='';

pathImagens := ExtractFilePath(ParamStr(0))+'logo.jpg';
achouLogo := true;
if not FileExists(pathImagens) then
begin
  pathImagens := ExtractFilePath(ParamStr(0))+'logo.jpeg';
  if not FileExists(pathImagens) then
  begin
    pathImagens := ExtractFilePath(ParamStr(0))+'logo.bmp';
    if not FileExists(pathImagens) then
      achouLogo := false;
  end;
end;

if achouLogo then
begin
   QRImage2.Picture.LoadFromFile(pathimagens);
   QRImage2.Picture.LoadFromFile(pathimagens);
end;

icontaGrupo := 0;

end;

procedure Tqr_bordero.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

var hoje,venc:TDateTime;
var numero:string;
var valorRecebido, valorRetenc : real;
begin

inc(icontaGrupo);

inc(iQtdTitulos);
if Pos( ADOQuery1pk_devedor.AsString , sDevedores) =0 then
begin
  inc(iQtdDevedores);
  sDevedores := sDevedores + ';'+ADOQuery1pk_devedor.AsString;
end;
hoje := date;
venc := ADOQuery1vencimento.Value;

qrlb_atraso.caption := intToStr( Trunc(hoje - venc) );

numero:='';
if ADOQuery1tipo_titulo.value <>'' then
  numero := ADOQuery1tipo_titulo.value + '-';
qrlb_numero.caption := numero + ADOQuery1numero_titulo.value;

qrlb_cheque.caption := '';

if ADOQuery1banco.value+ADOQuery1agencia.value+ADOQuery1conta.value+ADOQuery1cheque.value <> '' then
  qrlb_cheque.caption := ADOQuery1banco.value+'/'+ADOQuery1agencia.value+'/'+ADOQuery1conta.value+'/'+ADOQuery1cheque.value+'/'+ADOQuery1alinea_devol.value
else
begin
  if ADOQuery1valor_principal.value = 0 then
    qrlb_cheque.caption := 'Baixa Parcial';
end;


end;

procedure Tqr_bordero.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var cpf:string;
begin
icontaGrupo:=0;

  if length(ADOQuery1cgc_cpf.value)=11 then
    cpf := urotinas.FormatCPF(ADOQuery1cgc_cpf.value)
  else
    cpf := urotinas.FormatCGC(ADOQuery1cgc_cpf.value);

  qrlb_devedor.caption := cpf+' - '+ADOQuery1nome_devedor.value+' - '+ADOQuery1codigo_devedor.asstring;
  qrlb_cobrador.caption := 'Cobrador: '+ADOQuery1cobrador.value;

  if borderoBaixas then
    qrlb_dtprev.caption := ''
  else
  begin
    if previsao then
      qrlb_dtprev.caption := '( Previsão: '+FormatDateTime('dd/mm/yyyy',ADOQuery1data_venc.value)+')'
    else
      qrlb_dtprev.caption := '';
  end;






end;

procedure Tqr_bordero.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

{
qrlb_gprinc.Caption := FormatFloat('#,###,##0.00',gPrinc);

qrlb_gjuros.Caption := FormatFloat('#,###,##0.00',gjuros);
qrlb_gmulta.Caption := FormatFloat('#,###,##0.00',gmulta);
qrlb_gdescjuros.Caption := FormatFloat('#,###,##0.00',gdescj);
qrlb_gdescmulta.Caption := FormatFloat('#,###,##0.00',gdescm);
qrlb_gvrliq.Caption := FormatFloat('#,###,##0.00',gvalorliq);
qrlb_gret.Caption := FormatFloat('#,###,##0.00', gvalorret);
qrlb_gacres.Caption := FormatFloat('#,###,##0.00',gacres);

qrlb_qtd.caption := FormatFloat('#,###,##0',iQtdTitulos);
qrlb_qtdev.caption := FormatFloat('#,###,##0',iQtdDevedores);


qrlb_gtxADM.Caption := FormatFloat('#,###,##0.00',gtxAdm);
qrlb_gacres.Caption := FormatFloat('#,###,##0.00',gacresc);
qrlb_gtxBanc.Caption := FormatFloat('#,###,##0.00',gtxBanc);
qrlb_gtxSegVia.Caption := FormatFloat('#,###,##0.00',gtxSegVia);
qrlb_gacres.caption:= FormatFloat('#,###,##0.00',gacresc);

qrlb_gtxProtesto.caption:= FormatFloat('#,###,##0.00',gprot);

qrlb_gtxHonorario.caption:= FormatFloat('#,###,##0.00',ghonor);

qrlb_gdescprinc.caption:= FormatFloat('#,###,##0.00',gdescp);

qrlb_gret.caption:= FormatFloat('#,###,##0.00',gvalorret);

qrlb_gdescTxBanc.caption:= FormatFloat('#,###,##0.00',gdesctxbanc);
qrlb_gdescTxADM.caption:= FormatFloat('#,###,##0.00',gdesctxadm);

qr_totBxParc.caption := FormatFloat('#,###,##0.00',gBxParcial);

 }


end;

procedure Tqr_bordero.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
gjuros := 0;
gmulta := 0;
gPrinc := 0;
gdescp := 0;
gdescj := 0;
gdescm := 0;

gtxBanc :=0;
gtxAdm :=0;
gtxSegVia :=0;
gacresc :=0;
gBxParcial:=0
//gvalorliq := 0;
//gvalorret := 0;
//gacres := 0;
end;

end.
