unit Uqr_pcontas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB;

type
  Tqr_pcontas = class(TQuickRep)
    ADOQuery1: TADOQuery;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qlb_cliente: TQRLabel;
    qrlb_princ: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
    qrlb_acess: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel19: TQRLabel;
    QRShape8: TQRShape;
    QRBand4: TQRBand;
    tot_princ: TQRLabel;
    tot_juros: TQRLabel;
    tot_multa: TQRLabel;
    tot_descp: TQRLabel;
    tot_descj: TQRLabel;
    tot_descm: TQRLabel;
    tot_retenc: TQRLabel;
    tot_liquido: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape9: TQRShape;
    QRLabel22: TQRLabel;
    QRShape10: TQRShape;
    QRLabel25: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape20: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRImage2: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape16: TQRShape;
    QRShape19: TQRShape;
    QRLabel6: TQRLabel;
    QRShape30: TQRShape;
    QRLabel9: TQRLabel;
    QRShape18: TQRShape;
    QRShape23: TQRShape;
    QRShape28: TQRShape;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    ADOQuery1descricao: TWideStringField;
    ADOQuery1principal: TBCDField;
    ADOQuery1juros: TBCDField;
    ADOQuery1multa: TBCDField;
    ADOQuery1acrescimo: TBCDField;
    ADOQuery1descjuros: TBCDField;
    ADOQuery1descmulta: TBCDField;
    ADOQuery1descprincipal: TBCDField;
    ADOQuery1retencao: TBCDField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape5: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape22: TQRShape;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    ADOQuery1liquido: TBCDField;
    QRLabel7: TQRLabel;
    tot_acres: TQRLabel;
    qrlb_variaveis: TQRLabel;
    ADOQuery1VrTxAdm: TBCDField;
    ADOQuery1VrTxBancaria: TBCDField;
    ADOQuery1VrTxSegVia: TBCDField;
    ADOQuery1DescTxAdm: TBCDField;
    ADOQuery1DescTxBancaria: TBCDField;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel21: TQRLabel;
    QRShape21: TQRShape;
    QRDBText6: TQRDBText;
    ADOQuery1protesto: TBCDField;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    tot_txADM: TQRLabel;
    tot_txBanc: TQRLabel;
    tot_segVia: TQRLabel;
    tot_protesto: TQRLabel;
    tot_descTxAdm: TQRLabel;
    tot_descTxBanc: TQRLabel;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    qrlb_vr: TQRLabel;
    QRShape45: TQRShape;
    QRLabel18: TQRLabel;
    QRShape46: TQRShape;
    QRShape52: TQRShape;
    QRDBText15: TQRDBText;
    qrl_bxparcial: TQRLabel;
    ADOQuery1baixaparcial: TBCDField;
    QRLabel26: TQRLabel;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRDBText17: TQRDBText;
    ADOQuery1honorario: TBCDField;
    tot_honorario: TQRLabel;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private

  public
  end;

var
  qr_pcontas: Tqr_pcontas;

implementation

{$R *.DFM}
uses Urotinas,UDM;

procedure Tqr_pcontas.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//
end;

procedure Tqr_pcontas.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var pathImagens:string;
  var achouLogo : boolean;
begin

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

end;

procedure Tqr_pcontas.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
// qrlb_cpf
//if length(ADOQuery1cgc_cpf.value)=11 then
//  qrlb_cpf.Caption := urotinas.FormatCPF(ADOQuery1cgc_cpf.value)
//else
//  qrlb_cpf.Caption := urotinas.FormatCGC(ADOQuery1cgc_cpf.value);

if ADOQuery1retencao.AsFloat>0 then
  qrlb_vr.caption:= FormatFloat('###,###,##0.00',ADOQuery1retencao.asfloat)
else
  qrlb_vr.caption:= FormatFloat('###,###,##0.00',ADOQuery1VrTxAdm.asfloat - ADOQuery1DescTxAdm.asfloat);

end;

end.                                           -
