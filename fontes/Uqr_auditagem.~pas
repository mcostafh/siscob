unit Uqr_auditagem;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB, QRExport;

type
  Tqr_auditagem = class(TQuickRep)
    ADOQuery1: TADOQuery;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
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
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape5: TQRShape;
    QRGroup1: TQRGroup;
    Label1: TLabel;
    QRDBText9: TQRDBText;
    QRShape3: TQRShape;
    QRShape17: TQRShape;
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
    ADOQuery1cobrador: TStringField;
    ADOQuery1cgc_cpf: TStringField;
    ADOQuery1nomecliente: TStringField;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    ADOQuery1nomemotivo: TWideStringField;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRDBText8: TQRDBText;
    ADOQuery1devedor: TStringField;
    QRShape4: TQRShape;
    QRImage2: TQRImage;
    qrlb_periodo: TQRLabel;
    QRShape1: TQRShape;
    QRShape6: TQRShape;
    QRLabel2: TQRLabel;
    qrlb_duracao: TQRLabel;
    qlb_cobrador: TQRLabel;
    QRDBText5: TQRDBText;
    ADOQuery1codmotivo: TStringField;
    QRDBText6: TQRDBText;
    QRExcelFilter1: TQRExcelFilter;
    QRExcelFilter2: TQRExcelFilter;
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
  qr_auditagem: Tqr_auditagem;

implementation

{$R *.DFM}
uses Urotinas,UDM;

procedure Tqr_auditagem.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//
end;

procedure Tqr_auditagem.QuickRepBeforePrint(Sender: TCustomQuickRep;
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

procedure Tqr_auditagem.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var hora : string;
  var min:string;
  var minAnt:string;
  var minDuracao:string;
  var horaDuracao:integer;
begin
  minDuracao := '';

  if dataAnt = ADOQuery1Data.asstring then
  begin

    if horaAnt <> '' then
    begin

      hora := ADOQuery1Hora.Value;
      min   := copy(hora,4,2);
      minAnt:= copy(horaAnt,4,2);
      minDuracao := '';
      horaDuracao := 0;

      if (copy(hora,1,2) > copy(horaAnt,1,2) ) then
      begin

        if min >= minAnt then
        begin
          horaDuracao := 1;
          minDuracao := intToStr( strToInt(min) - strToInt(minAnt) );
          //minDuracao := intToStr( ( 60 - strToInt(min) ) + ( 60 - strToInt(minAnt) ) );
        end
        else
        begin
          minDuracao := intToStr( ( 60 - strToInt(minAnt) ) + ( strToInt(min) ) );

        end;
      end
      else
      begin

        minDuracao := intToStr( strToInt(min) - strToInt(minAnt) );

      end;

    end;


  end;

  qrlb_duracao.Caption := '';
  if minDuracao <> '' then
  begin
    if horaDuracao >0  then
      qrlb_duracao.Caption := intToStr(horaDuracao)+':'+urotinas.strzero(strToInt(minDuracao),2)+' hs'
    else
      qrlb_duracao.Caption := '00:'+strzero(strToInt(minDuracao),2)+' hs';
  end;

  horaAnt := ADOQuery1Hora.Value;
  dataAnt := ADOQuery1Data.asstring;

end;

end.
