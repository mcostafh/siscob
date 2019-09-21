unit UCadDevedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadPadrao, RxLookup, Buttons, StdCtrls, DB, ADODB, DBTables,
  ComCtrls, RXCtrls, ExtCtrls, SpeedBar, Grids, DBGrids, Mask, DBCtrls,
  ToolEdit, RXDBCtrl, ToolWin;

type
  TFrm_Devedores = class(TFrm_PadCad)
    Panel3: TPanel;
    qry_cliente: TADOQuery;
    qry_clientepk_cliente: TIntegerField;
    qry_clientenome: TStringField;
    dts_cliente: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    cpf_devedor: TEdit;
    btn_buscar: TSpeedButton;
    lk_cliente: TRxDBLookupCombo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    Label35: TLabel;
    Label38: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit24: TDBEdit;
    GroupBox2: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit25: TDBEdit;
    Label39: TLabel;
    DBEdit1: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit4: TDBEdit;
    Label18: TLabel;
    DBEdit49: TDBEdit;
    Label65: TLabel;
    DBEdit5: TDBEdit;
    Label19: TLabel;
    DBEdit15: TDBEdit;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    GroupBox5: TGroupBox;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    edt_banco: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    GroupBox6: TGroupBox;
    Label56: TLabel;
    Label52: TLabel;
    DBEdit42: TDBEdit;
    DBEdit38: TDBEdit;
    GroupBox7: TGroupBox;
    Label58: TLabel;
    Label62: TLabel;
    DBEdit44: TDBEdit;
    DBEdit48: TDBEdit;
    Label57: TLabel;
    DBEdit39: TDBEdit;
    Label53: TLabel;
    Label55: TLabel;
    DBEdit41: TDBEdit;
    Label51: TLabel;
    Label50: TLabel;
    Label59: TLabel;
    DBEdit45: TDBEdit;
    seq_tabelas: TADODataSet;
    seq_tabelastabela: TStringField;
    seq_tabelasseq: TIntegerField;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    telefones: TADODataSet;
    telefonesid: TIntegerField;
    telefonespk_devedor: TIntegerField;
    telefonestipo_fone: TStringField;
    telefonesTelefone: TStringField;
    dts_telefones: TDataSource;
    dts_divida: TDataSource;
    grid_fones: TDBGrid;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    qry_cobrador: TADOQuery;
    dts_cobrador: TDataSource;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    edt_dtPgto: TDBDateEdit;
    cb_motivo: TComboBox;
    GroupBox4: TGroupBox;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label5: TLabel;
    Label9: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    GroupBox8: TGroupBox;
    DBEdit7: TDBEdit;
    eventos: TADODataSet;
    eventoschave: TIntegerField;
    eventospk_devedor: TIntegerField;
    eventosData: TDateTimeField;
    eventosHora: TStringField;
    eventosTexto: TStringField;
    eventosmotivo: TIntegerField;
    eventosAgendado_Data: TDateTimeField;
    eventosAgendado_Tipo: TIntegerField;
    eventosAgendado_Hora: TStringField;
    eventosmarcar_nao_localiz: TStringField;
    eventosseq_arq_inclusao: TIntegerField;
    log: TADODataSet;
    logdata: TDateTimeField;
    logtexto: TStringField;
    logusuario_chave: TIntegerField;
    logusuario_nome: TStringField;
    logdevedor_chave: TIntegerField;
    logdevedor_nome: TStringField;
    GroupBox9: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    cbx_motivoBx: TComboBox;
    DBDateEdit3: TDBDateEdit;
    Query1pk_devedor: TIntegerField;
    Query1pk_cliente: TIntegerField;
    Query1chave_no_cliente: TIntegerField;
    Query1codigo_no_cliente: TStringField;
    Query1CGC_CPF: TStringField;
    Query1titular_avalista: TStringField;
    Query1Nome: TStringField;
    Query1RG: TStringField;
    Query1Orgao_Rg: TStringField;
    Query1data_nasc: TDateTimeField;
    Query1telefones: TStringField;
    Query1tipo_logradouro: TStringField;
    Query1logradouro: TStringField;
    Query1Numero: TStringField;
    Query1Complemento: TStringField;
    Query1Bairro: TStringField;
    Query1Cidade: TStringField;
    Query1Cep: TStringField;
    Query1Uf: TStringField;
    Query1ponto_referencia: TStringField;
    Query1trabalho_nome: TStringField;
    Query1Trab_logradouro: TStringField;
    Query1trab_numero: TStringField;
    Query1trab_bairro: TStringField;
    Query1Trab_cidade: TStringField;
    Query1Trab_uf: TStringField;
    Query1trab_fones: TStringField;
    Query1trab_complemento: TStringField;
    Query1trab_ponto_refer: TStringField;
    Query1trab_cep: TStringField;
    Query1Profissao: TStringField;
    Query1SEXO: TStringField;
    Query1prim_ref_pessoal: TStringField;
    Query1prim_ref_pessoal_fones: TStringField;
    Query1seg_ref_pessoal: TStringField;
    Query1seg_ref_pessoal_fones: TStringField;
    Query1nao_localizado: TDateTimeField;
    Query1data_baixa: TDateTimeField;
    Query1agendado_data: TDateTimeField;
    Query1agendado_hora: TStringField;
    Query1agendado_tipo: TIntegerField;
    Query1seq_arq_inclusao: TIntegerField;
    Query1seq_arq_baixa: TIntegerField;
    Query1usuario_baixa: TIntegerField;
    Query1usuario_inclusao: TIntegerField;
    Query1motivo_baixa: TStringField;
    Query1valor_divida: TFloatField;
    Query1motivo_dialogo: TIntegerField;
    Query1data_dialogo: TDateTimeField;
    Query1pk_cobrador: TIntegerField;
    TabSheet3: TTabSheet;
    dts_historicos: TDataSource;
    qry_historico: TADOQuery;
    qry_historicochave: TIntegerField;
    qry_historicopk_devedor: TIntegerField;
    qry_historicoData: TDateTimeField;
    qry_historicoHora: TStringField;
    qry_historicoTexto: TStringField;
    qry_historicomotivo: TIntegerField;
    qry_historicoAgendado_Data: TDateTimeField;
    qry_historicoAgendado_Hora: TStringField;
    qry_historicoseq_arq_inclusao: TIntegerField;
    PageControl3: TPageControl;
    TabSheet4: TTabSheet;
    DBGrid3: TDBGrid;
    TabSheet7: TTabSheet;
    Label12: TLabel;
    Label14: TLabel;
    Label21: TLabel;
    Label29: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    DBEdit23: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBMemo1: TDBMemo;
    sb_retirar: TSpeedItem;
    ADODataSet1: TADODataSet;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    qry_divida: TADODataSet;
    qry_dividapk_titulo: TIntegerField;
    qry_dividapk_devedor: TIntegerField;
    qry_dividapk_cliente: TIntegerField;
    qry_dividanome_banco: TStringField;
    qry_dividaBanco: TStringField;
    qry_dividaAgencia: TStringField;
    qry_dividaConta: TStringField;
    qry_dividaCheque: TStringField;
    qry_dividaEndossado: TStringField;
    qry_dividaEndossado_CPF: TStringField;
    qry_dividaemissao: TDateTimeField;
    qry_dividaVencimento: TDateTimeField;
    qry_dividavenc_ult_extrato: TDateTimeField;
    qry_dividadias_atraso_remessa: TIntegerField;
    qry_dividavalor_principal: TFloatField;
    qry_dividapagamento_minimo: TFloatField;
    qry_dividaperc_taxa_mes_fin: TFloatField;
    qry_dividaperc_taxa_mes_juros: TFloatField;
    qry_dividaperc_taxa_multa: TFloatField;
    qry_dividavalor_avencer_remessa: TFloatField;
    qry_dividamotivo_baixa: TStringField;
    qry_dividausuario_baixa: TIntegerField;
    qry_dividadata_baixa: TDateTimeField;
    qry_dividatipo_titulo: TStringField;
    qry_dividaAgenda_Data: TDateTimeField;
    qry_dividaAgenda_Hora: TStringField;
    qry_dividaAgenda_Tipo: TStringField;
    qry_dividausuario_inclusao: TIntegerField;
    qry_dividaData_inclusao: TDateTimeField;
    qry_dividachave_avalista: TIntegerField;
    qry_dividapraca_cheque: TStringField;
    qry_dividaalinea_devol: TStringField;
    qry_dividapk_recibo: TIntegerField;
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
    qry_dividanumero_titulo: TStringField;
    qry_dividaseq_arq_inclusao: TIntegerField;
    qry_dividaseq_arq_baixa: TIntegerField;
    qry_dividachave_titulo: TStringField;
    qry_dividaatualizar: TStringField;
    DBMemo2: TDBMemo;
    Query1anotacoes: TStringField;
    TabSheet5: TTabSheet;
    PageControl6: TPageControl;
    Panel15: TPanel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    DBEdit30: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit60: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit61: TDBEdit;
    DBEdit62: TDBEdit;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit65: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit66: TDBEdit;
    DBEdit67: TDBEdit;
    DBEdit68: TDBEdit;
    DBGrid4: TDBGrid;
    recibos: TADODataSet;
    recibospk_recibo: TIntegerField;
    recibospk_devedor: TIntegerField;
    recibosdata: TDateTimeField;
    reciboshora: TStringField;
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
    reciboschave_tabretenc: TIntegerField;
    recibosdias_atraso: TIntegerField;
    dts_recibos: TDataSource;
    qry_historiconome_dialogo: TStringField;
    edt_cgf: TEdit;
    Label13: TLabel;
    DBEdit2: TDBEdit;
    qry_dividaValor_titulo: TFloatField;
    qry_dividaatu_data: TDateTimeField;
    qry_dividaatu_juros: TBCDField;
    qry_dividaatu_multa: TBCDField;
    qry_dividaatu_percjuro: TBCDField;
    qry_dividaatu_percmulta: TBCDField;
    qry_dividaatu_retencao: TBCDField;
    qry_dividaatu_valor: TBCDField;
    qry_dividadesc_principal: TBCDField;
    qry_dividadesc_juros: TBCDField;
    qry_dividadesc_multa: TBCDField;
    qry_dividaacres_protesto: TBCDField;
    qry_dividaacres_honorarios: TBCDField;
    qry_dividavalor_retenc: TBCDField;
    qry_dividavalor_liquido: TBCDField;
    TabSheet6: TTabSheet;
    DBGrid2: TDBGrid;
    qry_bxparciais: TADOQuery;
    qry_bxparciaisPK_bxparcial: TIntegerField;
    qry_bxparciaispk_devedor: TIntegerField;
    qry_bxparciaisdata: TDateTimeField;
    qry_bxparciaisvalor: TBCDField;
    qry_bxparciaispk_prestcontas: TIntegerField;
    qry_bxparciaisacordo: TIntegerField;
    dts_bxparciais: TDataSource;
    GroupBox10: TGroupBox;
    Label17: TLabel;
    DBEdit52: TDBEdit;
    Label20: TLabel;
    DBEdit53: TDBEdit;
    Label37: TLabel;
    DBEdit54: TDBEdit;
    btn_excluirBXParcial: TSpeedButton;
    cb_visualizaInativos: TCheckBox;
    SpeedButton1: TSpeedButton;
    recibospk_prestcontas: TIntegerField;
    Label42: TLabel;
    DBEdit55: TDBEdit;
    Label43: TLabel;
    Query1nossonumero: TStringField;
    Query1agendado_cobrador: TIntegerField;
    Query1email: TStringField;
    DBEdit56: TDBEdit;
    Label54: TLabel;
    DBEdit57: TDBEdit;
    qry_dividachave_contrato: TStringField;
    Label63: TLabel;
    DBEdit58: TDBEdit;
    Label64: TLabel;
    DBEdit69: TDBEdit;
    telefonessms: TStringField;
    telefonesDDD: TStringField;
    Panel4: TPanel;
    btn_incluir: TSpeedButton;
    btn_alterar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_gravar: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_retirar: TSpeedButton;
    btn_rotornar: TSpeedButton;
    GroupBox11: TGroupBox;
    qry_bxparctitulo: TADODataSet;
    dts_bxparcTitulo: TDataSource;
    DBGrid5: TDBGrid;
    qry_bxparctitulodata: TDateTimeField;
    qry_bxparctitulovalor: TBCDField;
    qry_bxparctituloarquivo: TStringField;
    qry_bxparciaisvalor_retenc: TBCDField;
    Label67: TLabel;
    DBEdit70: TDBEdit;
    qry_bxparctitulopk_prestcontas: TIntegerField;
    qry_bxparciaistaxa_retenc: TBCDField;
    qry_bxparciaisatraso: TIntegerField;
    qry_bxparctitulovalor_retenc: TBCDField;
    qry_bxparctitulotaxa_retenc: TBCDField;
    qry_bxparctituloatraso: TIntegerField;
    Label70: TLabel;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    Label71: TLabel;
    cbox_tipoTitulo: TDBComboBox;
    Panel5: TPanel;
    Label68: TLabel;
    DBEdit71: TDBEdit;
    Label66: TLabel;
    edt_totbxparciais: TMaskEdit;
    Label69: TLabel;
    DBEdit72: TDBEdit;
    qry_bxparctituloPK_bxparcial: TIntegerField;
    qry_bxparctitulopk_devedor: TIntegerField;
    qry_bxparctituloacordo: TIntegerField;
    qry_bxparctitulopk_titulo: TIntegerField;
    qry_bxparctitulohistorico: TStringField;
    Label72: TLabel;
    DBEdit43: TDBEdit;
    qry_bxparciaisarquivo: TStringField;
    qry_bxparciaispk_titulo: TIntegerField;
    qry_bxparciaishistorico: TStringField;
    Label73: TLabel;
    DBEdit76: TDBEdit;
    Query1enviaaospc: TStringField;
    DBCb_spc: TDBComboBox;
    Label74: TLabel;
    logtipo: TStringField;
    logcgc_cpf: TStringField;
    lognumero_titulo: TStringField;
    cb_titaberto: TCheckBox;
    GroupBox12: TGroupBox;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    DBEdit75: TDBEdit;
    DBEdit77: TDBEdit;
    DBEdit78: TDBEdit;
    DBEdit79: TDBEdit;
    DBEdit80: TDBEdit;
    DBEdit81: TDBEdit;
    DBEdit82: TDBEdit;
    Label82: TLabel;
    DBEdit83: TDBEdit;
    Query1cpf_inq: TStringField;
    Query1nome_inq: TStringField;
    Query1codigo: TStringField;
    Query1tipologradouro_inq: TStringField;
    Query1logradouro_inq: TStringField;
    Query1Numero_inq: TStringField;
    Query1bairro_inq: TStringField;
    Query1Compl_inq: TStringField;
    Query1cidade_inq: TStringField;
    Query1uf_inq: TStringField;
    Query1email_inq: TStringField;
    qry_devedores: TADODataSet;
    qry_devedoresCGC_CPF: TStringField;
    qry_devedoresNome: TStringField;
    qry_devedorestipo_logradouro: TStringField;
    qry_devedoreslogradouro: TStringField;
    qry_devedoresNumero: TStringField;
    qry_devedoresComplemento: TStringField;
    qry_devedoresBairro: TStringField;
    qry_devedoresCidade: TStringField;
    qry_devedoresCep: TStringField;
    qry_devedoresUf: TStringField;
    qry_devedoresponto_referencia: TStringField;
    qry_devedoresemail: TStringField;
    qry_devedorespk_devedor: TIntegerField;
    qry_devedorespk_cliente: TIntegerField;
    qry_devedorestelefones: TStringField;
    qry_devedoresnomeCliente: TStringField;
    qry_devedorescpf_inq: TStringField;
    qry_devedoresnome_inq: TStringField;
    qry_devedorescodigo: TStringField;
    dts_devedores: TDataSource;
    grid_devedores: TDBGrid;
    Label83: TLabel;
    DBEdit84: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure SB_SalvarClick(Sender: TObject);
    procedure Query1BeforePost(DataSet: TDataSet);
    procedure btn_buscarClick(Sender: TObject);
    procedure Query1AfterOpen(DataSet: TDataSet);
    procedure telefonesBeforePost(DataSet: TDataSet);
    procedure qry_dividaBeforePost(DataSet: TDataSet);
    procedure btn_gravarClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure limpaCampos(opcao: char);
    procedure btn_alterarClick(Sender: TObject);
    procedure buscaTelefonesDivida;
    procedure SB_InserirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure grid_fonesExit(Sender: TObject);
    procedure qry_dividaAfterOpen(DataSet: TDataSet);
    procedure SB_ExcluirClick(Sender: TObject);
    procedure qry_dividaAfterScroll(DataSet: TDataSet);
    procedure qry_historicoCalcFields(DataSet: TDataSet);
    procedure sb_retirarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure formatarCGCCPF( cgcCpf:string );
    procedure edt_cgfExit(Sender: TObject);
    procedure btn_retirarClick(Sender: TObject);
    procedure btn_rotornarClick(Sender: TObject);
    procedure btn_excluirBXParcialClick(Sender: TObject);
    procedure cb_visualizaInativosClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sb_recalculaClick(Sender: TObject);
    procedure cb_titabertoClick(Sender: TObject);
    procedure grid_devedoresDblClick(Sender: TObject);
    procedure abrirDevedor(chaveDevedor :string);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Devedores: TFrm_Devedores;

