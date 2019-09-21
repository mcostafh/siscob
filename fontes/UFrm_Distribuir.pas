unit UFrm_Distribuir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls,  Gauges,  FileCtrl, Mask, DBCtrls,
  DB, ADODB, RxLookup, ToolEdit, RXCtrls;

type
  TResultArray = array of string; //<== Definição do tipo

  TFrm_Distribuir = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    sb_gravarConf: TSpeedButton;
    Panel2: TPanel;
    OpenDialog1: TOpenDialog;
    Dts_cliente: TDataSource;
    lb_mens: TLabel;
    qry_devedor: TADOQuery;
    usuarios: TADOTable;
    dts_usuarios: TDataSource;
    qry_devedorpk_cobrador: TIntegerField;
    qry_temp: TADOQuery;
    qry_devedorpk_devedor: TIntegerField;
    qry_devedorvalor_divida: TFloatField;
    Panel4: TPanel;
    Gauge_atualizando: TGauge;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    lk_cliente: TRxDBLookupCombo;
    Label5: TLabel;
    edt_tipotitulo: TEdit;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label48: TLabel;
    Label61: TLabel;
    Label70: TLabel;
    edt_fx1: TEdit;
    edt_fx2: TEdit;
    edt_atraso1: TDateEdit;
    edt_atraso2: TDateEdit;
    qry_cobradores: TADOQuery;
    dts_cobradores: TDataSource;
    qry_cobradoresnu_usu: TIntegerField;
    qry_cobradoreslogin: TWideStringField;
    qry_cobradoresSenha: TWideStringField;
    qry_cobradoresNome: TWideStringField;
    qry_cobradoresnivel_acesso: TIntegerField;
    qry_cobradoresPK_GRUPO: TIntegerField;
    qry_cobradoreslogado: TStringField;
    qry_cobradorespk_cliente: TIntegerField;
    GroupBox4: TGroupBox;
    RxCheckListBox1: TRxCheckListBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    lb_total: TLabel;
    btn_buscar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    lb_informacoes: TLabel;
    Label4: TLabel;
    edt_qtde: TEdit;
    qry_clientes: TADOQuery;
    qry_clientespk_cliente: TIntegerField;
    qry_clientesnome: TStringField;
    qry_clientesperc_juros_mes: TFloatField;
    qry_clientesperc_multa: TFloatField;
    qry_clientescnpj: TStringField;
    qry_clienteslayout_Inteq: TStringField;
    qry_clientesbaixaTit_Carga: TStringField;
    qry_clientesTIPO_LOGRADOURO: TStringField;
    qry_clientesLOGRADOURO: TStringField;
    qry_clientesNUMERO: TStringField;
    qry_clientesCOMPLEMENTO: TStringField;
    qry_clientesBAIRRO: TStringField;
    qry_clientesCIDADE: TStringField;
    qry_clientesCEP: TStringField;
    qry_clientesUF: TStringField;
    qry_clientesPONTO_REF: TStringField;
    qry_clientesTELEFONE: TStringField;
    qry_clientesFAX: TStringField;
    qry_clientesZERO_OITOCENTOS: TStringField;
    qry_clientesEMAIL: TStringField;
    qry_clientesSKYPE: TStringField;
    qry_clientesMSN: TStringField;
    qry_clientesRESP_COBRANA: TStringField;
    qry_clientesarquivabxparcial: TStringField;
    qry_clientesbanco1: TStringField;
    qry_clientesagencia1: TStringField;
    qry_clientesconta1: TStringField;
    qry_clientesbanco2: TStringField;
    qry_clientesagencia2: TStringField;
    qry_clientesconta2: TStringField;
    qry_clientesfavorecido1: TStringField;
    qry_clientesfavorecido2: TStringField;
    qry_clientesinativado: TDateTimeField;
    qry_clientestipoatraso: TStringField;
    qry_clientescodsocio: TStringField;
    qry_clientescodentidade: TStringField;
    qry_clientesrazaosocial: TStringField;
    qry_clientesdiasatrasoremessaspc: TIntegerField;
    qry_clientesnaturezainclusaospc: TStringField;
    qry_clientesretirarPorNegociacao: TStringField;
    qry_clientestiposDeTitulos: TStringField;
    qry_clientestaxaAdm: TBCDField;
    qry_clientesvr_taxa_bancaria: TBCDField;
    qry_clientesvr_segunda_via: TBCDField;
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
  Frm_Distribuir: TFrm_Distribuir;

implementation

uses UPrincipal, UDM, URotinas;

{$R *.dfm}

procedure TFrm_Distribuir.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure TFrm_Distribuir.sb_PesquisarArquivosClick(Sender: TObject);
begin
OpenDialog1.InitialDir := 'C:\';
OpenDialog1.Execute;
end;




procedure TFrm_Distribuir.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure TFrm_Distribuir.FormShow(Sender: TObject);
begin
  qry_clientes.Open;
  usuarios.Open;
  qry_cobradores.Open;

  RxCheckListBox1.Clear;

  while not qry_cobradores.eof do
  begin
    RxCheckListBox1.Items.Add(qry_cobradoreslogin.asstring);
    qry_cobradores.next;
  end;

