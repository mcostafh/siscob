unit Ucons_cobranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, RxLookup, DB, ADODB, Mask, ToolEdit,
  SpeedBar, ComCtrls, Gauges, DBCtrls, Grids, DBGrids, RXSpin, CurrEdit,
  RXDBCtrl, RXCtrls, ToolWin, jpeg;

type
  Tfrm_cons_cobranca = class(TForm)
    Dts_cliente: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    qry_devedores: TADODataSet;
    qry_temp: TADOQuery;
    devedor: TADODataSet;
    DataSource1: TDataSource;
    qry_divida: TADOQuery;
    dts_divida: TDataSource;
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
    qry_dividavenc_ult_extrato: TDateTimeField;
    qry_dividadias_atraso_remessa: TIntegerField;
    qry_dividaValor_titulo: TFloatField;
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
    devedorpk_devedor: TIntegerField;
    devedorpk_cliente: TIntegerField;
    devedorchave_no_cliente: TIntegerField;
    devedorcodigo_no_cliente: TStringField;
    devedorCGC_CPF: TStringField;
    devedortitular_avalista: TStringField;
    devedorNome: TStringField;
    devedorRG: TStringField;
    devedorOrgao_Rg: TStringField;
    devedordata_nasc: TDateTimeField;
    devedortelefones: TStringField;
    devedortipo_logradouro: TStringField;
    devedorlogradouro: TStringField;
    devedorNumero: TStringField;
    devedorComplemento: TStringField;
    devedorBairro: TStringField;
    devedorCidade: TStringField;
    devedorCep: TStringField;
    devedorUf: TStringField;
    devedorponto_referencia: TStringField;
    devedortrabalho_nome: TStringField;
    devedorTrab_logradouro: TStringField;
    devedortrab_numero: TStringField;
    devedortrab_bairro: TStringField;
    devedorTrab_cidade: TStringField;
    devedorTrab_uf: TStringField;
    devedortrab_fones: TStringField;
    devedortrab_complemento: TStringField;
    devedortrab_ponto_refer: TStringField;
    devedortrab_cep: TStringField;
    devedorProfissao: TStringField;
    devedorSEXO: TStringField;
    devedorprim_ref_pessoal: TStringField;
    devedorprim_ref_pessoal_fones: TStringField;
    devedorseg_ref_pessoal: TStringField;
    devedorseg_ref_pessoal_fones: TStringField;
    devedordata_baixa: TDateTimeField;
    devedoragendado_data: TDateTimeField;
    devedoragendado_hora: TStringField;
    devedoragendado_tipo: TIntegerField;
    devedorseq_arq_inclusao: TIntegerField;
    devedorseq_arq_baixa: TIntegerField;
    devedorusuario_baixa: TIntegerField;
    devedorusuario_inclusao: TIntegerField;
    devedormotivo_baixa: TStringField;
    devedorvalor_divida: TFloatField;
    Label20: TLabel;
    qry_evento: TADODataSet;
    qry_eventochave: TIntegerField;
    qry_eventopk_devedor: TIntegerField;
    qry_eventoData: TDateTimeField;
    qry_eventoHora: TStringField;
    qry_eventomotivo: TIntegerField;
    qry_eventoAgendado_Data: TDateTimeField;
    qry_eventoAgendado_Tipo: TIntegerField;
    qry_eventoAgendado_Hora: TStringField;
    qry_eventomarcar_nao_localiz: TStringField;
    qry_eventoseq_arq_inclusao: TIntegerField;
    devedordata_dialogo: TDateTimeField;
    devedormotivo_dialogo: TIntegerField;
    telefones: TADODataSet;
    telefonesid: TIntegerField;
    telefonespk_devedor: TIntegerField;
    telefonestipo_fone: TStringField;
    telefonesTelefone: TStringField;
    dts_telefones: TDataSource;
    qry_cliente: TADOQuery;
    qry_clientepk_cliente: TIntegerField;
    qry_clientenome: TStringField;
    DataSource2: TDataSource;
    Label3: TLabel;
    qry_historico: TADOQuery;
    dts_historicos: TDataSource;
    qry_historicochave: TIntegerField;
    qry_historicopk_devedor: TIntegerField;
    qry_historicoData: TDateTimeField;
    qry_historicoHora: TStringField;
    qry_historicoTexto: TStringField;
    qry_historicomotivo: TIntegerField;
    qry_historicoAgendado_Data: TDateTimeField;
    qry_historicoAgendado_Hora: TStringField;
    qry_historicoseq_arq_inclusao: TIntegerField;
    qry_dividaatraso_atual: TIntegerField;
    qry_agendamento: TADODataSet;
    qry_agendamentopk_devedor: TIntegerField;
    qry_agendamentopk_cliente: TIntegerField;
    qry_agendamentochave_no_cliente: TIntegerField;
    qry_agendamentocodigo_no_cliente: TStringField;
    qry_agendamentoCGC_CPF: TStringField;
    qry_agendamentotitular_avalista: TStringField;
    qry_agendamentoNome: TStringField;
    qry_agendamentoRG: TStringField;
    qry_agendamentoOrgao_Rg: TStringField;
    qry_agendamentodata_nasc: TDateTimeField;
    qry_agendamentotelefones: TStringField;
    qry_agendamentotipo_logradouro: TStringField;
    qry_agendamentologradouro: TStringField;
    qry_agendamentoNumero: TStringField;
    qry_agendamentoComplemento: TStringField;
    qry_agendamentoBairro: TStringField;
    qry_agendamentoCidade: TStringField;
    qry_agendamentoCep: TStringField;
    qry_agendamentoUf: TStringField;
    qry_agendamentoponto_referencia: TStringField;
    qry_agendamentotrabalho_nome: TStringField;
    qry_agendamentoTrab_logradouro: TStringField;
    qry_agendamentotrab_numero: TStringField;
    qry_agendamentotrab_bairro: TStringField;
    qry_agendamentoTrab_cidade: TStringField;
    qry_agendamentoTrab_uf: TStringField;
    qry_agendamentotrab_fones: TStringField;
    qry_agendamentotrab_complemento: TStringField;
    qry_agendamentotrab_ponto_refer: TStringField;
    qry_agendamentotrab_cep: TStringField;
    qry_agendamentoProfissao: TStringField;
    qry_agendamentoSEXO: TStringField;
    qry_agendamentoprim_ref_pessoal: TStringField;
    qry_agendamentoprim_ref_pessoal_fones: TStringField;
    qry_agendamentoseg_ref_pessoal: TStringField;
    qry_agendamentoseg_ref_pessoal_fones: TStringField;
    qry_agendamentonao_localizado: TDateTimeField;
    qry_agendamentodata_baixa: TDateTimeField;
    qry_agendamentoagendado_data: TDateTimeField;
    qry_agendamentoagendado_hora: TStringField;
    qry_agendamentoagendado_tipo: TIntegerField;
    qry_agendamentoseq_arq_inclusao: TIntegerField;
    qry_agendamentoseq_arq_baixa: TIntegerField;
    qry_agendamentousuario_baixa: TIntegerField;
    qry_agendamentousuario_inclusao: TIntegerField;
    qry_agendamentomotivo_baixa: TStringField;
    qry_agendamentovalor_divida: TFloatField;
    qry_agendamentomotivo_dialogo: TIntegerField;
    qry_agendamentodata_dialogo: TDateTimeField;
    qry_agendamentopk_cobrador: TIntegerField;
    Timer1: TTimer;
    temp: TADOCommand;
    qry_clientes: TADOQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    dts_clientes: TDataSource;
    dts_devedores: TDataSource;
    qry_dividanMotivo_baixa: TStringField;
    devedorpk_cobrador: TIntegerField;
    devedornMotivo_baixa: TStringField;
    usuarios: TADOTable;
    dts_usuarios: TDataSource;
    qry_eventoagendado_cobrador: TIntegerField;
    devedoragendado_cobrador: TIntegerField;
    qry_dividapk_recibo: TIntegerField;
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
    dts_recibos: TDataSource;
    recibosdata_venc: TDateTimeField;
    devedornossonumero: TStringField;
    taxas: TADODataSet;
    taxaspk_cliente: TIntegerField;
    taxaspk_faixa: TIntegerField;
    taxascodigo: TStringField;
    taxasfaixa1: TIntegerField;
    taxasfaixa2: TIntegerField;
    taxasperc_desc_juros: TBCDField;
    taxasperc_desc_multa: TBCDField;
    taxasperc_desc_princ: TBCDField;
    taxasperc_ret: TBCDField;
    qry_clientesperc_juros_mes: TBCDField;
    qry_clientesperc_multa: TBCDField;
    taxasforma_ret: TStringField;
    qry_dividaatu_data: TDateTimeField;
    qry_dividaatualizar: TStringField;
    qry_clienteperc_juros_mes: TBCDField;
    qry_clienteperc_multa: TBCDField;
    reciboschave_tabretenc: TIntegerField;
    recibosdias_atraso: TIntegerField;
    devedoranotacoes: TStringField;
    qry_ocorr: TADOQuery;
    dts_ocorr: TDataSource;
    qry_historiconome_dialogo: TStringField;
    qry_eventopk_cobrador: TIntegerField;
    qry_eventopk_cliente: TIntegerField;
    Panel1: TPanel;
    bt_fechar: TSpeedButton;
    lb_totalDevedores: TLabel;
    lb_usuario: TLabel;
    lb_mensagem: TLabel;
    gb_mens: TGroupBox;
    lb_mens: TLabel;
    Gauge1: TGauge;
    Image1: TImage;
    TbParam: TADOTable;
    qry_bxparciais: TADOQuery;
    dts_bxparciais: TDataSource;
    qry_bxparciaisPK_bxparcial: TIntegerField;
    qry_bxparciaispk_devedor: TIntegerField;
    qry_bxparciaishistorico: TStringField;
    qry_bxparciaisdata: TDateTimeField;
    qry_bxparciaisvalor: TBCDField;
    recibostipo: TIntegerField;
    recibospk_prestcontas: TIntegerField;
    recibosbaixaparcial: TBCDField;
    recibosacordo: TIntegerField;
    qry_bxparciaispk_prestcontas: TIntegerField;
    qry_bxparciaisacordo: TIntegerField;
    lb_outrocobrador: TLabel;
    devedoremail: TStringField;
    grid_devedores: TDBGrid;
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
    Qry_parcAcordo: TADOQuery;
    Qry_parcAcordoPK_parcela: TIntegerField;
    Qry_parcAcordoPK_CLIENTE: TIntegerField;
    Qry_parcAcordoPK_DEVEDOR: TIntegerField;
    Qry_parcAcordoDATA_ACORDO: TDateTimeField;
    Qry_parcAcordoTIPO_ACORDO: TStringField;
    Qry_parcAcordoVENCIMENTO: TDateTimeField;
    Qry_parcAcordovalor_acordo: TBCDField;
    Qry_parcAcordopagamento: TDateTimeField;
    Qry_parcAcordovalor_pgto: TBCDField;
    Qry_parcAcordoobservacao: TStringField;
    Qry_parcAcordovalor_parcela: TBCDField;
    Qry_parcAcordopk_cobrador: TIntegerField;
    Qry_parcAcordonumero: TStringField;
    telefonessms: TStringField;
    telefonesDDD: TStringField;
    qry_bxparciaisnumero_titulo: TStringField;
    qry_bxparciaistipo_titulo: TStringField;
    qry_bxparciaisvalor_retenc: TBCDField;
    qry_dividaVencimento: TDateTimeField;
    qry_dividachave_titulo: TStringField;
    qry_dividaseq_arq_inclusao: TIntegerField;
    qry_dividaseq_arq_baixa: TIntegerField;
    qry_dividaatu_juros: TBCDField;
    qry_dividaatu_multa: TBCDField;
    qry_dividaatu_percjuro: TBCDField;
    qry_dividaatu_percmulta: TBCDField;
    qry_dividaatu_retencao: TBCDField;
    qry_dividaatu_valor: TBCDField;
    qry_dividachave_contrato: TStringField;
    qry_dividanumero_titulo: TStringField;
    qry_dividadesc_principal: TBCDField;
    qry_dividadesc_juros: TBCDField;
    qry_dividadesc_multa: TBCDField;
    qry_dividaacres_protesto: TBCDField;
    qry_dividaacres_honorarios: TBCDField;
    qry_dividavalor_retenc: TBCDField;
    qry_dividavalor_liquido: TBCDField;
    qry_dividachave_contrato2: TStringField;
    devedorcodigo: TStringField;
    devedorcpf_inq: TStringField;
    devedornome_inq: TStringField;
    devedortipologradouro_inq: TStringField;
    devedorlogradouro_inq: TStringField;
    devedorNumero_inq: TStringField;
    devedorbairro_inq: TStringField;
    devedorCompl_inq: TStringField;
    devedorcidade_inq: TStringField;
    devedoruf_inq: TStringField;
    devedoremail_inq: TStringField;
    qry_devedorescpf_inq: TStringField;
    qry_devedoresnome_inq: TStringField;
    qry_devedorescodigo: TStringField;
    GroupBox25: TGroupBox;
    PageControl8: TPageControl;
    TabSheet18: TTabSheet;
    DBGrid5: TDBGrid;
    TabSheet20: TTabSheet;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    DBEdit85: TDBEdit;
    DBEdit86: TDBEdit;
    DBEdit87: TDBEdit;
    DBEdit88: TDBEdit;
    DBEdit89: TDBEdit;
    DBMemo2: TDBMemo;
    pn_negociar: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    PageControl4: TPageControl;
    TabSheet8: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    TabSheet9: TTabSheet;
    Label59: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label55: TLabel;
    Label53: TLabel;
    Label6: TLabel;
    Label57: TLabel;
    Label54: TLabel;
    Label73: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    lb_pag: TLabel;
    SpeedButton4: TSpeedButton;
    Label52: TLabel;
    GroupBox8: TGroupBox;
    Label42: TLabel;
    Label43: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit58: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit50: TDBEdit;
    GroupBox7: TGroupBox;
    Label58: TLabel;
    Label62: TLabel;
    DBEdit44: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit70: TDBEdit;
    DBEdit71: TDBEdit;
    DBEdit72: TDBEdit;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBEdit38: TDBEdit;
    tbSheet_BxParcial: TTabSheet;
    DBGrid1: TDBGrid;
    GroupBox23: TGroupBox;
    Label84: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    edt_bxData: TDateEdit;
    edt_bxHistorico: TEdit;
    edt_bxValor: TCurrencyEdit;
    btn_gravaBxParcial: TBitBtn;
    TabSheet12: TTabSheet;
    PageControl6: TPageControl;
    TbSheet_ParcAcordo: TTabSheet;
    Panel8: TPanel;
    SpeedButton2: TSpeedButton;
    btn_cancelarRec: TSpeedButton;
    btn_receber: TSpeedButton;
    DBGrid4: TDBGrid;
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
    Label117: TLabel;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    DBEdit60: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit61: TDBEdit;
    DBEdit62: TDBEdit;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit65: TDBEdit;
    GroupBox1: TGroupBox;
    Label98: TLabel;
    Label99: TLabel;
    DBEdit32: TDBEdit;
    DBEdit68: TDBEdit;
    DBEdit66: TDBEdit;
    DBEdit67: TDBEdit;
    DBEdit2: TDBEdit;
    TabSheet14: TTabSheet;
    Label90: TLabel;
    GroupBox12: TGroupBox;
    Label44: TLabel;
    Label78: TLabel;
    SpeedButton3: TSpeedButton;
    Label83: TLabel;
    Label112: TLabel;
    edt_divida: TCurrencyEdit;
    edt_totalDivida: TCurrencyEdit;
    edt_dataPgto: TDateEdit;
    edt_diasprev: TEdit;
    gb_pagamento: TGroupBox;
    GroupBox15: TGroupBox;
    Label77: TLabel;
    vr_pagamento: TCurrencyEdit;
    GroupBox16: TGroupBox;
    Label71: TLabel;
    Label102: TLabel;
    desc_juros: TCurrencyEdit;
    edt_percdescj: TCurrencyEdit;
    GroupBox17: TGroupBox;
    Label103: TLabel;
    Label72: TLabel;
    edt_percdescm: TCurrencyEdit;
    desc_multa: TCurrencyEdit;
    GroupBox18: TGroupBox;
    Label104: TLabel;
    Label105: TLabel;
    edt_percdescp: TCurrencyEdit;
    desc_principal: TCurrencyEdit;
    GroupBox19: TGroupBox;
    Label79: TLabel;
    Label80: TLabel;
    vr_protesto: TCurrencyEdit;
    vr_honorario: TCurrencyEdit;
    GroupBox22: TGroupBox;
    Label114: TLabel;
    edt_bxparcial: TCurrencyEdit;
    TbSheet_ListaParcAcordos: TTabSheet;
    DBGrid6: TDBGrid;
    Panel9: TPanel;
    GroupBox27: TGroupBox;
    Label21: TLabel;
    Label29: TLabel;
    edt_percdescADM: TCurrencyEdit;
    desc_Adm: TCurrencyEdit;
    GroupBox28: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    PercDesc_txBanco: TCurrencyEdit;
    desc_txBanco: TCurrencyEdit;
    cb_cobJuridica: TCheckBox;
    Label76: TLabel;
    obs_pgto: TEdit;
    Label137: TLabel;
    edt_segViaBoleto: TCurrencyEdit;
    qry_clientestaxaAdm: TBCDField;
    qry_clientesvr_taxa_bancaria: TBCDField;
    qry_clientesvr_segunda_via: TBCDField;
    taxasperc_desc_tx_ADM: TBCDField;
    recibosVrTxAdm: TBCDField;
    recibosVrTxBancaria: TBCDField;
    recibosVrTxSegVia: TBCDField;
    recibosCobJuridica: TStringField;
    recibosDescTxAdm: TBCDField;
    recibosDescTxBancaria: TBCDField;
    GroupBox29: TGroupBox;
    btn_geraRecibo: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Panel7: TPanel;
    Label17: TLabel;
    SpeedButton6: TSpeedButton;
    Label56: TLabel;
    DBEdit3: TDBEdit;
    DBGrid2: TDBGrid;
    btn_fone: TBitBtn;
    DBEdit42: TDBEdit;
    Panel4: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    edt_dialogo: TMemo;
    GroupBox4: TGroupBox;
    Label60: TLabel;
    edt_hota: TMaskEdit;
    cb_cobrador: TRxDBLookupCombo;
    GroupBox10: TGroupBox;
    Label113: TLabel;
    edt_dias: TEdit;
    edt_data: TDateEdit;
    cb_motivo: TDBLookupComboBox;
    pn_botoes: TPanel;
    SpeedButton5: TSpeedButton;
    sb_enviarEmail: TSpeedButton;
    btn_negociar: TSpeedButton;
    Label133: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Panel16: TPanel;
    edt_divida2: TCurrencyEdit;
    dias_atraso2: TEdit;
    edt_qtdTitulos: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    Label1: TLabel;
    DBEdit6: TDBEdit;
    DBEdit30: TDBEdit;
    PageControl7: TPageControl;
    TabSheet19: TTabSheet;
    GroupBox24: TGroupBox;
    Label100: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label126: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    DBEdit76: TDBEdit;
    DBEdit77: TDBEdit;
    DBEdit78: TDBEdit;
    DBEdit79: TDBEdit;
    DBEdit80: TDBEdit;
    DBEdit81: TDBEdit;
    DBEdit84: TDBEdit;
    DBEdit82: TDBEdit;
    DBEdit83: TDBEdit;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit75: TDBEdit;
    GroupBox6: TGroupBox;
    Label118: TLabel;
    TabSheet15: TTabSheet;
    GroupBox3: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    GroupBox14: TGroupBox;
    Label16: TLabel;
    Label15: TLabel;
    Label39: TLabel;
    Label18: TLabel;
    Label65: TLabel;
    Label19: TLabel;
    Label4: TLabel;
    Label47: TLabel;
    Label101: TLabel;
    DBEdit1: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit69: TDBEdit;
    edt_cgf: TEdit;
    GroupBox20: TGroupBox;
    btn_gravarAnot: TSpeedButton;
    Memo_anot: TMemo;
    TabSheet4: TTabSheet;
    Label46: TLabel;
    PageControl5: TPageControl;
    tbSheet_DefinirRegra: TTabSheet;
    btn_reorganizar: TSpeedButton;
    Label2: TLabel;
    Label111: TLabel;
    Label12: TLabel;
    lk_cliente: TRxDBLookupCombo;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label48: TLabel;
    Label61: TLabel;
    Label70: TLabel;
    edt_fx1: TEdit;
    edt_fx2: TEdit;
    edt_atraso1: TDateEdit;
    edt_atraso2: TDateEdit;
    GroupBox9: TGroupBox;
    Label49: TLabel;
    edt_diassemcontato: TEdit;
    GroupBox11: TGroupBox;
    cb_ordValor: TCheckBox;
    cb_ordAtraso: TCheckBox;
    cb_ordDiasSemContato: TCheckBox;
    cb_ordTipoValor: TComboBox;
    cb_TipoOrdAtraso: TComboBox;
    cb_ordTipoSemContato: TComboBox;
    cb_agendaFuturos: TCheckBox;
    GroupBox21: TGroupBox;
    RxCheckList_ocorr: TRxCheckListBox;
    cb_visualizaInativos: TCheckBox;
    edt_Uf: TEdit;
    edt_tipotitulo: TComboBox;
    TabSheet11: TTabSheet;
    GroupBox13: TGroupBox;
    Label45: TLabel;
    SpeedButton1: TSpeedButton;
    edt_devedor: TEdit;
    cb_tipoPesquisa: TRadioGroup;
    pn_pesq: TPanel;
    lb_help: TLabel;
    sbtn_naoPesquisar: TSpeedButton;
    Panel14: TPanel;
    Label11: TLabel;
    Label13: TLabel;
    SpeedButton8: TSpeedButton;
    Label74: TLabel;
    edt_juros: TCurrencyEdit;
    Label75: TLabel;
    edt_multa: TCurrencyEdit;
    Label14: TLabel;
    txBancaria: TCurrencyEdit;
    Label9: TLabel;
    edt_txadm: TCurrencyEdit;
    GroupBox26: TGroupBox;
    dias_atraso: TEdit;
    lb_mariorAtraso: TLabel;
    Label82: TLabel;
    ed_subtotal: TCurrencyEdit;
    lbacrescimo: TLabel;
    edt_acrescimo: TCurrencyEdit;
    GroupBox30: TGroupBox;
    vr_retencao: TCurrencyEdit;
    recibosacrescimo: TBCDField;
    Label81: TLabel;
    DBEdit7: TDBEdit;
    Label110: TLabel;
    DBEdit26: TDBEdit;
    qry_eventoTexto: TStringField;
    procedure bt_fecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sb_gravarConfClick(Sender: TObject);
    procedure buscaProximo();
    procedure gravar();
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_dialogoExit(Sender: TObject);
    procedure edt_dialogoChange(Sender: TObject);
    procedure devedorAfterOpen(DataSet: TDataSet);
    procedure edt_diasExit(Sender: TObject);
    procedure btn_reorganizarClick(Sender: TObject);
    procedure telefonesBeforePost(DataSet: TDataSet);
    procedure qry_historicoCalcFields(DataSet: TDataSet);
    procedure qry_dividaCalcFields(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure pesquisaAgendamentoParaAHora;
    procedure SpeedButton1Click(Sender: TObject);
    procedure grid_devedoresDblClick(Sender: TObject);
    procedure devedorCalcFields(DataSet: TDataSet);
    procedure montaPesquisa;
    procedure edt_fx1Exit(Sender: TObject);
    procedure edt_fx2Exit(Sender: TObject);
    procedure desc_principalExit(Sender: TObject);
    procedure recalculaLiquido;
    procedure btn_geraReciboClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btn_cancelarRecClick(Sender: TObject);
    procedure desc_jurosExit(Sender: TObject);
    procedure desc_multaExit(Sender: TObject);
    procedure vr_protestoExit(Sender: TObject);
    procedure vr_honorarioExit(Sender: TObject);
    procedure vr_retencaoExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure edt_percdescjExit(Sender: TObject);
    procedure edt_percdescmExit(Sender: TObject);
    procedure edt_percdescpExit(Sender: TObject);
    procedure calculaRetencao;
    procedure liberaGeracaoRecibos;
    procedure atualizar(zerarCampos:boolean);
    procedure edt_dataPgtoExit(Sender: TObject);
    function calculaMaiorAtrasoEDivida( data : Tdate ) : integer;
    function permiteRetroagir():boolean;
    procedure qry_dividaAfterScroll(DataSet: TDataSet);
    procedure btn_gravarAnotClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure formatarCGCCPF( cgcCpf:string );
    procedure abreAgendamentos;
    procedure edt_diasprevExit(Sender: TObject);
    procedure btn_receberClick(Sender: TObject);
    procedure gravaParcelasDeAcordo;
    procedure btn_gravaBxParcialClick(Sender: TObject);
    function calculaBaixasParciais( devedor : integer ) : real;
    function calculaRetencaoBxParcial():real;
    procedure cb_visualizaInativosClick(Sender: TObject);
    procedure btn_foneClick(Sender: TObject);
    procedure sb_enviarEmailClick(Sender: TObject);
    procedure sbtn_naoPesquisarClick(Sender: TObject);
    procedure qry_devedoresCalcFields(DataSet: TDataSet);
    procedure btn_negociarClick(Sender: TObject);
    procedure cb_cobJuridicaClick(Sender: TObject);
    procedure edt_percdescADMExit(Sender: TObject);
    procedure PercDesc_txBancoExit(Sender: TObject);
    procedure desc_txBancoExit(Sender: TObject);
    procedure desc_AdmExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    age_select, age_from, age_where, age_hora,janela : string;
    atendendo_Agendamento : boolean;
    maiorAtraso, chaveTabRetencao:integer;
    totalDivida,descMaxPrinc, descMaxJuros, DescMaxMulta , descTxAdm: real;
    permiteRetroagirPgt : boolean;

  end;

var
  frm_cons_cobranca: Tfrm_cons_cobranca;

implementation

uses UPrincipal, UDM, URotinas, Math, UAgenda, UQr_Recibo, URecebimento,
  UAcordo, UEnviarEmail;

{$R *.dfm}

procedure Tfrm_cons_cobranca.bt_fecharClick(Sender: TObject);
begin
close;
end;

procedure Tfrm_cons_cobranca.FormShow(Sender: TObject);
var select,from,where,order:string;
begin

janela := 'registroscobranca';
permiteRetroagirPgt := frotinas.acessoValido(janela,'retroagirPgt');

qry_clientes.open;
qry_ocorr.Open;
usuarios.open;

RxCheckList_ocorr.Items.Clear;
RxCheckList_ocorr.Items.add('Não acionado');

while not qry_ocorr.eof do
begin
  RxCheckList_ocorr.Items.Add(qry_ocorr.fieldbyName('nome').value);
  qry_ocorr.next;
end;


select:= 'select d.*,c.nome as nomeCliente ';
from := 'from DEVEDORES d inner join clientes c on (d.pk_cliente=c.pk_cliente) ';
where:='where 1=2 ';

//d.pk_cobrador='+intToStr(frotinas.usu_nu)+' and d.data_baixa is null and d.Agendado_hora is null ';
//where := where + ' and (d.Agendado_Data is null or d.Agendado_Data<='''+FormatDateTime('mm/dd/yyyy',date)+''') ';
//order := 'order by d.valor_divida desc ';

qry_devedores.close;
qry_devedores.CommandText := select+from+where+order;
qry_devedores.open;

lb_usuario.caption := 'Usuário Cobrador: '+frotinas.Usu_Nome;
lb_totalDevedores.Caption := 'Total a cobrar: '+intToStr(qry_devedores.recordCount);

//buscaProximo();
pn_botoes.Enabled :=false;
edt_dialogo.SetFocus;

tbSheet_BxParcial.TabVisible :=true;
TbParam.open;
if (TbParam.locate('nome_param','PERM_BXPARC',[])) and (TbParam.fieldByName('valor_param').asstring  ='N')    then
begin
  tbSheet_BxParcial.TabVisible :=false;
end;

TbSheet_ParcAcordo.TabVisible := true;
TbSheet_ListaParcAcordos.TabVisible := true;
if (TbParam.locate('nome_param','PERM_LANCPARC_ACORDO',[])) and (TbParam.fieldByName('valor_param').asstring='N' )   then
begin
  TbSheet_ParcAcordo.TabVisible :=false;
  TbSheet_ListaParcAcordos.TabVisible := false;
end;


abreAgendamentos;
Timer1.Enabled := true;


end;

procedure Tfrm_cons_cobranca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;
end;

procedure Tfrm_cons_cobranca.sb_gravarConfClick(Sender: TObject);
  var total:integer;
begin


//qry_temp.Close;
//qry_temp.SQL.Text := 'select count(1) as total from devedores where pk_cliente='+lk_cliente.KeyValue;
//qry_temp.open;
//total := qry_temp.fieldByName('total').asinteger;

//lb_total.caption := intToStr(total);
//lb_ligfeitas.caption := intToStr(qry_devedores.recordCount);

edt_data.Text := '';
edt_dialogo.Text := '';
edt_dias.Text := '';
edt_hota.Text := '';
edt_juros.Text:= '';
edt_multa.Text:='';

qry_devedores.next;
buscaProximo();
pn_botoes.Enabled :=true;
edt_dialogo.SetFocus;


end;

procedure Tfrm_cons_cobranca.liberaGeracaoRecibos;
begin
  gb_pagamento.Enabled := true;
  while not recibos.eof do
  begin
    if (recibosusuario_receb.asInteger = 0) and (recibosusuario_canc.asinteger = 0) and gb_pagamento.Enabled then
      gb_pagamento.Enabled := false;
    recibos.next;
  end;
end;

procedure Tfrm_cons_cobranca.buscaProximo();
var continua :boolean;
begin

  if not frotinas.validaLimiteUsuariosLogados(frotinas.usu_nu)  then
  begin
    application.Messagebox('Usuário já logado em outra estação ou limite de usuários logados ultrapassou ao licenciado.','Informação',mrOk);
    exit;
  end;


  edt_diasprev.text:= '';
  edt_dataPgto.Text:='';
  edt_data.Text := '';
  edt_dialogo.Text := '';
  edt_dias.Text := '';
  edt_hota.Text := '';
  edt_juros.Text:= '';
  edt_multa.Text:='';

  usuarios.close;
  usuarios.open;

  cb_cobrador.KeyValue := '';
  vr_pagamento.Value := 0;

  lb_outrocobrador.Visible := false;

  // busca próximo devedor
  continua := true;
  lb_mensagem.visible := false;

  if age_select <> '' then
  begin
    qry_devedores.close;
    qry_devedores.CommandText := age_select+age_from+age_where;
    qry_devedores.open;

    age_select:='';
    age_from:='';
    age_where:='';

    lb_mensagem.Caption := 'Atendendo Agendamento marcado para '+age_hora;
    lb_mensagem.visible := true;

    temp.CommandText := 'update devedores set agendado_hora=null, agendado_data=null where pk_devedor='+qry_devedores.fieldByName('pk_devedor').asstring;
    temp.Execute;

  end;

  if qry_devedores.eof then
  begin
    devedor.close;
    devedor.CommandText := 'select * from DEVEDORES where 1=2';
    devedor.open;
    qry_divida.Close;
    qry_divida.SQL.Text := 'select * from titulos where 1=2';
    qry_divida.open;
    telefones.close;
    telefones.CommandText := 'select * from telefones where 1=2';
    telefones.open;

    qry_historico.Close;
    qry_historico.SQL.Text :='select e.* , o.nome as nome_dialogo from eventos e left join ocorrencias o on (e.motivo=o.pk_ocorr) where 1=2';
    qry_historico.open;

    qry_bxparciais.close;
    qry_bxparciais.Parameters.ParamByName('devedor').value := -1;
    qry_bxparciais.open;

    Qry_parcAcordo.Close;
    Qry_parcAcordo.Parameters.ParamByName('devedor').value := -1;
    Qry_parcAcordo.open;


    showmessage('Não foi localizado Devedores com as condições informadas');
    exit;

  end;

  while not qry_devedores.eof and continua do
  begin

    devedor.close;
    devedor.CommandText := 'select * from DEVEDORES where pk_devedor='+qry_devedores.fieldByName('pk_devedor').asstring;
    devedor.open;

    continua := devedor.recordCount=0;
    if not continua then
    begin


      qry_divida.Close;
      qry_divida.SQL.Text := 'select *  from titulos where data_baixa is null and pk_devedor='+qry_devedores.fieldByName('pk_devedor').asstring+' order by vencimento';
      //qry_divida.Parameters.ParamByName('devedor').Value := qry_devedores.fieldByName('pk_devedor').asstring;
      qry_divida.open;

      if qry_divida.recordCount = 0 then
      begin
        devedor.edit;
        devedordata_baixa.Value := date;
        devedormotivo_baixa.value := 'TR';
        devedor.post;
      end;
      telefones.close;
      telefones.CommandText := 'select * from telefones where pk_devedor='+ qry_devedores.fieldByName('pk_devedor').asstring;
      telefones.open;

      qry_historico.Close;
      qry_historico.SQL.Text := 'select e.* , o.nome as nome_dialogo from eventos e left join ocorrencias o on (e.motivo=o.pk_ocorr) where e.pk_devedor='+qry_devedores.fieldByName('pk_devedor').asstring+' order by e.data desc';
      qry_historico.open;

      qry_bxparciais.Close;
      qry_bxparciais.Parameters.ParamByName('devedor').value := qry_devedores.fieldByName('pk_devedor').asstring;
      //qry_bxparciais.Parameters.ParamByName('titulo').value := qry_divida.fieldByName('pk_titulo').asstring;
      qry_bxparciais.open;

      Qry_parcAcordo.Close;
      Qry_parcAcordo.Parameters.ParamByName('devedor').value := qry_devedores.fieldByName('pk_devedor').asstring;
      Qry_parcAcordo.open;


    end;

    if continua then
      qry_devedores.next;


  end;

  //Timer1.Enabled := true;

  Memo_anot.Lines.Clear;
  Memo_anot.Text := devedoranotacoes.Value;

  if (devedorpk_cobrador.value <> frotinas.usu_nu ) and (devedorpk_cobrador.value>0) then
  begin
    frotinas.Qry_Livre.close;
    frotinas.Qry_Livre.CommandText := 'select * from usuarios tab_usu where nu_usu='+devedorpk_cobrador.asstring;
    frotinas.Qry_Livre.open;
    lb_outrocobrador.caption := 'Cobrador: '+frotinas.Qry_Livre.FieldByName('Nome').AsString;
    lb_outrocobrador.Visible := true;

  end;



  maiorAtraso := calculaMaiorAtrasoEDivida(Date);

  recibos.close;
  recibos.Parameters.ParamByName('devedor').value := devedorpk_devedor.asstring;
  recibos.open;

  liberaGeracaoRecibos;

  //qry_clientes.close;
  qry_clientes.locate('pk_cliente',devedorpk_cliente.value,[] );

  taxas.close;
  taxas.Parameters.ParamByName('cliente').value := devedorpk_cliente.Value;
  taxas.open;

  pn_botoes.Enabled := true;

  refresh;



  end;


function Tfrm_cons_cobranca.calculaMaiorAtrasoEDivida( data : Tdate ) : integer;
var dias,qtd:integer;
begin

  maiorAtraso := 0;
  totalDivida := 0;
  qry_divida.first;
  qtd:=0;

  while not qry_divida.eof do
  begin
    inc(qtd);
    if (qry_dividaatualizar.Value = 'Sim') or (qry_dividaatualizar.Value = 'S') then
    begin
      if qry_dividadata_baixa.AsString = '' then
      begin
        totalDivida := totalDivida + qry_dividavalor_principal.asFloat;
      end;

      dias := Trunc(data - qry_dividaVencimento.value);

      if dias > maiorAtraso then
        maiorAtraso := dias;

    end;

    qry_divida.next;

  end;

  edt_divida.Value := totalDivida; //FormatFloat('#,###,##0.00', divida);
  edt_divida2.Value := totalDivida; //FormatFloat('#,###,##0.00', divida);
  edt_totaldivida.value := totalDivida;

  dias_atraso.text := intTostr(maiorAtraso);
  dias_atraso2.text := intTostr(maiorAtraso);

  edt_qtdTitulos.text := intTostr(qtd);


  result:= maiorAtraso;

end;


procedure Tfrm_cons_cobranca.gravar;
var chave:integer;
begin
  if not pn_botoes.Enabled then
  begin
    showmessage('Você deve selecionar o Cliente e Clicar no botão Selecionar Cobranças do Cliente');
    exit;
  end;

  if edt_dialogo.Text = '' then
  begin
    showmessage('Não foi informado o Diálogo com o Cliente');
    exit;
  end;
  if cb_motivo.Text = '' then
  begin
    showmessage('Não foi informado o Motivo do Diálogo com o Cliente');
    exit;
  end;


  chave := frotinas.Sequencial('eventos');

  qry_evento.Close;
  qry_evento.open;

  qry_evento.append;
  qry_eventochave.value := chave;
  qry_eventopk_devedor.value := devedorpk_devedor.Value;
  qry_eventoData.value :=  Date;
  qry_eventoHora.value := FormatDateTime( 'hh:mm:ss', time);
  qry_eventomotivo.value := cb_motivo.KeyValue;
  qry_eventoTexto.Value := edt_dialogo.Text;
  qry_eventopk_cobrador.Value := devedorpk_cobrador.Value;
  qry_eventopk_cliente.Value  := devedorpk_cliente.Value;

  if DateToStr(edt_data.Date) <> '30/12/1899' then
  begin
    qry_eventoAgendado_Data.value := edt_data.date;
    qry_eventoAgendado_Tipo.value := 2;
  end;

  if (edt_hota.text<>'  :  ') and (edt_hota.text<>'00:00') then
  begin
    qry_eventoAgendado_Hora.value := edt_hota.text;
    if cb_cobrador.KeyValue >0 then
      qry_eventoagendado_cobrador.value := cb_cobrador.KeyValue
    else
      qry_eventoagendado_cobrador.value := devedorpk_cobrador.Value;
  end;

  qry_evento.post;

  devedor.edit;

  if DateToStr(edt_data.Date) <> '30/12/1899' then
  begin
    devedoragendado_data.value := qry_eventoAgendado_Data.value;
    devedoragendado_tipo.value := qry_eventoAgendado_Tipo.value;
  end;

  if (edt_hota.text<>'  :  ') and (edt_hota.text<>'00:00') then
  begin
    devedoragendado_hora.value := qry_eventoAgendado_Hora.value;
    if cb_cobrador.KeyValue >0 then
      devedoragendado_cobrador.value := cb_cobrador.KeyValue
    else
      devedoragendado_cobrador.value := devedorpk_cobrador.Value;
  end
  else
  begin
    //devedoragendado_data.value := qry_eventoAgendado_Data.value;
    devedoragendado_hora.value := qry_eventoAgendado_Hora.value;
    devedoragendado_cobrador.value := qry_eventoagendado_cobrador.value ;
  end;

  devedormotivo_dialogo.value := qry_eventomotivo.value;
  devedordata_dialogo.value := qry_eventoData.value;


  devedor.post;


  // limpa campos
  edt_dialogo.Text := '';
  cb_motivo.KeyValue := -1;
  edt_data.Text := '';
  edt_hota.Text := '';
  edt_dias.Text := '';


  qry_devedores.Next;

  if atendendo_Agendamento then
  begin
    atendendo_Agendamento := false;
    montaPesquisa;
  end;

  buscaProximo();

  edt_dialogo.SetFocus;

end;

procedure Tfrm_cons_cobranca.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
      begin
         key := #0;
         PerForm (cm_dialogKey,vk_tab,0);
      end;

//if key = F10 then
//      gravar();

{Trocando Virgula por Ponto}
//if Key in [',','.'] then
//  Key := DecimalSeparator;

if key = #27 then
  close;


end;

procedure Tfrm_cons_cobranca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if key = 121 then
   gravar();
end;

procedure Tfrm_cons_cobranca.edt_dialogoExit(Sender: TObject);
begin
cb_motivo.SetFocus;

end;

procedure Tfrm_cons_cobranca.edt_dialogoChange(Sender: TObject);
begin
edt_dialogo.setFocus;
end;

procedure Tfrm_cons_cobranca.devedorAfterOpen(DataSet: TDataSet);
begin
If devedorpk_cliente.AsString <> '' then
begin
  qry_cliente.close;
  qry_cliente.Parameters.ParamByName('cliente').value := devedorpk_cliente.AsString;
  qry_cliente.open;
end;
formatarCGCCPF(devedorCGC_CPF.asstring);


end;

procedure Tfrm_cons_cobranca.edt_diasExit(Sender: TObject);
var hj:TDatetime;
begin

if edt_dias.Text <> '' then
begin
  hj:= Date;
  edt_data.Date := hj + StrToInt(edt_dias.Text);
end;

end;

procedure Tfrm_cons_cobranca.btn_reorganizarClick(Sender: TObject);
begin
montaPesquisa;
end;


procedure Tfrm_cons_cobranca.montaPesquisa;
var select,from,where,order,sql:string;
hoje, data :TDateTime;
seq : integer;
formato_dt,motivo,sqlAtraso : string;
begin

{
1-Falou com o Cliente
2-Deixou Recado
3-Não Atende
4-Número Errado
5-Não Localizado
6-Marcou Pagamento
7-Falecido
}


hoje := date;

formato_dt := frotinas.formato_data_banco();

//select:= 'select distinct d.pk_devedor, d.pk_cliente, d.cgc_cpf,d.nome, d.agendado_data, d.agendado_hora, d.agendado_cobrador, d.motivo_dialogo, d.data_dialogo, d.pk_cobrador,d.valor_divida  ';
//from := 'from DEVEDORES d '; //inner join TITULOS t on (d.PK_DEVEDOR=t.PK_DEVEDOR)';

select:= 'select d.*, c.nome as nomeCliente ';
from := 'from DEVEDORES d inner join CLIENTES c on ( c.pk_cliente=d.pk_cliente) ' ;


where:='where d.pk_cobrador='+intToStr(frotinas.usu_nu)+
'  and exists(select 1 from titulos t where t.pk_devedor=d.pk_devedor and (t.motivo_baixa is null or t.motivo_baixa ='''')  ) ';
//'  and exists(select 1 from titulos t where t.pk_devedor=d.pk_devedor and t.data_baixa is null ) ';


if not cb_agendaFuturos.Checked then
   where := where + ' and (d.Agendado_data is null or d.Agendado_data <'''+FormatDateTime(formato_dt,hoje)+''') ';
// and  (d.Agendado_hora is null or d.Agendado_hora='''' )


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
        sql := sql+' d.motivo_dialogo= '+qry_ocorr.fieldByName('pk_ocorr').asstring;
      end
      else  // Não acionado
      begin
        if sql <>'' then
          sql := sql + ' or ';
        sql := sql +' d.motivo_dialogo is null ';
      end;

   end;

   inc(seq);
end;


if sql<>'' then
  where := where+'and ('+sql+' ) ';


if lk_cliente.KeyValue=NULL then
begin
   showMessage('Informe o cliente');
   exit;
end;


where := where+'and d.pk_cliente='+lk_cliente.KeyValue+' ';

if edt_diassemcontato.Text <> '' then
begin
   data := hoje;
   data := data - strtoInt(edt_diassemcontato.Text);
   where := where + ' and d.data_dialogo <'''+FormatDateTime(formato_dt,data)+'''';
end;

// 30 a 60 dias
sqlAtraso := '';
if (DateToStr(edt_atraso1.Date) <> '30/12/1899') or ( DateToStr(edt_atraso2.Date) <> '30/12/1899' ) then
begin

  sqlAtraso := '';

  if (DateToStr(edt_atraso1.Date) <> '30/12/1899') then
  begin
     //where := where + ' and t.vencimento >='''+FormatDateTime('mm/dd/yyyy',edt_atraso1.Date)+'''';
     sqlAtraso := ' and exists( select (1) from titulos t2 where t2.pk_devedor=d.pk_devedor and t2.vencimento >= '''+FormatDateTime(formato_dt,edt_atraso1.Date)+'''';
  end;

  if DateToStr(edt_atraso2.Date) <> '30/12/1899' then
  begin
     if sqlAtraso = '' then
        sqlAtraso := ' and exists( select (1) from titulos t2 where t2.pk_devedor=d.pk_devedor ';
     sqlAtraso := sqlAtraso + ' and t2.vencimento <='''+FormatDateTime(formato_dt,edt_atraso2.Date)+'''';
  end;
  sqlAtraso := sqlAtraso + ') ';

  where := where + sqlAtraso;

end;

if edt_tipotitulo.Text <> '' then
  where := where + ' and exists( select (1) from titulos t2 where t2.pk_devedor=d.pk_devedor and t2.TIPO_TITULO='''+edt_tipotitulo.Text+''' ) ';

order := '';
if cb_ordValor.Checked then
begin
  //order := order + 'd.valor_divida ';
  //if cb_ordTipoValor.ItemIndex = 0 then
  //  order := order + ' desc ';

  if order <> '' then
     order := order + ', ';
  order  := order +  ' divida';
  select := select +', (select sum(t2.valor_principal) as divida from titulos t2 where t2.pk_devedor=d.pk_devedor ) as divida ';
  if cb_ordTipoValor.ItemIndex = 0 then
    order := order + ' desc ';


end;

if cb_ordAtraso.Checked then
begin
  if order <> '' then
     order := order + ', ';
  order  := order +  ' vencimento';
  select := select +', (select min(t2.vencimento) as vencimento from titulos t2 where t2.pk_devedor=d.pk_devedor ) as vencimento ';
  if cb_TipoOrdAtraso.ItemIndex = 0 then
    order := order + ' desc ';

end;

if cb_ordDiasSemContato.Checked then
begin
  if order <> '' then
     order := order + ', ';
  order := order + ' d.data_dialogo ';
  if cb_ordTipoSemContato.ItemIndex = 0 then
    order := order + ' desc ';
end;

if order <> '' then
   order := ' Order by '+order;

qry_devedores.Close;
qry_devedores.CommandText := select+' '+from+' '+where+' '+order;
qry_devedores.open;

lb_usuario.caption := 'Usuário Cobrador: '+frotinas.Usu_Nome;
lb_totalDevedores.Caption := 'Total a cobrar: '+intToStr(qry_devedores.recordCount);

qry_devedores.first;
buscaProximo();
pn_botoes.Enabled :=true;
if qry_devedores.recordCount >0 then
begin
  PageControl2.ActivePageIndex := 0;
  edt_dialogo.SetFocus;
end;



end;


procedure Tfrm_cons_cobranca.telefonesBeforePost(DataSet: TDataSet);
var chave:integer;
begin
  chave := frotinas.Sequencial('telefones');

  telefonesid.value := chave;
  telefonespk_devedor.value := devedorpk_devedor.Value;



end;

procedure Tfrm_cons_cobranca.qry_historicoCalcFields(DataSet: TDataSet);
begin
{
0 1-Falou com o Cliente
1 2-Deixou Recado
2 3-Não Atende
3 4-Número Errado
4 5-Não Localizado
5 6-Marcou Pagamento
6 7-Falecido



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

procedure Tfrm_cons_cobranca.qry_dividaCalcFields(DataSet: TDataSet);
var hoje:Tdatetime;
begin
hoje := Date;

qry_dividaatraso_atual.value := Trunc(hoje - qry_dividaVencimento.value);

if qry_dividamotivo_baixa.Value = 'PG' then
  qry_dividanMotivo_baixa.Value := 'Pago'
else if qry_dividamotivo_baixa.Value = 'TR' then
  qry_dividanMotivo_baixa.Value := 'Retirado';

end;

procedure Tfrm_cons_cobranca.Timer1Timer(Sender: TObject);
begin
   Timer1.Enabled := false;
   if qry_agendamento.RecordCount >0 then
     pesquisaAgendamentoParaAHora;
   Timer1.Enabled := true;

end;

procedure Tfrm_cons_cobranca.abreAgendamentos;
begin
  qry_agendamento.Close;
  qry_agendamento.Parameters.ParamByName('data').Value := date;
  qry_agendamento.Parameters.ParamByName('cobrador').Value := frotinas.usu_nu;
  qry_agendamento.Parameters.ParamByName('cobrador2').Value := frotinas.usu_nu;
  qry_agendamento.open;
  Timer1.Enabled := true;

end;

procedure Tfrm_cons_cobranca.pesquisaAgendamentoParaAHora;
var achouAgendamentos:string;
var select, from,where:string;
var hora, horario ,devedor,sql: string;
    min:integer;

begin
  hora := FormatDateTime('hh:mm', time);
  achouAgendamentos := '';
  qry_agendamento.first;
  while not qry_agendamento.eof do
  begin
    if copy( hora,1,2) = copy(qry_agendamentoagendado_hora.asstring,1,2) then
    begin
      if copy( hora,4,2) >= copy(qry_agendamentoagendado_hora.asstring,4,2) then
      begin
        achouAgendamentos := achouAgendamentos + qry_agendamentopk_devedor.asString+',';
      end;
    end
    else
    begin
      if copy( hora,1,2) > copy(qry_agendamentoagendado_hora.asstring,1,2) then
        achouAgendamentos := achouAgendamentos + qry_agendamentopk_devedor.asString+',';
    end;
    qry_agendamento.next;
  end;
  if achouAgendamentos<>'' then
  begin
    Application.CreateForm(Tfrm_agenda, frm_agenda);
    with frm_agenda do
    begin
      achouAgendamentos := copy( achouAgendamentos,1, length(achouAgendamentos) -1);
      devedoresAgendados.Close;

      sql :=       'select d.*,c.nome as nomeCliente, u.nome as usuario ';
      sql := sql + 'from DEVEDORES d ';
      sql := sql + 'inner join clientes c on (d.pk_cliente=c.pk_cliente) ';
      sql := sql + 'inner join usuarios u on (u.nu_usu=d.pk_cobrador) ';
      sql := sql + 'where d.data_baixa is null and d.PK_DEVEDOR in ('+achouAgendamentos+') and d.agendado_cobrador='+ intToStr(frotinas.usu_nu);

      devedoresAgendados.CommandText := sql;
      devedoresAgendados.open;

      if (devedoresAgendados.recordCount=0) then
        exit;

      showmodal;

      if atender=1 then // atender agora
      begin
        temp.CommandText := 'update devedores set agendado_hora=null, agendado_data=null where pk_devedor='+devedoresAgendadospk_devedor.asstring;
        temp.Execute;
        select:= 'select d.*,c.nome as nomeCliente ';
        from := 'from DEVEDORES d inner join clientes c on (d.pk_cliente=c.pk_cliente) ';
        where:='where d.data_baixa is null and (d.pk_cobrador='+intToStr(frotinas.usu_nu)+' or d.agendado_cobrador='+intToStr(frotinas.usu_nu)+') and  d.pk_devedor='+devedoresAgendadospk_devedor.asstring;
        abreAgendamentos;
      end;

      if atender=2 then // em seguida ao atendimento atual
      begin
       //
        abreAgendamentos;

        //hora := copy(devedoresAgendadosagendado_hora.Value,1,2);
        //min  := strToInt(copy(devedoresAgendadosagendado_hora.Value,4,2)) + 5;
        min := strToInt(copy(hora,4,2)) + 5;
        hora := copy(hora,1,2);

        if min >= 60 then
        begin
          hora := urotinas.StrZero(strtoint(hora) + 1 ,2);
          min  := 5;
          horario := hora + ':'+ urotinas.StrZero(min,2);
        end
        else
        begin
          horario := hora + ':'+ urotinas.StrZero(min,2);
        end;

        while not devedoresAgendados.Eof do
        begin
          if qry_agendamento.locate('pk_devedor', devedoresAgendadospk_devedor.asstring, []) then
          begin
            qry_agendamento.edit;
            qry_agendamentoagendado_hora.value := horario;
            qry_agendamento.post;
          end;
          devedoresAgendados.Next;
        end;

      end;

    end;

    frm_agenda.destroy;

    if select<>'' then
    begin
      qry_devedores.Close;
      qry_devedores.CommandText := select+from+where;
      qry_devedores.open;

      lb_usuario.caption := 'Usuário Cobrador: '+frotinas.Usu_Nome;
      lb_totalDevedores.Caption := 'Total a cobrar: '+intToStr(qry_devedores.recordCount);

      qry_devedores.first;
      buscaProximo();
      pn_botoes.Enabled :=true;
      edt_dialogo.SetFocus;

      atendendo_Agendamento := true;
    end;

  end;

  //
end;

procedure Tfrm_cons_cobranca.SpeedButton1Click(Sender: TObject);
var select,from,where,where2,order : string;
var erro:boolean;
begin

grid_devedores.Visible := false;


select:= 'select d.*, c.nome as nomeCliente ';
from := 'from DEVEDORES d inner join CLIENTES c on ( c.pk_cliente=d.pk_cliente) ' ;
where:='where exists(select 1 from titulos t where t.pk_devedor=d.pk_devedor and t.data_baixa is null ) ';
where2:=' and 1=2 ';

if cb_tipoPesquisa.ItemIndex = 0 then
  where2 :=  ' and d.pk_devedor='+edt_devedor.text
else
  if cb_tipoPesquisa.ItemIndex = 1 then
    where2 := ' and d.cgc_cpf = '''+edt_devedor.text+''''
  else
    if cb_tipoPesquisa.ItemIndex = 2 then
      where2 := ' and d.nome like ''%'+edt_devedor.text+'%'''
    else
      if cb_tipoPesquisa.ItemIndex = 3 then
        where2 := ' and exists( select 1 from telefones t where t.pk_devedor=d.pk_devedor and t.telefone like ''%'+edt_devedor.text+'%'') '
      else
          if cb_tipoPesquisa.ItemIndex = 4 then
            where2 := ' and d.logradouro like ''%'+edt_devedor.text+'%'''
          else
            if cb_tipoPesquisa.ItemIndex = 5 then
            begin
              if edt_devedor.text='13' then
                where2 := ' and d.codigo like '''+edt_devedor.text+' %'''
              else
              where2 := ' and d.codigo like '''+edt_devedor.text+'%''' ;
            end
            else
             if cb_tipoPesquisa.ItemIndex = 6 then
              where2 := ' and d.cpf_inq = '''+edt_devedor.text+''''
              else
                if cb_tipoPesquisa.ItemIndex = 7 then
                where2 := ' and d.nome_inq like ''%'+edt_devedor.text+'%''';



order := ' order by c.nome,d.logradouro,d.nome';

qry_devedores.Close;
qry_devedores.CommandText := select+from+where+where2+order;
qry_devedores.open;

if qry_devedores.recordCount > 1 then
begin

    grid_devedores.left := 10;
    grid_devedores.top := 269;
    grid_devedores.width := 993;
    grid_devedores.height := 345;

    pn_pesq.Visible := true;

    grid_devedores.Visible := true;
    //sbtn_naoPesquisar.Visible:=true;
    //lb_help.visible := true;

end
else
  if qry_devedores.recordCount = 1 then
  begin
    buscaProximo();
    PageControl2.ActivePageIndex :=0;
    pn_pesq.Visible := false;

  end
  else
    showmessage('Não foi localizado dívida para este Devedor.');




end;

procedure Tfrm_cons_cobranca.grid_devedoresDblClick(Sender: TObject);
begin
buscaProximo();
PageControl2.ActivePageIndex :=0;
grid_devedores.visible := false;
pn_pesq.Visible := false;

end;

procedure Tfrm_cons_cobranca.devedorCalcFields(DataSet: TDataSet);
begin
if devedormotivo_baixa.value = 'PG' then
  devedornMotivo_baixa.value := 'Pago'
else if devedormotivo_baixa.value = 'TR' then
  devedornMotivo_baixa.value := 'Retirado';

  end;

procedure Tfrm_cons_cobranca.edt_fx1Exit(Sender: TObject);
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

procedure Tfrm_cons_cobranca.edt_fx2Exit(Sender: TObject);
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

procedure Tfrm_cons_cobranca.desc_principalExit(Sender: TObject);
var pdesc:real;
begin

if desc_principal.value >0 then
begin
  pdesc:= (desc_principal.value / edt_divida.value)*100;
  if pdesc > descMaxJuros  then
  begin
    showmessage('Desconto permitido desconto inferior a '+floatTostr(descMaxJuros)+' para esta faixa de atraso.'  );
    edt_percdescp.value := 0 ;
    desc_principal.value:=0;
  end
  else
    edt_percdescp.value := pdesc;

  recalculaLiquido;
end
else
    desc_principal.value:=0;

end;

procedure Tfrm_cons_cobranca.recalculaLiquido;
var acrescimo, descontos, baixasParciais :real;
begin

acrescimo := vr_protesto.value + vr_honorario.value + edt_segViaBoleto.value + edt_acrescimo.value;
descontos := desc_juros.value + desc_multa.value + desc_principal.value+desc_Adm.value+desc_txBanco.value;
baixasParciais := edt_bxparcial.value;

vr_pagamento.value := ((edt_totalDivida.value + acrescimo) - descontos ) - baixasParciais ;

calculaRetencao;

end;

procedure Tfrm_cons_cobranca.gravaParcelasDeAcordo;
var chave:integer;
var chaveOcorr:integer;
begin
  //frotinas.cancelaReciboAnterior( devedorpk_devedor.asinteger );


  chave := frotinas.Sequencial('recibos');

  recibos.append;
  recibospk_recibo.value := chave;
  recibospk_devedor.value := devedorpk_devedor.Value;
  recibospk_cliente.value := devedorpk_cliente.Value;
  recibosdata.value       := date;
  reciboshora.value       := FormatDateTime( 'hh:mm:ss', time);
  recibosusuario_cobrador.value := frotinas.usu_nu;
  recibosprincipal.value   := edt_divida.value;
  recibosjuros.Value      := edt_juros.value;
  recibosmulta.value      := edt_multa.value;
  recibosdesc_principal.value:= desc_principal.Value;
  recibosdesc_juros.value := desc_juros.Value;
  recibosdesc_multa.value := desc_multa.value;

  recibosVrTxAdm.value:= edt_txadm.value;
  recibosVrTxBancaria.value:= txBancaria.value;
  recibosVrTxSegVia.value := edt_segViaBoleto.value;
  recibosDescTxAdm.value := desc_Adm.value;
  recibosDescTxBancaria.value := desc_txBanco.value;
  recibosacrescimo.value := edt_acrescimo.value;

  recibosvalor_liquido.Value:= vr_pagamento.value;
  recibosvalor_retenc.value := vr_retencao.value;
  reciboschave_tabretenc.value := chaveTabRetencao;
  recibosacres_protesto.value := vr_protesto.value;
  recibosacres_honorarios.value := vr_honorario.Value;
  recibosdata_venc.value := edt_dataPgto.Date;
  recibosobservacao.value := obs_pgto.Text;
  recibosdias_atraso.value:= strToInt(dias_atraso.text);
  recibosbaixaparcial.value := edt_bxparcial.Value;
  recibosacordo.value := frotinas.Sequencial('acordo');
  recibos.post;

  qry_divida.first;
  while not qry_divida.Eof do
  begin
    if (qry_dividaatualizar.Value = 'Sim') or (qry_dividaatualizar.Value = 'S') then
    begin
      qry_divida.edit;
      qry_dividapk_recibo.value := chave;
      qry_divida.post;
    end;
    qry_divida.next;
  end;



  qry_bxparciais.first;
  while not qry_bxparciais.eof do
  begin
    if qry_bxparciaisacordo.asinteger <=0 then
    begin
      qry_bxparciais.Edit;
      qry_bxparciaisacordo.value := recibosacordo.value;
      qry_bxparciais.post;
    end;
    qry_bxparciais.next;
  end;


  // descobre parametro com tipo de ocorrencia
  if (TbParam.locate('nome_param','PAGOU',[])) then
  begin
    chaveOcorr := TbParam.fieldByname('valor_param').asinteger;
    frotinas.gravaRealizouPGT( chaveOcorr, devedorpk_devedor.asinteger, 'Realizou pagamento total de R$ '+vr_pagamento.text, false);
  end;

  frotinas.Qry_Livre.close;
  frotinas.Qry_Livre.CommandText := 'select * from recibos where pk_recibo='+recibospk_recibo.asstring;
  frotinas.Qry_Livre.open;

  frotinas.rateiaRecibo;


  desc_principal.Value := 0;
  desc_juros.Value := 0;
  desc_multa.value := 0;
  vr_pagamento.value:=0;
  vr_retencao.value:=0;
  vr_retencao.value:=0;
  vr_protesto.value:=0;
  vr_honorario.Value:=0;
  obs_pgto.Text:='';
  edt_dataPgto.Text := '';
  edt_bxparcial.Value := 0;


  showmessage('Recibo gravado sob o número '+intTostr(chave));
  liberaGeracaoRecibos;

end;

procedure Tfrm_cons_cobranca.btn_geraReciboClick(Sender: TObject);
var chave:integer;
var valorLiquido,recibo:real;
begin

   if not frotinas.acessoValido(janela,'btn_geraRecibo') then
   begin
    showmessage('Você não tem permissão para esta opção.');
    exit;
   end;


  if edt_dataPgto.date = 0 then
  begin
    showmessage('Informe a data para pagamento');
    exit;
  end;

  recibo := frotinas.temAcordoPendente(devedorpk_devedor.asinteger );
  if recibo>0 then
  begin
    showmessage('Já existe um Acordo Pendente, cancele o acordo '+floatTostr(recibo)+'. Você pode cancelar recibos na tela de Recebimentos ou em Manutenção de devedores!');
    exit;
  end;


  //Application.CreateForm(Tfrm_acordo, frm_acordo);
  //frm_acordo.show;
  //frm_acordo.destroy;

  valorLiquido := vr_pagamento.Value;
  atualizar(false);

  if Urotinas.arredonda(valorLiquido) <> Urotinas.arredonda(vr_pagamento.Value) then
  begin
    showmessage('ATENÇÃO: '+#13+
    'O valor Líquido sofreu alterações desde a última atualização.'+#13+
    'Provalvelmente, você alterou o campo "Atualizar" de algum título da dívida. '+#13+
    'Valor Anterior: '+FormatFloat('###,###.#0',valorLiquido)+' Valor Atual: '+FormatFloat('###,###.#0',vr_pagamento.value)+#13+
    'Favor verificar se o novo Valor Líquido corresponde ao esperado e tente Gravar novamente.');
    exit;
  end;

  gravaParcelasDeAcordo;

  qry_bxparciais.Refresh;

end;

procedure Tfrm_cons_cobranca.SpeedButton2Click(Sender: TObject);
begin
if MessageDlg('Deseja emitir o recibo número '+recibospk_recibo.asstring+' ?',
   mtConfirmation, [mbYes, mbNo],0) = mrYes then
begin

     Application.CreateForm(TQr_Recibo, Qr_Recibo);
     Qr_Recibo.quickrep1.preview;
     Qr_Recibo.destroy;

end;

end;

procedure Tfrm_cons_cobranca.btn_cancelarRecClick(Sender: TObject);
begin

 showmessage('indisponivel, será implementada a validação de existência de outras parcelas');
// exit;

 if not frotinas.acessoValido(janela,'btn_cancelar') then
 begin
  showmessage('Você não tem permissão para esta opção.');
  exit;
 end;

recibos.refresh;
if recibosusuario_receb.value>0 then
begin
  showmessage('Não é possível cancelar um recibo já recebido no caixa.');
end
else
begin
  if MessageDlg('Confirma cancelamento do recibo número '+recibospk_recibo.asstring+' ?',
     mtConfirmation, [mbYes, mbNo],0) = mrYes then
  begin
    recibos.edit;
    recibosdata_canc.Value := date;
    reciboshora_canc.value       := FormatDateTime( 'hh:mm:ss', time);
    recibosusuario_canc.value := frotinas.usu_nu;
    recibos.post;


    qry_bxparciais.first;
    while not qry_bxparciais.eof do
    begin
      if qry_bxparciaisacordo.Value = recibosacordo.value then
      begin
        qry_bxparciais.Edit;
        qry_bxparciaisacordo.value := 0;
        qry_bxparciais.post;
      end;
      qry_bxparciais.next;
    end;



  end;
end;

end;

{
erro:=false;
try
  qry_devedores.open;
  if qry_devedores.recordCount > 1 then
  begin
      grid_devedores.Visible := true;
      lb_help.visible := true;
  end
  else
  begin
      buscaProximo();
      PageControl2.ActivePageIndex :=0;
  end;
except
  erro:=true;
end;

if erro then
begin

  where:='where d.cgc_cpf = '''+edt_devedor.text+''' and exists(select 1 from titulos t where t.pk_devedor=d.pk_devedor and t.data_baixa is null ) ';
  qry_devedores.Close;
  qry_devedores.CommandText := select+from+where+order;
  qry_devedores.open;
  erro:=false;
  if qry_devedores.recordCount = 0 then
    erro:=true;

  if erro then
  begin

    order := ' order by NOME ';

    where:='where exists(select 1 from titulos t where t.pk_devedor=d.pk_devedor and t.data_baixa is null )  and d.nome like ''%'+edt_devedor.text+'%''';

    qry_devedores.Close;
    qry_devedores.CommandText := select+from+where+order;
    qry_devedores.open;

    if qry_devedores.recordCount > 1 then
    begin
        grid_devedores.Visible := true;
        lb_help.visible := true;
    end
    else
    begin
      if qry_devedores.recordCount = 1 then
      begin
        buscaProximo();
        PageControl2.ActivePageIndex :=0;
      end
      else
        showmessage('Não foi localizado dívida para este Devedor.');

    end;
  end;

}
procedure Tfrm_cons_cobranca.desc_jurosExit(Sender: TObject);
var pdesc:real;
begin
pdesc:= (desc_juros.value / edt_juros.value) * 100;
if pdesc > descMaxJuros then
begin
  showmessage('Desconto permitido desconto inferior a '+floatTostr(descMaxJuros)+' para esta faixa de atraso.'  );
  edt_percdescj.value := 0 ;
  desc_juros.value:=0;
end;
//else
//  edt_percdescj.value := pdesc;


recalculaLiquido;

end;

procedure Tfrm_cons_cobranca.desc_multaExit(Sender: TObject);
var pdesc:real;
begin
if edt_multa.value >0 then
begin
  pdesc:= (desc_multa.value / edt_multa.value)*100;
  if pdesc > descMaxJuros then
  begin
    showmessage('Desconto permitido desconto inferior a '+floatTostr(descMaxJuros)+' para esta faixa de atraso.'  );
    edt_percdescm.value := 0 ;
    desc_multa.value:=0;
  end;
  //else
  //  edt_percdescm.value := pdesc;

  recalculaLiquido;
end
else
    desc_multa.value:=0;


end;

procedure Tfrm_cons_cobranca.vr_protestoExit(Sender: TObject);
begin
recalculaLiquido;

end;

procedure Tfrm_cons_cobranca.vr_honorarioExit(Sender: TObject);
begin

recalculaLiquido;

end;

procedure Tfrm_cons_cobranca.vr_retencaoExit(Sender: TObject);
begin
recalculaLiquido;

end;

function Tfrm_cons_cobranca.calculaBaixasParciais( devedor:integer) : real;
var valor:real;
begin

  frotinas.Qry_Livre2.close;
  frotinas.Qry_Livre2.CommandText := 'select sum(b.valor) as valor from baixasparciais b left join titulos t on (t.pk_titulo=b.pk_titulo) where (b.pk_titulo is null or t.atualizar=''S'') and (b.acordo is null or b.acordo = 0 ) and b.pk_devedor='+intToStr(devedor);
  frotinas.Qry_Livre2.open;

  valor := frotinas.Qry_Livre2.fieldByName('valor').AsFloat;

  result:= valor;

end;


procedure Tfrm_cons_cobranca.atualizar(zerarCampos:boolean);
var tdivida,divida, percJurosMes, percMulta, tJuros, subtotal,tMulta,juros, multa, retencao, baixasParciais ,tTxAdm, tTxBancaria, tTxSegundaVia, percTxAdm, vrTxBancaria, vrTxADM, VrSegundaVia : real;
var atraso : integer;
var data:TdateTime;
var mes,diaVenc:integer;

begin

  if zerarCampos then
  begin
    edt_percdescj.Value := 0;
    desc_juros.value := 0;
    edt_percdescm.value := 0;
    desc_multa.value := 0;
    edt_percdescp.value := 0;
    desc_principal.value := 0;
    vr_retencao.value := 0;
    edt_percdescADM.Value :=0;
    desc_Adm.value := 0;
    PercDesc_txBanco.value:=0;
    desc_txBanco.Value:=0;
    edt_segViaBoleto.value:=0.00;
    edt_acrescimo.value :=0.00;
  end;

  urotinas.log('atualizar - antes calculaBaixasParciais');

  baixasParciais := calculaBaixasParciais(qry_devedores.fieldByName('pk_devedor').asinteger );
  edt_bxparcial.Value := baixasParciais;


  if edt_dataPgto.Date = 0 then
     edt_dataPgto.Date := date;

  divida:= 0;
  juros        := 0.00;
  multa        := 0.00;
  retencao     := 0.00;
  vrTxAdm        := 0.00;
  vrTxBancaria   := 0.00;
  subtotal     := 0.00;


  qry_divida.First;

  percJurosMes := (qry_clientesperc_juros_mes.asfloat/30)/100;
  if qry_clientesperc_multa.asfloat>0 then
    percMulta := qry_clientesperc_multa.asfloat/100
  else
    percMulta := 0 ;

  if (qry_clientestaxaAdm.asfloat>0 ) and not cb_cobJuridica.Checked then
    percTxAdm := qry_clientestaxaAdm.asfloat/100
  else
    percTxAdm := 0 ;

  if qry_clientesvr_taxa_bancaria.asfloat>0 then
    vrTxBancaria := qry_clientesvr_taxa_bancaria.asfloat
  else
    vrTxBancaria := 0 ;

{  if qry_clientesvr_segunda_via.asfloat>0 then
    VrSegundaVia := qry_clientesvr_segunda_via.asfloat
  else
    VrSegundaVia := 0 ;
 }


  TbParam.Open;

  tjuros:=0.00;
  tmulta:=0.00;
  juros:= 0.00;
  divida:=0.00;

  tTxAdm:=0.00;
  tTxBancaria:= 0.00;
  tTxSegundaVia:=0.00;

  while not qry_divida.eof do
  begin

    if (qry_dividaatualizar.Value = 'Sim') or (qry_dividaatualizar.Value = 'S') then
    begin

        atraso := Trunc(edt_dataPgto.date - qry_dividaVencimento.value);

        if percJurosMes>0 then
        begin
          qry_divida.edit;
          qry_dividaatu_juros.value := (( percJurosMes * qry_dividavalor_principal.asfloat ) * atraso );
          qry_dividaatu_multa.value := ( percMulta * qry_dividavalor_principal.asfloat );
          qry_dividaatu_percjuro.value := qry_clientesperc_juros_mes.asfloat;
          qry_dividaatu_percmulta.value:= qry_clientesperc_multa.asfloat;
          qry_dividaatu_valor.value    := qry_dividavalor_principal.asfloat + qry_dividaatu_juros.asfloat + qry_dividaatu_multa.asfloat;

          qry_dividaatu_data.value     := date;
          qry_divida.post;

          tjuros := tjuros + qry_dividaatu_juros.value;
          tmulta := tmulta + qry_dividaatu_multa.value;

        end;

        //divida := divida + qry_dividavalor_principal.asfloat;
        tdivida:= tdivida + (qry_dividavalor_principal.asfloat + qry_dividaatu_juros.asfloat + qry_dividaatu_multa.asfloat);


    end;
    qry_divida.next;

  end;

  subtotal:= tdivida + vrTxBancaria;
  tTxAdm := (tdivida + vrTxBancaria ) * percTxAdm ;
  tdivida:= tdivida + vrTxBancaria + tTxAdm ;

  edt_multa.value := tmulta;
  edt_juros.value := tjuros;
  edt_txadm.Value := tTxAdm;
  ed_subtotal.value := subtotal;

  txBancaria.value:= vrTxBancaria;

  

  edt_divida2.value:= tdivida;
  edt_totalDivida.Value := tdivida;

  recalculaLiquido;
  liberaGeracaoRecibos;

  // detecta máxino de descontos

  descMaxPrinc := 0;
  descMaxJuros := 0;
  DescMaxMulta := 0;
  descTxAdm:=0;


  taxas.first;
  while (not taxas.eof) and ( (descMaxPrinc+descMaxJuros+DescMaxMulta+descTxAdm ) = 0 ) do
  begin
    if (strToInt(dias_atraso.Text) >= taxasfaixa1.AsInteger)
       and ( (taxasfaixa2.asInteger>0) and (strToInt(dias_atraso.Text) <= taxasfaixa2.AsFloat)) then
    begin
       descMaxPrinc := taxasperc_desc_princ.asfloat;
       descMaxJuros := taxasperc_desc_juros.asfloat;
       DescMaxMulta := taxasperc_desc_multa.asfloat;
       descTxAdm    := taxasperc_desc_tx_ADM.asfloat;

    end;
    taxas.next;
  end;


end;

procedure Tfrm_cons_cobranca.SpeedButton3Click(Sender: TObject);
begin
if permiteRetroagir() then
begin
  urotinas.log('calcular atraso');
  if edt_dataPgto.Date = 0 then
    calculaMaiorAtrasoEDivida( Date )
  else
    calculaMaiorAtrasoEDivida( edt_dataPgto.Date );

  urotinas.log('calculou atraso');
  atualizar(true);
end;

end;

procedure Tfrm_cons_cobranca.edt_percdescjExit(Sender: TObject);
begin
if descMaxJuros = 0 then
  atualizar(false);

if descMaxJuros < edt_percdescj.value then
begin
  showmessage('Desconto permitido desconto inferior a '+floatTostr(descMaxJuros)+' para esta faixa de atraso.'  );
  edt_percdescj.value := 0 ;
  desc_juros.value:=0;
end
else
  desc_juros.value := (edt_percdescj.value / 100 ) * edt_juros.value;
recalculaLiquido;

end;

procedure Tfrm_cons_cobranca.edt_percdescmExit(Sender: TObject);
begin
if descMaxMulta < edt_percdescm.value then
begin
  showmessage('Desconto permitido desconto inferior a '+floatTostr(descMaxMulta)+' para esta faixa de atraso.'  );
  desc_multa.value:=0;
  edt_percdescm.value:=0;
end
else
  desc_multa.value := (edt_percdescm.value / 100 ) * edt_multa.value;

recalculaLiquido;

end;

procedure Tfrm_cons_cobranca.edt_percdescpExit(Sender: TObject);
begin
if descMaxPrinc = 0 then
  atualizar(false);


if descMaxPrinc < edt_percdescp.value then
begin
  showmessage('O desconto permitido deve ser inferior a '+floatTostr(descMaxPrinc)+'(%) para esta faixa de atraso.' );
  desc_principal.value := 0;
  edt_percdescp.value := 0;
end
else
  desc_principal.value := (edt_percdescp.value / 100 ) * edt_divida.value;
recalculaLiquido;

end;

procedure Tfrm_cons_cobranca.calculaRetencao;
var atraso:integer;
var percRetencao,valorRetencao:real;
var formaRetencao:string;
begin

  chaveTabRetencao:=0;

  taxas.close;
  taxas.Parameters.ParamByName('cliente').value := qry_clientepk_cliente.Value;
  taxas.open;

  percRetencao := 0;
  formaRetencao := '';
  valorRetencao := 0;
  taxas.First;
  while not taxas.eof do
  begin
    if (maiorAtraso >= taxasfaixa1.AsInteger ) and ( (taxasfaixa2.AsInteger = 0) or (maiorAtraso <= taxasfaixa2.AsInteger) ) then
    begin
      percRetencao := taxasperc_ret.AsFloat;
      formaRetencao:= taxasforma_ret.asstring;
    end;
    taxas.next;
  end;

  if percRetencao > 0  then
  begin
    if formaRetencao = 'Total Recebido' then
      valorRetencao := vr_pagamento.Value * (percRetencao/100)
    else if formaRetencao = 'Sobre Juros e Multa' then
      valorRetencao := ((edt_juros.value - desc_juros.Value) + (edt_multa.value - desc_multa.value) ) * (percRetencao/100)
    else if formaRetencao = 'Sobre Principal' then
      valorRetencao := (edt_divida.value - desc_principal.Value) * (percRetencao/100);
    chaveTabRetencao := taxaspk_faixa.value;
  end;

  vr_retencao.value := valorRetencao;

end;

function Tfrm_cons_cobranca.calculaRetencaoBxParcial():real;
var atraso:integer;
var percRetencao,valorRetencao:real;
var formaRetencao:string;
begin

  chaveTabRetencao:=0;

  taxas.close;
  taxas.Parameters.ParamByName('cliente').value := qry_clientepk_cliente.Value;
  taxas.open;

  taxas.First;
  percRetencao := taxasperc_ret.AsFloat;
  formaRetencao:= taxasforma_ret.asstring;

  while not taxas.eof do
  begin
    if (maiorAtraso >= taxasfaixa1.AsInteger ) and ( (taxasfaixa2.AsInteger = 0) or (maiorAtraso <= taxasfaixa2.AsInteger) ) then
    begin
      percRetencao := taxasperc_ret.AsFloat;
      formaRetencao:= taxasforma_ret.asstring;
    end;
    taxas.next;
  end;

  if percRetencao > 0  then
  begin
    if formaRetencao = 'Total Recebido' then
      valorRetencao := edt_bxValor.Value * (percRetencao/100);
    chaveTabRetencao := taxaspk_faixa.value;
  end;

  result := valorRetencao;

end;

function Tfrm_cons_cobranca.permiteRetroagir():boolean;
var dataServidor:TDateTime;
var reCalcula:boolean;
begin
  dataServidor := frotinas.lerDataServidor();
  if dataServidor < date then
    dataServidor := date;

  if ( (edt_dataPgto.date>0) and (edt_dataPgto.date < dataServidor) ) then
    reCalcula := permiteRetroagirPgt
  else
    reCalcula := true;

  if reCalcula then
    //atualizar
  else
  begin
    showmessage('Não será possível recalcular nesta data');
    edt_dataPgto.date := 0;
  end;
  result:=reCalcula;
end;

procedure Tfrm_cons_cobranca.edt_dataPgtoExit(Sender: TObject);
begin
  permiteRetroagir;
end;

procedure Tfrm_cons_cobranca.qry_dividaAfterScroll(DataSet: TDataSet);
begin
lb_pag.caption := intToStr(qry_divida.recNo)+'/'+intToStr(qry_divida.recordCount);
end;

procedure Tfrm_cons_cobranca.btn_gravarAnotClick(Sender: TObject);
begin

try
begin
  devedor.edit;
  devedoranotacoes.value := Memo_anot.Text;
  devedor.post;
  showmessage('Anotação gravada!');
end
except
  showmessage('Ocorreu um erro no banco de dados.');
end;

  end;

procedure Tfrm_cons_cobranca.SpeedButton5Click(Sender: TObject);
begin
if qry_devedores.recordCount = 0 then
begin
  showMessage('Não foi selecionado nenhuma regra de busca.');
  exit;
end;

gravar();

end;

procedure Tfrm_cons_cobranca.formatarCGCCPF(cgcCpf:string);
begin
  if devedor.Active and ( Length(cgcCpf) >0 ) then
  begin
    if Length(cgcCpf) = 11 then
      edt_cgf.text := FormatCPF(cgcCpf)
    else
      edt_cgf.text := FormatCGC(cgcCpf);
  end;
end;

procedure Tfrm_cons_cobranca.edt_diasprevExit(Sender: TObject);
var hj:TDatetime;
var dt:string;
begin

if (edt_diasprev.Text <> '') and (edt_diasprev.Text <> '0') then
begin
  hj:= Date;
  dt:=FormatDateTime('dd/mm/yyyy',hj);

  dt:=(edt_diasprev.Text)+copy(dt,3,8);

  edt_dataPgto.Date := strToDateTime(dt);
end;

end;

procedure Tfrm_cons_cobranca.btn_receberClick(Sender: TObject);
var podeReceber : boolean;
var chave:integer;
var recibo,devedor:integer;
begin

  if not frotinas.acessoValido(janela,'btn_receber') then
  begin
    showmessage('Você não tem permissão para esta opção.');
    exit;
  end;

  podeReceber:=false;

  recibos.refresh;
  if recibosusuario_receb.value>0 then
  begin
    showmessage('Este recibo já foi recebido.');
  end
  else
  begin
    if MessageDlg('Confirma o Recebimento do Recibo na Empresa ?',
       mtConfirmation, [mbYes, mbNo],0) = mrYes then
    begin
      podeReceber:=true;
    end;
  end;


  if podeReceber then
  begin

    recibo := recibospk_recibo.value;
    devedor:= recibospk_devedor.value;

    Application.CreateForm(TFrm_Recebimento, Frm_Recebimento);
    Frm_Recebimento.hide;
    Frm_Recebimento.cb_tipoRecebimento.ItemIndex := 1;

    with Frm_Recebimento do
    begin

      recibos.Close;
      recibos.Parameters.ParamByName('recibo').value := intToStr(recibo);
      recibos.open;

      if recibos.recordCount = 0 then
      begin
        showmessage('Recibo não localizado!');
        Frm_Recebimento.destroy;
        exit;
      end;

      devedores.close;
      devedores.Parameters.ParamByName('devedor').value := intToStr(devedor);
      devedores.open;

      gravarRecebimento;

    end;

    Frm_Recebimento.destroy;

    recibos.close;
    recibos.Parameters.ParamByName('devedor').value := devedor;
    recibos.open;


  end;

end;

procedure Tfrm_cons_cobranca.btn_gravaBxParcialClick(Sender: TObject);
var chaveOcorr, diasAtraso:integer;
begin

   if not frotinas.acessoValido(janela,'btn_gravaBxParcial') then
   begin
    showmessage('Você não tem permissão para esta opção.');
    exit;
   end;

diasAtraso := calculaMaiorAtrasoEDivida(edt_bxData.Date);

frotinas.Qry_Livre.close;
frotinas.Qry_Livre.CommandText := 'select * from baixasparciais where 1=2';
frotinas.Qry_Livre.open;

frotinas.Qry_Livre.append;
frotinas.Qry_Livre.fieldByName('pk_bxparcial').value := frotinas.Sequencial('baixasparciais');
frotinas.Qry_Livre.fieldByName('pk_devedor').value   := qry_devedores.fieldByName('pk_devedor').value;
frotinas.Qry_Livre.fieldByName('data').value   := edt_bxData.Date;
frotinas.Qry_Livre.fieldByName('historico').value   := edt_bxHistorico.text;
frotinas.Qry_Livre.fieldByName('valor').value   := edt_bxValor.value;
frotinas.Qry_Livre.fieldByName('valor_retenc').value   := calculaRetencaoBxParcial();
frotinas.Qry_Livre.fieldByName('atraso').value   := diasAtraso;

frotinas.Qry_Livre.post;

// descobre parametro com tipo de ocorrencia
TbParam.open;
if (TbParam.locate('nome_param','PAGOUPARC',[])) then
begin
  chaveOcorr := TbParam.fieldByname('valor_param').asinteger;
  frotinas.gravaRealizouPGT( chaveOcorr, devedorpk_devedor.asinteger, edt_bxHistorico.text+'  R$ '+edt_bxValor.text,false);
end;


edt_bxData.Text := '';
edt_bxHistorico.text := '';
edt_bxValor.value := 0;

qry_bxparciais.Close;
qry_bxparciais.Open;

showMessage('Baixa parcial grava com sucesso');


end;

procedure Tfrm_cons_cobranca.cb_visualizaInativosClick(Sender: TObject);
begin
if cb_visualizaInativos.Checked then
begin
  qry_clientes.close;
  qry_clientes.SQL.CommaText := 'select * from clientes';
  qry_clientes.open;
end
else
begin
  qry_clientes.close;
  qry_clientes.SQL.CommaText := 'select * from clientes where inativado is null';
  qry_clientes.open;
end;


end;

procedure Tfrm_cons_cobranca.btn_foneClick(Sender: TObject);
begin
  if dts_telefones.State = dsEdit then
     telefones.Post;
end;

procedure Tfrm_cons_cobranca.sb_enviarEmailClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_envioEmail, frm_envioEmail);

  
end;

