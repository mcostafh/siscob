unit Uqr_desempenho;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB;

type
  Tqr_desempenho = class(TQuickRep)
    ADOQuery1: TADOQuery;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRBand2: TQRBand;
    QRLabel23: TQRLabel;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    qlb_cliente: TQRLabel;
    QRShape2: TQRShape;
    QRBand4: TQRBand;
    tot_saldo: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    QRShape21: TQRShape;
    QRShape24: TQRShape;
    QRDBText1: TQRDBText;
    qlb_cobrador: TQRLabel;
    tot_valorpago: TQRLabel;
    tot_naoacionados: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    tot_devedores: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRImage2: TQRImage;
    qrlb_pdevedores: TQRLabel;
    qrlb_pacionados: TQRLabel;
    qrlb_psaldo: TQRLabel;
    qrlb_periodo: TQRLabel;
    ADOQuery1job: TIntegerField;
    ADOQuery1categoria: TWideStringField;
    ADOQuery1nome_campo: TWideStringField;
    ADOQuery1valor: TBCDField;
    ADOQuery1descricao: TWideStringField;
    ADOQuery1chave: TIntegerField;
    ADOQuery1tag_1: TWideStringField;
    ADOQuery1tag_2: TWideStringField;
    ADOQuery1tag_3: TWideStringField;
    ADOQuery1tag_4: TWideStringField;
    ADOQuery1tag_5: TWideStringField;
    ADOQuery1dec_1: TBCDField;
    ADOQuery1dec_2: TBCDField;
    ADOQuery1dec_3: TBCDField;
    ADOQuery1dec_4: TBCDField;
    ADOQuery1dec_5: TBCDField;
    ADOQuery1dec_6: TBCDField;
    QRShape3: TQRShape;
    QRShape15: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    qrlb_pnaoacionados: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape7: TQRShape;
    QRDBText5: TQRDBText;
    tot_acionados: TQRLabel;
    qrlb_ppago: TQRLabel;
    qrlb_saldo: TQRLabel;
    perc_valorpago: TQRLabel;
    QRDBText6: TQRDBText;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private

  public
     tdevedores, tacionados, tnaoacionados, tvaloratraso, tpago, tsaldo : real;


  end;

var
  qr_desempenho: Tqr_desempenho;

implementation

{$R *.DFM}
uses Urotinas,UDM;

procedure Tqr_desempenho.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

tot_devedores.Caption := FormatFloat('##0',tdevedores );
tot_acionados.caption := FormatFloat('##0',tacionados );
tot_naoacionados.caption:=FormatFloat('##0',tdevedores-tacionados );
//tot_valoratraso.caption :=FormatFloat('#,###,##0.00',tvaloratraso );
tot_valorpago.caption := FormatFloat('#,###,##0.00',tpago );
tot_saldo.caption := FormatFloat('#,###,##0.00',tvaloratraso - tpago );

perc_valorpago.caption := FormatFloat('#,###,##0.00', (tpago / tvaloratraso ) * 100);

//
end;

procedure Tqr_desempenho.QuickRepBeforePrint(Sender: TCustomQuickRep;
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

procedure Tqr_desempenho.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var naoacionados, saldo:real;
begin

//qrlb_qtdeNaoAcionados.Caption := FormatFloat('##0',ADOQuery1dec_1.asfloat - ADOQuery1dec_2.asfloat );

qrlb_pdevedores.Caption := FormatFloat('##0.00',divide(ADOQuery1dec_1.asfloat, tdevedores) * 100);
qrlb_pacionados.Caption := FormatFloat('##0.00',divide(ADOQuery1dec_2.asfloat , tacionados) * 100);
naoAcionados := ADOQuery1dec_1.asfloat - ADOQuery1dec_2.asfloat;
qrlb_pnaoacionados.Caption := FormatFloat('##0.00',divide(naoAcionados , tnaoacionados) * 100);

//qrlb_pvaloratraso.Caption := FormatFloat('##0.00',divide( ADOQuery1dec_3.asfloat, tvaloratraso) * 100);

qrlb_ppago.Caption := FormatFloat('##0.00',divide( ADOQuery1dec_4.asfloat, ADOQuery1dec_3.asfloat) * 100);

saldo := ADOQuery1dec_3.asfloat - ADOQuery1dec_4.asfloat;

qrlb_saldo.caption := FormatFloat('##0.00',saldo);

qrlb_psaldo.caption := FormatFloat('##0.00',divide(saldo , (tvaloratraso - tpago)) * 100 );

{  if qr_demonst.ADOQuery1tag_1.value = 'Inativo' then
  begin
    qrlb_pdevedores.caption := FormatFloat('###,###,##0.00',(ADOQuery1qtddevedores.asInteger / iqtdDevedores) * 100 );
    qrlb_ptitulos.caption   := FormatFloat('###,###,##0.00',(qr_demonst.ADOQuery1qtdTtulos.value / iqtdTitulos) * 100);
    qrlb_pvalores.caption   := FormatFloat('###,###,##0.00',(qr_demonst.ADOQuery1total.value / ivalorTitulos)*100);
  end
  else
  begin
    qrlb_pdevedores.caption := FormatFloat('###,###,##0.00',(ADOQuery1qtddevedores.asInteger / aqtdDevedores) * 100 );
    qrlb_ptitulos.caption   := FormatFloat('###,###,##0.00',(qr_demonst.ADOQuery1qtdTtulos.value / aqtdTitulos) * 100);
    qrlb_pvalores.caption   := FormatFloat('###,###,##0.00',(qr_demonst.ADOQuery1total.value / avalorTitulos)*100);

  end;
 }
end;

end.
