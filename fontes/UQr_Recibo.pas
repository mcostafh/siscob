unit UQr_Recibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, ADODB;

type
  TQr_Recibo = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    qrlb_tipo: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRShape4: TQRShape;
    qrlb_empresa: TQRLabel;
    QRImage2: TQRImage;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    lbValor: TQRLabel;
    QRLabel2: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    ADOQuery1: TADOQuery;
    ADOQuery1pk_titulo: TIntegerField;
    ADOQuery1pk_devedor: TIntegerField;
    ADOQuery1pk_cliente: TIntegerField;
    ADOQuery1nome_banco: TStringField;
    ADOQuery1Banco: TStringField;
    ADOQuery1Agencia: TStringField;
    ADOQuery1Conta: TStringField;
    ADOQuery1Cheque: TStringField;
    ADOQuery1emissao: TDateTimeField;
    ADOQuery1Vencimento: TDateTimeField;
    ADOQuery1Valor_titulo: TFloatField;
    ADOQuery1valor_principal: TFloatField;
    ADOQuery1tipo_titulo: TStringField;
    ADOQuery1praca_cheque: TStringField;
    ADOQuery1pk_recibo: TIntegerField;
    empresa: TADOTable;
    empresanome: TStringField;
    qrlb_cnpj: TQRLabel;
    empresacnpj: TStringField;
    QRLabel13: TQRLabel;
    qrmemo_titulos: TQRMemo;
    qrlb_numero: TQRLabel;
    QRLabel15: TQRLabel;
    qrlb_empresa2: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qrlb_numero2: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel20: TQRLabel;
    lbValor2: TQRLabel;
    qrmemo_titulos2: TQRMemo;
    QRShape1: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    qrlb_empresa3: TQRLabel;
    QRLabel23: TQRLabel;
    qrlb_numero3: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel26: TQRLabel;
    lbValor3: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText9: TQRDBText;
    qrmemo_titulos3: TQRMemo;
    qry_recibo: TADOQuery;
    qry_recibopk_recibo: TIntegerField;
    qry_recibopk_devedor: TIntegerField;
    qry_recibodata: TDateTimeField;
    qry_recibohora: TStringField;
    qry_recibotipo: TIntegerField;
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
    qry_recibochave_tabretenc: TIntegerField;
    qry_recibovalor_retenc: TBCDField;
    qry_recibodata_receb: TDateTimeField;
    qry_recibohora_receb: TStringField;
    qry_recibousuario_receb: TIntegerField;
    qry_recibodata_canc: TDateTimeField;
    qry_recibohora_canc: TStringField;
    qry_recibousuario_canc: TIntegerField;
    qry_reciboobservacao: TStringField;
    qry_recibodata_venc: TDateTimeField;
    qry_recibopk_prestcontas: TIntegerField;
    qry_recibodias_atraso: TIntegerField;
    QRLabel24: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    ADOQuery1numero_titulo: TStringField;
    qry_recibobaixaparcial: TBCDField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qr_Recibo: TQr_Recibo;

implementation
uses URotinas,uCons_cobranca,UDM;

{$R *.dfm}

procedure TQr_Recibo.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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

lbValor.caption := FormatFloat('R$ ###,###,##0.00',frm_cons_cobranca.recibos.fieldbyname('valor_liquido').asfloat) ;
lbValor2.caption := FormatFloat('R$ ###,###,##0.00',frm_cons_cobranca.recibos.fieldbyname('valor_liquido').asfloat) ;
lbValor3.caption := FormatFloat('R$ ###,###,##0.00',frm_cons_cobranca.recibos.fieldbyname('valor_liquido').asfloat) ;

QRMemo1.Lines.text := '';
QRMemo1.Lines.Add( urotinas.PadrAsteristico (urotinas.Extenso(frm_cons_cobranca.recibos.fieldbyname('valor_liquido').asfloat) ,90)  );

ADOQuery1.close;
ADOQuery1.Parameters.ParamByName('recibo').value := frm_cons_cobranca.recibospk_recibo.value;
ADOQuery1.open;

qrmemo_titulos.Lines.Clear;
while not ADOQuery1.eof do
begin
  qrmemo_titulos.Lines.add( 'N. Titulo: '+ADOQuery1numero_titulo.value+' Emissão: '+FormatDateTime('dd/mm/YYYY',ADOQuery1emissao.value)+' Vencimento: '+
  FormatDateTime('dd/mm/YYYY',ADOQuery1vencimento.value)+' Tipo: '+ADOQuery1tipo_titulo.asstring +' Principal: '+FormatFloat('###,###,##0.00',ADOQuery1valor_principal.value)+
  ' Bco/Age/Cta/Cheque: '+ADOQuery1Banco.Value+'/'+ADOQuery1Agencia.Value+'/'+ADOQuery1Conta.value+'/'+ADOQuery1Cheque.value );
  ADOQuery1.next;
end;


qry_recibo.close;
qry_recibo.Parameters.ParamByName('recibo').value := ADOQuery1pk_recibo.value;
qry_recibo.open;

qrmemo_titulos2.Lines.Text := 'Principal: '+FormatFloat('###,###,##0.00',qry_reciboprincipal.value)+
                              ' Juros: '+FormatFloat('###,###,##0.00',qry_recibojuros.value)+
                              ' Multa: '+FormatFloat('###,###,##0.00',qry_recibomulta.value)+
                              ' Honorários: '+FormatFloat('###,###,##0.00',qry_reciboacres_honorarios.value)+
                              ' Protesto: '+FormatFloat('###,###,##0.00',qry_reciboacres_protesto.value)+
                              ' Desc Princ: '+FormatFloat('###,###,##0.00',qry_recibodesc_principal.value)+
                              ' Desc Juros: '+FormatFloat('###,###,##0.00',qry_recibodesc_juros.value)+
                              ' Desc Multa: '+FormatFloat('###,###,##0.00',qry_recibodesc_multa.value)+
                              ' Bx Parcial: '+FormatFloat('###,###,##0.00',qry_recibobaixaparcial.value)+
                              ' Valor Recebido: '+FormatFloat('###,###,##0.00',qry_recibovalor_liquido.value)+
                              ' Valor Retenção: '+FormatFloat('###,###,##0.00',qry_recibovalor_retenc.value)+
                              ' Valor Repasse: '+FormatFloat('###,###,##0.00',qry_recibovalor_liquido.value - qry_recibovalor_retenc.value);



qrmemo_titulos3.Lines.Text := qrmemo_titulos2.Lines.Text;

empresa.Open;
qrlb_empresa.caption := empresanome.value;
qrlb_cnpj.caption := empresacnpj.value;

qrlb_empresa2.Caption := empresanome.value;
qrlb_empresa3.Caption := empresanome.value;

qrlb_numero.caption := urotinas.StrZero(ADOQuery1pk_recibo.value,6);
qrlb_numero2.caption:= qrlb_numero.caption;
qrlb_numero3.caption:= qrlb_numero.caption;



end;

end.