implementation
uses UDM, URotinas;
{$R *.dfm}

procedure TFrm_Devedores.FormShow(Sender: TObject);
begin
  inherited;
qry_cliente.open;
qry_cobrador.open;

if FRotinas.pk_cliente >0 then
begin
  lk_cliente.Value := IntToStr(FRotinas.pk_cliente);
  lk_cliente.Enabled := false
end;

Urotinas.tiposDeTituloComboDb(cbox_tipoTitulo);


janela:= 'manutencaodevedores';
end;


procedure TFrm_Devedores.SB_SalvarClick(Sender: TObject);
begin

if Query1pk_devedor.AsInteger =0 then
begin
  if lk_cliente.KeyValue = null then
  begin
    showmessage('Informe o Cliente');
    exit;
  end;
end;

if edt_dtPgto.Date >0then
begin
  if cb_motivo.text = '' then
  begin
    showmessage('Informe o motivo da baixa');
    exit;
  end;

  if cb_motivo.ItemIndex = 0 then
    Query1motivo_baixa.value := 'PG'
  else
    Query1motivo_baixa.value := 'TR';

end;
grid_fones.Enabled :=true;

  inherited;

end;

procedure TFrm_Devedores.Query1BeforePost(DataSet: TDataSet);
var chave:integer;
var cpf:string;
begin
  inherited;

  if Query1pk_devedor.value = 0 then
  begin
    seq_tabelas.close;
    seq_tabelas.Parameters.ParamByName('tab').value := 'devedores';
    seq_tabelas.open;
    chave := seq_tabelasseq.asInteger+1;

    Query1pk_devedor.value := chave;
    Query1pk_cliente.value := lk_cliente.KeyValue;


    if Length(edt_cgf.text) > 0 then
    begin
      cpf := Urotinas.limpaFormatacao(edt_cgf.text);
      Query1CGC_CPF.value := cpf;
    end;

    seq_tabelas.edit;
    seq_tabelasseq.Value := chave;
    seq_tabelas.post;
  end
  else
  begin
      if Length(edt_cgf.text) > 0 then
      begin
        cpf := Urotinas.limpaFormatacao(edt_cgf.text);
        Query1CGC_CPF.value := cpf;
    end;
  end;


