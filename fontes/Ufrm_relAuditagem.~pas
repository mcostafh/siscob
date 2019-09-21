unit Ufrm_relAuditagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, RxLookup, DB, ADODB, Buttons,
  Gauges, Grids, DBGrids, FileCtrl, RXCtrls, jpeg;

type
  Tfrm_RelAuditagem = class(TForm)
    Panel1: TPanel;
    Dts_cliente: TDataSource;
    DataSource1: TDataSource;
    dts_clientes: TDataSource;
    Panel2: TPanel;
    lb_mens: TLabel;
    usuarios: TADOTable;
    dts_usuarios: TDataSource;
    cb_cobrador: TRxDBLookupCombo;
    Label3: TLabel;
    lk_cliente: TRxDBLookupCombo;
    Label1: TLabel;
    qry_rel: TADODataSet;
    Gauge_atualizando: TGauge;
    qry_aux: TADOQuery;
    qry_reljob: TIntegerField;
    qry_relnome_campo: TStringField;
    qry_relvalor: TBCDField;
    qry_reldescricao: TStringField;
    ADOCommand1: TADOCommand;
    qry_relcategoria: TStringField;
    DataSource2: TDataSource;
    qry_relchave: TIntegerField;
    qry_reltag_1: TStringField;
    qry_reltag_2: TStringField;
    qry_reltag_3: TStringField;
    qry_reltag_4: TStringField;
    qry_reltag_5: TStringField;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    dt_inicial: TDateEdit;
    dt_final: TDateEdit;
    GroupBox21: TGroupBox;
    RxCheckList_ocorr: TRxCheckListBox;
    qry_ocorr: TADOQuery;
    qry_ocorrpk_ocorr: TIntegerField;
    qry_ocorrnome: TWideStringField;
    qry_ocorrtipo: TWideStringField;
    Label5: TLabel;
    edt_cpf: TEdit;
    Image1: TImage;
    Label14: TLabel;
    Label6: TLabel;
    cb_ordenar: TComboBox;
    cb_titaberto: TCheckBox;
    tb_clientes: TADOQuery;
    btn_imprimir: TSpeedButton;
    bt_fechar: TSpeedButton;
    pn_nomearq: TPanel;
    Label7: TLabel;
    edt_nomeArq: TEdit;
    ADOQuery1: TADOQuery;
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
    ADOQuery1nomemotivo: TWideStringField;
    ADOQuery1devedor: TStringField;
    ADOQuery1codmotivo: TStringField;
    edt_Uf: TEdit;
    Label9: TLabel;
    ADOQuery1nomedevedor: TStringField;
    RadioGroup1: TRadioGroup;
    SpeedButton1: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    function pegaNomeMotivo(motivo:integer):string;
    function pegaTipoMotivo(motivo:integer):string;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bt_fecharClick(Sender: TObject);
    function montarQuery() : String;
    procedure SpeedButton1Click(Sender: TObject);
    procedure gerarAcionamentos;
    procedure gerarSms;
    procedure gerarHigienizacao;
    procedure RadioGroup1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_RelAuditagem: Tfrm_RelAuditagem;

implementation

uses udm, urotinas, Uqr_auditagem,QRExport ;

{$R *.dfm}

procedure Tfrm_RelAuditagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure Tfrm_RelAuditagem.FormShow(Sender: TObject);
begin

if FRotinas.pk_cliente >0 then
begin
  lk_cliente.Value := IntToStr(FRotinas.pk_cliente);
  lk_cliente.Enabled := false
end;


tb_clientes.Open;
qry_ocorr.open;
usuarios.open;

RxCheckList_ocorr.Items.Clear;
RxCheckList_ocorr.Items.add('Não acionado');

while not qry_ocorr.eof do
begin
  RxCheckList_ocorr.Items.Add(qry_ocorr.fieldbyName('nome').value);
  qry_ocorr.next;
end;


end;

procedure Tfrm_RelAuditagem.SpeedButton2Click(Sender: TObject);
begin
close;

end;

function Tfrm_RelAuditagem.pegaTipoMotivo(motivo:integer):string;
begin

