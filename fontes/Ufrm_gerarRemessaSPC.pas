unit Ufrm_gerarRemessaSPC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, DB, ADODB, RxLookup, StdCtrls, Grids, DBGrids,
  Mask, DBCtrls, ToolEdit, CurrEdit, jpeg,UConheceCobrancaNoSPC;

type
  Tfrm_GerarRemessaSPC = class(TForm)
    Panel1: TPanel;
    Dts_cliente: TDataSource;
    Panel2: TPanel;
    Label1: TLabel;
    lk_cliente: TRxDBLookupCombo;
    btn_busca: TSpeedButton;
    SpeedButton1: TSpeedButton;
    dts_pendencia: TDataSource;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    qry_prestcontas: TADODataSet;
    qry_prestcontaspk_prestcontas: TIntegerField;
    qry_prestcontasdata: TDateTimeField;
    qry_prestcontaspk_cliente: TIntegerField;
    qry_prestcontasprincipal: TBCDField;
    qry_prestcontasjuros: TBCDField;
    qry_prestcontasmulta: TBCDField;
    qry_prestcontasdescjuros: TBCDField;
    qry_prestcontasdescmulta: TBCDField;
    qry_prestcontasdescprincipal: TBCDField;
    qry_prestcontaspdescjuros: TBCDField;
    qry_prestcontaspdescmulta: TBCDField;
    qry_prestcontasretencao: TBCDField;
    qry_prestcontasacrescimos: TBCDField;
    qry_prestcontasliquido: TBCDField;
    qry_recibo: TADODataSet;
    Image1: TImage;
    Label14: TLabel;
    Label7: TLabel;
    qry_prestcontasbaixaparcial: TBCDField;
    tb_cliente: TADOQuery;
    tb_clientepk_cliente: TIntegerField;
    tb_clientenome: TStringField;
    tb_clienteinativado: TDateTimeField;
    tb_clientecodsocio: TStringField;
    tb_clientecodentidade: TStringField;
    tb_clienterazaosocial: TStringField;
    tb_clientediasatrasoremessaspc: TIntegerField;
    tb_clientenaturezainclusaospc: TStringField;
    tb_clienteretirarPorNegociacao: TStringField;
    tb_clientetiposDeTitulos: TStringField;
    tb_clientecnpj: TStringField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    qry_pendencia: TADODataSet;
    sb_gerar: TSpeedButton;
    btn_imprimir: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_buscaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    objRemessaSPC : RemessaAoSPC;
  end;

var
  frm_GerarRemessaSPC: Tfrm_GerarRemessaSPC;



implementation
uses UDM, URotinas;
{$R *.dfm}

procedure Tfrm_GerarRemessaSPC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure Tfrm_GerarRemessaSPC.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure Tfrm_GerarRemessaSPC.btn_buscaClick(Sender: TObject);

begin

  if lk_cliente.KeyValue = null then
  begin
    showmessage('Não foi informado o cliente.');
    exit;
  end;

  objRemessaSPC := RemessaAoSPC.create(dm.DB);
  if not objRemessaSPC.pesquisarCliente( lk_cliente.KeyValue ) then
  begin
    showmessage('Cliente não localizado.');
    exit;
  end;

  if (tb_clientediasatrasoremessaspc.asstring='' ) then
  begin
    showmessage('Deve ser informado no cliente os dias de atraso para a negativação no SPC');
    exit;
  end;

  objRemessaSPC.pesquisarTitulosEmAtraso( lk_cliente.KeyValue , tb_clientetiposDeTitulos.value, tb_clientediasatrasoremessaspc.value) ;

  qry_pendencia.Clone(objRemessaSPC.titulosEmAtraso);

  refresh;

  sb_gerar.Enabled := true;


end;

procedure Tfrm_GerarRemessaSPC.FormShow(Sender: TObject);
begin
tb_cliente.Open;
end;

procedure Tfrm_GerarRemessaSPC.SpeedButton3Click(Sender: TObject);
begin

dm.DB.BeginTrans;
try

  qry_prestcontas.close;
  qry_prestcontas.open;

  if MessageDlg('Deseja Gerar a prestação de contas agora ?',
     mtConfirmation, [mbYes, mbNo],0) = mrYes then
  begin

  end;

  showmessage('Prestação de contas gerada com sucesso! '+inttostr(qry_prestcontaspk_prestcontas.asinteger));
except

  dm.DB.RollbackTrans;
  showmessage('Não foi possível gerar Prestação de contas, ocorreu um erro no banco de dados !');
end;




btn_busca.Click;

end;

end.
