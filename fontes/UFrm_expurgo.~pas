unit UFrm_expurgo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls,  Gauges,  FileCtrl, Mask, DBCtrls,
  DB, ADODB, RxLookup;

type
  Tfrm_expurgo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Gauge_atualizando: TGauge;
    Label1: TLabel;
    lk_cliente: TRxDBLookupCombo;
    lb_mens: TLabel;
    qry_devedor: TADOQuery;
    qry_titulos: TADOQuery;
    telefones: TADODataSet;
    telefonesid: TIntegerField;
    telefonespk_devedor: TIntegerField;
    telefonestipo_fone: TStringField;
    telefonesTelefone: TStringField;
    recibos: TADODataSet;
    recibospk_recibo: TIntegerField;
    recibospk_devedor: TIntegerField;
    recibosdata: TDateTimeField;
    reciboshora: TStringField;
    recibostipo: TIntegerField;
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
    recibosvalor_liquido: TBCDField;
    recibostaxa_retenc: TBCDField;
    recibosvalor_retenc: TBCDField;
    recibosdata_receb: TDateTimeField;
    reciboshora_receb: TStringField;
    recibosusuario_receb: TIntegerField;
    recibosdata_canc: TDateTimeField;
    reciboshora_canc: TStringField;
    recibosusuario_canc: TIntegerField;
    recibosobservacao: TStringField;
    recibosdata_venc: TDateTimeField;
    sb_gravarConf: TSpeedButton;
    SpeedButton1: TSpeedButton;
    cliente: TADODataSet;
    tb_cliente: TADOTable;
    Dts_cliente: TDataSource;
    taxas: TADODataSet;
    qry_evento: TADODataSet;
    cb_expurgafinanceira: TCheckBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sb_gravarConfClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    F : TextFile;
  end;

var
  frm_expurgo: Tfrm_expurgo;

implementation

uses UPrincipal, UDM, URotinas;

{$R *.dfm}

procedure Tfrm_expurgo.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure Tfrm_expurgo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure Tfrm_expurgo.sb_gravarConfClick(Sender: TObject);
var conta,total:integer;
begin
if lk_cliente.KeyValue = 0 then
begin
  showmessage('Não foi informado o cliente');
  exit;
end;

qry_devedor.Close;
qry_devedor.Parameters.ParamByName('cliente').value := lk_cliente.KeyValue;
qry_devedor.open;

if qry_devedor.recordCount = 0 then
begin
  showmessage('Não foi localizado nenhum Devedor neste cliente');
  exit;
end;

Gauge_atualizando.MinValue := 0;
Gauge_atualizando.MaxValue := qry_devedor.recordCount;
Gauge_atualizando.Visible := true;

conta := 0;
total := qry_devedor.recordCount;

while (not qry_devedor.eof) do
begin

  conta := conta + 1;
  Gauge_atualizando.AddProgress(1);

  if not cb_expurgafinanceira.Checked then
  begin

    telefones.close;
    telefones.Parameters.ParamByName('devedor').value := qry_devedor.fieldByName('pk_devedor').value;
    telefones.open;

    while (not telefones.eof) do
    begin
      telefones.delete;
    end;

  end;

  qry_titulos.close;
  qry_titulos.Parameters.ParamByName('devedor').value := qry_devedor.fieldByName('pk_devedor').value;
  qry_titulos.open;
  while (not qry_titulos.eof) do
  begin
    qry_titulos.delete;
  end;

  if not cb_expurgafinanceira.Checked then
  begin
    qry_evento.close;
    qry_evento.Parameters.ParamByName('devedor').value := qry_devedor.fieldByName('pk_devedor').value;
    qry_evento.open;
    while (not qry_evento.eof) do
    begin
        qry_evento.delete;
    end;
  end;

  recibos.close;
  recibos.Parameters.ParamByName('devedor').value := qry_devedor.fieldByName('pk_devedor').value;
  recibos.open;
  while (not recibos.eof) do
  begin
      recibos.delete;
  end;

  if not cb_expurgafinanceira.Checked then
  begin
      taxas.Close;
      taxas.Parameters.ParamByName('cliente').value := lk_cliente.KeyValue;
      taxas.open;
      while (not taxas.eof) do
      begin
        taxas.delete;
      end;
  end;

  if not cb_expurgafinanceira.Checked then
      qry_devedor.delete
  else
      qry_devedor.next;

  end;

  if not cb_expurgafinanceira.Checked then
  begin
    cliente.Close;
    cliente.Parameters.ParamByName('cliente').value := lk_cliente.KeyValue;
    cliente.open;
    cliente.delete;
  end;

  showmessage('Expurgo concluído.');


end;

procedure Tfrm_expurgo.FormShow(Sender: TObject);
begin
tb_cliente.Open;
end;

end.
