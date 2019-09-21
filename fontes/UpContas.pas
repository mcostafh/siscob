unit UpContas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB;

type
  Tqr_pcontas = class(TQuickRep)
    ADOQuery1: TADOQuery;
    ADOQuery1pk_prestcontas: TIntegerField;
    ADOQuery1data: TDateTimeField;
    ADOQuery1pk_cliente: TIntegerField;
    ADOQuery1principal: TBCDField;
    ADOQuery1juros: TBCDField;
    ADOQuery1multa: TBCDField;
    ADOQuery1descjuros: TBCDField;
    ADOQuery1descmulta: TBCDField;
    ADOQuery1descprincipal: TBCDField;
    ADOQuery1pdescjuros: TBCDField;
    ADOQuery1pdescmulta: TBCDField;
    ADOQuery1acrescimos: TBCDField;
    ADOQuery1retencao: TBCDField;
    ADOQuery1liquido: TBCDField;
    ADOQuery1pk_titulo: TIntegerField;
    ADOQuery1pk_devedor: TIntegerField;
    ADOQuery1pk_cliente_1: TIntegerField;
    ADOQuery1nome_banco: TStringField;
    ADOQuery1Banco: TStringField;
    ADOQuery1Agencia: TStringField;
    ADOQuery1Conta: TStringField;
    ADOQuery1Cheque: TStringField;
    ADOQuery1Endossado: TStringField;
    ADOQuery1Endossado_CPF: TStringField;
    ADOQuery1emissao: TDateTimeField;
    ADOQuery1Vencimento: TDateTimeField;
    ADOQuery1venc_ult_extrato: TDateTimeField;
    ADOQuery1dias_atraso_remessa: TIntegerField;
    ADOQuery1Valor_titulo: TFloatField;
    ADOQuery1valor_principal: TFloatField;
    ADOQuery1pagamento_minimo: TFloatField;
    ADOQuery1perc_taxa_mes_fin: TFloatField;
    ADOQuery1perc_taxa_mes_juros: TFloatField;
    ADOQuery1perc_taxa_multa: TFloatField;
    ADOQuery1valor_avencer_remessa: TFloatField;
    ADOQuery1motivo_baixa: TStringField;
    ADOQuery1usuario_baixa: TIntegerField;
    ADOQuery1data_baixa: TDateTimeField;
    ADOQuery1tipo_titulo: TStringField;
    ADOQuery1Agenda_Data: TDateTimeField;
    ADOQuery1Agenda_Hora: TStringField;
    ADOQuery1Agenda_Tipo: TStringField;
    ADOQuery1usuario_inclusao: TIntegerField;
    ADOQuery1Data_inclusao: TDateTimeField;
    ADOQuery1chave_contrato: TIntegerField;
    ADOQuery1chave_titulo: TIntegerField;
    ADOQuery1chave_avalista: TIntegerField;
    ADOQuery1numero_titulo: TStringField;
    ADOQuery1praca_cheque: TStringField;
    ADOQuery1alinea_devol: TStringField;
    ADOQuery1seq_arq_inclusao: TIntegerField;
    ADOQuery1seq_arq_baixa: TIntegerField;
    ADOQuery1pk_recibo: TIntegerField;
    ADOQuery1atu_data: TDateTimeField;
    ADOQuery1atu_juros: TBCDField;
    ADOQuery1atu_multa: TBCDField;
    ADOQuery1atu_percjuro: TBCDField;
    ADOQuery1atu_percmulta: TBCDField;
    ADOQuery1atu_retencao: TBCDField;
    ADOQuery1atu_valor: TBCDField;
    ADOQuery1atualizar: TStringField;
    ADOQuery1pk_recibo_1: TIntegerField;
    ADOQuery1pk_devedor_1: TIntegerField;
    ADOQuery1data_1: TDateTimeField;
    ADOQuery1hora: TStringField;
    ADOQuery1tipo: TIntegerField;
    ADOQuery1pk_cliente_2: TIntegerField;
    ADOQuery1usuario_cobrador: TIntegerField;
    ADOQuery1principal_1: TBCDField;
    ADOQuery1juros_1: TBCDField;
    ADOQuery1multa_1: TBCDField;
    ADOQuery1desc_principal: TBCDField;
    ADOQuery1desc_juros: TBCDField;
    ADOQuery1desc_multa: TBCDField;
    ADOQuery1acres_protesto: TBCDField;
    ADOQuery1acres_honorarios: TBCDField;
    ADOQuery1valor_liquido: TBCDField;
    ADOQuery1taxa_retenc: TBCDField;
    ADOQuery1chave_tabretenc: TIntegerField;
    ADOQuery1valor_retenc: TBCDField;
    ADOQuery1data_receb: TDateTimeField;
    ADOQuery1hora_receb: TStringField;
    ADOQuery1usuario_receb: TIntegerField;
    ADOQuery1data_canc: TDateTimeField;
    ADOQuery1hora_canc: TStringField;
    ADOQuery1usuario_canc: TIntegerField;
    ADOQuery1observacao: TStringField;
    ADOQuery1data_venc: TDateTimeField;
    ADOQuery1pk_prestcontas_1: TIntegerField;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape8: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel34: TQRLabel;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
  private

  public

  end;

var
  qr_pcontas: Tqr_pcontas;

implementation

{$R *.DFM}
uses UDM;

end.
 