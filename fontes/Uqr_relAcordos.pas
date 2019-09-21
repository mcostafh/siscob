unit Uqr_relAcordos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB;

type
  Tqr_prevRetornos = class(TQuickRep)
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
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    qlb_cliente: TQRLabel;
    QRShape2: TQRShape;
    QRShape11: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape5: TQRShape;
    QRGroup1: TQRGroup;
    Label1: TLabel;
    QRDBText9: TQRDBText;
    QRShape3: TQRShape;
    QRShape17: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRDBText8: TQRDBText;
    QRShape4: TQRShape;
    QRImage2: TQRImage;
    qlb_cobrador: TQRLabel;
    QRShape1: TQRShape;
    QRShape6: TQRShape;
    qrlb_periodo: TQRLabel;
    QRLabel2: TQRLabel;
    qrlb_cpf: TQRLabel;
    ADOQuery1chave: TIntegerField;
    ADOQuery1pk_devedor: TIntegerField;
    ADOQuery1Data: TDateTimeField;
    ADOQuery1Hora: TStringField;
    ADOQuery1Texto: TStringField;
    ADOQuery1motivo: TIntegerField;
    ADOQuery1Agendado_Data: TDateTimeField;
    ADOQuery1Agendado_Tipo: TIntegerField;
    ADOQuery1Agendado_Hora: TStringField;
    ADOQuery1agendado_cobrador: TIntegerField;
    ADOQuery1marcar_nao_localiz: TStringField;
    ADOQuery1seq_arq_inclusao: TIntegerField;
    ADOQuery1pk_cobrador: TIntegerField;
    ADOQuery1pk_cliente: TIntegerField;
    ADOQuery1devedor: TStringField;
    ADOQuery1cgc_cpf: TStringField;
    ADOQuery1nomemotivo: TWideStringField;
    ADOQuery1nomecliente: TStringField;
    QRLabel3: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    ADOQuery1nomecobrador: TWideStringField;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private

  public
    iqtdDevedores, iQtdTitulos,aqtdDevedores, aQtdTitulos,gQtdDevedores, gQtdTitulos : integer;
    iValorTitulos, aValorTitulos, gValorTitulos : real;
    horaAnt : string;
    dataAnt : string;
  end;

var
  qr_prevRetornos: Tqr_prevRetornos;

implementation

{$R *.DFM}
uses Urotinas,UDM;

procedure Tqr_prevRetornos.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//
end;

procedure Tqr_prevRetornos.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var pathImagens:string;
  var achouLogo : boolean;
begin
horaAnt := '';

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

procedure Tqr_prevRetornos.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
if length(ADOQuery1cgc_cpf.Text)=11 then
  qrlb_cpf.caption := urotinas.FormatCPF(ADOQuery1cgc_cpf.Text)
else
  qrlb_cpf.caption := urotinas.FormatCGC(ADOQuery1cgc_cpf.Text);

end;

end.
