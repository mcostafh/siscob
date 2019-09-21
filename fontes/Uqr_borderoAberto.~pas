unit Uqr_borderoAberto;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB, QRExport;

type
  Tqr_borderoAberto = class(TQuickRep)
    ADOQuery1: TADOQuery;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qlb_cliente: TQRLabel;
    QRLabel9: TQRLabel;
    QRGroup1: TQRGroup;
    Label1: TLabel;
    QRShape30: TQRShape;
    QRImage2: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    qrlb_atraso: TQRLabel;
    qrlb_numero: TQRLabel;
    qrlb_periodo: TQRLabel;
    qrlb_devedor: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel8: TQRLabel;
    qrlb_cheque: TQRLabel;
    QRDBText1: TQRDBText;
    qrlb_tipoBordero: TQRLabel;
    QRBand4: TQRBand;
    QRLabel22: TQRLabel;
    grlb_princ: TQRLabel;
    qrlb_dtprev: TQRLabel;
    QRBand5: TQRBand;
    QRLabel23: TQRLabel;
    qrlb_gprinc: TQRLabel;
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

  private

  public
    icontaGrupo,iqtdDevedores, iQtdTitulos,  aqtdDevedores, aQtdTitulos,gQtdDevedores, gQtdTitulos : integer;
    iValorTitulos, aValorTitulos, gValorTitulos : real;
    hoje: TdateTime;
    gjuros, gmulta, gPrinc, gdescp, gdescj, gdescm, gvalorliq, gvalorret, gacres:real;
    tjuros, tmulta, tPrinc, tdescp, tdescj, tdescm, tvalorliq, tvalorret, tacres:real;
    borderoBaixas:boolean;
    previsao:boolean;
    sDevedores:string;
  end;

var
  qr_borderoAberto: Tqr_borderoAberto;

implementation

{$R *.DFM}
uses Urotinas,UDM;

procedure Tqr_borderoAberto.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//
if icontaGrupo>1 then
  PrintBand:=  true
else
  PrintBand:=  false;

grlb_princ.Caption := FormatFloat('#,###,##0.00',gPrinc);
//qrlb_descp.Caption := FormatFloat('#,###,##0.00',gdescp);
 {
grl_juros.Caption := FormatFloat('#,###,##0.00',gjuros);
grl_multa.Caption := FormatFloat('#,###,##0.00',gmulta);
grlb_descj.Caption := FormatFloat('#,###,##0.00',gdescj);
grlb_descm.Caption := FormatFloat('#,###,##0.00',gdescm);
grlb_valorliq.Caption := FormatFloat('#,###,##0.00',gvalorliq);
grlb_valorret.Caption := FormatFloat('#,###,##0.00',gvalorret);
grlb_acres.Caption := FormatFloat('#,###,##0.00',gacres);
  }


end;

procedure Tqr_borderoAberto.QuickRepBeforePrint(Sender: TCustomQuickRep;
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
tjuros:=0;
tmulta:=0;
tPrinc:=0;
tdescp:=0;
tdescj:=0;
tdescm:=0;
tvalorliq:=0;
tvalorret:=0;
tacres:=0;


end;

procedure Tqr_borderoAberto.QRBand3BeforePrint(Sender: TQRCustomBand;
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
gPrinc := gPrinc + ADOQuery1valor_principal.asfloat;
tPrinc := tPrinc + ADOQuery1valor_principal.asfloat;

//qrlb_acresc.Caption := FormatFloat('###,###,##0.00',(ADOQuery1acres_protesto.asfloat + ADOQuery1acres_honorarios.asfloat));
{
valorRecebido := ADOQuery1valor_liquido.value;
valorRetenc := ADOQuery1valor_retenc.value;

gjuros := gjuros + ADOQuery1atu_juros.asfloat;
gmulta := gmulta + ADOQuery1atu_multa.asfloat;

gdescp := gdescp + ADOQuery1desc_principal.asfloat;
gdescj := gdescj + ADOQuery1desc_juros.asfloat;
gdescm := gdescm + ADOQuery1desc_multa.asfloat;
}
{
gvalorliq := gvalorliq + valorRecebido; // ADOQuery1valor_liquido.asfloat;
gvalorret := gvalorret + valorRetenc; // ADOQuery1valor_retenc.asfloat;
gacres := gacres + ADOQuery1acres_protesto.asfloat + ADOQuery1acres_honorarios.asfloat;

tjuros := tjuros + ADOQuery1atu_juros.asfloat;
tmulta := tmulta + ADOQuery1atu_multa.asfloat;

tdescp := tdescp + ADOQuery1desc_principal.asfloat;
tdescj := tdescj + ADOQuery1desc_juros.asfloat;
tdescm := tdescm + ADOQuery1desc_multa.asfloat;

tvalorliq := tvalorliq + valorRecebido; //ADOQuery1valor_liquido.asfloat;
tvalorret := tvalorret + valorRetenc ; //ADOQuery1valor_retenc.asfloat;
tacres := tacres + ADOQuery1acres_protesto.asfloat + ADOQuery1acres_honorarios.asfloat;

if ADOQuery1motivo_baixa.value = '' then
begin
  QRDB_JUROS.Enabled := false;
  QRDBMulta.Enabled  := false;
  qrlb_acresc.Enabled:= false;


end;
}

end;

procedure Tqr_borderoAberto.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var cpf:string;
begin
icontaGrupo:=0;
gjuros := 0;
gmulta := 0;
gPrinc := 0;
gdescp := 0;
gdescj := 0;
gdescm := 0;
gvalorliq := 0;
gvalorret := 0;
gacres := 0;

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

procedure Tqr_borderoAberto.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

qrlb_gprinc.Caption := FormatFloat('#,###,##0.00',tPrinc);
//qrlb_descp.Caption := FormatFloat('#,###,##0.00',tdescp);
 {
qrlb_gjuros.Caption := FormatFloat('#,###,##0.00',tjuros);
qrlb_gmulta.Caption := FormatFloat('#,###,##0.00',tmulta);
qrlb_gdescjuros.Caption := FormatFloat('#,###,##0.00',tdescj);
qrlb_gdescmulta.Caption := FormatFloat('#,###,##0.00',tdescm);
qrlb_gvrliq.Caption := FormatFloat('#,###,##0.00',tvalorliq);
qrlb_gret.Caption := FormatFloat('#,###,##0.00', tvalorret);
qrlb_gacres.Caption := FormatFloat('#,###,##0.00',tacres);


}
qrlb_qtd.caption := FormatFloat('#,###,##0',iQtdTitulos);
qrlb_qtdev.caption := FormatFloat('#,###,##0',iQtdDevedores);

end;

end.