end;

procedure TFrm_Devedores.abrirDevedor(chaveDevedor :string);
begin
 Query1.close;
  Query1.CommandText := 'select * from devedores where  pk_devedor='+chaveDevedor;
  Query1.open;

  telefones.close;
  if Query1.RecordCount >0 then
    telefones.CommandText := 'select * from telefones where pk_devedor='+ Query1pk_devedor.asstring
  else
    telefones.CommandText := 'select * from telefones where 1=2';
  telefones.open;

  qry_historico.Close;
  qry_historico.SQL.Text := 'select e.* , o.nome as nome_dialogo from eventos e left join ocorrencias o on (e.motivo=o.pk_ocorr) where e.pk_devedor='+Query1pk_devedor.asstring+' order by e.data desc';
  qry_historico.open;

  qry_bxparciais.close;
  qry_bxparciais.Parameters.ParamByName('devedor').value := Query1pk_devedor.asstring;
  qry_bxparciais.open;

end;

procedure TFrm_Devedores.btn_buscarClick(Sender: TObject);
var select, from, where, chave:string;
var erro:boolean;
begin
  inherited;

if  cpf_devedor.text = '' then
begin
  showmessage('Informe o CPF ou Nome do Devedor');
  exit;
end;

chave := cpf_devedor.Text;
erro:=false;