end;

procedure TFrm_Distribuir.sb_gravarConfClick(Sender: TObject);
var conta,total, selected:integer;
var cobradoresSel : Array of string;
var cobrador : integer;
var contaCobradorSel : integer;
begin

  sb_gravarConf.Enabled := false;

  selected := 0;
  for conta := 0 to Pred(RxCheckListBox1.items.count) do
  begin
    if RxCheckListBox1.Checked[conta] then
      inc(selected);
  end;


  SetLength(cobradoresSel,selected);

  selected := 0;
  for conta := 0 to Pred(RxCheckListBox1.items.count) do
  begin
    if RxCheckListBox1.Checked[conta] then
    begin
      cobradoresSel[selected] := RxCheckListBox1.items[conta];
      inc(selected);
    end;
  end;


  if qry_devedor.recordCount = 0  then
  begin
    showmessage('Não localizado devedores a distribuir do cliente');
    exit;
  end;

  lb_informacoes.Caption := 'Cobradores selecionados: '+intToStr(selected)+' Qtde a distribuir por cobrador: '+  FloatToStr( qry_devedor.recordCount / selected ) ;

  if selected >0 then
  begin
    frotinas.Qry_Livre.close;
    frotinas.Qry_Livre.CommandText := 'select * from usuarios ';
    frotinas.Qry_Livre.open;
  end;



  if edt_qtde.text <> '' then
    total:= strToInt(edt_qtde.text)
  else
    total := qry_devedor.recordCount;


  contaCobradorSel := 0;
  conta := 0;

  Gauge_atualizando.MinValue := 0;
  if total>0 then
    Gauge_atualizando.MaxValue := total
  else
    Gauge_atualizando.MaxValue := qry_devedor.recordCount;

  Gauge_atualizando.Visible := true;
  refresh;


  qry_devedor.first;
  while not qry_devedor.eof do
  begin
    Gauge_atualizando.AddProgress(1);
    refresh;


    if selected >0 then
    begin

      if frotinas.Qry_Livre.Locate('login', cobradoresSel[contaCobradorSel],[] ) then
      begin
           cobrador := frotinas.Qry_Livre.fieldByName('nu_usu').value;
           inc(contaCobradorSel);
           if contaCobradorSel=selected then
            contaCobradorSel:=0;
      end;

    end;


    //qry_temp.close;
    //qry_temp.SQL.Text := 'select sum(valor_principal) as valor from titulos where pk_devedor = '+qry_devedorpk_devedor.asstring;
    //qry_temp.open;

    qry_devedor.edit;
    //qry_devedorvalor_divida.value := qry_temp.FieldByName('valor').asFloat;
    qry_devedorpk_cobrador.value := cobrador;
    qry_devedor.post;

    inc(conta);

    if (total>0) and (total<conta ) then
      qry_devedor.last;

    qry_devedor.next;

  end;

  showmessage('Distribuição concluída!');


end;

procedure TFrm_Distribuir.btn_buscarClick(Sender: TObject);
var select, from, join, where, order:string;
begin

  if lk_cliente.KeyValue = 0 then
  begin
    showmessage('Não foi informado o cliente.');
    exit
  end;


  select := ' select d.*, (select min(t2.vencimento) as vencimento from titulos t2 where t2.pk_devedor=d.pk_devedor ) as vencimento ';
  select := select + ', (select sum(t2.valor_principal) as divida from titulos t2 where t2.pk_devedor=d.pk_devedor ) as divida ';
  from   := ' from devedores d ';
  where  := ' where d.pk_cobrador is null and d.pk_cliente='+intTostr(lk_cliente.KeyValue);
  where  := where + ' and exists( select 1 from titulos t where t.pk_devedor=d.pk_devedor ';

  if edt_tipotitulo.text <> '' then
  begin
    where := where + ' and t.tipo_titulo='''+edt_tipotitulo.text+''' ';
  end;

  if (DateToStr(edt_atraso1.Date) <> '30/12/1899') or ( DateToStr(edt_atraso2.Date) <> '30/12/1899' ) then
  begin

    if (DateToStr(edt_atraso1.Date) <> '30/12/1899') then
    begin
       where := where + '  and t.vencimento >='''+FormatDateTime(frotinas.formato_data_banco(),edt_atraso1.Date)+'''';
    end;

    if DateToStr(edt_atraso2.Date) <> '30/12/1899' then
    begin
       where := where + ' and t.vencimento <='''+FormatDateTime(frotinas.formato_data_banco(),edt_atraso2.Date)+'''';
    end;


  end;

  where := where + ' )';

  order := 'order by vencimento, divida desc';


  qry_devedor.Close;
  qry_devedor.SQL.Text := select+from+where+order;
  qry_devedor.open;
  lb_total.caption := intToStr(qry_devedor.recordCount);

  sb_gravarConf.Enabled := true;

end;

procedure TFrm_Distribuir.edt_fx1Exit(Sender: TObject);
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

procedure TFrm_Distribuir.edt_fx2Exit(Sender: TObject);
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

procedure TFrm_Distribuir.FormKeyPress(Sender: TObject; var Key: Char);
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