if qry_ocorr.Locate('pk_ocorr',motivo,[]) then
begin
  if qry_ocorrtipo.value = 'A' then
    result := 'Ativo'
  else
    result := 'Incobrável';
end
else
  result := 'Ativo';
end;

function Tfrm_RelAuditagem.pegaNomeMotivo(motivo:integer):string;
begin
if qry_ocorr.Locate('pk_ocorr',motivo,[]) then
  result := qry_ocorrnome.value
else
  result := 'Não acionado';

{
if motivo = 0 then
  result := 'Falou com o Cliente'
else if motivo = 1 then
  result := 'Deixou Recado'
else if motivo = 2 then
  result := 'Não Atende'
else if motivo = 3 then
  result := 'Número Errado'
else if motivo = 4 then
  result := 'Não Localizado'
else if motivo = 5 then
  result := 'Marcou Pagamento'
else if motivo = 6 then
  result := 'Falecido'
else if motivo = 9 then
  result := 'Outros';
}

end;

function Tfrm_RelAuditagem.montarQuery() : String;
var comando,select,from,join,where,group,order:string;
var sql,motivo,cpf, retorno : string;
var seq:integer;
var erro : boolean;
begin

  erro := false;
  retorno := '';

  if (cb_cobrador.KeyValue = null) and (edt_cpf.Text = '') and (dt_inicial.Date =0 ) and (edt_Uf.Text = '') then
  begin
    showmessage('Informe pelo menos uma data inicial para a buscas das informações.');
    erro := true;
  end;

  if dt_inicial.Date =0 then
  begin
    showmessage('Informe a data inicial');
    erro := true;
  end;
  if dt_final.Date =0 then
  begin
    showmessage('Informe a data final');
    erro := true;
  end;

  if not erro then
  begin
    select := ' select e.*, d.nome as devedor,d.cgc_cpf, c.nome as nomecliente, d.nome as nomedevedor,o.codigo as codmotivo,o.nome as nomemotivo,u.nome as cobrador ';
      from   := ' from eventos e ';
      join   := ' inner join devedores d on (d.pk_devedor=e.pk_devedor) ';
      join   := join + ' inner join clientes c on (c.pk_cliente=e.pk_cliente) ';
      join   := join + ' inner join ocorrencias o on ( o.pk_ocorr=e.motivo) ';
      join   := join + ' left join usuarios u on (u.nu_usu=e.pk_cobrador) ';

      where  := ' where 1=1 ';
      if (cb_cobrador.KeyValue <> null) then
        where  := where + ' and  e.pk_cobrador='+intToStr(cb_cobrador.KeyValue);

      if edt_cpf.Text <> '' then
      begin
        cpf := Urotinas.limpaFormatacao(edt_cpf.Text);
        where := where + ' and d.cgc_cpf = '''+cpf+''' ';
      end;

      if dt_inicial.Date >0 then
        where := where + ' and e.data >= '''+FormatDateTime(frotinas.formato_data_banco(),dt_inicial.Date)+'''';

      if dt_final.Date >0 then
        where := where + ' and e.data <= '''+FormatDateTime(frotinas.formato_data_banco(),dt_final.Date)+'''';

      if edt_Uf.Text <> '' then
      begin
        where := where + ' and upper(d.uf) = '''+edt_Uf.Text+'''';
      end;


      sql := '';
      seq := 0;
      while seq<RxCheckList_ocorr.Items.Count do
      begin

         if RxCheckList_ocorr.State[seq]  = cbChecked then
         begin
            motivo := RxCheckList_ocorr.items[seq];
            if qry_ocorr.Locate('nome',motivo,[]) then
            begin
              if sql<>'' then
                sql := sql + ' or ';
              sql := sql+' e.motivo= '+qry_ocorr.fieldByName('pk_ocorr').asstring;
            end
            else  // Não acionado
            begin
              if sql <>'' then
                sql := sql + ' or ';
              sql := sql +' e.motivo is null ';
            end;

         end;

         inc(seq);
      end;

      if lk_cliente.KeyValue >0 then
      begin
        where := where+ ' and e.pk_cliente = '+intToStr(lk_cliente.KeyValue);
      end;

      if sql<>'' then
        where := where+' and ('+sql+' ) ';

      if ( cb_titaberto.Checked ) then
        where := where+ ' and exists ( select (1) from titulos t where t.pk_devedor = d.pk_devedor and (t.motivo_baixa is null or t.motivo_baixa='''') ) ';

      group  := '';

      if cb_ordenar.ItemIndex = 0 then
        order  := ' order by c.nome, e.data,e.hora '
      else
        order  := ' order by c.nome, d.nome,e.data,e.hora ';

      retorno:= select+from+join+where+group+order;

  end;

  result := retorno;

