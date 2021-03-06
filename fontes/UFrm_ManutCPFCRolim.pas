unit UFrm_ManutCPFCRolim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls,  Gauges,  FileCtrl, Mask, DBCtrls,
  DB, ADODB, RxLookup, UEstruturasDeDadosParaImportacao, UDataSourcesDeImportacao, ULeituraDeArquivosRemessas;

type
  TFrm_ManutCPFCRolim = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    OpenDialog1: TOpenDialog;
    gb_enviar: TGroupBox;
    sb_PesquisarArquivos: TSpeedButton;
    DBEdit1: TDBEdit;
    Gauge_atualizando: TGauge;
    Memo1: TMemo;
    Label1: TLabel;
    tb_cliente: TADOTable;
    Dts_cliente: TDataSource;
    lk_cliente: TRxDBLookupCombo;
    qry_seqArq: TADOQuery;
    lb_mens: TLabel;
    qry_devedor: TADOQuery;
    tabelas: TADOTable;
    sb_gravarConf: TSpeedButton;
    memo_arquivos: TMemo;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    tb_clientepk_cliente: TIntegerField;
    tb_clientenome: TStringField;
    tb_clienteperc_juros_mes: TBCDField;
    tb_clienteperc_multa: TBCDField;
    tb_clientecnpj: TStringField;
    tb_clientelayout_Inteq: TStringField;
    tb_clientebaixaTit_Carga: TStringField;
    lb_status: TLabel;
    qry_devedorpk_devedor: TIntegerField;
    qry_devedorpk_cliente: TIntegerField;
    qry_devedornossonumero: TStringField;
    qry_devedorchave_no_cliente: TIntegerField;
    qry_devedorCGC_CPF: TStringField;
    qry_devedortitular_avalista: TStringField;
    qry_devedorNome: TStringField;
    qry_devedorRG: TStringField;
    qry_devedorOrgao_Rg: TStringField;
    qry_devedordata_nasc: TDateTimeField;
    qry_devedortelefones: TStringField;
    qry_devedortipo_logradouro: TStringField;
    qry_devedorlogradouro: TStringField;
    qry_devedorNumero: TStringField;
    qry_devedorComplemento: TStringField;
    qry_devedorBairro: TStringField;
    qry_devedorCidade: TStringField;
    qry_devedorCep: TStringField;
    qry_devedorUf: TStringField;
    qry_devedorponto_referencia: TStringField;
    qry_devedortrabalho_nome: TStringField;
    qry_devedorTrab_logradouro: TStringField;
    qry_devedortrab_numero: TStringField;
    qry_devedortrab_bairro: TStringField;
    qry_devedorTrab_cidade: TStringField;
    qry_devedorTrab_uf: TStringField;
    qry_devedortrab_fones: TStringField;
    qry_devedortrab_complemento: TStringField;
    qry_devedortrab_ponto_refer: TStringField;
    qry_devedortrab_cep: TStringField;
    qry_devedorProfissao: TStringField;
    qry_devedorSEXO: TStringField;
    qry_devedorprim_ref_pessoal: TStringField;
    qry_devedorprim_ref_pessoal_fones: TStringField;
    qry_devedorseg_ref_pessoal: TStringField;
    qry_devedorseg_ref_pessoal_fones: TStringField;
    qry_devedornao_localizado: TDateTimeField;
    qry_devedordata_baixa: TDateTimeField;
    qry_devedoragendado_data: TDateTimeField;
    qry_devedoragendado_hora: TStringField;
    qry_devedoragendado_tipo: TIntegerField;
    qry_devedoragendado_cobrador: TIntegerField;
    qry_devedorseq_arq_inclusao: TIntegerField;
    qry_devedorseq_arq_baixa: TIntegerField;
    qry_devedorusuario_baixa: TIntegerField;
    qry_devedorusuario_inclusao: TIntegerField;
    qry_devedormotivo_baixa: TStringField;
    qry_devedorvalor_divida: TFloatField;
    qry_devedormotivo_dialogo: TIntegerField;
    qry_devedordata_dialogo: TDateTimeField;
    qry_devedorpk_cobrador: TIntegerField;
    qry_devedoranotacoes: TStringField;
    qry_devedoremail: TStringField;
    qry_devedorcodigo_no_cliente: TStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure sb_PesquisarArquivosClick(Sender: TObject);
    procedure lerArquivo();
    procedure sb_gravarConfClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure gravarTelefonesDoDevedor( devedor:integer; numeroTelefone:string; tipo:string);

  private
    { Private declarations }

  public
    { Public declarations }
    F : TextFile;
  end;