procedure Tfrm_cons_cobranca.sbtn_naoPesquisarClick(Sender: TObject);
begin
grid_devedores.Visible := false;

pn_pesq.Visible := false;
PageControl2.ActivePageIndex :=0;

//sbtn_naoPesquisar.Visible:=false;
//lb_help.Visible:=false;

end;

procedure Tfrm_cons_cobranca.qry_devedoresCalcFields(DataSet: TDataSet);
var telefones:string;
begin
frotinas.Qry_Livre.close;
frotinas.Qry_Livre.CommandText := 'select telefone from telefones t where pk_devedor= '+qry_devedorespk_devedor.asstring;
frotinas.Qry_Livre.open;
while not frotinas.Qry_Livre.eof do
begin
   if telefones<>'' then
    telefones := telefones + ' / ';
   telefones := telefones + alltrim(frotinas.Qry_Livre.fieldByName('telefone').asstring);
   frotinas.Qry_Livre.next;
end;

qry_devedorestelefones.value := telefones;

end;

procedure Tfrm_cons_cobranca.btn_negociarClick(Sender: TObject);
begin

if not pn_negociar.Visible  then
begin
  pn_negociar.Left := 2;
  pn_negociar.top:=107;
  pn_negociar.Visible:=true;

end
else
begin
  pn_negociar.Visible:=false;