end;

procedure Tfrm_RelAuditagem.btn_imprimirClick(Sender: TObject);
var comando,select,from,join,where,group,order:string;
var tprinc, tjuros, tmulta, tdescprinc,tdescjuros,tdescmulta,thonor, tprotesto,tretenc, trepasse:real;
var conta,job:integer;
var total:integer;
var gtotPrincipal,itotPrincipal,atotPrincipal : real;
var aqtdTitulos, aqtdDevedores , iqtdTitulos, iqtdDevedores : integer;
var seq:integer;
var sql,motivo,cpf : string;
begin

  tprinc := 0.00;
  tjuros := 0.00;
  tmulta := 0.00;
  tdescprinc := 0.00;
  tdescjuros := 0.00;
  tdescmulta := 0.00;
  thonor     := 0.00;
  tprotesto  := 0.00;
  tretenc    := 0.00;
  trepasse   := 0.00;

  select := '';
  from   := '';
  join   := '';
  where  := '';


  {
select e.*, d.nome as devedor,d.cgc_cpf, c.nome as nomecliente, o.nome as nomemotivo, u.nome as cobrador
from eventos e
inner join devedores d on (d.pk_devedor=e.pk_devedor)
inner join usuarios u on (u.nu_usu=e.pk_cobrador)
inner join clientes c on (c.pk_cliente=e.pk_cliente)
inner join ocorrencias o on ( o.pk_ocorr=e.motivo)
  }

  try
    Application.CreateForm(Tqr_auditagem, qr_auditagem);

    lb_mens.caption := 'Pesquisando informações...';
    lb_mens.Visible := true;

    sql := montarQuery();

    if sql = '' then
      exit;

    qr_auditagem.ADOQuery1.close;
    qr_auditagem.ADOQuery1.sql.Text := sql;
    qr_auditagem.ADOQuery1.open;


    if qr_auditagem.ADOQuery1.recordCount = 0 then
    begin
      showmessage('Não foi localizado nenhum registro');
      //qr_auditagem.Destroy;
      exit;
    end;




    qr_auditagem.qlb_cobrador.caption  := cb_cobrador.Text;

    if cb_cobrador.KeyValue >0 then
      qr_auditagem.qlb_cobrador.caption := cb_cobrador.text;
    if cb_cobrador.Text <> '' then
      qr_auditagem.qlb_cobrador.caption := 'Cobrador: '+cb_cobrador.Text;

    if edt_Uf.Text <> '' then
      qr_auditagem.qlb_cobrador.Caption := qr_auditagem.qlb_cobrador.Caption+' UF: '+edt_Uf.Text;


    qr_auditagem.qlb_cliente.caption := lk_cliente.text;

    qr_auditagem.qrlb_periodo.caption := 'Período: '+dt_inicial.text+' a '+dt_final.Text;

    qr_auditagem.ExportToFilter( TQRXLSFilter.Create( ExtractFilePath(ParamStr(0))+'\\auditagem.xls'));
    qr_auditagem.preview;


  finally
    qr_auditagem.destroy;
  end;

  lb_mens.Visible := false;


end;

procedure Tfrm_RelAuditagem.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
      begin
         key := #0;
         PerForm (cm_dialogKey,vk_tab,0);
      end;
{Trocando Virgula por Ponto}
//if Key in [',','.'] then
//  Key := DecimalSeparator;

end;

procedure Tfrm_RelAuditagem.bt_fecharClick(Sender: TObject);
begin
close;
end;

