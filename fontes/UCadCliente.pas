unit UCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadPadrao, DB, ADODB, ComCtrls, RXCtrls, ExtCtrls, SpeedBar,
  Grids, DBGrids, DBTables, StdCtrls, RxDBComb, Mask, DBCtrls, RXDBCtrl,
  ToolEdit, CurrEdit, Buttons;

type
  TFrm_CadCliente = class(TFrm_PadCad)
    DBGrid1: TDBGrid;
    query1pk_cliente: TIntegerField;
    query1nome: TStringField;
    seq_tabelas: TADODataSet;
    seq_tabelastabela: TStringField;
    seq_tabelasseq: TIntegerField;
    taxas: TADODataSet;
    dts_taxas: TDataSource;
    taxaspk_cliente: TIntegerField;
    taxaspk_faixa: TIntegerField;
    taxascodigo: TStringField;
    taxasfaixa1: TIntegerField;
    taxasfaixa2: TIntegerField;
    taxasperc_desc_juros: TBCDField;
    taxasperc_desc_multa: TBCDField;
    taxasperc_desc_princ: TBCDField;
    taxasperc_ret: TBCDField;
    taxasforma_ret: TStringField;
    Query1cnpj: TStringField;
    Query1layout_Inteq: TStringField;
    Query1baixaTit_Carga: TStringField;
    gb_regras: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    db_bxtituloscarga: TDBComboBox;
    dbgird_faixas: TRxDBGrid;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Query1arquivaBxParcial: TStringField;
    Query1TIPO_LOGRADOURO: TStringField;
    Query1LOGRADOURO: TStringField;
    Query1NUMERO: TStringField;
    Query1COMPLEMENTO: TStringField;
    Query1BAIRRO: TStringField;
    Query1CIDADE: TStringField;
    Query1CEP: TStringField;
    Query1UF: TStringField;
    Query1PONTO_REF: TStringField;
    Query1TELEFONE: TStringField;
    Query1FAX: TStringField;
    Query1ZERO_OITOCENTOS: TStringField;
    Query1EMAIL: TStringField;
    Query1SKYPE: TStringField;
    Query1MSN: TStringField;
    Query1RESP_COBRANA: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Query1banco1: TStringField;
    Query1agencia1: TStringField;
    Query1conta1: TStringField;
    Query1banco2: TStringField;
    Query1agencia2: TStringField;
    Query1conta2: TStringField;
    TabSheet3: TTabSheet;
    Label30: TLabel;
    DBDateEdit1: TDBDateEdit;
    GroupBox3: TGroupBox;
    Label29: TLabel;
    Label23: TLabel;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    DBEdit23: TDBEdit;
    GroupBox4: TGroupBox;
    Label26: TLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit26: TDBEdit;
    Label31: TLabel;
    Query1favorecido1: TStringField;
    Query1favorecido2: TStringField;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    Query1inativado: TDateTimeField;
    Query1perc_juros_mes: TBCDField;
    Query1perc_multa: TBCDField;
    DBEdit1: TDBEdit;
    Label32: TLabel;
    DBComboBox1: TDBComboBox;
    Query1tipoatraso: TStringField;
    TabSheet4: TTabSheet;
    Query1codsocio: TStringField;
    Query1codentidade: TStringField;
    Query1razaosocial: TStringField;
    Query1diasatrasoremessaspc: TIntegerField;
    Query1naturezainclusaospc: TStringField;
    Query1retirarPorNegociacao: TStringField;
    Label33: TLabel;
    DBEdit29: TDBEdit;
    Label34: TLabel;
    DBEdit30: TDBEdit;
    Label35: TLabel;
    DBEdit31: TDBEdit;
    Label36: TLabel;
    DBEdit32: TDBEdit;
    Label37: TLabel;
    cbox_naturezainclusao: TDBComboBox;
    RxDBComboBox1: TRxDBComboBox;
    Label38: TLabel;
    GroupBox5: TGroupBox;
    edt_tipo: TComboBox;
    Query1tiposDeTitulos: TStringField;
    Label39: TLabel;
    DBEdit33: TDBEdit;
    Label40: TLabel;
    SpeedButton1: TSpeedButton;
    Label41: TLabel;
    GroupBox6: TGroupBox;
    Label42: TLabel;
    Query1taxaAdm: TBCDField;
    Query1vr_taxa_bancaria: TBCDField;
    Query1vr_segunda_via: TBCDField;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    taxasperc_desc_tx_ADM: TBCDField;
    DBRadioGroup1: TDBRadioGroup;
    procedure Query1BeforePost(DataSet: TDataSet);
    procedure SB_InserirClick(Sender: TObject);
    procedure SB_SalvarClick(Sender: TObject);
    procedure taxasBeforePost(DataSet: TDataSet);
    procedure Query1AfterScroll(DataSet: TDataSet);
    procedure dbgird_faixasExit(Sender: TObject);
    procedure RxDBGrid1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_ExcluirClick(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_tipoExit(Sender: TObject);
    procedure adicionarTipo();
    procedure SpeedButton1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadCliente: TFrm_CadCliente;

implementation

uses UDM,urotinas;
{$R *.dfm}

procedure TFrm_CadCliente.Query1BeforePost(DataSet: TDataSet);
var chave:integer;
begin
  inherited;
  if Query1pk_cliente.value = 0 then
  begin
    seq_tabelas.close;
    seq_tabelas.Parameters.ParamByName('tab').value := 'clientes';
    seq_tabelas.open;
    chave := seq_tabelasseq.asInteger+1;

    Query1pk_cliente.value := chave;

    seq_tabelas.edit;
    seq_tabelasseq.Value := chave;
    seq_tabelas.post;
  end;

end;

procedure TFrm_CadCliente.SB_InserirClick(Sender: TObject);
begin
  inherited;
dbgird_faixas.Enabled := false;

end;

procedure TFrm_CadCliente.SB_SalvarClick(Sender: TObject);
begin
  inherited;
dbgird_faixas.Enabled := true;




end;

procedure TFrm_CadCliente.taxasBeforePost(DataSet: TDataSet);
var chave:integer;
begin
  inherited;

  if taxaspk_cliente.value = 0 then
  begin

    seq_tabelas.close;
    seq_tabelas.Parameters.ParamByName('tab').value := 'taxas_clientes';
    seq_tabelas.open;
    chave := seq_tabelasseq.asInteger+1;

    seq_tabelas.edit;
    seq_tabelasseq.Value := chave;
    seq_tabelas.post;

    taxaspk_faixa.Value := chave;

    taxaspk_cliente.value := Query1pk_cliente.Value;
  end;

end;

procedure TFrm_CadCliente.Query1AfterScroll(DataSet: TDataSet);
begin
  inherited;
taxas.Close;
taxas.Parameters.ParamByName('cliente').value := Query1pk_cliente.Value;
taxas.open;
  if Query1baixaTit_Carga.value = 'S' then
    db_bxtituloscarga.Text := 'Sim'
  else
    if Query1baixaTit_Carga.value = 'N' then
      db_bxtituloscarga.Text := 'Não'
    else
      if Query1baixaTit_Carga.value = 'B' then
        db_bxtituloscarga.Text := 'Baixa como Retirada';


end;

procedure TFrm_CadCliente.dbgird_faixasExit(Sender: TObject);
begin
  inherited;
taxas.post;
end;

procedure TFrm_CadCliente.RxDBGrid1Exit(Sender: TObject);
begin
  inherited;
   if (dts_taxas.State = dsEdit) or (dts_taxas.State = dsInsert)then
    taxas.post;
end;

procedure TFrm_CadCliente.FormCreate(Sender: TObject);
begin
  inherited;
janela:='Empresascliente';
end;

procedure TFrm_CadCliente.SB_ExcluirClick(Sender: TObject);
begin
  frotinas.Qry_Livre.close;
  frotinas.Qry_Livre.CommandText := 'select count(1) as conta from devedores where pk_cliente='+Query1pk_cliente.asstring;
  frotinas.Qry_Livre.open;
  if frotinas.Qry_Livre.fieldByName('conta').asinteger >0 then
  begin
    showmessage('Não é possível excluir Cliente, já existe movimentação. Para isso utilize o expurgo.');
    exit;
  end;

  inherited;

end;

procedure TFrm_CadCliente.DataSource1StateChange(Sender: TObject);
begin
  inherited;
  if Query1baixaTit_Carga.value = 'S' then
    db_bxtituloscarga.Text := 'Sim';

end;

procedure TFrm_CadCliente.FormShow(Sender: TObject);
begin
  inherited;

  Urotinas.naturezaDeInclusaoSPCComboDB(cbox_naturezainclusao);
  Urotinas.tiposDeTituloCombo(edt_tipo);


  if frotinas.acessoValido(janela,'REGRAS') then
    gb_regras.visible := true
  else
    gb_regras.visible := false;

end;

procedure TFrm_CadCliente.edt_tipoExit(Sender: TObject);
begin
  inherited;
  adicionarTipo;

end;

procedure TFrm_CadCliente.adicionarTipo();
begin


  if edt_tipo.Text <> '' then
  begin
    if Query1tiposDeTitulos.Value  = '' then
      Query1tiposDeTitulos.Value := edt_tipo.Text
    else
      Query1tiposDeTitulos.Value := Query1tiposDeTitulos.Value + ',' + edt_tipo.Text;

    edt_tipo.Text := '';

  end;
end;


procedure TFrm_CadCliente.SpeedButton1Click(Sender: TObject);
begin
  inherited;
adicionarTipo();
end;

end.