qry_bxparciais.close;
qry_historico.Close;
telefones.close;

select:='select d.*, c.nome as nomeCliente ';
from:='from DEVEDORES d inner join CLIENTES c on ( c.pk_cliente=d.pk_cliente) ';
where := '';
//order by d.valor_divida desc


qry_devedores.Close;
where := 'where  d.pk_devedor='+chave;
qry_devedores.CommandText := select+from+where;
try
  qry_devedores.open;
Except
  erro:=true;
end;


if erro or (qry_devedores.recordCount = 0) then
begin

  if (lk_cliente.KeyValue = null) then
  begin
    showmessage('Informe o Cliente');
    exit;
  end;



  qry_devedores.Close;
  qry_devedores.CommandText := select+from+'  where (d.CGC_CPF='''+chave+''' or d.NOME LIKE ''%'+chave+'%'' or d.codigo like ''%'+chave+'%'' '+
  ' or d.cpf_inq = '''+chave+''' or d.nome_inq like ''%'+chave+'%'' '+
  ')  and d.pk_cliente='+lk_cliente.KeyValue;


  qry_devedores.open;
  if qry_devedores.recordCount = 0 then
  begin

        showmessage('Não foi localizado nenhum Devedor com este CPF');
        exit;
  end;
end;

if qry_devedores.recordCount > 1 then
begin
    grid_devedores.left := 10;
    grid_devedores.top := 269;
    grid_devedores.width := 993;
    grid_devedores.height := 345;

    //pn_pesq.Visible := true;

    grid_devedores.Visible := true;
end;



if qry_devedores.recordCount =1 then
begin
  abrirDevedor(qry_devedorespk_devedor.asstring);
end;

end;

procedure TFrm_Devedores.Query1AfterOpen(DataSet: TDataSet);
begin
  inherited;
  buscaTelefonesDivida;

  if Query1pk_devedor.asInteger >0 then
  begin
    recibos.close;
    recibos.Parameters.ParamByName('devedor').value := Query1pk_devedor.asstring;
    recibos.open;
  end;

  if Query1data_baixa.value >0 then
  begin
    if Query1motivo_baixa.value = 'PG' then
      cb_motivo.ItemIndex := 0
    else
      cb_motivo.ItemIndex := 1;
  end;

  lk_cliente.Color        := clWindow;
  lk_cliente.Font.Color   := clBlack;

  cpf_devedor.Color        := clWindow;
  cpf_devedor.Font.Color   := clBlack;

  formatarCGCCPF(Query1CGC_CPF.asstring);

end;

procedure TFrm_Devedores.buscaTelefonesDivida;
begin
  telefones.close;
  if Query1pk_devedor.asInteger >0 then
    telefones.CommandText := 'select * from telefones where pk_devedor='+ Query1pk_devedor.asstring
  else
    telefones.CommandText := 'select * from telefones where 1=2';

  telefones.open;

  qry_divida.Close;
  if Query1pk_devedor.asInteger>0 then
    qry_divida.CommandText := 'select * from titulos where pk_devedor='+Query1pk_devedor.asstring+' order by vencimento, numero_titulo'
  else
    qry_divida.CommandText := 'select * from titulos where 1=2';
  qry_divida.open;


end;

procedure TFrm_Devedores.telefonesBeforePost(DataSet: TDataSet);
var chave:integer;
begin
  inherited;
  if Query1pk_devedor.value > 0 then
  begin
    seq_tabelas.close;
    seq_tabelas.Parameters.ParamByName('tab').value := 'telefones';
    seq_tabelas.open;
    chave := seq_tabelasseq.asInteger+1;

    telefonesid.value := chave;
    telefonespk_devedor.value := Query1pk_devedor.value;

    seq_tabelas.edit;
    seq_tabelasseq.Value := chave;
    seq_tabelas.post;
  end;

end;

procedure TFrm_Devedores.qry_dividaBeforePost(DataSet: TDataSet);
var chave:integer;
begin
  inherited;
  if (Query1pk_devedor.value > 0) and (qry_dividapk_titulo.asinteger =0) then
  begin

    chave := frotinas.Sequencial('titulos');

    qry_dividapk_titulo.value := chave;
    qry_dividapk_devedor.value := Query1pk_devedor.value;
    qry_dividapk_cliente.value := Query1pk_cliente.value;


    //qry_dividapk_titulo.value := chave;
    //qry_dividapk_devedor.value := Query1pk_devedor.value;

    //seq_tabelas.edit;
    //seq_tabelasseq.Value := chave;
    //seq_tabelas.post;
  end;

  if cbx_motivoBx.ItemIndex = 0 then
    qry_dividamotivo_baixa.Value := 'PG'
  else if cbx_motivoBx.ItemIndex = 1 then
    qry_dividamotivo_baixa.Value := 'TR';

  qry_dividaatualizar.value := 'Sim';

end;

procedure TFrm_Devedores.btn_gravarClick(Sender: TObject);
var pktitulo :integer;
begin
  inherited;

   if not frotinas.acessoValido(janela,'btn_gravar') then
   begin
    showmessage('Você não tem permissão para esta opção.');
    exit;
   end;


  limpaCampos('P');


  // limpa campos pra evitar sujeira
  qry_dividaValor_titulo.value := qry_dividavalor_principal.value ;
  qry_dividaatu_juros.value := 0;
  qry_dividaatu_multa.value := 0;
  qry_dividaatu_retencao.value := 0;
  qry_dividaatu_valor.value := 0;


  qry_divida.Post;

btn_alterar.enabled := true;
btn_incluir.enabled := true;
btn_gravar.enabled  := false;

end;

procedure TFrm_Devedores.PageControl1Change(Sender: TObject);
begin
  inherited;
  if Query1.RecordCount >0 then
  begin

    ToolBar.Enabled := true;

    if  PageControl1.TabIndex = 1 then
      ToolBar.Enabled := false;

    qry_divida.Cancel;

    if qry_divida.recordCount >0 then
      btn_alterar.enabled := true;

    btn_incluir.enabled := true;
    btn_gravar.enabled  := false;
  end
  else
    PageControl1.TabIndex := 0;

end;

procedure TFrm_Devedores.btn_incluirClick(Sender: TObject);
begin
  inherited;

   if not frotinas.acessoValido(janela,'btn_incluir') then
   begin
    showmessage('Você não tem permissão para esta opção.');
    exit;
   end;


if Query1pk_devedor.AsInteger = 0 then
begin
  showmessage('Não foi selectionado o Devedor');
  exit;
end;

limpaCampos('I');

if not qry_divida.Active then
begin
    qry_divida.Close;
    qry_divida.CommandText := 'select * from titulos where pk_devedor='+Query1pk_devedor.asstring+' order by vencimento';
    qry_divida.open;
end;

qry_divida.Append;

btn_incluir.enabled := false;
btn_alterar.enabled := false;
btn_gravar.enabled  := true;

edt_banco.SetFocus;

end;

procedure TFrm_Devedores.limpaCampos(opcao:Char);
var i:integer;
begin
   //  Inclusão ou Edição, coloca Cor Branco no Fundo dos Campos

   if Opcao in ['E','I'] then
        for i:=0 to ComponentCount-1 do
        begin
           if (Components[i].ClassName = 'TEdit') or
              (Components[i].ClassName = 'TDBEdit') or
              (Components[i].ClassName = 'TDBListBox') or
              (Components[i].ClassName = 'TDBComboBox') or
              (Components[i].ClassName = 'TRxDBComboBox') or
              (Components[i].ClassName = 'TDBLookupComboBox') or
              (Components[i].ClassName = 'TDBLookupListBox') or
              (Components[i].ClassName = 'TDBMemo')            or
              (Components[i].ClassName = 'TMaskEdit')          or
              (Components[i].ClassName = 'TRxDBCalcEdit')          or
              (Components[i].ClassName = 'TRxDBLookupCombo')          or
              (Components[i].ClassName = 'TDBDateEdit')      or
              (Components[i].ClassName = 'TCurrencyEdit') then
           begin
              Tedit(Components[i]).Color        := clWindow;
              TEdit(Components[i]).Font.Color   := clBlack;
           end;
        end
   else
        for i:=0 to ComponentCount-1 do
        begin
           if (Components[i].ClassName = 'TEdit') or
              (Components[i].ClassName = 'TDBEdit') or
              (Components[i].ClassName = 'TDBListBox') or
              (Components[i].ClassName = 'TMaskEdit')          or
              (Components[i].ClassName = 'TDBComboBox') or
              (Components[i].ClassName = 'TRxDBCalcEdit')          or
              (Components[i].ClassName = 'TRxDBComboBox') or
              (Components[i].ClassName = 'TDBLookupComboBox') or
              (Components[i].ClassName = 'TDBLookupListBox') or
              (Components[i].ClassName = 'TDBMemo')            or
              (Components[i].ClassName = 'TRxDBLookupCombo')          or
              (Components[i].ClassName = 'TDBDateEdit') or
              (Components[i].ClassName = 'TCurrencyEdit') then
           begin
              Tedit(Components[i]).Color        := clSilver; //$00404000;
              TEdit(Components[i]).Font.Color   := clNavy; //ClBlack;
           end;

        end;


end;

procedure TFrm_Devedores.btn_alterarClick(Sender: TObject);
begin
  inherited;

   if not frotinas.acessoValido(janela,'btn_alterar') then
   begin
    showmessage('Você não tem permissão para esta opção.');
    exit;
   end;

  limpaCampos('E');

btn_alterar.enabled := false;
btn_incluir.enabled := false;
btn_gravar.enabled := true;

  qry_divida.edit;
end;

procedure TFrm_Devedores.SB_InserirClick(Sender: TObject);
begin
if lk_cliente.KeyValue = null then
begin
  showmessage('Não foi informado o cliente');
  exit;
end;

if not Query1.Active then
  Query1.open;

PageControl1.TabIndex := 0;
grid_fones.Enabled :=false;

  inherited;
buscaTelefonesDivida;
  recibos.close;

edt_cgf.Text := '';
edt_cgf.SetFocus;

end;


procedure TFrm_Devedores.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
        begin
           key := #0;
           PerForm (cm_dialogKey,vk_tab,0);
        end;

  //if key = F10 then
  //      gravar();

  {Trocando Virgula por Ponto}
  if Key in [',','.'] then
    Key := DecimalSeparator;

  if key = #27 then
    close;

end;

procedure TFrm_Devedores.grid_fonesExit(Sender: TObject);
begin
  inherited;
telefones.Post;
end;

procedure TFrm_Devedores.qry_dividaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if qry_divida.recordCount>0 then
  begin
    btn_alterar.enabled := true;
    btn_incluir.enabled := true;
    btn_gravar.enabled  := false;
  end
  else
  begin
    btn_alterar.enabled := false;
    btn_incluir.enabled := true;
    btn_gravar.enabled  := false;
  end;

end;

procedure TFrm_Devedores.SB_ExcluirClick(Sender: TObject);
var seq:integer;
begin

   if not frotinas.acessoValido(janela,'SB_Excluir') then
   begin
    showmessage('Você não tem permissão para esta opção.');
    exit;
   end;

   if qry_dividapk_recibo.AsInteger >0 then
   begin
    showmessage('Não é possível excluir esta dívida pois já existe um recibo. Exclua o recibo de pagamento para poder excluir dívida.');
    exit;
   end;


  //inherited;
   if MessageDlg('Dejesa realmente Excluir?',
      mtConfirmation, [mbYes, mbNo],0) = mrYes then
   begin
      telefones.first;
      while not telefones.Eof do
      begin
        telefones.delete;
      end;

      qry_divida.First;
      while not qry_divida.eof do
      begin
        log.Close;
        log.Open;
        log.append;
        logdata.Value := date;
        logtexto.value := 'Exclusão do titulo (chave '+qry_dividapk_titulo.asstring+' Número:'+qry_dividanumero_titulo.asstring+
      ' Vencimento: '+qry_dividaVencimento.AsString+' Ch.Contrato: '+qry_dividachave_contrato.asstring+
      ' Ch Titulo: '+qry_dividachave_titulo.AsString+' Vr. Titulo: '+qry_dividaValor_titulo.asstring+
      ' Devedor:'+Query1Nome.asstring+' CNPJ/CPF: '+Query1CGC_CPF.asstring+   ')';


        logusuario_chave.value := frotinas.usu_nu;
        logusuario_nome.value := frotinas.Usu_Nome;
        logdevedor_chave.value := Query1pk_devedor.asinteger;
        logdevedor_nome.value :=Query1Nome.Value;
        lognumero_titulo.value := qry_dividanumero_titulo.Value;
        logtipo.Value := 'Exclusão do Devedor';
        logcgc_cpf.Value := Query1CGC_CPF.value;
        log.post;

        qry_divida.delete;
      end;

      seq_tabelas.close;
      seq_tabelas.Parameters.ParamByName('tab').value := 'devedores';
      seq_tabelas.open;
      seq := seq_tabelasseq.asInteger+1;
      seq_tabelas.edit;
      seq_tabelasseq.Value := seq;
      seq_tabelas.post;

      eventos.Close;
      eventos.CommandText := 'select * from eventos where pk_devedor='+Query1pk_devedor.asstring;
      eventos.open;
      while not eventos.eof do
      begin
        eventos.delete;
      end;



      Excluir;

   end;

end;

procedure TFrm_Devedores.qry_dividaAfterScroll(DataSet: TDataSet);
var total:real;
begin
  inherited;
  cbx_motivoBx.ItemIndex := -1;

  if qry_dividamotivo_baixa.Value = 'PG' then
    cbx_motivoBx.ItemIndex := 0
  else if qry_dividamotivo_baixa.Value = 'TR' then
    cbx_motivoBx.ItemIndex := 1;

  qry_bxparctitulo.close;
  if qry_dividapk_titulo.asinteger >0 then
    qry_bxparctitulo.CommandText := 'select * from baixasparciais where pk_devedor='+qry_dividapk_devedor.asstring+' and pk_titulo='+qry_dividapk_titulo.asstring
  else
    qry_bxparctitulo.CommandText := 'select * from baixasparciais where 1=2';
  qry_bxparctitulo.open;

  while not qry_bxparctitulo.eof do
  begin
    total := total + qry_bxparctitulovalor.asfloat;
    qry_bxparctitulo.next;
  end;
  qry_bxparctitulo.first;

  edt_totbxparciais.Text := FormatFloat('#,###,##0.00', total);

end;

procedure TFrm_Devedores.qry_historicoCalcFields(DataSet: TDataSet);
begin
  inherited;
{
0 1-Falou com o Cliente
1 2-Deixou Recado
2 3-Não Atende
3 4-Número Errado
4 5-Não Localizado
5 6-Marcou Pagamento
6 7-Falecido

}
{
if qry_historicomotivo.value = 0 then
  qry_historiconome_motivo.value := 'Falou com o Cliente'
else if qry_historicomotivo.value = 1 then
  qry_historiconome_motivo.value := 'Deixou Recado'
else if qry_historicomotivo.value = 2 then
  qry_historiconome_motivo.value := 'Não Atende'
else if qry_historicomotivo.value = 3 then
  qry_historiconome_motivo.value := 'Número Errado'
else if qry_historicomotivo.value = 4 then
  qry_historiconome_motivo.value := 'Não Localizado'
else if qry_historicomotivo.value = 5 then
  qry_historiconome_motivo.value := 'Marcou Pagamento'
else if qry_historicomotivo.value = 6 then
  qry_historiconome_motivo.value := 'Falecido'
else if qry_historicomotivo.value = 9 then
  qry_historiconome_motivo.value := 'Outros';
}
end;

procedure TFrm_Devedores.sb_retirarClick(Sender: TObject);
var chave:integer;
begin
  inherited;

   if not frotinas.acessoValido(janela,'sb_retirar') then
   begin
    showmessage('Você não tem permissão para esta opção.');
    exit;
   end;


  if MessageDlg('Deseja Retirar este Devedor da assessoria ?',
     mtConfirmation, [mbYes, mbNo],0) = mrNo then
    exit;

  seq_tabelas.close;
  seq_tabelas.Parameters.ParamByName('tab').value := 'eventos';
  seq_tabelas.open;

  seq_tabelas.edit;
  seq_tabelasseq.Value := seq_tabelasseq.asInteger + 1;
  seq_tabelas.post;
  chave := seq_tabelasseq.Value;

  qry_evento.Close;
  qry_evento.open;

  qry_evento.append;
  qry_eventochave.value := chave;
  qry_eventopk_devedor.value := Query1pk_devedor.value;
  qry_eventoData.value :=  Date;
  qry_eventoHora.value := FormatDateTime( 'hh:mm:ss', time);
  qry_eventomotivo.value := 9;
  qry_eventoTexto.Value := 'Cliente retirou o Devedor da assessoria ';
  qry_evento.post;


  while not qry_divida.eof do
  begin

    qry_divida.edit;
    qry_divida.fieldbyname('motivo_baixa').value := 'TR';
    qry_divida.fieldbyname('data_baixa').value := date;
    qry_divida.post;

    qry_divida.next;

  end;


end;

procedure TFrm_Devedores.btn_excluirClick(Sender: TObject);
begin
  inherited;
   if qry_dividapk_recibo.AsInteger >0 then
   begin
    showmessage('Não é possível excluir esta dívida pois já existe um recibo. Exclua o recibo de pagamento para poder excluir dívida.');
    exit;
   end;


   if not frotinas.acessoValido(janela,'btn_excluir') then
   begin
    showmessage('Você não tem permissão para esta opção.');
    exit;
   end;

   if MessageDlg('Dejesa realmente Excluir?',
      mtConfirmation, [mbYes, mbNo],0) = mrYes then
   begin

      log.Close;
      log.Open;
      log.append;
      logdata.Value := date;
      logtexto.value := 'Exclusão do titulo (chave '+qry_dividapk_titulo.asstring+' Número:'+qry_dividanumero_titulo.asstring+
      ' Vencimento: '+qry_dividaVencimento.AsString+' Ch.Contrato: '+qry_dividachave_contrato.asstring+
      ' Ch Titulo: '+qry_dividachave_titulo.AsString+' Vr. Titulo: '+qry_dividaValor_titulo.asstring+
      ' Devedor:'+Query1Nome.asstring+' CNPJ/CPF: '+Query1CGC_CPF.asstring+   ')';
      logusuario_chave.value := frotinas.usu_nu;
      logusuario_nome.value := frotinas.Usu_Nome;
      logdevedor_chave.value := Query1pk_devedor.asinteger;
      logdevedor_nome.value :=Query1Nome.Value;
      logtipo.Value := 'Exclusão do título';
      logcgc_cpf.Value := Query1CGC_CPF.value;
      lognumero_titulo.Value := qry_dividanumero_titulo.value;
      log.post;


      qry_divida.Delete;
   end;
end;


procedure TFrm_Devedores.DataSource1StateChange(Sender: TObject);
begin
  inherited;
  lk_cliente.Color        := clWindow;
  lk_cliente.Font.Color   := clBlack;

  cpf_devedor.Color        := clWindow;
  cpf_devedor.Font.Color   := clBlack;

end;

procedure TFrm_Devedores.btn_cancelarClick(Sender: TObject);
begin
  inherited;
qry_divida.cancel;

btn_incluir.enabled := true;
btn_alterar.enabled := true;
btn_gravar.enabled  := false;
limpaCampos('P');

end;

procedure TFrm_Devedores.FormCreate(Sender: TObject);
begin
  inherited;
janela:='manutencaodevedores';
end;

procedure TFrm_Devedores.formatarCGCCPF(cgcCpf:string);
begin
  if Query1.Active and ( Length(cgcCpf) >0 ) then
  begin
    if Length(alltrim(cgcCpf)) = 11 then
      edt_cgf.text := FormatCPF(cgcCpf)
    else
      edt_cgf.text := FormatCGC(cgcCpf);
  end;
end;
procedure TFrm_Devedores.edt_cgfExit(Sender: TObject);
var cpf:string;
begin
  inherited;
  cpf:= edt_cgf.Text;
  formatarCGCCPF(cpf);
end;

procedure TFrm_Devedores.btn_retirarClick(Sender: TObject);
begin
  inherited;
  if not frotinas.acessoValido(janela,'btn_retirar') then
  begin
    showmessage('Você não tem permissão para esta opção.');
    exit;
  end;

  if not MessageDlg('Dejesa retirar este Titulo da Assessoria?',
    mtConfirmation, [mbYes, mbNo],0) = mrYes then
    exit;


  if qry_dividadata_baixa.AsString  <> '' then
  begin
    showmessage('Este título já foi retirado da Carteira');
    exit;
  end;

   if qry_dividapk_recibo.AsInteger >0 then
   begin
    showmessage('Não é possível retirar esta dívida pois já existe um recibo. Exclua o recibo de pagamento para poder excluir dívida.');
    exit;
   end;


  qry_divida.edit;
  qry_dividamotivo_baixa.value := 'TR';
  qry_dividadata_baixa.value := date;
  qry_dividausuario_baixa.value := frotinas.usu_nu;
  qry_divida.post;

  buscaTelefonesDivida;


  showmessage('Título retirado da Carteira');

end;

procedure TFrm_Devedores.btn_rotornarClick(Sender: TObject);
begin
  inherited;

  if not frotinas.acessoValido(janela,'btn_rotornar') then
  begin
    showmessage('Você não tem permissão para esta opção.');
    exit;
  end;

  if not MessageDlg('Dejesa retornar este Titulo para Assessoria?',
    mtConfirmation, [mbYes, mbNo],0) = mrYes then
    exit;

  if qry_dividamotivo_baixa.value = '' then
  begin
    showmessage('Este título não está baixado');
    exit;
  end;


  frotinas.ADOCommand1.CommandText := 'update titulos set motivo_baixa = null, usuario_baixa=null, data_baixa=null where pk_titulo='+qry_dividapk_titulo.asstring;
  frotinas.ADOCommand1.Prepared;
  frotinas.ADOCommand1.Execute;

  buscaTelefonesDivida;

  showmessage('Título retornado da Carteira');

end;

procedure TFrm_Devedores.btn_excluirBXParcialClick(Sender: TObject);
begin
  inherited;
  if not frotinas.acessoValido(janela,'btn_excluirBXParcial') then
  begin
    showmessage('Você não tem permissão para esta opção.');
    exit;
  end;

  if MessageDlg('Dejesa Excluir esta baixa parcial?',
    mtConfirmation, [mbYes, mbNo],0) = mrYes then
    qry_bxparciais.delete
  else
    exit;


end;

procedure TFrm_Devedores.cb_visualizaInativosClick(Sender: TObject);
begin
  inherited;
if cb_visualizaInativos.Checked then
begin
  qry_cliente.close;
  qry_cliente.SQL.CommaText := 'select * from clientes';
  qry_cliente.open;
end
else
begin
  qry_cliente.close;
  qry_cliente.SQL.CommaText := 'select * from clientes where inativado is null';
  qry_cliente.open;
end;

end;

procedure TFrm_Devedores.SpeedButton1Click(Sender: TObject);
begin
  inherited;

  if recibospk_prestcontas.Value > 0 then
  begin
    showmessage('Não pode excluir recibo em prestação de contas ');
    exit;
  end;

  if not frotinas.acessoValido(janela,'btn_excluirRecibo') then
  begin
    showmessage('Você não tem permissão para esta opção.');
    exit;
  end;

  if MessageDlg('Dejesa Excluir este Recibo?',
    mtConfirmation, [mbYes, mbNo],0) = mrYes then
  begin

    if frotinas.excluirRecibos(recibospk_recibo.asfloat,false) then
      showmessage('Excusão realizada!')
    else
      showmessage('Não foi possível excluir recibo!');

    recibos.close;
    recibos.open;


  end
  else
    exit;



end;

procedure TFrm_Devedores.sb_recalculaClick(Sender: TObject);
var diasAtraso: integer;
begin
  inherited;


end;

procedure TFrm_Devedores.cb_titabertoClick(Sender: TObject);
begin
  inherited;

  if cb_titaberto.Checked then
  begin
    qry_divida.Filter := ' data_baixa = null';
    qry_divida.Filtered := true;
  end
  else
  begin
    qry_divida.Filter := '';
    qry_divida.Filtered := false;

  end;

end;

procedure TFrm_Devedores.grid_devedoresDblClick(Sender: TObject);
begin
  inherited;
//buscaProximo();

grid_devedores.visible := false;

abrirDevedor(qry_devedorespk_devedor.asstring);

//pn_pesq.Visible := false;

end;

end.
