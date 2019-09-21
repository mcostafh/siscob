unit UFrm_RateiaRecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls,  Gauges,  FileCtrl, Mask, DBCtrls,
  DB, ADODB, RxLookup, ToolEdit;

type
  TFrm_RateiaRecibo = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    sb_gravarConf: TSpeedButton;
    Panel2: TPanel;
    OpenDialog1: TOpenDialog;
    Gauge_atualizando: TGauge;
    Label1: TLabel;
    tb_cliente: TADOTable;
    Dts_cliente: TDataSource;
    lk_cliente: TRxDBLookupCombo;
    lb_mens: TLabel;
    qry_recibos: TADOQuery;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    lb_total: TLabel;
    qry_temp: TADOQuery;
    edt_recibo: TEdit;
    Label5: TLabel;
    btn_buscar: TSpeedButton;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label48: TLabel;
    Label61: TLabel;
    Label70: TLabel;
    edt_fx1: TEdit;
    edt_fx2: TEdit;
    edt_atraso1: TDateEdit;
    edt_atraso2: TDateEdit;
    SpeedButton1: TSpeedButton;
    qry_recibospk_recibo: TIntegerField;
    qry_recibospk_devedor: TIntegerField;
    qry_recibosdata: TDateTimeField;
    qry_reciboshora: TStringField;
    qry_recibospk_cliente: TIntegerField;
    qry_recibosusuario_cobrador: TIntegerField;
    qry_recibosprincipal: TBCDField;
    qry_recibosjuros: TBCDField;
    qry_recibosmulta: TBCDField;
    qry_recibosdesc_principal: TBCDField;
    qry_recibosdesc_juros: TBCDField;
    qry_recibosdesc_multa: TBCDField;
    qry_recibosacres_protesto: TBCDField;
    qry_recibosacres_honorarios: TBCDField;
    qry_recibosvalor_liquido: TBCDField;
    qry_recibostaxa_retenc: TBCDField;
    qry_recibosvalor_retenc: TBCDField;
    qry_recibosdata_receb: TDateTimeField;
    qry_reciboshora_receb: TStringField;
    qry_recibosusuario_receb: TIntegerField;
    qry_recibosdata_canc: TDateTimeField;
    qry_reciboshora_canc: TStringField;
    qry_recibosusuario_canc: TIntegerField;
    qry_recibosobservacao: TStringField;
    qry_recibosdata_venc: TDateTimeField;
    qry_recibostipo: TIntegerField;
    qry_reciboschave_tabretenc: TIntegerField;
    qry_recibosdias_atraso: TIntegerField;
    qry_recibospk_prestcontas: TIntegerField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure sb_PesquisarArquivosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sb_gravarConfClick(Sender: TObject);
    procedure btn_buscarClick(Sender: TObject);
    procedure edt_fx1Exit(Sender: TObject);
    procedure edt_fx2Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }

  public
    { Public declarations }
    F : TextFile;
  end;

var
  Frm_RateiaRecibo: TFrm_RateiaRecibo;

implementation

uses UPrincipal, UDM, URotinas;

{$R *.dfm}

procedure TFrm_RateiaRecibo.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure TFrm_RateiaRecibo.sb_PesquisarArquivosClick(Sender: TObject);
begin
OpenDialog1.InitialDir := 'C:\';
OpenDialog1.Execute;
end;




procedure TFrm_RateiaRecibo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure TFrm_RateiaRecibo.FormShow(Sender: TObject);
begin
tb_cliente.Open;
end;

procedure TFrm_RateiaRecibo.sb_gravarConfClick(Sender: TObject);
var conta,total:integer;
var dif,pjuros, pmulta,pprincipal, liquido, pliquido, tdesc_juros, tdesc_multa, tdesc_principal, tdesc_acrescimo, tliquido, tretencao ,tacrescimo: real;
begin


  if frotinas.Qry_Livre.recordCount = 0  then
  begin
    showmessage('Não localizado recibos do cliente');
    exit;
  end;

  Gauge_atualizando.MinValue := 0;
  Gauge_atualizando.MaxValue := frotinas.Qry_Livre.recordCount;
  Gauge_atualizando.Visible := true;


  conta := 0;
  frotinas.Qry_Livre.first;
  while not frotinas.Qry_Livre.eof do
  begin
    Gauge_atualizando.AddProgress(1);

    frotinas.rateiaRecibo;

    inc(conta);


    frotinas.Qry_Livre.next;
  end;

end;

procedure TFrm_RateiaRecibo.btn_buscarClick(Sender: TObject);
var sql:string;
begin

  if lk_cliente.KeyValue = 0 then
  begin
    showmessage('Não foi informado o cliente.');
    exit
  end;


  sql := 'select r.* from recibos r where r.pk_cliente='+intTostr(lk_cliente.KeyValue);

  if edt_recibo.Text <> '' then
    sql := sql + ' and r.pk_recibo='+edt_recibo.Text;

  if (DateToStr(edt_atraso1.Date) <> '30/12/1899') or ( DateToStr(edt_atraso2.Date) <> '30/12/1899' ) then
  begin

    if (DateToStr(edt_atraso1.Date) <> '30/12/1899') then
    begin
       sql := sql + '  and r.data >='''+FormatDateTime(frotinas.formato_data_banco(),edt_atraso1.Date)+'''';
    end;

    if DateToStr(edt_atraso2.Date) <> '30/12/1899' then
    begin
       sql := sql + ' and r.data <='''+FormatDateTime(frotinas.formato_data_banco(),edt_atraso2.Date)+'''';
    end;


  end;


  frotinas.Qry_Livre.close;
  frotinas.Qry_Livre.CommandText := sql;
  frotinas.Qry_Livre.open;

  //qry_recibos.Close;
  //qry_recibos.SQL.Text := sql;
  //qry_recibos.open;
  lb_total.caption := intToStr(frotinas.Qry_Livre.recordCount);

end;

procedure TFrm_RateiaRecibo.edt_fx1Exit(Sender: TObject);
var hj:TDatetime;
begin

if edt_fx1.Text <> '' then
begin
  hj:= Date;
  edt_atraso1.Date := hj - StrToInt(edt_fx1.Text);
end
else
  edt_atraso1.text := '';

end;

procedure TFrm_RateiaRecibo.edt_fx2Exit(Sender: TObject);
var hj:TDatetime;
begin

if edt_fx2.Text <> '' then
begin
  hj:= Date;
  edt_atraso2.Date := hj - StrToInt(edt_fx2.Text);
end
else
  edt_atraso2.text := '';

end;

procedure TFrm_RateiaRecibo.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
      begin
         key := #0;
         PerForm (cm_dialogKey,vk_tab,0);
      end;
{Trocando Virgula por Ponto}
if Key in [',','.'] then
  Key := DecimalSeparator;

end;

end.