procedure Tfrm_RelAuditagem.gerarAcionamentos;
var F   : TextFile;
var linha   : string;
var arquivo,pedido : string;
var i,coLanc       : integer;
var texto,sql:string;
var seq : integer;
var codAssessoria : string;
begin

  if edt_nomeArq.Text = '' then
  begin
      showmessage('Não foi informado o caminho e nome do arquivo');
      exit;
  end;


  lb_mens.caption := 'Pesquisando informações...';
  lb_mens.Visible := true;

  seq:=0;
  while seq<RxCheckList_ocorr.Items.Count do
  begin
    if RxCheckList_ocorr.State[seq]  = cbChecked then
        sql := 'sim';
    inc(seq);
  end;

  seq:=0;
  if sql = '' then
  begin

    if MessageDlg('Não foi selecionada nenhuma ocorrência, deseja gerar arquivo com todas as ocorrências?',
      mtConfirmation, [mbYes, mbNo],0) = mrNo then
      exit;

  end;


  sql := montarQuery();

  if sql = '' then
      exit;


  ADOQuery1.close;
  ADOQuery1.sql.Text := sql;
  ADOQuery1.open;

  if ADOQuery1.recordCount = 0 then
  begin
    showmessage('Não foi localizado nenhum registro');
    exit;
  end;


  arquivo := edt_nomeArq.Text;

  try
    AssignFile(F,arquivo);
  except
    showmessage('Erro ao criar o arquivo ');
  CloseFile(F);
    exit;
  end;
  Rewrite(F);

  {ESTRUTURA DO ARQUIVO
  COD_ASSESSORIA;CPF;DATA HORA DO ACIONAMENTO;NOME DA ACAO;ACIONAMENTO;TELEFONE;OPERADOR;CODIGO AÇÃO

  }

  codAssessoria := '15';


  writeLn( F,  'COD_ASSESSORIA;CPF;DATA HORA DO ACIONAMENTO;NOME DA ACAO;ACIONAMENTO;TELEFONE;OPERADOR;CODIGO AÇÃO');


  i:=0;
  ADOQuery1.first;
  while not ADOQuery1.eof do
  begin

    linha := codAssessoria+';'+ urotinas.limpaFormatacao(ADOQuery1cgc_cpf.Value)+';'+
             FormatDateTime( 'DD/MM/YYYY', ADOQuery1Data.value )+' '+copy(ADOQuery1Hora.value,1,5)+';'+
             ADOQuery1nomemotivo.value+';'+
             ADOQuery1Texto.value+';'+
             ';'+
             ADOQuery1cobrador.value+';'+
             ADOQuery1codmotivo.value;

    writeLn( F,linha );

    ADOQuery1.next;

  end;
  CloseFile(F);

  showmessage('Arquivo gerado no caminho informado: '+edt_nomeArq.text);


end;

procedure Tfrm_RelAuditagem.gerarSms;
var F   : TextFile;
var linha   : string;
var arquivo,pedido : string;
var i,coLanc       : integer;
var texto,sql:string;
var seq : integer;
var codAssessoria : string;
begin

  if edt_nomeArq.Text = '' then
  begin
      showmessage('Não foi informado o caminho e nome do arquivo');
      exit;
  end;


  lb_mens.caption := 'Pesquisando informações...';
  lb_mens.Visible := true;

  seq:=0;
  while seq<RxCheckList_ocorr.Items.Count do
  begin
    if RxCheckList_ocorr.State[seq]  = cbChecked then
        sql := 'sim';
    inc(seq);
  end;

  seq:=0;
  if sql = '' then
  begin

    if MessageDlg('Não foi selecionada nenhuma ocorrência, deseja gerar arquivo com todas as ocorrências?',
      mtConfirmation, [mbYes, mbNo],0) = mrNo then
      exit;

  end;

  sql := montarQuery();

  if sql = '' then
      exit;

  ADOQuery1.close;
  ADOQuery1.sql.Text := sql;
  ADOQuery1.open;

  if ADOQuery1.recordCount = 0 then
  begin
    showmessage('Não foi localizado nenhum registro');
    exit;
  end;


  arquivo := edt_nomeArq.Text;

  try
    AssignFile(F,arquivo);
  except
    showmessage('Erro ao criar o arquivo ');
  CloseFile(F);
    exit;
  end;
  Rewrite(F);

  {ESTRUTURA DO ARQUIVO
  primeiro nome;telefone

  }

  codAssessoria := '15';


  //writeLn( F,  'COD_ASSESSORIA;CPF;DATA HORA DO ACIONAMENTO;NOME DA ACAO;ACIONAMENTO;TELEFONE;OPERADOR;CODIGO AÇÃO');


  i:=0;
  ADOQuery1.first;
  while not ADOQuery1.eof do
  begin

    frotinas.Qry_Livre.close;
    frotinas.Qry_Livre.CommandText := 'select * from telefones where pk_devedor='+ADOQuery1pk_devedor.asString+' and sms=''S'' ';
    frotinas.Qry_Livre.open;

    if frotinas.Qry_Livre.recordCount>0 then
    begin

      linha := urotinas.primeiraPalavra( ADOQuery1nomedevedor.asstring) + ';'+frotinas.Qry_Livre.fieldbyName('ddd').asstring+';'+urotinas.limpaFormatacao(frotinas.Qry_Livre.fieldbyName('telefone').asString);

      writeLn( F,linha );

    end;

    ADOQuery1.next;

  end;
  CloseFile(F);

  showmessage('Arquivo gerado no caminho informado: '+edt_nomeArq.text);


