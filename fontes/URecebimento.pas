unit URecebimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, DB, ADODB, Mask, DBCtrls, jpeg,
  ToolEdit, CurrEdit;

type
  Tfrm_recebimento = class(TForm)
    Panel1: TPanel;
    recibos: TADODataSet;
    dts_recibos: TDataSource;
    pn_dados: TPanel;
    recibospk_recibo: TIntegerField;
    recibospk_devedor: TIntegerField;
    recibosdata: TDateTimeField;
    reciboshora: TStringField;
    recibosvalor_liquido: TBCDField;
    recibosobservacao: TStringField;
    recibosdata_venc: TDateTimeField;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Panel3: TPanel;
    Label1: TLabel;
    edt_recibo: TEdit;
    btn_buscar: TSpeedButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    devedores: TADODataSet;
    devedorespk_devedor: TIntegerField;
    devedorespk_cliente: TIntegerField;
    devedoresCGC_CPF: TStringField;
    devedoresNome: TStringField;
    devedoresCidade: TStringField;
    devedoresUf: TStringField;
    devedoresagendado_data: TDateTimeField;
    devedoresagendado_hora: TStringField;
    devedoresvalor_divida: TFloatField;
    devedorespk_cobrador: TIntegerField;
    devedoresnomeCliente: TStringField;
    devedoresusuario: TWideStringField;
    dts_devedores: TDataSource;
    recibosdata_receb: TDateTimeField;
    reciboshora_receb: TStringField;
    recibosusuario_receb: TIntegerField;
    qry_divida: TADOQuery;
    qry_dividapk_titulo: TIntegerField;
    qry_dividamotivo_baixa: TStringField;
    qry_dividausuario_baixa: TIntegerField;
    qry_dividadata_baixa: TDateTimeField;
    recibostipo: TIntegerField;
    gb_gravar: TGroupBox;
    sb_gravarConf: TSpeedButton;
    Label10: TLabel;
    cb_tipoRecebimento: TComboBox;
    qry_evento: TADODataSet;
    qry_eventochave: TIntegerField;
    qry_eventopk_devedor: TIntegerField;
    qry_eventoData: TDateTimeField;
    qry_eventoHora: TStringField;
    qry_eventoTexto: TStringField;
    qry_eventomotivo: TIntegerField;
    qry_eventoAgendado_Data: TDateTimeField;
    qry_eventoAgendado_Tipo: TIntegerField;
    qry_eventoAgendado_Hora: TStringField;
    qry_eventoagendado_cobrador: TIntegerField;
    qry_eventomarcar_nao_localiz: TStringField;
    qry_eventoseq_arq_inclusao: TIntegerField;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Label14: TLabel;
    edt_dataPgto: TDateEdit;
    Label11: TLabel;
    SpeedButton2: TSpeedButton;
    devedorescodigo: TStringField;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    recibospk_cliente: TIntegerField;
    recibosusuario_cobrador: TIntegerField;
    recibosprincipal: TBCDField;
    recibosjuros: TBCDField;
    recibosmulta: TBCDField;
    recibosdesc_principal: TBCDField;
    recibosdesc_juros: TBCDField;
    recibosdesc_multa: TBCDField;
    recibosacres_protesto: TBCDField;
    recibosacres_honorarios: TBCDField;
    recibostaxa_retenc: TBCDField;
    recibosvalor_retenc: TBCDField;
    recibosdata_canc: TDateTimeField;
    reciboshora_canc: TStringField;
    recibosusuario_canc: TIntegerField;
    reciboschave_tabretenc: TIntegerField;
    recibosdias_atraso: TIntegerField;
    recibospk_prestcontas: TIntegerField;
    recibosbaixaparcial: TBCDField;
    recibosacordo: TIntegerField;
    recibosVrTxAdm: TBCDField;
    recibosVrTxBancaria: TBCDField;
    recibosVrTxSegVia: TBCDField;
    recibosCobJuridica: TStringField;
    recibosDescTxAdm: TBCDField;
    recibosDescTxBancaria: TBCDField;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    Label15: TLabel;
    DBEdit11: TDBEdit;
    Label16: TLabel;
    DBEdit12: TDBEdit;
    Label17: TLabel;
    DBEdit13: TDBEdit;
    Label18: TLabel;
    DBEdit14: TDBEdit;
    Label19: TLabel;
    DBEdit15: TDBEdit;
    Label20: TLabel;
    DBEdit16: TDBEdit;
    Label21: TLabel;
    DBEdit17: TDBEdit;
    Label22: TLabel;
    DBEdit18: TDBEdit;
    Label23: TLabel;
    DBEdit19: TDBEdit;
    Label24: TLabel;
    DBEdit20: TDBEdit;
    Label25: TLabel;
    DBEdit21: TDBEdit;
    Label26: TLabel;
    DBEdit22: TDBEdit;
    recibosacrescimo: TBCDField;
    Label27: TLabel;
    DBEdit23: TDBEdit;
    Label28: TLabel;
    Label29: TLabel;
    totalDesc: TCurrencyEdit;
    totalAcres: TCurrencyEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_buscarClick(Sender: TObject);
    procedure sb_gravarConfClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gravarRecebimento;
    procedure SpeedButton2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_recebimento: Tfrm_recebimento;

