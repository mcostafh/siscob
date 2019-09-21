unit Uqr_agendamentos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB;

type
  Tqr_agendamentos = class(TQuickRep)
    ADOQuery1: TADOQuery;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    Cliente: TQRLabel;
    QRBand2: TQRBand;
    QRLabel23: TQRLabel;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    qlb_cliente: TQRLabel;
    QRLabel9: TQRLabel;
    QRGroup1: TQRGroup;
    Label1: TLabel;
    QRImage2: TQRImage;
    QRLabel6: TQRLabel;
    QRLabel12: TQRLabel;
    ADOQuery1pk_devedor: TIntegerField;
    ADOQuery1nome: TStringField;
    ADOQuery1agendado_data: TDateTimeField;
    ADOQuery1agendado_hora: TStringField;
    ADOQuery1agendado_tipo: TIntegerField;
    ADOQuery1motivo_dialogo: TIntegerField;
    QRLabel13: TQRLabel;
    QRDBText1: TQRDBText;
    ADOQuery1nomecliente: TStringField;
    QRDBText3: TQRDBText;
    qrlb_periodo: TQRLabel;
    ADOQuery1cgc_cpf: TStringField;
    ADOQuery1cpf: TStringField;
    QRDBText6: TQRDBText;
    qrlb_data: TQRLabel;
    qlb_cobrador: TQRLabel;
    ADOQuery1pk_cobrador: TIntegerField;
    ADOQuery1agendado_cobrador: TIntegerField;
    ADOQuery1nomecobrador: TStringField;
    ADOQuery1nomecobrador2: TStringField;
    qrlb_cobrador: TQRLabel;
    qrlb_cobrador2: TQRLabel;
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

  end;

var
  qr_agendamentos: Tqr_agendamentos;

implementation

{$R *.DFM}
uses Urotinas,UDM;

procedure Tqr_agendamentos.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//
end;

procedure Tqr_agendamentos.QuickRepBeforePrint(Sender: TCustomQuickRep;
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
end;

end;

procedure Tqr_agendamentos.ADOQuery1CalcFields(DataSet: TDataSet);
begin

if length(ADOQuery1cgc_cpf.value)=11 then
  ADOQuery1cpf.Value := urotinas.FormatCPF(ADOQuery1cgc_cpf.value)
else
  ADOQuery1cpf.Value := urotinas.FormatCGC(ADOQuery1cgc_cpf.value);

//if ADOQuery1data_dialogo.value >0 then
//  ADOQuery1defasagem.value := Trunc(hoje - ADOQuery1data_dialogo.value )
//else
//  ADOQuery1defasagem.value := Trunc(hoje - ADOQuery1maiorvenc.Value );


end;

procedure Tqr_agendamentos.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

var hoje,venc:TDateTime;
begin

if ADOQuery1pk_cobrador.value >0 then
begin

  frotinas.Qry_Livre.close;
  frotinas.Qry_Livre.CommandText := 'select nome from usuarios where nu_usu='+ADOQuery1pk_cobrador.asstring;
  frotinas.Qry_Livre.open;

  qrlb_cobrador.caption := '';
  if frotinas.Qry_Livre.recordCount>0 then
  begin
    qrlb_cobrador.caption := frotinas.Qry_Livre.fieldByName('nome').value;
  end;

  qrlb_cobrador2.caption := '';

  if ADOQuery1agendado_cobrador.value >0 then
  begin
    frotinas.Qry_Livre.close;
    frotinas.Qry_Livre.CommandText := 'select nome from usuarios where nu_usu='+ADOQuery1agendado_cobrador.asstring;
    frotinas.Qry_Livre.open;
    if frotinas.Qry_Livre.recordCount>0 then
    begin
      qrlb_cobrador2.caption := frotinas.Qry_Livre.fieldByName('nome').value;
    end;
  end;
end;

end;

procedure Tqr_agendamentos.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if ADOQuery1agendado_data.value>0 then
      qrlb_data.caption := FormatDateTime('dd/mm/yyyy',ADOQuery1agendado_data.value)+' - '+ urotinas.DiadaSemana(ADOQuery1agendado_data.value);
end;

end.
