unit UFrm_Transferir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls,  Gauges,  FileCtrl, Mask, DBCtrls,
  DB, ADODB, RxLookup, Grids, DBGrids, ToolEdit;

type
  TFrm_Transferir = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    OpenDialog1: TOpenDialog;
    Dts_cliente: TDataSource;
    qry_devedor: TADOQuery;
    usuarios: TADOTable;
    dts_usuarios: TDataSource;
    qry_temp: TADOQuery;
    Panel4: TPanel;
    Label1: TLabel;
    lk_cliente: TRxDBLookupCombo;
    Label3: TLabel;
    cb_cobrador: TRxDBLookupCombo;
    cb_cobradorDest: TRxDBLookupCombo;
    Label5: TLabel;
    Gauge_atualizando: TGauge;
    lb_mens: TLabel;
    dts_devedor: TDataSource;
    DBGrid1: TDBGrid;
    qry_devedorCGC_CPF: TStringField;
    qry_devedorNome: TStringField;
    qry_devedorpk_devedor: TIntegerField;
    qry_devedorpk_cobrador: TIntegerField;
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
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label48: TLabel;
    Label61: TLabel;
    Label70: TLabel;
    edt_fx1: TEdit;
    edt_fx2: TEdit;
    edt_atraso1: TDateEdit;
    edt_atraso2: TDateEdit;
    GroupBox1: TGroupBox;
    sb_Buscar: TSpeedButton;
    lb_total: TLabel;
    btn_transferir: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Gauge1: TGauge;
    Label2: TLabel;
    edt_tipotitulo: TEdit;
    cb_naoacionados: TCheckBox;
    edt_qtde: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    cpf_devedor: TEdit;
    tb_cliente: TADOQuery;
    procedure SpeedButton1Click(Sender: TObject);
    procedure sb_PesquisarArquivosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lk_clienteExit(Sender: TObject);
    procedure sb_BuscarClick(Sender: TObject);
    procedure btn_transferirClick(Sender: TObject);
    procedure edt_fx1Exit(Sender: TObject);
    procedure edt_fx2Exit(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    F : TextFile;
  end;

var
  Frm_Transferir: TFrm_Transferir;

implementation

uses UPrincipal, UDM, URotinas;

{$R *.dfm}

procedure TFrm_Transferir.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure TFrm_Transferir.sb_PesquisarArquivosClick(Sender: TObject);
begin
OpenDialog1.InitialDir := 'C:\';
OpenDialog1.Execute;
end;




procedure TFrm_Transferir.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure TFrm_Transferir.FormShow(Sender: TObject);
begin
tb_cliente.Open;
usuarios.Open;
end;

procedure TFrm_Transferir.lk_clienteExit(Sender: TObject);
begin
//qry_devedor.Close;
//qry_devedor.Parameters.ParamByName('cliente').value := lk_cliente.KeyValue;
//qry_devedor.open;

end;

procedure TFrm_Transferir.sb_BuscarClick(Sender: TObject);
var sql:string;
var conta,total:integer;
begin

if lk_cliente.KeyValue = null then
begin
  showmessage('N�o foi informado o Cliente');
  exit;
end;
if cb_cobrador.KeyValue = null then
begin
  showmessage('N�o foi informado o Cobrador origem');
  exit;
end;
if cb_cobradordest.KeyValue = null then
begin
  showmessage('N�o foi informado o Cobrador destino');
  exit;
end;

{
select d.*
from devedores d
where d.pk_cliente=:cliente and d.pk_cobrador = :cobrador
and exists( select 1 from titulos t where t.pk_devedor = d.pk_devedor and t.data_baixa is null )
}

sql := 'select d.* ';
sql := sql + 'from devedores d ';
sql := sql + 'where d.pk_cliente='+IntToStr(lk_cliente.KeyValue)+' and d.pk_cobrador ='+intToStr(cb_cobrador.KeyValue);
if cb_naoacionados.Checked then
  sql := sql + 'and d.motivo_dialogo is null ';

if cpf_devedor.text <> '' then
  sql := sql + 'and d.CGC_CPF='''+cpf_devedor.text+''' ';


sql := sql + 'and exists( select 1 from titulos t where t.pk_devedor = d.pk_devedor and t.data_baixa is null ';


if edt_tipotitulo.text <> '' then
  sql := sql + 'and t.tipo_titulo = '''+edt_tipotitulo.text+'''';


if (DateToStr(edt_atraso1.Date) <> '30/12/1899') or ( DateToStr(edt_atraso2.Date) <> '30/12/1899' ) then
begin

  if (DateToStr(edt_atraso1.Date) <> '30/12/1899') then
  begin
     sql := sql + '  and t.vencimento >='''+FormatDateTime(frotinas.formato_data_banco(),edt_atraso1.Date)+'''';
  end;

  if DateToStr(edt_atraso2.Date) <> '30/12/1899' then
  begin
     sql := sql + ' and t.vencimento <='''+FormatDateTime(frotinas.formato_data_banco(),edt_atraso2.Date)+'''';
  end;

end;

sql := sql + ') ';
qry_devedor.close;
qry_devedor.SQL.Text := sql;
qry_devedor.open;

lb_total.caption := inttostr(qry_devedor.recordCount)+' devedores ';
lb_total.visible := true;
btn_transferir.Enabled := true;

{
  if qry_devedor.recordCount = 0  then
  begin
    showmessage('N�o localizado devedores a distribuir do cliente');
    exit;
  end;

  Gauge_atualizando.MinValue := 0;
  Gauge_atualizando.MaxValue := qry_devedor.recordCount;
  Gauge_atualizando.Visible := true;

  total:= strToInt(edt_qtde.text);
  conta := 0;
  qry_devedor.first;
  while not qry_devedor.eof do
  begin
    Gauge_atualizando.AddProgress(1);
    qry_temp.close;
    qry_temp.SQL.Text := 'select sum(valor_titulo) as valor from titulos where pk_devedor = '+qry_devedorpk_devedor.asstring;
    qry_temp.open;

    qry_devedor.edit;
    qry_devedorvalor_divida.value := qry_temp.FieldByName('valor').asFloat;
    qry_devedorpk_cobrador.value := cb_cobrador.KeyValue;
    qry_devedor.post;

    inc(conta);

    if (total>0) and (total<conta ) then
      qry_devedor.last;

    qry_devedor.next;
  end;
}
end;

procedure TFrm_Transferir.btn_transferirClick(Sender: TObject);
var chave,conta,total:integer;
var continua:boolean;
begin

  if MessageDlg('Confirma transfer�ncia do Cobrador? ',
     mtConfirmation, [mbYes, mbNo],0) = mrNo then
  begin
     exit;
  end;

  Gauge_atualizando.MinValue := 0;
  Gauge_atualizando.MaxValue := qry_devedor.recordCount;
  Gauge_atualizando.Visible := true;

  qry_evento.Close;
  qry_evento.open;


  total:= qry_devedor.recordCount;
  conta := 0;
  continua:=true;

  qry_devedor.first;
  while not qry_devedor.eof and continua do
  begin
    Gauge_atualizando.AddProgress(1);

    chave := frotinas.Sequencial('eventos');

    qry_evento.append;
    qry_eventochave.value := chave;
    qry_eventopk_devedor.value := qry_devedorpk_devedor.value;
    qry_eventoData.value :=  Date;
    qry_eventoHora.value := FormatDateTime( 'hh:mm:ss', time);
    qry_eventoTexto.Value := 'Transfer�ncia do Cobrador '+cb_cobrador.text;
    qry_evento.post;

    qry_devedor.edit;
    qry_devedorpk_cobrador.value := cb_cobradorDest.KeyValue;
    qry_devedor.post;

    inc(conta);
    if edt_qtde.Text <> '' then
    begin
        if conta >= strToInt(edt_qtde.Text) then
          continua:=false;
    end;

    qry_devedor.next;
  end;

  showmessage('Transfer�ncia gravada.');
  qry_devedor.close;
  Gauge_atualizando.visible := true;
end;

procedure TFrm_Transferir.edt_fx1Exit(Sender: TObject);
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

procedure TFrm_Transferir.edt_fx2Exit(Sender: TObject);
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

end.