implementation
uses UPrincipal, UDM, URotinas;
{$R *.dfm}

procedure Tfrm_recebimento.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure Tfrm_recebimento.btn_buscarClick(Sender: TObject);
var totacres, totdesc:real;
begin


if edt_recibo.text <> '' then
begin

  recibos.Close;
  recibos.Parameters.ParamByName('recibo').value := edt_recibo.text;
  recibos.open;

  if recibos.recordCount = 0 then
  begin
    showmessage('Recibo não localizado!');
    exit;
  end;

  totacres:= 0;
  totdesc:=0;

  totacres:= totacres + recibosprincipal.asfloat;
  totacres:= totacres + recibosjuros.asfloat;
  totacres:= totacres + recibosmulta.asfloat;
  totacres:= totacres + recibosacrescimo.asfloat;
  totacres:= totacres + recibosVrTxAdm.asfloat;
  totacres:= totacres + recibosVrTxBancaria.asfloat;
  totacres:= totacres + recibosVrTxSegVia.asfloat;
  totacres:= totacres + recibosacres_honorarios.asfloat;
  totacres:= totacres + recibosacres_protesto.asfloat;

  totalAcres.Text:= FormatFloat('#,###,##0.00', totacres);

  totdesc:= totdesc + recibosdesc_principal.asfloat;
  totdesc:= totdesc + recibosdesc_juros.asfloat;
  totdesc:= totdesc + recibosdesc_multa.asfloat;
  totdesc:= totdesc + recibosDescTxAdm.asfloat;
  totdesc:= totdesc + recibosDescTxBancaria.asfloat;

  totalDesc.Text:= FormatFloat('#,###,##0.00', totdesc);


  devedores.close;
  devedores.Parameters.ParamByName('devedor').value := recibospk_devedor.asstring;
  devedores.open;

  pn_dados.Visible := true;
  gb_gravar.Visible := true;

end;

end;

procedure Tfrm_recebimento.sb_gravarConfClick(Sender: TObject);
var chave:integer;
begin

  if MessageDlg('Deseja realmente fazer este recebimento ?',
     mtConfirmation, [mbYes, mbNo],0) = mrNo then
    exit;


  if not recibos.Active then
  begin
    showmessage('Não foi pesquisado recibo para recebimento');
    exit;
  end;

  if recibos.recordCount = 0 then
  begin
    showmessage('Não foi pesquisado recibo para recebimento');
    exit;
  end;

  if edt_dataPgto.Date = 0 then
  begin
    showmessage('Não foi informada a data do pagamento deste recibo');
    exit;
  end;

  gravarRecebimento;

  showmessage('Recebimento efetuado com sucesso!');

  recibos.close;
  devedores.close;
  edt_recibo.Text := '';

  pn_dados.Visible := false;
  gb_gravar.Visible := false;


//btn_buscar.Click;

end;



procedure Tfrm_recebimento.gravarRecebimento;
var chave:integer;
begin

  qry_divida.Close;
  qry_divida.Parameters.ParamByName('devedor').Value := recibospk_devedor.asstring;
  qry_divida.Parameters.ParamByName('recibo').value :=  recibospk_recibo.asstring;
  qry_divida.open;
  if qry_divida.recordCount = 0 then
  begin
    showmessage('Não foi localizado titulos do recibo.');
    exit;
  end;

  while not qry_divida.eof do
  begin
    qry_divida.edit;
    qry_dividausuario_baixa.value := frotinas.usu_nu;
    qry_dividadata_baixa.value := edt_dataPgto.Date;
    qry_dividamotivo_baixa.value := 'PG';
    qry_divida.post;
    qry_divida.next;
  end;

  recibos.edit;
  recibosusuario_receb.value := frotinas.usu_nu;
  recibosdata_receb.Value := edt_dataPgto.Date;
  reciboshora_receb.value := FormatDateTime( 'hh:mm:ss', time);
  recibostipo.value := cb_tipoRecebimento.ItemIndex;
  recibos.post;



end;

procedure Tfrm_recebimento.FormShow(Sender: TObject);
begin
  pn_dados.Visible := false;
  gb_gravar.Visible := false;

end;

procedure Tfrm_recebimento.SpeedButton2Click(Sender: TObject);
begin

  if MessageDlg('Nesta opção será excluir recibos não baixados. Dejesa Excluir este Recibo? ',
    mtConfirmation, [mbYes, mbNo],0) = mrYes then
  begin

    if frotinas.excluirRecibos( strtofloat(edt_recibo.text),true) then
    begin
      devedores.close();
      recibos.close();
      showmessage('Excusão realizada!');
    end
    else
      showmessage('Não foi possível excluir recibo!');
  end;
  
end;

end.
