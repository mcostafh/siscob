unit UFrm_BatimentoCarteira;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls,  Gauges,  FileCtrl, Mask, DBCtrls,
  DB, ADODB, RxLookup, UEstruturasDeDadosParaImportacao, UDataSourcesDeImportacao, ULeituraDeArquivosRemessas, UValidarBatimentoCarteira;


type
  TFrm_BatimentoCarteira = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    OpenDialog1: TOpenDialog;
    gb_enviar: TGroupBox;
    sb_explorer: TSpeedButton;
    Gauge_atualizando: TGauge;
    Label1: TLabel;
    tb_cliente: TADOTable;
    Dts_cliente: TDataSource;
    lk_cliente: TRxDBLookupCombo;
    tb_assessoria: TADOTable;
    qry_seqArq: TADOQuery;
    qry_devedor: TADOQuery;
    tabelas: TADOTable;
    qry_titulos: TADOQuery;
    telefones: TADODataSet;
    telefonesid: TIntegerField;
    telefonespk_devedor: TIntegerField;
    telefonestipo_fone: TStringField;
    telefonesTelefone: TStringField;
    qry_evento: TADODataSet;
    recibos: TADODataSet;
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
    recibospk_recibo: TIntegerField;
    recibospk_devedor: TIntegerField;
    recibosdata: TDateTimeField;
    reciboshora: TStringField;
    recibostipo: TIntegerField;
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
    seq_tabelas: TADODataSet;
    seq_tabelastabela: TStringField;
    seq_tabelasseq: TIntegerField;
    memo_arquivos: TMemo;
    SpeedButton1: TSpeedButton;
    tb_clientepk_cliente: TIntegerField;
    tb_clientenome: TStringField;
    tb_clienteperc_juros_mes: TBCDField;
    tb_clienteperc_multa: TBCDField;
    tb_clientecnpj: TStringField;
    tb_clientelayout_Inteq: TStringField;
    tb_clientebaixaTit_Carga: TStringField;
    lb_status: TLabel;
    qry_eventopk_cliente: TIntegerField;
    Label2: TLabel;
    DBEdit1: TEdit;
    sb_PesquisarArquivos: TSpeedButton;
    sb_gravarConf: TSpeedButton;
    Label3: TLabel;
    edt_excel: TEdit;
    SpeedButton3: TSpeedButton;
    pn_efetivar: TPanel;
    Memo1: TMemo;
    qry_job1: TADODataSet;
    qry_job1job: TIntegerField;
    qry_job1nome_campo: TWideStringField;
    qry_job1valor: TBCDField;
    qry_job1chave: TIntegerField;
    qry_job1tag_1: TWideStringField;
    qry_job1tag_2: TWideStringField;
    qry_job1tag_3: TWideStringField;
    qry_job1tag_4: TWideStringField;
    qry_job1tag_5: TWideStringField;
    qry_job1dec_1: TBCDField;
    qry_job1dec_2: TBCDField;
    qry_job1dec_3: TBCDField;
    qry_job1dec_4: TBCDField;
    qry_job1dec_5: TBCDField;
    qry_job1dec_6: TBCDField;
    qry_job1dec_7: TBCDField;
    qry_job1dec_8: TBCDField;
    qry_job1dec_9: TBCDField;
    qry_job1dec_10: TBCDField;
    qry_job1dec_11: TBCDField;
    qry_job1dec_12: TBCDField;
    qry_job1categoria: TStringField;
    ADOCommand1: TADOCommand;
    lb_mens: TLabel;
    qry_job1descricao: TStringField;
    qry_job1tag_6: TStringField;
    qry_job1tag_7: TStringField;
    qry_job1tag_8: TStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure sb_explorerClick(Sender: TObject);
    procedure lerArquivoPadrao();
    procedure lerArquivo();
    procedure sb_gravarConfClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sb_PesquisarArquivosClick(Sender: TObject);
    procedure reportToCsv(job:integer; nomeArquivo:string);

  private
    { Private declarations }

  public
    { Public declarations }
    F : TextFile;
  end;

var
  Frm_BatimentoCarteira: TFrm_BatimentoCarteira;

implementation

uses UPrincipal, UDM, URotinas,Uqr_rels, uRecebimento;

{$R *.dfm}

procedure TFrm_BatimentoCarteira.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure TFrm_BatimentoCarteira.sb_explorerClick(Sender: TObject);
begin
 OpenDialog1.InitialDir := DBEdit1.text;
OpenDialog1.Execute;
memo_arquivos.Lines.Clear;

DBEdit1.text := OpenDialog1.FileName;

if DBEdit1.text <>''then
  fRotinas.SetParam_String('PASTA_CARGA', DBEdit1.text );


memo_arquivos.Lines.Clear;
memo_arquivos.Lines.Add(DBEdit1.text);

end;


procedure TFrm_BatimentoCarteira.lerArquivoPadrao();

var F,fFile, fileBat : TextFile;
var linha, seqArq, data,regAnterior:string;
var conta,total,erros, qtd_clientes,qtd_titulos_inc,pk_telefones, qtd_titulos_exc_pg,qtd_titulos_exc_tr, pk_devedores, pk_titulos,chave, totalHeader :integer;
var chaveTitulo,contrato, numeroTitulo : string;
var historico:string;
var principalRec, jurosRec,multaRec,valorRec : real;
var cpf,tipoTitulo:string;
var podeBaixar :boolean;
var mensErro, inconsistencia, motivoBaixa, sql:string;
var ocorrAtualiz ,linArq, qtd_titulos_alt, ocorrBaixaImportada, job : integer;
var layoutAlteracaoValor : boolean;

var objEstruturaDevedor : EstruturaDevedor;
var objEstruturaPagamentos : EstruturaPagamentos;
var objEstruturaTitulos : EstruturaTitulos;
var objEstruturaAcordos : EstruturaAcordos;
var objEstruturaRetirada : EstruturaRetirada;

var objImportarRemessa : ImportarRemessas;
var objImportarPagamentos:ImportarPagamentos;
var objImportarAcordos:ImportarAcordos;
var objImportarRetirada:ImportarRetirada;

var objValidarRemessas:ValidarRemessas;
var objValidarPagamentos:ValidarPagamentos;
var objValidarRetirada:ValidarRetirada;


