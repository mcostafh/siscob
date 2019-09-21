unit Uqr_defas_sintetico;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB, QRExport;

type
  Tqr_defas_sintetico = class(TQuickRep)
    ADOQuery1: TADOQuery;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qlb_cobrador: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape5: TQRShape;
    QRGroup1: TQRGroup;
    Label1: TLabel;
    QRShape3: TQRShape;
    QRShape17: TQRShape;
    QRShape31: TQRShape;
    QRShape4: TQRShape;
    QRImage2: TQRImage;
    QRShape1: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText11: TQRDBText;
    qrlb_cliente: TQRLabel;
    ADOQuery1data_dialogo: TDateTimeField;
    ADOQuery1nome_motivo: TWideStringField;
    ADOQuery1nome_cobrador: TWideStringField;
    ADOQuery1qtdevedores: TIntegerField;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRDBText3: TQRDBText;
    ADOQuery1defasagem: TIntegerField;
    QRExcelFilter1: TQRExcelFilter;
    ADOQuery1agendado_data: TDateTimeField;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private

  public
    iqtdDevedores, iQtdTitulos,aqtdDevedores, aQtdTitulos,gQtdDevedores, gQtdTitulos : integer;
    iValorTitulos, aValorTitulos, gValorTitulos : real;
    hoje: TdateTime;
    diasMaxdefasagem:integer;

  end;

var
  qr_defas_sintetico: Tqr_defas_sintetico;

implementation

{$R *.DFM}
uses Urotinas,UDM;

procedure Tqr_defas_sintetico.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//
end;

procedure Tqr_defas_sintetico.QuickRepBeforePrint(Sender: TCustomQuickRep;
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

procedure Tqr_defas_sintetico.ADOQuery1CalcFields(DataSet: TDataSet);
begin

if ADOQuery1data_dialogo.value >0 then
begin
  if (ADOQuery1agendado_data.value >0) then
  begin

    if (ADOQuery1agendado_data.value > hoje ) then
      ADOQuery1defasagem.value := 0
    else if (ADOQuery1agendado_data.value > ADOQuery1data_dialogo.value) then
      ADOQuery1defasagem.value := Trunc(hoje - ADOQuery1agendado_data.value )
    else
      ADOQuery1defasagem.value := Trunc(hoje - ADOQuery1data_dialogo.value );
  end
  else
    ADOQuery1defasagem.value := Trunc(hoje - ADOQuery1data_dialogo.Value );

end
else
  ADOQuery1defasagem.value := 0;



end;

procedure Tqr_defas_sintetico.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

var hoje,venc:TDateTime;
begin

if diasMaxdefasagem>0 then
begin
   PrintBand := ADOQuery1defasagem.AsInteger >= diasMaxdefasagem;
end;

hoje := date;
    {

frotinas.Qry_Livre.close;
frotinas.Qry_Livre.CommandText := 'select numero_titulo, valor_principal,tipo_titulo,vencimento  from titulos where pk_devedor='+ADOQuery1pk_devedor.asstring+' and vencimento='''+FormatDateTime(frotinas.formato_data_banco(),ADOQuery1maiorvenc.value)+'''';
frotinas.Qry_Livre.open;

if frotinas.Qry_Livre.recordCount>0 then
begin
  venc := ADOQuery1maiorvenc.Value;
  if venc>0 then
  begin
    qrlb_atraso.caption := intToStr( Trunc(hoje - venc) );
    qrlb_venc.caption   := FormatDateTime(FRotinas.formato_data_banco(),frotinas.Qry_Livre.fieldByName('vencimento').value);
  end;
  qrlb_numero.caption := frotinas.Qry_Livre.fieldByName('numero_titulo').asstring+' '+frotinas.Qry_Livre.fieldByName('tipo_titulo').asstring;
  qrlb_princ.caption  := FormatFloat('###,###,##0.00',frotinas.Qry_Livre.fieldByName('valor_principal').asfloat);
end;
 }
 
end;

procedure Tqr_defas_sintetico.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
if diasMaxdefasagem>0 then
begin
   PrintBand := ADOQuery1defasagem.AsInteger >= diasMaxdefasagem;
end;

end;

end.
