unit UFrm_Exportar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls,  Gauges,  FileCtrl, Mask, DBCtrls,
  DB, ADODB, RxLookup, ToolEdit;

type
  TFrm_Exportar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    OpenDialog1: TOpenDialog;
    gb_enviar: TGroupBox;
    Gauge_atualizando: TGauge;
    Label1: TLabel;
    Dts_cliente: TDataSource;
    lk_cliente: TRxDBLookupCombo;
    lb_mens: TLabel;
    qry_devedor: TADOQuery;
    qry_titulos: TADOQuery;
    sb_gravarConf: TSpeedButton;
    SpeedButton1: TSpeedButton;
    lb_status: TLabel;
    Memo1: TMemo;
    edt_atraso1: TDateEdit;
    edt_atraso2: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    tb_Cliente: TADOTable;
    DBEdit1: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure ExportaArquivoPadrao();
    procedure sb_gravarConfClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    F : TextFile;
  end;

var
  Frm_Exportar: TFrm_Exportar;

implementation

uses UPrincipal, UDM, URotinas,Uqr_rels, uRecebimento;

{$R *.dfm}

procedure TFrm_Exportar.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure TFrm_Exportar.ExportaArquivoPadrao();
var F,fFile : TextFile;
var linha, seqArq, data,sql:string;
var linArq, pk_devedor : integer;
begin

  if lk_cliente.KeyValue = '' then
  begin
    showmessage('Informe o Cliente');
    exit;
  end;

  sql := 'select * from titulos where pk_cliente='+lk_cliente.KeyValue;

  if (DateToStr(edt_atraso1.Date) <> '30/12/1899') then
  begin
     sql := sql + '  and vencimento >='''+FormatDateTime(frotinas.formato_data_banco(),edt_atraso1.Date)+'''';
  end;

  if (DateToStr(edt_atraso2.Date) <> '30/12/1899') then
  begin
     sql := sql + '  and vencimento <='''+FormatDateTime(frotinas.formato_data_banco(),edt_atraso2.Date)+'''';
  end;

  qry_titulos.Close;
  qry_titulos.SQL.Text := sql+ ' order by pk_devedor ';
  qry_titulos.open;

  if  qry_titulos.recordCount = 0 then
  begin
    showmessage('Não localizados titulos');
    exit;
  end;

  lb_mens.caption := 'Checando arquivo (0)';

  Memo1.Lines.Clear;
  Memo1.Lines.Add('Total de títulos '+intToStr(qry_titulos.recordCount) );


  AssignFile(f,DBEdit1.text);
  ReWrite(f);

  WriteLn(f,'00|1');

  pk_devedor := qry_titulos.fieldByName('pk_devedor').AsInteger;

  qry_devedor.close;
  qry_devedor.SQL.Text := 'select * from devedores where pk_devedor='+intToStr(pk_devedor);
  qry_devedor.open;
  // formatdateTime('DD/MM/YYYY', qry_devedor.FieldByName('data_nasc').value)

  if qry_devedor.FieldByName('data_nasc').value = null then
    data := ''
  else
     data := qry_devedor.FieldByName('data_nasc').value;

  linArq:=2;
  writeln(f,'01|'+
  qry_devedor.fieldByName('cgc_cpf').asstring+'|'+
  qry_devedor.FieldByName('nome').asstring+'|'+
  qry_devedor.FieldByName('rg').asstring+'|'+
  qry_devedor.FieldByName('orgao_rg').asstring+'|'+
  data+'|'+
  qry_devedor.FieldByName('tipo_logradouro').asstring+'|'+
  qry_devedor.FieldByName('logradouro').asstring+'|'+
  qry_devedor.FieldByName('numero').asstring+'|'+
  qry_devedor.FieldByName('bairro').asstring+'|'+
  qry_devedor.FieldByName('cidade').asstring+'|'+
  qry_devedor.FieldByName('uf').asstring+'|'+
  qry_devedor.FieldByName('complemento').asstring+'|'+
  qry_devedor.FieldByName('ponto_referencia').asstring+'|'+
  qry_devedor.FieldByName('cep').asstring+'|'+
  '|'+
  qry_devedor.FieldByName('trabalho_nome').asstring+'|'+
  qry_devedor.FieldByName('trab_logradouro').asstring+'|'+
  qry_devedor.FieldByName('trab_numero').asstring+'|'+
  qry_devedor.FieldByName('trab_bairro').asstring+'|'+
  qry_devedor.FieldByName('trab_cidade').asstring+'|'+
  qry_devedor.FieldByName('trab_uf').asstring+'|'+
  qry_devedor.FieldByName('trab_complemento').asstring+'|'+
  qry_devedor.FieldByName('trab_ponto_refer').asstring+'|'+
  qry_devedor.FieldByName('trab_cep').asstring+'|'+
  qry_devedor.FieldByName('trab_fones').asstring+'|'+
  qry_devedor.FieldByName('prim_ref_pessoal').asstring+'|'+
  qry_devedor.FieldByName('prim_ref_pessoal_fones').asstring+'|'+
  qry_devedor.FieldByName('seg_ref_pessoal').asstring+'|'+
  qry_devedor.FieldByName('seg_ref_pessoal_fones').asstring+'|'+
  intToStr(linArq)
  );

  //   formatdateTime('DD/MM/YYYY', qry_devedor.FieldByName('emissao_rg').value)+'|'+
  Gauge_atualizando.MaxValue := qry_titulos.RecordCount;
  Gauge_atualizando.Visible:=true;

  while not qry_titulos.eof do
  begin

    Gauge_atualizando.AddProgress(1);

    inc(linArq);

    if pk_devedor <> qry_titulos.fieldByName('pk_devedor').AsInteger then
    begin
      pk_devedor := qry_titulos.fieldByName('pk_devedor').AsInteger;
      qry_devedor.close;
      qry_devedor.SQL.Text := 'select * from devedores where pk_devedor='+intToStr(pk_devedor);
      qry_devedor.open;

      if qry_devedor.FieldByName('data_nasc').value = null then
        data := ''
      else
         data := qry_devedor.FieldByName('data_nasc').value;

      writeln(f,'01|'+
      qry_devedor.fieldByName('cgc_cpf').asstring+'|'+
      qry_devedor.FieldByName('nome').asstring+'|'+
      qry_devedor.FieldByName('rg').asstring+'|'+
      qry_devedor.FieldByName('orgao_rg').asstring+'|'+
      data+'|'+ //
      qry_devedor.FieldByName('tipo_logradouro').asstring+'|'+
      qry_devedor.FieldByName('logradouro').asstring+'|'+
      qry_devedor.FieldByName('numero').asstring+'|'+
      qry_devedor.FieldByName('bairro').asstring+'|'+
      qry_devedor.FieldByName('cidade').asstring+'|'+
      qry_devedor.FieldByName('uf').asstring+'|'+
      qry_devedor.FieldByName('complemento').asstring+'|'+
      qry_devedor.FieldByName('ponto_referencia').asstring+'|'+
      qry_devedor.FieldByName('cep').asstring+'|'+
      '|'+
      qry_devedor.FieldByName('trabalho_nome').asstring+'|'+
      qry_devedor.FieldByName('trab_logradouro').asstring+'|'+
      qry_devedor.FieldByName('trab_numero').asstring+'|'+
      qry_devedor.FieldByName('trab_bairro').asstring+'|'+
      qry_devedor.FieldByName('trab_cidade').asstring+'|'+
      qry_devedor.FieldByName('trab_uf').asstring+'|'+
      qry_devedor.FieldByName('trab_complemento').asstring+'|'+
      qry_devedor.FieldByName('trab_ponto_refer').asstring+'|'+
      qry_devedor.FieldByName('trab_cep').asstring+'|'+
      qry_devedor.FieldByName('trab_fones').asstring+'|'+
      qry_devedor.FieldByName('prim_ref_pessoal').asstring+'|'+
      qry_devedor.FieldByName('prim_ref_pessoal_fones').asstring+'|'+
      qry_devedor.FieldByName('seg_ref_pessoal').asstring+'|'+
      qry_devedor.FieldByName('seg_ref_pessoal_fones').asstring+'|'+
      intToStr(linArq) );

      inc(linArq);

    end;

    writeln(f,'02|'+
    qry_titulos.fieldbyname('tipo_titulo').asstring+'|'+
    qry_titulos.fieldbyname('chave_contrato').asstring+'|'+
    qry_titulos.fieldbyname('numero_titulo').asstring+'|'+
    qry_titulos.fieldbyname('banco').asstring+'|'+
    qry_titulos.fieldbyname('nome_banco').asstring+'|'+
    qry_titulos.fieldbyname('agencia').asstring+'|'+
    qry_titulos.fieldbyname('conta').asstring+'|'+
    qry_titulos.fieldbyname('praca_cheque').asstring+'|'+
    qry_titulos.fieldbyname('alinea_devol').asstring+'|'+
    qry_titulos.fieldbyname('endossado_cpf').asstring+'|'+
    qry_titulos.fieldbyname('endossado').asstring+'|'+
    formatdateTime('DD/MM/YYYY', qry_titulos.fieldbyname('emissao').value)+'|'+
    formatdateTime('DD/MM/YYYY', qry_titulos.fieldbyname('vencimento').value)+'|'+
    qry_titulos.fieldbyname('valor_principal').asstring+'|'+
    intToStr(linArq));

    qry_titulos.next;

  end;

  inc(linArq);

  writeln(f,'99|'+intToStr(linArq));

  CloseFile(f);


end;


procedure TFrm_Exportar.sb_gravarConfClick(Sender: TObject);
begin

tb_cliente.Locate('pk_cliente', lk_cliente.KeyValue , []);
lb_status.caption := 'Checando...';

if DBEdit1.Text = '' then
begin
  showmessage('Não foi informado o nome do arquivo');
  exit
end;

if lk_cliente.KeyValue = '' then
begin
  showmessage('Informe o Cliente');
  exit;
end;


exportaArquivoPadrao();

end;

procedure TFrm_Exportar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure TFrm_Exportar.FormShow(Sender: TObject);
begin
tb_cliente.Open;
end;

procedure TFrm_Exportar.SpeedButton2Click(Sender: TObject);
var linArq:integer;
begin
  Application.CreateForm(Tqr_rels, qr_rels);
  qr_rels.qrlb_titulo.caption := 'ERROS NA CARGA DOS ARQUIVOS';

  qr_rels.QRMemo1.Lines.clear;
  linArq:=0;
  while linArq < Memo1.Lines.Count do
  begin
    qr_rels.QRMemo1.Lines.Add( Memo1.Lines[linArq] );
    inc(linArq);
  end;
  qr_rels.preview;
  qr_rels.destroy;

end;




end.