var
  Frm_ManutCPFCRolim: TFrm_ManutCPFCRolim;

implementation

uses UPrincipal, UDM, URotinas,Uqr_rels, uRecebimento;

{$R *.dfm}

procedure TFrm_ManutCPFCRolim.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure TFrm_ManutCPFCRolim.sb_PesquisarArquivosClick(Sender: TObject);
begin
OpenDialog1.InitialDir := 'C:\';
OpenDialog1.Execute;
DBEdit1.text := OpenDialog1.FileName;
memo_arquivos.Lines.Add(DBEdit1.text);

end;

procedure TFrm_ManutCPFCRolim.gravarTelefonesDoDevedor( devedor:integer; numeroTelefone:string; tipo:string);
begin

  frotinas.Qry_Livre.close;
  frotinas.Qry_Livre.CommandText := 'select * from telefones where telefone='''+numeroTelefone+''' and pk_devedor='+inttostr(devedor);
  frotinas.Qry_Livre.open;
  if frotinas.Qry_Livre.recordCount = 0 then
  begin
    frotinas.Qry_Livre.append;
    frotinas.Qry_Livre.fieldByName('pk_devedor').value := devedor;
    frotinas.Qry_Livre.fieldByName('id').value := frotinas.Sequencial('telefones');
    frotinas.Qry_Livre.fieldByName('tipo_fone').value := tipo;
    frotinas.Qry_Livre.fieldByName('telefone').value := numeroTelefone;
    frotinas.Qry_Livre.post;
  end;


end;


procedure TFrm_ManutCPFCRolim.lerArquivo();

var F,fFile : TextFile;
var linha, seqArq, data,regAnterior:string;
var conta,total,erros, pk_devedores, pk_titulos,pk_telefones,chave :integer;
var chaveTitulo,contrato, numeroTitulo : string;
var historico:string;
var principalRec, jurosRec,multaRec,valorRec : real;
var cpf,nome:string;
var podeBaixar :boolean;
var mensErro, inconsistencia, motivoBaixa:string;
var linArq : integer;
var tiposTelefones1,tiposTelefones2,tiposTelefones3,tiposTelefones4:string;
var numerosTelefones1,numerosTelefones2,numerosTelefones3,numerosTelefones4:string;

var parte : TStringList;

var col : integer;

var contaCol: integer;
var campo:string;
var achou : boolean;


begin

  if lk_cliente.KeyValue = '' then
  begin
    showmessage('Informe o Cliente');
    exit;
  end;


  regAnterior:='';

  lb_mens.caption := 'Checando arquivo (0)';

  Memo1.Lines.Clear;

  linArq:=0;
  while linArq < memo_arquivos.Lines.Count do
  begin

    DBEdit1.text := memo_arquivos.Lines[linArq];

    if DBEdit1.text <> '' then
    begin



      AssignFile(fFile,DBEdit1.text);
      total:=0;
      conta:=1;
      erros:=0;

      Memo1.Lines.Add('');
      Memo1.Lines.Add('');
      Memo1.Lines.Add(DBEdit1.text);
      Memo1.Lines.Add('------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');


      Gauge_atualizando.MinValue := 0;

      parte := TStringList.Create;

      reset(fFile);

      while not eof(fFile) do
      begin

         lb_mens.caption := 'Checando arquivo ('+intToStr(total)+')';
         refresh;

         ReadLn(fFile,linha);
         inc(conta);

         if (linha <>'') and (copy(linha,1,1) = '2') then
         begin

           nome := alltrim(copy(linha,13,50));
           cpf := alltrim(copy(linha,67,11));


           //cpf := urotinas.limpaFormatacao(cpf);

           qry_devedor.close;
           qry_devedor.SQL.Text := 'select * from devedores where pk_cliente='+inttostr(lk_cliente.KeyValue)+' and cgc_cpf='''+cpf+'''';
           qry_devedor.open;

           //Parameters.ParamByName('nome').value := nome;
           //qry_devedor.Parameters.ParamByName('cliente').value := lk_cliente.KeyValue;
           //qry_devedor.open;

           achou := qry_devedor.recordCount>0;

           if not achou then
           begin

            qry_devedor.close;
            qry_devedor.SQL.Text := 'select * from devedores where pk_cliente='+inttostr(lk_cliente.KeyValue)+' and nome='''+nome+'''';
            qry_devedor.open;

            achou := qry_devedor.recordCount>0;

           end;

           if achou then
           begin

            qry_devedor.edit;
            qry_devedorCGC_CPF.Value := cpf;
            qry_devedor.post;
            
            memo1.Lines.Add('# ATUALIZADO:  '+nome+' '+cpf);
            inc(contaCol);


            tiposTelefones1 := 'Residencial Fixo';
            numerosTelefones1 := alltrim(copy(linha, 86,4)) + ' '+alltrim(copy(linha, 90,8));

            tiposTelefones1 := 'Celular';
            numerosTelefones1 := alltrim(copy(linha, 98,4)) + ' '+alltrim(copy(linha, 102,8));


            if numerosTelefones1 <> '' then
              gravarTelefonesDoDevedor(qry_devedorpk_devedor.asInteger,numerosTelefones1, tiposTelefones1);


            tiposTelefones2 := 'Empresa Fixo';
            numerosTelefones2 := alltrim(copy(linha, 630,4)) + ' '+alltrim(copy(linha, 634,8));
            if numerosTelefones2 <> '' then
              gravarTelefonesDoDevedor(qry_devedorpk_devedor.asInteger,numerosTelefones2, tiposTelefones2);


            tiposTelefones3 := alltrim(copy(linha, 802,18));
            numerosTelefones3 := alltrim(copy(linha, 830,10));
            if numerosTelefones3 <> '' then
              gravarTelefonesDoDevedor(qry_devedorpk_devedor.asInteger,numerosTelefones3, tiposTelefones3);

            tiposTelefones4 := alltrim(copy(linha, 840,18));
            numerosTelefones4 := alltrim(copy(linha, 868,10));
            if numerosTelefones4 <> '' then
              gravarTelefonesDoDevedor(qry_devedorpk_devedor.asInteger, numerosTelefones4, tiposTelefones4);



           end
           else
           begin
              memo1.Lines.Add('*** N�O ATUALIZADO=>  '+inttostr(conta)+' Conte�do Linha: '+linha);
           end;

         end;

      end;

      lb_mens.caption := '';



      memo1.Lines.Add('Total registros atualizados: '+intToStr(contaCol));


    end;

    inc(linArq);

    CloseFile(fFile);

  end;

end;



procedure TFrm_ManutCPFCRolim.sb_gravarConfClick(Sender: TObject);
begin

tb_cliente.Locate('pk_cliente', lk_cliente.KeyValue , []);
lb_status.caption := 'Checando...';

  lerArquivo()

end;

procedure TFrm_ManutCPFCRolim.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure TFrm_ManutCPFCRolim.FormShow(Sender: TObject);
begin
tb_cliente.Open;
end;

procedure TFrm_ManutCPFCRolim.SpeedButton2Click(Sender: TObject);
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