end;

end;

procedure Tfrm_cons_cobranca.cb_cobJuridicaClick(Sender: TObject);
begin

  atualizar(true);

end;

procedure Tfrm_cons_cobranca.edt_percdescADMExit(Sender: TObject);
begin
if descTxAdm = 0 then
  atualizar(false);

if descTxAdm < edt_percdescADM.value then
begin
  showmessage('Desconto permitido desconto inferior a '+floatTostr(descTxAdm)+' para esta faixa de atraso.'  );
  edt_percdescADM.value := 0 ;
  desc_Adm.value:=0;
end
else
  desc_Adm.value := (edt_percdescADM.value / 100 ) * edt_txadm.value;
recalculaLiquido;
end;

procedure Tfrm_cons_cobranca.PercDesc_txBancoExit(Sender: TObject);
begin


desc_txBanco.value := (PercDesc_txBanco.value / 100 ) * txBancaria.value;
recalculaLiquido;

end;

procedure Tfrm_cons_cobranca.desc_txBancoExit(Sender: TObject);
begin
if desc_txBanco.value > txBancaria.value  then
begin
  showmessage('Valor de desconto superior ao valor da taxa.'  );
  desc_txBanco.value := 0 ;
end;
recalculaLiquido;
end;

procedure Tfrm_cons_cobranca.desc_AdmExit(Sender: TObject);
var pdesc:real;
begin
pdesc:= (desc_Adm.value / edt_txadm.value) * 100;
if pdesc > descTxAdm then
begin
  showmessage('Desconto permitido desconto inferior a '+floatTostr(descTxAdm)+' para esta faixa de atraso.'  );
  edt_percdescADM.value := 0 ;
  desc_Adm.value:=0;
end;
//else
//  edt_percdescj.value := pdesc;


recalculaLiquido;
end;

end.