var objLeituraDeArquivosRemessas : LerArquivoRemessa;
var tipoDeArquivo, nome,path,arquivo , nomeArquivoBatimento, pastaBatimento: string;

var found:boolean;
var parte : TStringList;
var i, retorno:integer;

begin


  lb_mens.Caption := 'Lendo arquivos..';
  lb_mens.Visible:= true;
  refresh;


  if lk_cliente.KeyValue = '' then
  begin
    showmessage('Informe o Cliente');
    exit;
  end;

  erros:=0;

  regAnterior:='';

  
  layoutAlteracaoValor:=false;

  objEstruturaDevedor           := EstruturaDevedor.create();
  objEstruturaTitulos           := EstruturaTitulos.create();
  objEstruturaPagamentos        := EstruturaPagamentos.Create();
  objEstruturaAcordos           := EstruturaAcordos.Create();
  objEstruturaRetirada           := EstruturaRetirada.Create();

  objImportarRemessa            := ImportarRemessas.create(dm.DB);
  objLeituraDeArquivosRemessas  := LerArquivoRemessa.Create();
  objImportarPagamentos         := ImportarPagamentos.Create(dm.DB);
  objImportarAcordos            := ImportarAcordos.Create(dm.DB);
  objImportarRetirada           := ImportarRetirada.Create(dm.DB);

  objValidarRemessas            := ValidarRemessas.Create(dm.DB);
  objValidarPagamentos          := ValidarPagamentos.Create(dm.DB);
  objValidarRetirada            := ValidarRetirada.Create(dm.DB);

  objLeituraDeArquivosRemessas.objEstruturaDevedor := objEstruturaDevedor;
  objLeituraDeArquivosRemessas.objEstruturaTitulos := objEstruturaTitulos;
  objLeituraDeArquivosRemessas.objEstruturaPagamentos := objEstruturaPagamentos;
  objLeituraDeArquivosRemessas.objEstruturaAcordos := objEstruturaAcordos;
  objLeituraDeArquivosRemessas.objEstruturaRetirada := objEstruturaRetirada;


  nomeArquivoBatimento := 'ResBat_'+FormatDateTime( 'DDMMYYYY',date)+' '+FormatDateTime( 'hhmmss', time)+'.txt';
  pastaBatimento := '';
  path:=edt_excel.Text;
  while pos('\', path)>0 do
  begin
    pastaBatimento := pastaBatimento + copy( path,1, pos('\', path) );
    path:= copy( path,pos('\', path)+1 , length(path) );

  end;

  AssignFile(fileBat, pastaBatimento+nomeArquivoBatimento);
  {$Iochecks off}
  Append(fileBat);
  {$IoChecks on}
  if IoResult <>0 then
    rewrite(fileBat);




  objLeituraDeArquivosRemessas.pk_cliente := lk_cliente.KeyValue;

  frotinas.hot_debugger := false;

  job := frotinas.Sequencial('jobs');

  qry_job1.close;
  qry_job1.CommandText := 'select * from jobs where job='+intToStr(job);
  qry_job1.open;


  linArq:=0;
  while linArq < memo_arquivos.Lines.Count do
  begin

    DBEdit1.text := memo_arquivos.Lines[linArq];

    lb_mens.Caption := 'Lendo arquivo '+inttostr(linArq)+'/'+inttostr( memo_arquivos.Lines.Count ) ;
    refresh;


    if (DBEdit1.text <> '') and (length(DBEdit1.text)>10) then
    begin


      AssignFile(fFile,DBEdit1.text);
      reset(fFile);
      total := 0;
      while not eof(fFile) do
      begin
         ReadLn(fFile,linha);

         if copy(linha,1,1)='H' then
          totalHeader := strtoint(copy(linha,3,4));
         if (copy(linha,1,1)='D') or (copy(linha,1,1)='P' ) or (copy(linha,1,1)='R' )then
           inc(total);

      end;
      CloseFile(fFile);




      AssignFile(fFile,DBEdit1.text);
      reset(fFile);


      //total:=0;
      conta:=0;
      erros:=0;
      qtd_clientes:=0;
      qtd_titulos_inc:=0;
      qtd_titulos_exc_pg:=0;
      qtd_titulos_exc_tr:=0;


      Gauge_atualizando.MinValue := 0;
      Gauge_atualizando.MaxValue := total;
      Gauge_atualizando.Visible := true;
      Gauge_atualizando.Progress:=0;

      reset(fFile);

      tipoDeArquivo := '';

      try

        i:=0;
        while not eof(fFile) do
        begin


          inc(conta);
          inc(i);
          if i>500 then
          begin
            Gauge_atualizando.AddProgress(i);
            i:=0;
          end;


          ReadLn(fFile,linha);

          objEstruturaDevedor.limparBuffer;
          objEstruturaTitulos.limparBuffer;
          objEstruturaAcordos.limparBuffer;


          { ------ Pagamento ---------}
          if (copy(linha,1,1) = 'P') then
          begin



            objLeituraDeArquivosRemessas.lerPagamentosPadrao(linha);

            nome := '';
            found := objImportarPagamentos.pesquisarDevedor( tb_clientepk_cliente.value, objEstruturaPagamentos.cgc_cpf );
            if found then
            begin
              objEstruturaPagamentos.pk_devedor := objImportarPagamentos.devedor.fieldByName('pk_devedor').Value;
              nome := objImportarPagamentos.devedor.fieldByName('nome').Value;
            end
            else if objEstruturaPagamentos.codigo <> '' then
            begin
              found := objImportarPagamentos.pesquisarCodigoDevedor( tb_clientepk_cliente.value , objEstruturaPagamentos.codigo );
              if found then
              begin
                objEstruturaPagamentos.pk_devedor := objImportarPagamentos.devedor.fieldByName('pk_devedor').Value;
                nome := objImportarPagamentos.devedor.fieldByName('nome').Value;
              end;
            end;


            if found then { encontrou devedor }
            begin

              retorno := objValidarPagamentos.pagamentoRegistrado(objEstruturaPagamentos, DBEdit1.text);

              {
                retorno 1 - pagamento não localizado
                retorno 2 - titulo não localizado
              }

              if (retorno>0 ) and  ( not qry_job1.Locate('nome_campo;tag_1', VarArrayOf([objEstruturaPagamentos.cgc_cpf, objEstruturaPagamentos.numero_titulo]), [loPartialKey]) ) then
              begin                 // Locate('Company;Contact;Phone', VarArrayOf(['Sight Diver', 'P', '408-431-1000']), [loPartialKey]);


                qry_job1.append;
                qry_job1job.value := job;
                qry_job1nome_campo.value := objEstruturaPagamentos.cgc_cpf;
                qry_job1tag_1.value := objEstruturaPagamentos.numero_titulo;
                qry_job1tag_2.value := FormatDateTime( 'DD/MM/YYYY',objEstruturaPagamentos.data_pgto);
                qry_job1dec_1.value := objEstruturaPagamentos.valor_pgto;
                qry_job1descricao.value := linha;


                if retorno =1 then { título não localizado}
                begin

                  {verifica se cliente excluido ou título }
                  sql:=' select * from log ';
                  sql:=sql+' where cgc_cpf ='''+objEstruturaDevedor.cgc_cpf+'''';
                  sql:=sql+' and (  texto like ''%'+objEstruturaTitulos.numeroTitulo+'%'' or numero_titulo='''+objEstruturaTitulos.numeroTitulo+''')' ;

                  frotinas.Qry_Livre.Close;
                  frotinas.Qry_Livre.CommandText:= sql;
                  frotinas.Qry_Livre.open;

                  if frotinas.Qry_Livre.recordCount >0 then
                  begin
                    qry_job1categoria.value := 'T3';  // TODO: T1 título não cadastrado, mas foi excluido
                    qry_job1tag_6.value := frotinas.Qry_Livre.fieldByName('usuario_nome').Value;
                  end
                  else
                  begin

                    qry_job1categoria.value := 'T1';  // TODO: T1 título não cadastrado

                  end;

                end
                else { pagamento não localizado}
                begin

                  qry_job1categoria.value := 'P'+intTostr(retorno);  // TODO: P1 = titulo do pagamento não encontrado, P2 pagamento não encontrado

                  writeln(fileBat,linha);

                end;

                qry_job1.post;


              end;

            end
            else
            begin

              { Se não encontrou o devedor, deve pesquisar no log               }

              frotinas.Qry_Livre.Close;
              frotinas.Qry_Livre.CommandText:='select * from log where cgc_cpf ='''+objEstruturaPagamentos.cgc_cpf+'''' ;
              frotinas.Qry_Livre.open;


              qry_job1.append;
              qry_job1job.value := job;

              if frotinas.Qry_Livre.recordcount>0 then
              begin
                qry_job1categoria.value := 'D3';  // D2 = Devedor veio no pagamento não cadastrado porque foi excluido
                qry_job1tag_6.value := frotinas.Qry_Livre.fieldByName('usuario_nome').Value;
              end
              else
                qry_job1categoria.value := 'D1';  // TODO: D1 = Devedor veio no pagamento não cadastrado

              qry_job1nome_campo.value := objEstruturaPagamentos.cgc_cpf;
              qry_job1tag_1.value := objEstruturaPagamentos.numero_titulo;
              qry_job1tag_2.value := FormatDateTime( 'DD/MM/YYYY',objEstruturaPagamentos.data_pgto);
              qry_job1dec_1.value := objEstruturaPagamentos.valor_pgto;
              qry_job1.post;

            end;



          end
          { ------ Retirado ---------}
          else if (copy(linha,1,1) = 'R') then  //  Exclusão/Retirada
          begin


              objLeituraDeArquivosRemessas.lerRetiradaPadrao(linha);

              podeBaixar:=true;
              if (objEstruturaRetirada.cgc_cpf = '') and (objEstruturaRetirada.codigo ='') then
              begin
                inc(erros);
                continue;
              end;

              found := objValidarRemessas.devedorRegistrado( tb_clientepk_cliente.value, objEstruturaRetirada.cgc_cpf );

              if found then
              begin
                  objEstruturaRetirada.pk_devedor := objValidarRemessas.devedor.fieldByName('pk_devedor').Value;
              end
              else
              begin


                qry_job1.append;
                qry_job1job.value := job;
                qry_job1categoria.value := 'D2';  // TODO: D2 = Devedor veio na retirada e não cadastrado
                qry_job1nome_campo.value := objEstruturaRetirada.cgc_cpf;
                qry_job1tag_1.value := objEstruturaRetirada.numero_titulo;
                qry_job1tag_2.value := FormatDateTime( 'DD/MM/YYYY',objEstruturaRetirada.data_retirada);
                qry_job1.post;
              end;

              if  not objValidarRemessas.tituloRegistrado(tb_clientepk_cliente.value, objEstruturaRetirada.pk_devedor, objEstruturaRetirada.contrato, objEstruturaRetirada.numero_titulo) then
              begin
                qry_job1.append;
                qry_job1job.value := job;
                qry_job1categoria.value := 'R1';  // TODO: R1 titulo não retirado
                qry_job1nome_campo.value := objEstruturaRetirada.cgc_cpf;
                qry_job1tag_1.value := objEstruturaRetirada.numero_titulo;
                qry_job1tag_2.value := FormatDateTime( 'DD/MM/YYYY',objEstruturaRetirada.data_retirada);
                qry_job1.post;

                writeln(fileBat,linha);

              end;


          end
          { ------ Remessa de Devedor e título ---------}
          else if (copy(linha,1,1) = 'D') then // inclusão/carga Divida
          begin


            historico := objLeituraDeArquivosRemessas.lerRemessaPadrao(linha);

            if (objEstruturaDevedor.cgc_cpf <> '') and (objEstruturaDevedor.nome <> '' ) then
            begin

              // identifica devedor
              if objValidarRemessas.devedorRegistrado( objEstruturaDevedor.pk_cliente , objEstruturaDevedor.cgc_cpf ) then
              begin
                objEstruturaDevedor.pk_devedor := objValidarRemessas.devedor.fieldByName('pk_devedor').Value;
                objEstruturaDevedor.inserir := false;
              end
              else
              begin


                frotinas.Qry_Livre.Close;
                frotinas.Qry_Livre.CommandText:='select * from log where cgc_cpf ='''+objEstruturaDevedor.cgc_cpf+'''';
                frotinas.Qry_Livre.open;

                objEstruturaDevedor.inserir := true;
                qry_job1.append;
                qry_job1job.value := job;


                if frotinas.Qry_Livre.recordCount >0 then
                begin
                  qry_job1categoria.value := 'DX';  // DX Devedor veio na remessa e não cadastrado porque foi excluido
                  qry_job1tag_6.value := frotinas.Qry_Livre.fieldByName('usuario_nome').Value;
                end
                else
                begin
                  qry_job1categoria.value := 'D0';  // TODO: D0(zero) Devedor veio na remessa e não cadastrado
                  writeln(fileBat,linha);
                end;

                qry_job1nome_campo.value := objEstruturaDevedor.cgc_cpf;
                qry_job1tag_1.value := objEstruturaDevedor.nome;
                qry_job1.post;


              end;


              // se tem devedor entra
              if not objEstruturaDevedor.inserir then
              begin

                objEstruturaTitulos.pk_devedor := objEstruturaDevedor.pk_devedor;

                // identifica devedor
                if objValidarRemessas.tituloRegistrado( objEstruturaTitulos.pk_cliente, objEstruturaTitulos.pk_devedor, objEstruturaTitulos.contrato, objEstruturaTitulos.numeroTitulo ) then
                begin
                  objEstruturaTitulos.pk_titulo := objValidarRemessas.titulosDoDevedor.fieldByName('pk_titulo').Value;
                  objEstruturaTitulos.inserir := false;
                end
                else
                begin
                  objEstruturaTitulos.inserir := true;

                  sql:=' select * from log ';
                  sql:=sql+' where cgc_cpf ='''+objEstruturaDevedor.cgc_cpf+'''';
                  sql:=sql+' and ( texto like ''%'+objEstruturaTitulos.numeroTitulo+'%'' or numero_titulo='''+objEstruturaTitulos.numeroTitulo+''')' ;

                  frotinas.Qry_Livre.Close;
                  frotinas.Qry_Livre.CommandText:= sql;
                  frotinas.Qry_Livre.open;

                  qry_job1.append;
                  qry_job1job.value := job;

                  if frotinas.Qry_Livre.recordCount >0 then
                  begin
                    qry_job1categoria.value := 'T3';  // TODO: T1 título não cadastrado, mas foi excluido
                    qry_job1tag_6.value := frotinas.Qry_Livre.fieldByName('usuario_nome').Value;
                  end
                  else
                  begin
                    qry_job1categoria.value := 'T1';  // TODO: T1 título não cadastrado
                    writeln(fileBat,linha);
                  end;
                  qry_job1nome_campo.value := objEstruturaDevedor.cgc_cpf;
                  qry_job1tag_1.value := objEstruturaTitulos.numerotitulo;
                  qry_job1tag_2.value := objEstruturaTitulos.contrato;
                  qry_job1descricao.value := 'bco '+objEstruturaTitulos.banco+' '+objEstruturaTitulos.nome_banco+'/Ag.'+objEstruturaTitulos.agencia+'/Cta: '+objEstruturaTitulos.conta+'\ch: '+objEstruturaTitulos.cheque;
                  qry_job1tag_3.value := FormatDateTime( 'DD/MM/YYYY',objEstruturaTitulos.emissao);
                  qry_job1tag_4.value := FormatDateTime( 'DD/MM/YYYY',objEstruturaTitulos.vencimento);
                  qry_job1tag_5.value := objEstruturaTitulos.tipo_titulo;
                  qry_job1dec_1.value := objEstruturaTitulos.valor_principal;
                  qry_job1.post;


                end;
              end;

            end;

          end;

        end;

      except
        on E: Exception do showmessage('ocorreu um erro ao abrir o arquivo Linha: '+intToStr(conta)+'#13'+E.Message);
      end;


      CloseFile(fFile);

    end;

    inc(linArq);


  end;

  CloseFile(fileBat);


  lb_mens.Caption := 'Gerando arquivo excel com divergências...';
  refresh;

  reportToCsv(job, edt_excel.Text);

  lb_mens.Caption := 'Limpeando memória no banco de dados...';
  refresh;

  ADOCommand1.Prepared := true;
  ADOCommand1.CommandText := 'delete from jobs where job='+intToStr(job);
  ADOCommand1.Execute;

  lb_mens.Visible:=false;

  showmessage('Checagem concluída! Verifique o arquivo: '+edt_excel.Text);



end;


procedure TFrm_BatimentoCarteira.reportToCsv(job:integer; nomeArquivo:string);
var    f : TextFile;
var linha,nomeArq, aux : string;
var countFields, idField : integer;
var aspas, categoria, nomeCategoria, pastaArquivo : string;
begin

  aspas := '''';
  if nomeArquivo='' then
  begin
    pastaArquivo := ExtractFilePath(ParamStr(0));
    nomeArquivo := pastaArquivo+'\siscob_BatimentoCarteira'+FormatDateTime( 'DDMMYYYY',date)+'.csv';
  end
  else
    nomeArquivo:=nomeArquivo+'.csv';


  AssignFile(f, nomeArquivo);
  {$Iochecks off}
  Append(f);
  {$IoChecks on}
  if IoResult <>0 then
    rewrite(f);


  qry_job1.close;
  qry_job1.CommandText := 'select * from jobs where job='+intToStr(job)+' order by categoria, nome_campo ';
  qry_job1.open;


  writeln(f,'Listagem do batimento entre carteiras de cobrança');
  writeln(f,'Data: '+FormatDateTime( 'dd/mm/yyyy hh:mm', Time) );

  writeln(f,'');

  Gauge_atualizando.MinValue := 0;
  Gauge_atualizando.MaxValue := qry_job1.recordCount;
  Gauge_atualizando.Visible := true;


  qry_job1.first;
  while not qry_job1.eof do
  begin

    categoria := qry_job1categoria.value;
    Gauge_atualizando.AddProgress(1);


    if (categoria = 'D0') or (categoria = 'DX') then  // REMESSA - Devedores inexistentes no SISCOB
    begin

      if categoria = 'D0' then
        nomeCategoria := 'REMESSA - Devedores inexistentes no SISCOB '
      else
        nomeCategoria := 'REMESSA - Devedores inexistentes no SISCOB porque foi excluído';


      writeln(f,'');
      writeln(f,nomeCategoria);
      writeln(f,'tipo;cgc;nome;usuário que excluiu');

      while not qry_job1.eof and (categoria = qry_job1categoria.value) do
      begin
        Gauge_atualizando.AddProgress(1);
        if length(qry_job1nome_campo.value) = 11 then
          aux := Urotinas.FormatCPF(qry_job1nome_campo.value)
        else
          aux := Urotinas.FormatCGC(qry_job1nome_campo.value);

        writeln(f, nomeCategoria+';'+aux+';'+qry_job1tag_1.value+ ';'+qry_job1tag_6.value);

        qry_job1.next;
      end;

    end
    else if (categoria = 'D1') or (categoria = 'D3') then  // PAGAMENTO - Devedores inexistentes no SISCOB
    begin

      if categoria = 'D1' then
        nomeCategoria := 'PAGAMENTO - Devedores inexistentes no SISCOB '
      else
        nomeCategoria := 'PAGAMENTO - Devedores inexistentes no SISCOB porque foram excluídos';

      writeln(f,'');
      writeln(f,nomeCategoria);
      writeln(f,'tipo;cgc;titulo;data pgto;valor pgto;usuário que excluiu');

      while not qry_job1.eof and (categoria = qry_job1categoria.value) do
      begin

        Gauge_atualizando.AddProgress(1);
        if length(qry_job1nome_campo.value) = 11 then
          aux := Urotinas.FormatCPF(qry_job1nome_campo.value)
        else
          aux := Urotinas.FormatCGC(qry_job1nome_campo.value);

        writeln(f, categoria+';'+aux+';'+qry_job1tag_1.value+';'+qry_job1tag_2.value+';'+qry_job1dec_1.asstring+';'+qry_job1tag_6.asstring );

        qry_job1.next;
      end;

    end
    else if categoria = 'D2' then  // RETIRADA - Devedores inexistentes no SISCOB
    begin
      nomeCategoria := 'RETIRADA - Devedores inexistentes no SISCOB ';

      writeln(f,'');
      writeln(f,nomeCategoria);
      writeln(f,'tipo;cgc;titulo;data retirada');

      while not qry_job1.eof and (categoria = qry_job1categoria.value) do
      begin

        Gauge_atualizando.AddProgress(1);
        if length(qry_job1nome_campo.value) = 11 then
          aux := Urotinas.FormatCPF(qry_job1nome_campo.value)
        else
          aux := Urotinas.FormatCGC(qry_job1nome_campo.value);

        writeln(f, categoria+';'+aux+';'+qry_job1tag_1.value+';'+qry_job1tag_2.value);

        qry_job1.next;
      end;


    end
    else if categoria = 'R1' then  // RETIRADA - Título inexistentes no SISCOB
    begin
      nomeCategoria := 'RETIRADA - Titulos inexistentes no SISCOB ';

      writeln(f,'');
      writeln(f,nomeCategoria);
      writeln(f,'tipo;cgc;titulo;data retirada');

      while not qry_job1.eof and (categoria = qry_job1categoria.value) do
      begin

        Gauge_atualizando.AddProgress(1);
        if length(qry_job1nome_campo.value) = 11 then
          aux := Urotinas.FormatCPF(qry_job1nome_campo.value)
        else
          aux := Urotinas.FormatCGC(qry_job1nome_campo.value);

        writeln(f, categoria+';'+aux+';'+qry_job1tag_1.value+';'+qry_job1tag_2.value);

        qry_job1.next;
      end;


    end
    else if (categoria = 'T1') or (categoria = 'T3') then  // REMESSA - Título inexistentes no SISCOB
    begin

      if categoria = 'T1' then
        nomeCategoria := 'REMESSA - Titulos inexistentes no SISCOB '
      else
        nomeCategoria := 'REMESSA - Titulos inexistentes no SISCOB porque foi excluido';

      writeln(f,'');
      writeln(f,nomeCategoria);
      writeln(f,'tipo;cgc;titulo;contrato;tipo;cheque;emissao;vencimento;principal;usuário que excluiu');

      while not qry_job1.eof and (categoria = qry_job1categoria.value) do
      begin

        Gauge_atualizando.AddProgress(1);
        if length(qry_job1nome_campo.value) = 11 then
          aux := Urotinas.FormatCPF(qry_job1nome_campo.value)
        else
          aux := Urotinas.FormatCGC(qry_job1nome_campo.value);

        writeln(f, categoria+';'+aux+';'+qry_job1tag_1.value+';'+qry_job1tag_2.value+';'+qry_job1tag_5.value+';'+qry_job1descricao.value+';'+qry_job1tag_3.value+';'+qry_job1tag_4.value+';'+floatToStr( qry_job1dec_1.value)+';'+qry_job1tag_6.asstring);

        qry_job1.next;
      end;


    end
    else if categoria = 'P1'  then  // PAGAMENTO - Título inexistentes no SISCOB
    begin
      nomeCategoria := 'PAGAMENTO - Titulos inexistentes no SISCOB ';

      writeln(f,'');
      writeln(f,nomeCategoria);
      writeln(f,'tipo;cgc;titulo;data pgto;valor pgto');

      while not qry_job1.eof and (categoria = qry_job1categoria.value) do
      begin

        Gauge_atualizando.AddProgress(1);
        if length(qry_job1nome_campo.value) = 11 then
          aux := Urotinas.FormatCPF(qry_job1nome_campo.value)
        else
          aux := Urotinas.FormatCGC(qry_job1nome_campo.value);

        writeln(f, categoria+';'+aux+';'+qry_job1tag_1.value+';'+qry_job1tag_2.value+';'+ floatToStr( qry_job1dec_1.value)+';'+qry_job1descricao.asstring);

        qry_job1.next;
      end;

    end
    else if categoria = 'P2'  then  // PAGAMENTO - pagamento inexistentes no SISCOB
    begin
      nomeCategoria := 'PAGAMENTO - Pagamento inexistentes no SISCOB ';

      writeln(f,'');
      writeln(f,nomeCategoria);

      writeln(f,'tipo;cgc;titulo;data pgto;valor pgto');

      while not qry_job1.eof and (categoria = qry_job1categoria.value) do
      begin

        Gauge_atualizando.AddProgress(1);
        if length(qry_job1nome_campo.value) = 11 then
          aux := Urotinas.FormatCPF(qry_job1nome_campo.value)
        else
          aux := Urotinas.FormatCGC(qry_job1nome_campo.value);

        writeln(f, categoria+';'+aux+';'+qry_job1tag_1.value+';'+qry_job1tag_2.value+';'+ floatToStr( qry_job1dec_1.value)+';'+qry_job1descricao.value);

        qry_job1.next;
      end;



    end
    else
        qry_job1.next;
  end;

  CloseFile(f);

end;


procedure TFrm_BatimentoCarteira.lerArquivo();

var F,fFile,fileBat : TextFile;
var linha, seqArq, data,regAnterior:string;
var conta,total,erros, qtd_clientes,qtd_titulos_inc,pk_telefones, qtd_titulos_exc_pg,qtd_titulos_exc_tr, pk_devedores, pk_titulos,chave :integer;
var chaveTitulo,contrato, numeroTitulo : string;
var historico:string;
var principalRec, jurosRec,multaRec,valorRec : real;
var cpf,tipoTitulo:string;
var podeBaixar :boolean;
var mensErro, inconsistencia, motivoBaixa, sql:string;
var ocorrAtualiz ,linArq, qtd_titulos_alt, ocorrBaixaImportada : integer;
var layoutAlteracaoValor : boolean;

var objEstruturaDevedor : EstruturaDevedor;
var objEstruturaPagamentos : EstruturaPagamentos;
var objEstruturaTitulos : EstruturaTitulos;
var objEstruturaAcordos : EstruturaAcordos;
var objEstruturaRetirada : EstruturaRetirada;

var objImportarRemessa : ImportarRemessas;
var objImportarPagamentos:ImportarPagamentos;
var objImportarAcordos:ImportarAcordos;
var objImportarRetirada:ImportarRetirada;

var objLeituraDeArquivosRemessas : LerArquivoRemessa;
var tipoDeArquivo, nome,path,arquivo : string;

var found:boolean;
var parte : TStringList;
var i:integer;
var nomeArquivoBatimento : string;

begin

  if lk_cliente.KeyValue = '' then
  begin
    showmessage('Informe o Cliente');
    exit;
  end;

  erros:=0;

  recibos.close;
  recibos.open;


  regAnterior:='';

  lb_mens.caption := 'Checando arquivo (0)';

  layoutAlteracaoValor:=false;


  // ---
  // verifica existência da ocorrência
  frotinas.Qry_Livre.Close;
  frotinas.Qry_Livre.CommandText := 'select * from ocorrencias where nome=''99-Atualização Dívida'' ';
  frotinas.Qry_Livre.open;
  if frotinas.Qry_Livre.recordCount=0 then
  begin
   frotinas.Qry_Livre.append;
   frotinas.Qry_Livre.fieldByName('pk_ocorr').value := frotinas.Sequencial('ocorrencias');
   frotinas.Qry_Livre.fieldByName('nome').value := '99-Atualização Dívida';
   frotinas.Qry_Livre.post;
  end;
  ocorrAtualiz := frotinas.Qry_Livre.fieldByName('pk_ocorr').value;


  objEstruturaDevedor           := EstruturaDevedor.create();
  objEstruturaTitulos           := EstruturaTitulos.create();
  objEstruturaPagamentos        := EstruturaPagamentos.Create();
  objEstruturaAcordos           := EstruturaAcordos.Create();
  objEstruturaRetirada           := EstruturaRetirada.Create();

  objImportarRemessa            := ImportarRemessas.create(dm.DB);
  objLeituraDeArquivosRemessas  := LerArquivoRemessa.Create();
  objImportarPagamentos         := ImportarPagamentos.Create(dm.DB);
  objImportarAcordos            := ImportarAcordos.Create(dm.DB);
  objImportarRetirada           := ImportarRetirada.Create(dm.DB);


  objLeituraDeArquivosRemessas.objEstruturaDevedor := objEstruturaDevedor;
  objLeituraDeArquivosRemessas.objEstruturaTitulos := objEstruturaTitulos;
  objLeituraDeArquivosRemessas.objEstruturaPagamentos := objEstruturaPagamentos;
  objLeituraDeArquivosRemessas.objEstruturaAcordos := objEstruturaAcordos;
  objLeituraDeArquivosRemessas.objEstruturaRetirada := objEstruturaRetirada;

  objLeituraDeArquivosRemessas.pk_cliente := lk_cliente.KeyValue;


  nomeArquivoBatimento := 'Bat_'+FormatDateTime( 'DD/MM/YYYY',date)+' '+FormatDateTime( 'hh:mm:ss', time)+'.txt';



  AssignFile(fileBat, nomeArquivoBatimento);
  {$Iochecks off}
  Append(fileBat);
  {$IoChecks on}
  if IoResult <>0 then
    rewrite(fileBat);





  linArq:=0;
  while linArq < memo_arquivos.Lines.Count do
  begin

    DBEdit1.text := memo_arquivos.Lines[linArq];

    if (DBEdit1.text <> '') and (length(DBEdit1.text)>10) then
    begin

      AssignFile(fFile,DBEdit1.text);
      reset(fFile);
      total := 0;
      while not eof(fFile) do
      begin
         ReadLn(fFile,linha);
         inc(total);
      end;
      CloseFile(fFile);

      AssignFile(fFile,DBEdit1.text);
      reset(fFile);


      //total:=0;
      conta:=0;
      erros:=0;
      qtd_clientes:=0;
      qtd_titulos_inc:=0;
      qtd_titulos_exc_pg:=0;
      qtd_titulos_exc_tr:=0;


      Gauge_atualizando.MinValue := 0;
      Gauge_atualizando.MaxValue := total;
      Gauge_atualizando.Visible := true;

      reset(fFile);

      tipoDeArquivo := '';

      while not eof(fFile) do
      begin

         lb_mens.caption := 'Verificando arquivo ('+intToStr(total)+')';

         inc(conta);
         Gauge_atualizando.AddProgress(1);

         refresh;


         ReadLn(fFile,linha);

         if tb_clientelayout_Inteq.value <> 'O' then // casa pio
         begin
          objEstruturaDevedor.limparBuffer;
          objEstruturaTitulos.limparBuffer;
          objEstruturaAcordos.limparBuffer;
         end;



         { **********************************************
              ler remessas
           **********************************************
         }



         if tb_clientelayout_Inteq.value = 'S' then // secrel
         begin

            objLeituraDeArquivosRemessas.lerRemessaSecrel(linha);
            tipoDeArquivo := 'R';


         end
         else if tb_clientelayout_Inteq.value = 'E' then // esplanada
         begin


              objLeituraDeArquivosRemessas.lerRemessaEsplanada(linha);
              tipoDeArquivo := 'R';


         end
         else if tb_clientelayout_Inteq.value = 'M' then // maresia
         begin
          if (copy(linha,1,1) = '1')  then
           begin
              objLeituraDeArquivosRemessas.lerRemessaMaresia(linha, nome);
              tipoDeArquivo := 'R';
           end
           else
              tipoDeArquivo := '';



         end
         else if tb_clientelayout_Inteq.value = 'O' then // casa pio
         begin


          // registro 1 = devedor, registro 4=parcelas
          if (copy(linha,1,1) = '2') or (copy(linha,1,1) = '4') then
          begin
              if (copy(linha,2,1) = 'I') then
              begin
                objLeituraDeArquivosRemessas.lerRemessaCasaPio(linha, nome);
                if copy(linha,1,1) = '4' then
                  tipoDeArquivo := 'R'
                else
                  tipoDeArquivo := '';

              end
              else if copy(linha,2,1) = 'R' then
              begin
                objLeituraDeArquivosRemessas.lerPagamentosCasaPio(linha);
                if copy(linha,1,1) = '4' then
                  tipoDeArquivo := 'P'
                else
                  tipoDeArquivo := '';
              end;

          end
          else
              tipoDeArquivo := '';



         end
         else if tb_clientelayout_Inteq.value = 'R' then // redesplan
         begin

              if (copy(linha,1,11) = 'DataGeracao')  or (tipoDeArquivo = 'P') then // arquivo alega pagamento
              begin

                if tipoDeArquivo = '' then
                  ReadLn(fFile,linha);

                objLeituraDeArquivosRemessas.lerPagamentosRedesplan(linha);
                tipoDeArquivo := 'P';

              end
              else if (copy(linha,1,1) = 'D') then  //  arquivo de inclusões - conducto
              begin

                  objLeituraDeArquivosRemessas.lerRemessaRedesplan(linha);
                  tipoDeArquivo := 'R';

              end
              else if (copy(linha,1,8) = 'ID_CONTA')  or (tipoDeArquivo = 'A') then // arquivo acordos
              begin

                if tipoDeArquivo = '' then
                  ReadLn(fFile,linha);

                objLeituraDeArquivosRemessas.lerAcordosRedesplan(linha);
                tipoDeArquivo := 'A';

              end
              else if (copy(linha,1,3) = 'CPF')  or (tipoDeArquivo = 'D') then // devolução - retiradas
              begin

                if (conta = 1) and (MessageDlg('Este arquivo é de Devolução?',   mtConfirmation, [mbYes, mbNo],0) = mrYes)  then
                begin
                  tipoDeArquivo := 'D';
                  ReadLn(fFile,linha);
                end
                else if conta = 1 then
                begin
                  showmessage('Processamento interrompido!');
                  exit;

                end;

                objLeituraDeArquivosRemessas.lerRetiradaRedesplan(linha);

              end;

         end
         else if tb_clientelayout_Inteq.value = 'C' then // eletro
         begin


          objLeituraDeArquivosRemessas.lerRemessaEletroCentral(linha);
          tipoDeArquivo := 'R';


         end;




        { ****************************************************************************************
           A seguir será utilizada a estrutura de devedores, titulos para realizar a gravação
          ****************************************************************************************
        }


        if tipoDeArquivo = 'R' then
        begin

          if (objEstruturaDevedor.cgc_cpf <> '') and (objEstruturaDevedor.nome <> '' ) then
          begin

            // identifica devedor
            if objImportarRemessa.pesquisarDevedor( objEstruturaDevedor.pk_cliente , objEstruturaDevedor.cgc_cpf ) then
            begin
              objEstruturaDevedor.pk_devedor := objImportarRemessa.devedor.fieldByName('pk_devedor').Value;
              objEstruturaDevedor.inserir := false;
            end
            else
            begin
              objEstruturaDevedor.pk_devedor := frotinas.Sequencial('devedores');
              objEstruturaDevedor.inserir := true;
            end;

            objEstruturaTitulos.pk_devedor := objEstruturaDevedor.pk_devedor;
            // identifica devedor
            if objImportarRemessa.pesquisarTituloDoDevedor( objEstruturaTitulos.pk_cliente, objEstruturaTitulos.pk_devedor, objEstruturaTitulos.contrato, objEstruturaTitulos.numeroTitulo ,objEstruturaTitulos.vencimento) then
            begin
              objEstruturaTitulos.pk_titulo := objImportarRemessa.titulosDoDevedor.fieldByName('pk_titulo').Value;
              objEstruturaTitulos.inserir := false;
            end
            else
            begin
              objEstruturaTitulos.pk_titulo := frotinas.Sequencial('titulos');
              objEstruturaTitulos.inserir := true;
            end;


            // validação dos dados do devedor
            if objEstruturaDevedor.pk_devedor = 0 then
            begin
              inc(erros);
            end;


            // grava devedor
            if (erros = 0) then
              objImportarRemessa.gravarDadosDoDevedor(objEstruturaDevedor);


            // valida dados do titulo
            if objEstruturaTitulos.valor_principal = 0 then
            begin
              inc(erros);
            end;

            if objEstruturaTitulos.vencimento = 0 then
            begin
              inc(erros);
            end;

            if (erros = 0) then
              objImportarRemessa.gravarTitulosDoDevedor(objEstruturaTitulos);

          end { cgc/cpf e nome}
          else
          begin
            if objEstruturaDevedor.cgc_cpf = '' then
            begin
              inc(erros);
            end;
          end; { cgc/cpf e nome}



        end {remessa}
        else if tipoDeArquivo = 'P' then   {importa remessas}
        begin


            podeBaixar:=true;
            if (objEstruturaPagamentos.cgc_cpf = '') and (objEstruturaPagamentos.codigo ='') then
            begin
              podeBaixar:=false;
              inc(erros);
              //Memo1.Lines.Add('<SEM CGC> Linha: '+linha);
              continue;
            end;


            {Processo de pagamentos}

              // identifica devedor

            nome := '';
            found := objImportarPagamentos.pesquisarDevedor( tb_clientepk_cliente.value, objEstruturaPagamentos.cgc_cpf );
            if found then
            begin
              objEstruturaPagamentos.pk_devedor := objImportarPagamentos.devedor.fieldByName('pk_devedor').Value;
              nome := objImportarPagamentos.devedor.fieldByName('nome').Value;
            end
            else if objEstruturaPagamentos.codigo <> '' then
            begin
              found := objImportarPagamentos.pesquisarCodigoDevedor( tb_clientepk_cliente.value , objEstruturaPagamentos.codigo );
              if found then
              begin
                objEstruturaPagamentos.pk_devedor := objImportarPagamentos.devedor.fieldByName('pk_devedor').Value;
                nome := objImportarPagamentos.devedor.fieldByName('nome').Value;
              end;
            end;


            if not found then
            begin
              podeBaixar:=false;
              continue;
            end;





            {
             pagamento RedeSplan
            }

            if (tb_clientelayout_Inteq.value = 'R') then
            begin
                objImportarPagamentos.gravarPagamentoParcial(objEstruturaPagamentos, DBEdit1.text);
            end
            else
            begin

              // identifica devedor
              if objImportarPagamentos.pesquisarTituloDoDevedor( objEstruturaPagamentos.pk_cliente, objEstruturaPagamentos.pk_devedor, objEstruturaPagamentos.contrato, objEstruturaPagamentos.numero_Titulo ) then
                objEstruturaPagamentos.pk_titulo := objImportarPagamentos.titulosDoDevedor.fieldByName('pk_titulo').Value
              else
                podeBaixar:=false;



              if (podeBaixar) and (erros = 0)  then
                objImportarPagamentos.gravarDadosDoPagamentoTotal(objEstruturaPagamentos);

           end;

        end  {pagamentos}

        else if tipoDeArquivo = 'D' then   {importa devolução}
        begin

            podeBaixar:=true;
            if (objEstruturaRetirada.cgc_cpf = '') and (objEstruturaRetirada.codigo ='') then
            begin
              podeBaixar:=false;
              inc(erros);
              continue;
            end;


            {Processo de pagamentos}

            // identifica devedor

            found := objImportarRetirada.pesquisarDevedorCGC( tb_clientepk_cliente.value, objEstruturaRetirada.cgc_cpf );

            if found then
            begin
                objEstruturaRetirada.pk_devedor := objImportarRetirada.devedor.fieldByName('pk_devedor').Value;
            end
            else
            begin
              podeBaixar:=false;
              continue;
            end;


            if podeBaixar and (tb_clientelayout_Inteq.value = 'R') then // redesplan
            begin
                objImportarRetirada.gravarRetirada(objEstruturaRetirada, DBEdit1.text,'');
            end;


        end
        else if tipoDeArquivo = 'A' then   {importa acordos}
        begin

            podeBaixar:=true;
            if (objEstruturaRetirada.cgc_cpf = '') and (objEstruturaRetirada.codigo ='') then
            begin
              podeBaixar:=false;
              inc(erros);
              continue;
            end;


            {Processo de pagamentos}

            // identifica devedor

            found := objImportarRetirada.pesquisarDevedorCGC( tb_clientepk_cliente.value, objEstruturaRetirada.cgc_cpf );

            if found then
            begin
                objEstruturaRetirada.pk_devedor := objImportarRetirada.devedor.fieldByName('pk_devedor').Value;
            end
            else
            begin
              podeBaixar:=false;
              continue;
            end;


            if podeBaixar and (tb_clientelayout_Inteq.value = 'R') then // redesplan
            begin
                objImportarRetirada.gravarRetirada(objEstruturaRetirada, DBEdit1.text,'');
            end;


        end;




        if objLeituraDeArquivosRemessas.errosArquivo <> '' then
        begin
          inc(erros);
        end;


      end;


    end;

    inc(linArq);


    CloseFile(fFile);

    arquivo:=DBEdit1.text;

    parte := TStringList.Create;

    parte.clear;
    ExtractStrings(['\'],[], PChar(arquivo), parte);

    path  := '';
    i:=0;
    while i<parte.count-1 do
    begin
      if path = '' then
        path := parte[i]
      else
        path := path + '\\'+parte[i];
      inc(i);
    end;

    // criar pasta e transferir arquivo
    path := path+'\\processados';

    if not DirectoryExists(path) then
        ForceDirectories(path);

    path := path+'\\'+FormatDateTime( 'dd_mm_yyyy', Date);

    if not DirectoryExists(path) then
        ForceDirectories(path);



    path := path+'\\'+parte[i];

    parte.Free;


    MoveFile(PChar(DBEdit1.text),PChar(path));


  end;

end;



procedure TFrm_BatimentoCarteira.sb_gravarConfClick(Sender: TObject);
begin

if memo_arquivos.Lines.Count = 0 then
begin
    showmessage('Não foi informado arquivos para leitura do batimento entre carteiras');
    exit;
end;

if edt_excel.Text = '' then
begin
    showmessage('Não foi informada a pasta e o nome do arquivo para gerar o arquivo no formato excel do batimento entre carteiras. Exemplo: C:\sistemas\batimento1');
    exit;
end;

lb_mens.Caption := 'Realizando leitura dos arquivos...';
lb_mens.Visible := true;


tb_cliente.Locate('pk_cliente', lk_cliente.KeyValue , []);
lb_status.caption := 'Checando...';

if tb_clientelayout_Inteq.value = 'P' then // próprio
  lerArquivoPadrao()
else
  lerArquivo();



pn_efetivar.Visible := true;


end;

procedure TFrm_BatimentoCarteira.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure TFrm_BatimentoCarteira.FormShow(Sender: TObject);
begin
tb_assessoria.Open;
tb_cliente.Open;

DBEdit1.text:= fRotinas.Param_String('PASTA_CARG');


end;


procedure TFrm_BatimentoCarteira.sb_PesquisarArquivosClick(Sender: TObject);
var SearchRec: TSearchRec;
 i:integer;
 dbResult : word;

 pasta:string;
begin
    pasta:= DBEdit1.text;

    fRotinas.SetParam_String('PASTA_CARG', DBEdit1.text );

    memo_arquivos.Lines.Clear;

    i:=FindFirst(pasta+'*.txt', faAnyFile, SearchRec);
    while i=0 do
    begin
      memo_arquivos.Lines.add(Pasta+SearchRec.Name);
      i:=FindNext(SearchRec);
    end;

end;

end.