end;


procedure Tfrm_RelAuditagem.gerarHigienizacao;
var F   : TextFile;
var linha   : string;
var arquivo,pedido : string;
var i,coLanc       : integer;
var texto,sql:string;
var seq : integer;
var codAssessoria : string;
begin

  if edt_nomeArq.Text = '' then
  begin
      showmessage('Não foi informado o caminho e nome do arquivo');
      exit;
  end;


  lb_mens.caption := 'Pesquisando informações...';
  lb_mens.Visible := true;

  seq:=0;
  while seq<RxCheckList_ocorr.Items.Count do
  begin
    if RxCheckList_ocorr.State[seq]  = cbChecked then
        sql := 'sim';
    inc(seq);
  end;

  seq:=0;
  if sql = '' then
  begin

    if MessageDlg('Não foi selecionada nenhuma ocorrência, deseja gerar arquivo com todas as ocorrências?',
      mtConfirmation, [mbYes, mbNo],0) = mrNo then
      exit;

  end;

  sql := montarQuery();

  if sql = '' then
      exit;

  ADOQuery1.close;
  ADOQuery1.sql.Text := sql;
  ADOQuery1.open;

  if ADOQuery1.recordCount = 0 then
  begin
    showmessage('Não foi localizado nenhum registro');
    exit;
  end;


  arquivo := edt_nomeArq.Text;

  try
    AssignFile(F,arquivo);
  except
    showmessage('Erro ao criar o arquivo ');
  CloseFile(F);
    exit;
  end;
  Rewrite(F);

  {ESTRUTURA DO ARQUIVO
  primeiro nome;telefone

  }

  codAssessoria := '15';


  //writeLn( F,  'COD_ASSESSORIA;CPF;DATA HORA DO ACIONAMENTO;NOME DA ACAO;ACIONAMENTO;TELEFONE;OPERADOR;CODIGO AÇÃO');


  i:=0;
  ADOQuery1.first;
  while not ADOQuery1.eof do
  begin

    writeLn( F, urotinas.limpaFormatacao(  ADOQuery1cgc_cpf.asstring ));
    ADOQuery1.next;

  end;
  CloseFile(F);

  showmessage('Arquivo gerado no caminho informado: '+edt_nomeArq.text);


end;



procedure Tfrm_RelAuditagem.SpeedButton1Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex = 0 then
  gerarAcionamentos
else if RadioGroup1.ItemIndex = 1 then
  gerarSms
else if RadioGroup1.ItemIndex = 2 then
  gerarHigienizacao;
end;

procedure Tfrm_RelAuditagem.RadioGroup1Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex = 0 then
  edt_nomeArq.Text := 'C:\sistemas\acionamentos.txt'
else if RadioGroup1.ItemIndex = 1 then
  edt_nomeArq.Text := 'C:\sistemas\sms.txt'
else if RadioGroup1.ItemIndex = 2 then
  edt_nomeArq.Text := 'C:\sistemas\higienizar.txt';


end;

end.
