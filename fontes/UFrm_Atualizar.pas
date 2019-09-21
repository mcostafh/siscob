unit UFrm_Atualizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls,  Gauges,  FileCtrl, Mask, DBCtrls,IBQuery,
  DB, ADODB, RxLookup, UEstruturasDeDadosParaImportacao, UDataSourcesDeImportacao, ULeituraDeArquivosRemessas;



type
  TFrm_Atualizar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    OpenDialog1: TOpenDialog;
    gb_enviar: TGroupBox;
    sb_explorer: TSpeedButton;
    Label1: TLabel;
    Dts_cliente: TDataSource;
    lk_cliente: TRxDBLookupCombo;
    tb_assessoria: TADOTable;
    qry_seqArq: TADOQuery;
    lb_mens: TLabel;
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
    qry_arqimportado: TADODataSet;
    SpeedButton1: TSpeedButton;
    lb_status: TLabel;
    qry_eventopk_cliente: TIntegerField;
    Label2: TLabel;
    DBEdit1: TEdit;
    sb_PesquisarArquivos: TSpeedButton;
    pn_mensagens: TPanel;
    Memo1: TMemo;
    SpeedButton2: TSpeedButton;
    memo_arquivos: TMemo;
    GroupBox1: TGroupBox;
    cb_gravar: TCheckBox;
    sb_gravarConf: TSpeedButton;
    Gauge_atualizando: TGauge;
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
    procedure sb_explorerClick(Sender: TObject);
    procedure lerArquivoPadrao();
    procedure lerArquivoInteq();
    procedure lerArquivo();
    procedure sb_gravarConfClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sb_PesquisarArquivosClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    F : TextFile;
  end;

var
  Frm_Atualizar: TFrm_Atualizar;

implementation

uses UPrincipal, UDM, URotinas,Uqr_rels, uRecebimento;

{$R *.dfm}

procedure TFrm_Atualizar.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure TFrm_Atualizar.sb_explorerClick(Sender: TObject);
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


procedure TFrm_Atualizar.lerArquivoPadrao();

var F,fFile : TextFile;
var linha, seqArq, data,regAnterior:string;
var conta,total,erros, qtd_clientes,qtd_titulos_inc,pk_telefones, qtd_titulos_exc_pg,qtd_titulos_exc_tr, pk_devedores, pk_titulos,chave, totalHeader :integer;
var chaveTitulo,contrato, numeroTitulo : string;
var historico:string;
var principalRec, jurosRec,multaRec,valorRec : real;
var cpf,tipoTitulo:string;
var podeBaixar :boolean;
var mensErro, inconsistencia, motivoBaixa, sql:string;
var ocorrAtualiz ,linArq, qtd_titulos_alt, ocorrBaixaImportada : integer;
var layoutAlteracaoValor : boolean;

var objEstruturaDevedor : EstruturaDevedor;
var objEstruturaInquilino : EstruturaDevedor;
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

begin


  if lk_cliente.KeyValue = '' then
  begin
    showmessage('Informe o Cliente');
    exit;
  end;

  erros:=0;

  //recibos.close;
  //recibos.open;


  regAnterior:='';

  lb_mens.caption := 'Checando arquivo (0)';

  Memo1.Lines.Clear;
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

  objEstruturaInquilino         := EstruturaDevedor.create();

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

  objLeituraDeArquivosRemessas.objEstruturaInquilino := objEstruturaInquilino;

  objLeituraDeArquivosRemessas.objEstruturaDevedor := objEstruturaDevedor;
  objLeituraDeArquivosRemessas.objEstruturaTitulos := objEstruturaTitulos;
  objLeituraDeArquivosRemessas.objEstruturaPagamentos := objEstruturaPagamentos;
  objLeituraDeArquivosRemessas.objEstruturaAcordos := objEstruturaAcordos;
  objLeituraDeArquivosRemessas.objEstruturaRetirada := objEstruturaRetirada;

  objLeituraDeArquivosRemessas.pk_cliente := lk_cliente.KeyValue;

  frotinas.hot_debugger := false;


  linArq:=0;
  while linArq < memo_arquivos.Lines.Count do
  begin

    DBEdit1.text := memo_arquivos.Lines[linArq];

    frotinas.qry_livre.close;
    frotinas.qry_livre.CommandText := 'select * from arq_importados where nomearquivo='''+DBEdit1.text+'''';
    frotinas.qry_livre.open;
    if frotinas.qry_livre.recordCount>0 then
    begin
      Memo1.Lines.Add('Arquivo '+DBEdit1.text+' já importado em '+FormatDateTime( 'dd_mm_yyyy', frotinas.qry_livre.fieldByName('data_importado').value));
      DBEdit1.text :='';
    end;



    if (DBEdit1.text <> '') and (length(DBEdit1.text)>10) then
    begin


      arquivo := DBEdit1.text;


      urotinas.log('calculando total');
      AssignFile(fFile, arquivo);
      reset(fFile);
      total := 0;
      while not eof(fFile) do
      begin
         ReadLn(fFile,linha);

         if copy(linha,1,1)='H' then
          totalHeader := strtoint(copy(linha,3,4));
         if (copy(linha,1,1)='D') or (copy(linha,1,1)='P' ) then
           inc(total);

      end;
      CloseFile(fFile);

      urotinas.log('total '+inttostr(total));
      AssignFile(fFile,arquivo);
      reset(fFile);


      //total:=0;
      conta:=0;
      erros:=0;
      qtd_clientes:=0;
      qtd_titulos_inc:=0;
      qtd_titulos_exc_pg:=0;
      qtd_titulos_exc_tr:=0;

      Memo1.Lines.Add('');
      Memo1.Lines.Add('');
      Memo1.Lines.Add(DBEdit1.text);
      Memo1.Lines.Add('------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');

      Gauge_atualizando.MinValue := 0;
      Gauge_atualizando.MaxValue := total;
      Gauge_atualizando.Visible := true;

      reset(fFile);

      tipoDeArquivo := '';

      try

        while not eof(fFile) do
        begin

          lb_mens.caption := 'Checando arquivo ('+intToStr(total)+')';

          inc(conta);
          Gauge_atualizando.AddProgress(1);

          refresh;

          urotinas.log('# '+inttostr(conta)+' '+linha);
          ReadLn(fFile,linha);

          objEstruturaInquilino.limparBuffer;
          objEstruturaDevedor.limparBuffer;
          objEstruturaTitulos.limparBuffer;
          objEstruturaAcordos.limparBuffer;


          { Pagamento}
          if (copy(linha,1,1) = 'P') then
          begin

            objLeituraDeArquivosRemessas.lerPagamentosPadrao(linha);

            if (objEstruturaPagamentos.cgc_cpf = '') then
            begin
              inc(erros);
              Memo1.Lines.Add('<SEM CGC> Linha: '+linha);
              continue;
            end;


            {Processo de pagamentos}

              // identifica devedor

            nome := '';
            found := objImportarPagamentos.pesquisarDevedor( qry_clientespk_cliente.value, objEstruturaPagamentos.cgc_cpf );
            if found then
            begin
              objEstruturaPagamentos.pk_devedor := objImportarPagamentos.devedor.fieldByName('pk_devedor').Value;
              nome := objImportarPagamentos.devedor.fieldByName('nome').Value;
            end
            else if objEstruturaPagamentos.codigo <> '' then
            begin
              found := objImportarPagamentos.pesquisarCodigoDevedor( qry_clientespk_cliente.value , objEstruturaPagamentos.codigo );
              if found then
              begin
                objEstruturaPagamentos.pk_devedor := objImportarPagamentos.devedor.fieldByName('pk_devedor').Value;
                nome := objImportarPagamentos.devedor.fieldByName('nome').Value;
              end;
            end;


            if found then
            begin
              Memo1.Lines.Add('Devedor: '+nome+' '+linha);
              objImportarPagamentos.gravarPagamentoPadrao(objEstruturaPagamentos, arquivo);
            end;


          end
          else if (copy(linha,1,1) = 'G') then  //  Exclusão/Retirada
          begin


            objLeituraDeArquivosRemessas.lerPagamentosPadrao(linha);

            if (objEstruturaPagamentos.cgc_cpf = '') then
            begin
              inc(erros);
              Memo1.Lines.Add('<SEM CGC> Linha: '+linha);
              continue;
            end;


            {Processo de pagamentos}

              // identifica devedor

            nome := '';
            found := objImportarPagamentos.pesquisarDevedor( qry_clientespk_cliente.value, objEstruturaPagamentos.cgc_cpf );
            if found then
            begin
              objEstruturaPagamentos.pk_devedor := objImportarPagamentos.devedor.fieldByName('pk_devedor').Value;
              nome := objImportarPagamentos.devedor.fieldByName('nome').Value;
            end
            else if objEstruturaPagamentos.codigo <> '' then
            begin
              found := objImportarPagamentos.pesquisarCodigoDevedor( qry_clientespk_cliente.value , objEstruturaPagamentos.codigo );
              if found then
              begin
                objEstruturaPagamentos.pk_devedor := objImportarPagamentos.devedor.fieldByName('pk_devedor').Value;
                nome := objImportarPagamentos.devedor.fieldByName('nome').Value;
              end;
            end;


            if found then
            begin
              Memo1.Lines.Add('Devedor: '+nome+' '+linha);
              objImportarPagamentos.gravarPagamentoPadraoNaoIdent(objEstruturaPagamentos, arquivo);
            end;




          end
          else if (copy(linha,1,1) = 'R') then  //  Exclusão/Retirada
          begin


              objLeituraDeArquivosRemessas.lerRetiradaPadrao(linha);

              podeBaixar:=true;
              if (objEstruturaRetirada.cgc_cpf = '') and (objEstruturaRetirada.codigo ='') then
              begin
                inc(erros);
                Memo1.Lines.Add('<SEM CGC> Linha: '+linha);
                continue;
              end;


              {Processo de pagamentos}

              // identifica devedor

              found := objImportarRetirada.pesquisarDevedorCGC( qry_clientespk_cliente.value, objEstruturaRetirada.cgc_cpf );

              if found then
              begin
                  objEstruturaRetirada.pk_devedor := objImportarRetirada.devedor.fieldByName('pk_devedor').Value;
              end
              else
              begin
                Memo1.Lines.Add('Não achou  '+objEstruturaRetirada.cgc_cpf +' '+linha);
                continue;
              end;

              Memo1.Lines.Add('Devedor: '+objImportarRetirada.devedor.fieldByName('nome').Value+' '+linha);

              if podeBaixar then
              begin
                  objImportarRetirada.gravarRetiradaTitulo(objEstruturaRetirada, arquivo,'Retirada');
              end;




          end
          else if (copy(linha,1,1) = 'D') then // inclusão/carga Divida
          begin


            historico := objLeituraDeArquivosRemessas.lerRemessaPadrao(linha);

            if historico<>'' then
            begin
              inc(erros);
              Memo1.Lines.Add('Mensagem: '+historico);
              continue;

            end;

            if (objLeituraDeArquivosRemessas.objEstruturaDevedor.cgc_cpf = '') and (objLeituraDeArquivosRemessas.objEstruturaDevedor.codigo ='') then
            begin
              inc(erros);
              //Memo1.Lines.Add('<SEM CGC> Linha: '+linha);
              continue;
            end;

            if (objLeituraDeArquivosRemessas.objEstruturaDevedor.cgc_cpf <> '') and (objLeituraDeArquivosRemessas.objEstruturaDevedor.nome <> '' ) then
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
              if objImportarRemessa.pesquisarTituloDoDevedor( objEstruturaTitulos.pk_cliente, objEstruturaTitulos.pk_devedor, objEstruturaTitulos.contrato, objEstruturaTitulos.numeroTitulo, objEstruturaTitulos.vencimento ) then
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
                Memo1.Lines.Add('<SEM CHAVE DEVEDOR> Linha: '+linha);
              end;


              // grava devedor
              if (erros = 0) and ( cb_gravar.Checked) then
                objImportarRemessa.gravarDadosDoDevedor(objEstruturaDevedor);


              // valida dados do titulo
              if objEstruturaTitulos.valor_principal = 0 then
              begin
                inc(erros);
                Memo1.Lines.Add('<SEM VALOR PRINCIPAL> Linha: '+linha);
              end;

              if objEstruturaTitulos.vencimento = 0 then
              begin
                inc(erros);
                Memo1.Lines.Add('<SEM VENCIMENTO> Linha: '+linha);
              end;

              if (erros = 0) and ( cb_gravar.Checked) then
                objImportarRemessa.gravarTitulosDoDevedor(objEstruturaTitulos);



            end { cgc/cpf e nome}
            else
            begin
              if objEstruturaDevedor.cgc_cpf = '' then
              begin
                inc(erros);
                Memo1.Lines.Add('<SEM CGC> Linha: '+linha);
              end;
            end; { cgc/cpf e nome}


          end;


        end;

      except

        on E: Exception do showmessage('ocorreu um erro ao abrir o arquivo Linha: '+intToStr(conta)+'#13'+E.Message);

      end;


      refresh;


      if (erros = 0) and ( not cb_gravar.Checked) then
        memo1.Lines.Add('=> PRONTO PARA GRAVAR (Para gravar marque a opção de gravar e execute novamente.)')
      else if cb_gravar.Checked then
      begin

        memo1.Lines.Add('');
        memo1.Lines.Add('---------------------------------------------------------');
        memo1.Lines.Add(' Total de Linhas lidas: '+inttostr(total));
        memo1.Lines.Add(' Total gravdos: '+inttostr(total - erros));
        memo1.Lines.Add(' Total erros: '+inttostr(erros));
        memo1.Lines.Add(' # Verifique na Distribuição.');

        memo1.Lines.Add('---------------------------------------------------------');

        

      end;
      CloseFile(fFile);


      if (erros = 0) and (cb_gravar.Checked) then
      begin

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

        //parte.Free;


        MoveFile(PChar(DBEdit1.text),PChar(path));

        frotinas.qry_livre.close;
        frotinas.qry_livre.CommandText := 'select * from arq_importados where nomearquivo='''+DBEdit1.text+'''';
        frotinas.qry_livre.open;
        if frotinas.qry_livre.recordCount=0 then
        begin

          frotinas.qry_livre.append;
          frotinas.qry_livre.fieldByName('pk_chave').value := FRotinas.Sequencial('arq_importados');
          frotinas.qry_livre.fieldByName('nomearquivo').value := DBEdit1.text;
          frotinas.qry_livre.fieldByName('data_importado').value := date;
          frotinas.qry_livre.post;

        end;

      end;


    end;

    inc(linArq);


  end;


end;

procedure TFrm_Atualizar.lerArquivo();

var F,fFile : TextFile;
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
var tipoDeArquivo, nome,path,arquivo, codigoDevedor, vencimento,competencia : string;

var found:boolean;
var parte : TStringList;
var i:integer;

var arLinha : TResultArray;

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

  Memo1.Lines.Clear;
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

  //objLeituraDeArquivosRemessas.objEstruturaInquilino := objEstruturaInquilino;

  objLeituraDeArquivosRemessas.objEstruturaDevedor := objEstruturaDevedor;
  objLeituraDeArquivosRemessas.objEstruturaTitulos := objEstruturaTitulos;
  objLeituraDeArquivosRemessas.objEstruturaPagamentos := objEstruturaPagamentos;
  objLeituraDeArquivosRemessas.objEstruturaAcordos := objEstruturaAcordos;
  objLeituraDeArquivosRemessas.objEstruturaRetirada := objEstruturaRetirada;

  objLeituraDeArquivosRemessas.pk_cliente := lk_cliente.KeyValue;

  codigoDevedor := '';
  vencimento:='';
  competencia:='';
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

      Memo1.Lines.Add('');
      Memo1.Lines.Add('');
      Memo1.Lines.Add(DBEdit1.text);
      Memo1.Lines.Add('------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');

      Gauge_atualizando.MinValue := 0;
      Gauge_atualizando.MaxValue := total;
      Gauge_atualizando.Visible := true;

      reset(fFile);

      tipoDeArquivo := '';
      linha :='';
      try

        while not eof(fFile) do
        begin

           lb_mens.caption := 'Checando arquivo ('+intToStr(total)+')';

           inc(conta);
           Gauge_atualizando.AddProgress(1);

           refresh;


           ReadLn(fFile,linha);

           if qry_clienteslayout_Inteq.value <> 'O' then // casa pio
           begin
            objEstruturaDevedor.limparBuffer;
            objEstruturaTitulos.limparBuffer;
            objEstruturaAcordos.limparBuffer;
            //objEstruturaInquilino.limparBuffer;
           end;



           { **********************************************
                ler remessas
             **********************************************
           }



           if qry_clienteslayout_Inteq.value = 'S' then // secrel
           begin

              objLeituraDeArquivosRemessas.lerRemessaSecrel(linha);
              tipoDeArquivo := 'R';


           end
           else if qry_clienteslayout_Inteq.value = 'E' then // esplanada
           begin


                objLeituraDeArquivosRemessas.lerRemessaEsplanada(linha);
                tipoDeArquivo := 'R';


           end
           else if qry_clienteslayout_Inteq.value = 'M' then // maresia
           begin
            if (copy(linha,1,1) = '1')  then
             begin
                objLeituraDeArquivosRemessas.lerRemessaMaresia(linha, nome);
                tipoDeArquivo := 'R';
             end
             else
                tipoDeArquivo := '';



           end
           else if qry_clienteslayout_Inteq.value = 'O' then // casa pio
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
           else if qry_clienteslayout_Inteq.value = 'R' then // redesplan
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
           else if qry_clienteslayout_Inteq.value = 'C' then // eletro
           begin
            tipoDeArquivo := objLeituraDeArquivosRemessas.lerRemessaEletroCentral(linha); //'R';

           end
           else if (qry_clienteslayout_Inteq.value = '1') and (alltrim(linha) <> '') then // arruda contato
           begin

              if (copy(linha,1,7) = 'Unidade') or (tipoDeArquivo='PROP') or (tipoDeArquivo='RES') then // arquivo acordos
              begin


                  if copy(linha,1,7) = 'Unidade' then
                    ReadLn(fFile,linha);

                  if copy(linha,1,4) = ';;;;' then
                    tipoDeArquivo := 'FIM'
                  else
                  begin

                    arLinha:=split(linha,';');
                    if (copy(arLinha[2],1,1)='P') then
                      tipoDeArquivo := 'PROP'
                    else if (copy(arLinha[2],1,1)='R') and (tipoDeArquivo = '') then
                      tipoDeArquivo := 'RES';

                    if ( tipoDeArquivo = 'RES' ) or (tipoDeArquivo = 'PROP') then
                      objLeituraDeArquivosRemessas.lerRemessaArrudaContato(linha, tipoDeArquivo );
                  end;

              end


              else
              begin

                if (urotinas.SoNumero(copy(linha,1, 2) )) and (( pos('-',linha)>0 ) and (pos('-',linha)<15) ) then
                begin
                    if (codigoDevedor='' ) or (codigoDevedor<> alltrim(copy(linha,1,pos( '-',linha)-1 )) ) then
                    begin
                      codigoDevedor:=alltrim(copy(linha,1,pos( '-',linha) -1));
                      vencimento := '';
                      competencia:='';
                    end;
                end
                else if copy(linha,1,4) <> 'Venc' then
                begin


                  arLinha:=split(linha,';');

                  if (arLinha[0]<>'')  then
                  begin

                    vencimento := arLinha[0];
                    competencia:= arLinha[1];

                    objEstruturaTitulos.limparBuffer();
                    objEstruturaTitulos.vencimento := strToDate( vencimento );
                    objEstruturaTitulos.numeroTitulo := copy(alltrim(arLinha[3]),1,20);
                    objEstruturaTitulos.contrato :=  competencia;
                    objEstruturaTitulos.valor_principal := strToFloat(arLinha[4]);
                    objEstruturaTitulos.data_inclusao := date;
                    objEstruturaTitulos.atualizar:='S';

                    tipoDeArquivo := 'DIV_PROP';

                  end
                  else if (vencimento<>'') and (codigoDevedor<>'') and (copy(linha,1,7) <> ';;;;;;;') then
                  begin

                      // taxas do vencimento
                      objEstruturaTitulos.limparBuffer();
                      objEstruturaTitulos.vencimento := strToDate( vencimento ) ;//strToDate( copy(vencimento,1,6)+'20'+copy(vencimento,7,2) );
                      objEstruturaTitulos.numeroTitulo := copy(alltrim(arLinha[3]),1,20);
                      objEstruturaTitulos.contrato :=  competencia;
                      objEstruturaTitulos.valor_principal:= strToFloat(arLinha[4]);
                      objEstruturaTitulos.data_inclusao := date;
                      objEstruturaTitulos.atualizar:='S';
                      tipoDeArquivo := 'DIV_PROP';


                  end;

                end;

              end;

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
              if objImportarRemessa.pesquisarTituloDoDevedor( objEstruturaTitulos.pk_cliente, objEstruturaTitulos.pk_devedor, objEstruturaTitulos.contrato, objEstruturaTitulos.numeroTitulo, objEstruturaTitulos.vencimento ) then
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
                Memo1.Lines.Add('<SEM CHAVE DEVEDOR> Linha: '+linha);
              end;


              // grava devedor
              if (erros = 0) and ( cb_gravar.Checked) then
                objImportarRemessa.gravarDadosDoDevedor(objEstruturaDevedor);


              // valida dados do titulo
              if objEstruturaTitulos.valor_principal = 0 then
              begin
                inc(erros);
                Memo1.Lines.Add('<SEM VALOR PRINCIPAL> Linha: '+linha);
              end;

              if objEstruturaTitulos.vencimento = 0 then
              begin
                inc(erros);
                Memo1.Lines.Add('<SEM VENCIMENTO> Linha: '+linha);
              end;

              if (erros = 0) and ( cb_gravar.Checked) then
                objImportarRemessa.gravarTitulosDoDevedor(objEstruturaTitulos);

            end { cgc/cpf e nome}
            else
            begin
              if objEstruturaDevedor.cgc_cpf = '' then
              begin
                inc(erros);
                Memo1.Lines.Add('<SEM CGC> Linha: '+linha);
              end;
            end; { cgc/cpf e nome}

          end
          else if tipoDeArquivo = 'DIV_PROP' then
          begin

            if codigoDevedor = '' then
            begin
                inc(erros);
                Memo1.Lines.Add(' ');
                Memo1.Lines.Add('<SEM CÓDIGO> Linha: '+linha);
            end
            else
            begin

              // identifica devedor
              if objImportarRemessa.pesquisarCodigoDevedorExato( qry_clientespk_cliente.value , codigoDevedor ) then
              begin
                objEstruturaTitulos.pk_devedor := objImportarRemessa.devedor.fieldByName('pk_devedor').Value;
                objEstruturaTitulos.pk_cliente := qry_clientespk_cliente.value ;

                if objImportarRemessa.pesquisarTituloDoDevedor( objEstruturaTitulos.pk_cliente, objEstruturaTitulos.pk_devedor, objEstruturaTitulos.contrato, objEstruturaTitulos.numeroTitulo, objEstruturaTitulos.vencimento ) then
                begin
                  inc(erros);
                  Memo1.Lines.Add(' ');
                  Memo1.Lines.Add('<TÍTULO JÁ EXISTE> Devedor: '+codigoDevedor+', Contrato: '+objEstruturaTitulos.contrato+
                  ', Número (20 caracteres): '+ objEstruturaTitulos.numeroTitulo+' , Vencimento:'+FormatDateTime('dd/mm/yyyy',objEstruturaTitulos.vencimento)+' => Linha: '+linha);
                end
                else
                begin
                  objEstruturaTitulos.pk_titulo := frotinas.Sequencial('titulos');
                  objEstruturaTitulos.inserir := true;
                  if ( cb_gravar.Checked) and (objEstruturaTitulos.valor_principal>0) then
                    objImportarRemessa.gravarTitulosDoDevedor(objEstruturaTitulos);

                end;

              end;

            end;


          end
          else if tipoDeArquivo = 'PROP' then
          begin


            if (objEstruturaDevedor.codigo = '' ) then
            begin
                inc(erros);
                Memo1.Lines.Add(' ');
                Memo1.Lines.Add('<SEM CÓDIGO> Linha: '+linha);
            end
            else
            begin

              // identifica devedor
              if objImportarRemessa.pesquisarCodigoDevedorExato( objEstruturaDevedor.pk_cliente , objEstruturaDevedor.codigo ) then
              begin
                objEstruturaDevedor.pk_devedor := objImportarRemessa.devedor.fieldByName('pk_devedor').Value;
                objEstruturaDevedor.pk_cliente := objEstruturaDevedor.pk_cliente ;
                objEstruturaDevedor.inserir := false;
              end
              else
              begin
                objEstruturaDevedor.pk_devedor := frotinas.Sequencial('devedores');
                objEstruturaDevedor.pk_cliente := objEstruturaDevedor.pk_cliente ;
                objEstruturaDevedor.inserir := true;
              end;


              // validação dos dados do devedor
              if objEstruturaDevedor.pk_devedor = 0 then
              begin
                inc(erros);
                Memo1.Lines.Add('');
                Memo1.Lines.Add('<SEM CHAVE DEVEDOR> Linha: '+linha);
              end
              else
              begin
                // grava devedor
                if ( cb_gravar.Checked) then
                  objImportarRemessa.gravarDadosDoDevedor(objEstruturaDevedor);
              end;

            end;

          // PROP
          end
          else if tipoDeArquivo = 'RES' then
          begin


            if (objEstruturaDevedor.codigo = '' ) then
            begin
                inc(erros);
                Memo1.Lines.Add(' ');
                Memo1.Lines.Add('<SEM CÓDIGO> Linha: '+linha);
            end
            else
            begin
               objEstruturaDevedor.inserir := false;
              // identifica devedor
              if objImportarRemessa.pesquisarCodigoDevedorExato( objEstruturaDevedor.pk_cliente , objEstruturaDevedor.codigo ) then
              begin
                objEstruturaDevedor.pk_devedor  := objImportarRemessa.devedor.fieldByName('pk_devedor').Value;

                // validação dos dados do devedor
                if objEstruturaDevedor.pk_devedor = 0 then
                begin
                  inc(erros);
                  Memo1.Lines.Add('');
                  Memo1.Lines.Add('<SEM CHAVE DEVEDOR> Linha: '+linha);
                end
                else
                begin
                  if ( cb_gravar.Checked) then
                    objImportarRemessa.gravarDadosDoInquilino(objEstruturaDevedor);
                end;

              end
              else
              begin
                inc(erros);
                Memo1.Lines.Add(' ');
                Memo1.Lines.Add('<UNIDADE NÃO LOCALIZADA> Linha: '+linha);
              end;

            end;

          // INQ
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
              found := objImportarPagamentos.pesquisarDevedor( qry_clientespk_cliente.value, objEstruturaPagamentos.cgc_cpf );
              if found then
              begin
                objEstruturaPagamentos.pk_devedor := objImportarPagamentos.devedor.fieldByName('pk_devedor').Value;
                nome := objImportarPagamentos.devedor.fieldByName('nome').Value;
              end
              else if objEstruturaPagamentos.codigo <> '' then
              begin
                found := objImportarPagamentos.pesquisarCodigoDevedor( qry_clientespk_cliente.value , objEstruturaPagamentos.codigo );
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


              Memo1.Lines.Add('Devedor: '+nome+' '+linha);



              {
               pagamento RedeSplan
              }

              if (qry_clienteslayout_Inteq.value = 'R') then
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



                if (podeBaixar) and (erros = 0) and ( cb_gravar.Checked)  then
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
                Memo1.Lines.Add('<SEM CGC> Linha: '+linha);
                continue;
              end;


              {Processo de pagamentos}

              // identifica devedor

              found := objImportarRetirada.pesquisarDevedorCGC( qry_clientespk_cliente.value, objEstruturaRetirada.cgc_cpf );

              if found then
              begin
                  objEstruturaRetirada.pk_devedor := objImportarRetirada.devedor.fieldByName('pk_devedor').Value;
              end
              else
              begin
                podeBaixar:=false;
                continue;
              end;

              Memo1.Lines.Add('Devedor: '+objImportarRetirada.devedor.fieldByName('nome').Value+' '+linha);

              if podeBaixar and (qry_clienteslayout_Inteq.value = 'R') then // redesplan
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
                Memo1.Lines.Add('<SEM CGC> Linha: '+linha);
                continue;
              end;


              {Processo de pagamentos}

              // identifica devedor

              found := objImportarRetirada.pesquisarDevedorCGC( qry_clientespk_cliente.value, objEstruturaRetirada.cgc_cpf );

              if found then
              begin
                  objEstruturaRetirada.pk_devedor := objImportarRetirada.devedor.fieldByName('pk_devedor').Value;
              end
              else
              begin
                podeBaixar:=false;
                continue;
              end;

              Memo1.Lines.Add('Devedor: '+objImportarRetirada.devedor.fieldByName('nome').Value+' '+linha);

              if podeBaixar and (qry_clienteslayout_Inteq.value = 'R') then // redesplan
              begin
                  objImportarRetirada.gravarRetirada(objEstruturaRetirada, DBEdit1.text,'');
              end;
            end;

            if objLeituraDeArquivosRemessas.errosArquivo <> '' then
            begin
              inc(erros);
              Memo1.Lines.Add(objLeituraDeArquivosRemessas.errosArquivo);
            end;

          end;

        except
          on E: Exception do
          begin
              Memo1.Lines.Add('');
              Memo1.Lines.Add('<ERRO DE ESTRUTURA DO ARQUIVO> Linha No. '+inttostr(conta)+'. Conteúdo da Linha: '+linha);
          end;
 
      end;


      if (erros = 0) and ( not cb_gravar.Checked) then
        memo1.Lines.Add('=> PRONTO PARA GRAVAR (Para gravar marque a opção de gravar e execute novamente.)')
      else if cb_gravar.Checked then
      begin
        memo1.Lines.Add('');
        memo1.Lines.Add('---------------------------------------------------------');
        memo1.Lines.Add(' Total de Linhas lidas: '+inttostr(total));
        memo1.Lines.Add(' Total gravados: '+inttostr(total - erros));
        memo1.Lines.Add(' Total erros: '+inttostr(erros));

        memo1.Lines.Add('---------------------------------------------------------');

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


procedure TFrm_Atualizar.lerArquivoInteq();
var F,fFile : TextFile;
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

  Memo1.Lines.Clear;
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

  frotinas.Qry_Livre.Close;
  frotinas.Qry_Livre.CommandText := 'select * from ocorrencias where nome=''98-Baixa Importada'' ';
  frotinas.Qry_Livre.open;
  if frotinas.Qry_Livre.recordCount=0 then
  begin
   frotinas.Qry_Livre.append;
   frotinas.Qry_Livre.fieldByName('pk_ocorr').value := frotinas.Sequencial('ocorrencias');
   frotinas.Qry_Livre.fieldByName('nome').value := '98-Baixa Importada';
   frotinas.Qry_Livre.post;
  end;
  ocorrBaixaImportada := frotinas.Qry_Livre.fieldByName('pk_ocorr').value;
  // ---



  linArq:=0;
  while linArq < memo_arquivos.Lines.Count do
  begin

    DBEdit1.text := memo_arquivos.Lines[linArq];

    if (DBEdit1.text <> '') and (length(DBEdit1.text)>10) then
    begin


      try
        AssignFile(fFile,DBEdit1.text);
      except
        on E: Exception do showmessage('ocorreu um erro ao abrir o arquivo '+DBEdit1.text+'#13'+E.Message);

      end;

      total:=0;
      conta:=1;
      erros:=0;
      qtd_clientes:=0;
      qtd_titulos_inc:=0;
      qtd_titulos_exc_pg:=0;
      qtd_titulos_exc_tr:=0;

      Memo1.Lines.Add('');
      Memo1.Lines.Add('');
      Memo1.Lines.Add(DBEdit1.text);
      Memo1.Lines.Add('------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');

      Gauge_atualizando.MinValue := 0;
      reset(fFile);
      while not eof(fFile) do
      begin
         lb_mens.caption := 'Checando arquivo ('+intToStr(total)+')';
         refresh;
         ReadLn(fFile,linha);

         try

         if ( copy(linha,1,2) = '00') then // header
         begin

           seqArq := copy(linha,101,3);
           qry_arqimportado.Close;
           qry_arqimportado.CommandText := 'select * from arq_importados where pk_cliente = '+lk_cliente.KeyValue+' and seq_arquivo='+seqArq;
           qry_arqimportado.open;
           if qry_arqimportado.recordCount>0 then
           begin
              //inc(erros);
              memo1.Lines.Add('O sequencial do arquivo ('+seqArq+') já foi importado em '+qry_arqimportado.fieldByName('data_importado').AsString)
           end;

           //if tb_cliente.FieldByName('cnpj').AsString <> copy(linha,15,14) then
           //begin
           //   inc(erros);
           //   memo1.Lines.Add('CNPJ do arquivo difere do CNPJ do cadastro do Cliente ('+copy(linha,15,14)+')')
           //end;
           if (copy(linha,54,1)<>'M') and (copy(linha,54,1)<>'R') and (copy(linha,54,1)<>'A') then
           begin
              inc(erros);
              memo1.Lines.Add('ERRO=> Arquivo não é de remessa ou retorno.')
           end;

           if (copy(linha,54,1)='A') then
              layoutAlteracaoValor:=true;


           qry_seqArq.close;
           qry_seqArq.Parameters.ParamByName('seq').value := copy(linha,101,3);
           qry_seqArq.open;
           if qry_seqArq.FieldByName('qtde').asinteger >0 then
           begin
              //inc(erros);
              memo1.Lines.Add('ERRO=> Sequencial do arquivo ('+copy(linha,101,3)+') já importado.')
           end;
         end;

         if ( regAnterior= '01' ) and (copy(linha,1,2) = '01') then
         begin
            inc(erros);
            memo1.Lines.Add('ERRO=> Após um registro do tipo 01, cadastro do cliente, deve seguir um registro do tipo 03 - titulos deste cliente. -> Linha '+inttostr(conta));
         end;
         regAnterior := copy(linha,1,2);

         if ( copy(linha,1,2) = '01') then // dados do devedor
         begin
            inc(qtd_clientes);
            cpf := copy(linha,4,14);
            //if (cpf = '00000000000000') or (cpf='              ') then //not urotinas.TestCpf( copy(linha,4,14) ) then
            //begin
            //  inc(erros);
            //  memo1.Lines.Add('CPF inválido ('+copy(linha,4,14)+'). '+copy(linha,80,40)+' -> Linha '+inttostr(conta));
            //end;
            cpf := copy(linha,4,14);
            if copy(cpf,1,3) = '000' then
              cpf := copy(cpf,4,11);

            qry_devedor.close;
            qry_devedor.Parameters.ParamByName('cpf').value := cpf;
            qry_devedor.Parameters.ParamByName('cliente').value := lk_cliente.KeyValue;
            qry_devedor.open;

            if qry_devedor.recordCount = 0 then
            begin
              if layoutAlteracaoValor then
              begin
                memo1.Lines.Add('ERRO=> Devedor não localizado -> linha '+inttostr(conta)+' cpf '+cpf);
                inc(erros);
              end;
            end;


         end;


         if ( copy(linha,1,2) = '03') then // Titulos
         begin


            if copy(linha,306,30) = '                              ' then
            begin
              //inc(erros);
              memo1.Lines.Add('ERRO=> Não informado os Telefones -> Linha '+inttostr(conta));
            end;
            if (copy(linha,251,8) = '        ') or (copy(linha,251,8) = '00000000') then
            begin
              //inc(erros);
              memo1.Lines.Add('ERRO=> Vencimento inválido -> linha '+inttostr(conta));
            end;

            if ( not layoutAlteracaoValor and ( (copy(linha,274,11) = '        ') or (copy(linha,274,11) = '00000000000')) )then
            begin
              //inc(erros);
              memo1.Lines.Add('ERRO=> Valor Principal inválido -> linha '+inttostr(conta));
            end;

            contrato := copy(linha,8,12); // Chave do contrato. Servirá para agrupar títulos de um mesmo contrato
            numeroTitulo:= copy(linha,44,20); // Número do título. Se o título for cheque representa o número do cheque
            chaveTitulo := copy(linha,20,12);


            qry_titulos.close;
            qry_titulos.SQL.Text := 'select * from titulos where numero_titulo='''+numeroTitulo+''' and chave_contrato='''+contrato+''' and chave_titulo='''+chaveTitulo+''' and pk_cliente='+lk_cliente.KeyValue;

            try
              qry_titulos.open;
              except
                showmessage('ERRO=> '+qry_titulos.SQL.Text);
              end;




            if copy(linha,3,1) = 'I' then
            begin

              inc(qtd_titulos_inc);
              if qry_titulos.recordCount > 0 then
              begin
                //inc(erros);
                memo1.Lines.Add('Título já incluido -> linha '+inttostr(conta)+' CPF='+cpf);
              end;

            end
            else
            begin

              podeBaixar := true;
              mensErro:='';
              if ( (qry_titulos.recordCount =0) and (qry_devedor.recordCount>0) ) then
              begin

                qry_titulos.close;
                qry_titulos.SQL.Text := 'select * from titulos where pk_cliente='+lk_cliente.KeyValue+' and (motivo_baixa is null or motivo_baixa='''') and pk_devedor='+qry_devedor.fieldByName('pk_devedor').asstring;
                qry_titulos.open;

                if ( qry_titulos.recordCount =0 ) then
                begin
                  mensErro:= 'Titulo não existe na base = '+chaveTitulo;
                  podeBaixar := false;
                end;

              end;

              if qry_devedor.recordCount=0 then
              begin
                memo1.Lines.Add('ERRO=> Título não é inclusão e Devedor não localizado -> linha '+inttostr(conta)+' cpf '+cpf);
                inc(erros);
              end;

              if (qry_titulos.fieldbyname('motivo_baixa').value <> Null) and (qry_titulos.fieldbyname('motivo_baixa').value <> '') then
              begin
                mensErro:= 'Titulo já baixado. ';
                podeBaixar := false;
              end;

              //principalRec := strtofloat(copy(linha,297,11))/100;
              //jurosRec     := strtofloat(copy(linha,308,11));
              //multaRec     := strtofloat(copy(linha,319,11));
              //valorRec     := principalRec + jurosRec + MultaRec;


              if not podeBaixar and not layoutAlteracaoValor then
              begin
                //inc(erros);
                memo1.Lines.Add('ERRO=> '+mensErro+' -> linha '+inttostr(conta));
                memo1.Lines.Add('  ->Contrato (8,12): '+contrato+' Número Título (44,20): '+numeroTitulo+' Chave Titulo (20,12): '+
                                chaveTitulo+' Devedor: '+qry_devedor.fieldByName('pk_devedor').asstring+' CPF '+qry_devedor.fieldByName('cgc_cpf').asstring);
              end;

              //if (copy(linha,4,2) <> 'PG') and (not layoutAlteracaoValor) and (qry_devedor.recordCount>0)  then
              //begin
              //  frotinas.Qry_Livre.close;
              //  frotinas.Qry_Livre.CommandText := 'select count(1) as tot from eventos where pk_devedor='+qry_devedor.FieldByName('pk_devedor').asstring+' and motivo is not null ';
              //  frotinas.Qry_Livre.open;
              //  if frotinas.Qry_Livre.fieldbyname('tot').value > 0 then
              //    memo1.Lines.Add('Alerta -> Devedor  '+qry_devedor.FieldByName('nome').asstring+' enviado com TR, porém com registro de acionamento');

              //end;

            end;

            if (copy(linha,3,1) = 'E') and (copy(linha,4,2) = 'PG') then
            begin
              inc(qtd_titulos_exc_pg);
            end;
            if (copy(linha,3,1) = 'E') and (copy(linha,4,2) = 'TR') then
            begin
              inc(qtd_titulos_exc_tr);
            end;
            if layoutAlteracaoValor then
              inc(qtd_titulos_alt);


         end;

         if ( copy(linha,1,2) = '99') then // trailler
         begin
            if strToInt( copy(linha,3,6) ) <> qtd_clientes then
            begin
              inc(erros);
              memo1.Lines.Add('ERRO=> Clientes: Calc.= '+intToStr(qtd_clientes)+' Arq. = '+copy(linha,3,6))
            end;
            if strToInt( copy(linha,9,6) ) <> (qtd_titulos_inc+ qtd_titulos_alt) then
            begin
              inc(erros);
              memo1.Lines.Add('ERRO=> Tit Incluídos: Calc.= '+intToStr(qtd_titulos_inc + qtd_titulos_alt)+' Arq. = '+copy(linha,9,6))
            end;
            if strToInt( copy(linha,15,6) ) <> qtd_titulos_exc_pg then
            begin
              inc(erros);
              memo1.Lines.Add('ERRO=> Tit Excluídos Pagto: Calc.= '+intToStr(qtd_titulos_exc_pg)+' Arq. = '+copy(linha,15,6))
            end;
            if strToInt( copy(linha,21,6) ) <> qtd_titulos_exc_tr then
            begin
              inc(erros);
              memo1.Lines.Add('ERRO=> Tit Excluídos Transf: Calc.= '+intToStr(qtd_titulos_exc_tr)+' Arq. = '+copy(linha,21,6))
            end;
         end;

        except
          memo1.Lines.Add('============= ERRO - CHECANDO ======== ');
          memo1.Lines.Add('linha => '+inttostr(conta)+' => '+linha );
        end;


         inc(conta);
         inc(total);
      end;

      lb_mens.caption := '';

      // Gravando //

      if ( erros>0 ) then
      begin
        //CloseFile(fFile);
        memo1.Lines.Add('************************************************************************************************************************************************************** ');
        memo1.Lines.Add('* NÃO FOI POSSÍVEL FAZER A CARGA. ERROS DETECTADOS '+inttostr(erros)+' ERROS. ');
        memo1.Lines.Add('* VERIFIQUE AS MENSAGENS DE ERROS ACIMA.');
        memo1.Lines.Add('************************************************************************************************************************************************************** ');

      end
      else
      begin
        memo1.Lines.Add('Total de Clientes: '+intToStr(qtd_clientes));
        memo1.Lines.Add('Títulos incluídos: '+intToStr(qtd_titulos_inc));
        memo1.Lines.Add('Títulos excluídos por Pgto: '+intToStr(qtd_titulos_exc_pg));
        memo1.Lines.Add('Títulos excluídos por Transf: '+intToStr(qtd_titulos_exc_tr));
        memo1.Lines.Add('Títulos alterados valores: '+intToStr(qtd_titulos_alt));
        memo1.Lines.Add('Pronto para importar...');

        if cb_gravar.Checked then
        begin

          lb_mens.caption := 'Gravando...';

          pk_devedores := 0;
          pk_titulos   := 0;

          if not layoutAlteracaoValor then
          begin
            tabelas.Open;
            tabelas.first;
            while not tabelas.eof do
            begin
              if tabelas.FieldByName('tabela').value = 'devedores' then
                 pk_devedores := tabelas.FieldByName('seq').asinteger + 1;
              if tabelas.FieldByName('tabela').value = 'titulos' then
                 pk_titulos := tabelas.FieldByName('seq').asinteger + 1;
              if tabelas.FieldByName('tabela').value = 'telefones' then
                 pk_telefones := tabelas.FieldByName('seq').asinteger + 1;
              tabelas.next;
            end;
          end;

          conta:=0;
          Gauge_atualizando.MinValue := 0;
          Gauge_atualizando.MaxValue := total;
          Gauge_atualizando.Visible := true;
          reset(fFile);
          while not eof(fFile) do
          begin
             ReadLn(fFile,linha);
             inc(conta);
             Gauge_atualizando.AddProgress(1);
             refresh;

             try

             if ( copy(linha,1,2) = '01') then // dados do devedor
             begin

              cpf := copy(linha,4,14);
              if copy(cpf,1,3) = '000' then
                cpf := copy(cpf,4,11);

              qry_devedor.close;
              qry_devedor.Parameters.ParamByName('cpf').value := cpf;
              qry_devedor.Parameters.ParamByName('cliente').value := lk_cliente.KeyValue;
              qry_devedor.open;
              if qry_devedor.RecordCount = 0 then
              begin

                if layoutAlteracaoValor then
                begin
                    memo1.Lines.Add('Devedor '+cpf+' não localizado ');
                end
                else
                begin
                  qry_devedor.append();
                  qry_devedor.FieldByName('pk_devedor').value := pk_devedores;
                  qry_devedor.FieldByName('cgc_cpf').value := cpf;
                  qry_devedor.FieldByName('nome').value := copy(linha,80,40);
                  qry_devedor.FieldByName('pk_cliente').value := lk_cliente.KeyValue;
                  qry_devedor.FieldByName('rg').value := copy(linha,18,20);
                  qry_devedor.FieldByName('orgao_rg').value := copy(linha,38,10);
                  qry_devedor.FieldByName('tipo_logradouro').value := copy(linha,128,10);
                  qry_devedor.FieldByName('logradouro').value := copy(linha,138,50);
                  qry_devedor.FieldByName('numero').value := copy(linha,188,8);
                  qry_devedor.FieldByName('bairro').value := copy(linha,196,25);
                  qry_devedor.FieldByName('cidade').value := copy(linha,221,25);
                  qry_devedor.FieldByName('uf').value := copy(linha,246,2);
                  qry_devedor.FieldByName('complemento').value := copy(linha,248,25);
                  qry_devedor.FieldByName('ponto_referencia').value := copy(linha,273,25);
                  qry_devedor.FieldByName('cep').value := copy(linha,298,8);
                  qry_devedor.FieldByName('trabalho_nome').value := copy(linha,336,30);
                  qry_devedor.FieldByName('trab_logradouro').value := copy(linha,366,10);
                  qry_devedor.FieldByName('trab_numero').value := copy(linha,426,8);
                  qry_devedor.FieldByName('trab_bairro').value := copy(linha,434,25);
                  qry_devedor.FieldByName('trab_cidade').value := copy(linha,459,25);
                  qry_devedor.FieldByName('trab_uf').value := copy(linha,484,2);
                  qry_devedor.FieldByName('trab_complemento').value := copy(linha,486,2);
                  qry_devedor.FieldByName('trab_ponto_refer').value := copy(linha,511,25);
                  qry_devedor.FieldByName('trab_cep').value := copy(linha,536,8);
                  qry_devedor.FieldByName('trab_fones').value := copy(linha,544,30);
                  qry_devedor.FieldByName('prim_ref_pessoal').value := copy(linha,594,30);
                  qry_devedor.FieldByName('prim_ref_pessoal_fones').value := copy(linha,624,30);

                  qry_devedor.FieldByName('seg_ref_pessoal').value := copy(linha,654,30);
                  qry_devedor.FieldByName('seg_ref_pessoal_fones').value := copy(linha,684,30);

                  qry_devedor.FieldByName('telefones').value := copy(linha,306,30);

                  qry_devedor.post();

                  telefones.close;
                  telefones.Parameters.ParamByName('devedor').value := pk_devedores;
                  telefones.open;

                  if trim(copy(linha,714,30)) <> '' then
                  begin
                    inc(pk_telefones);
                    telefones.append;
                    telefonesid.value := pk_telefones;
                    telefonespk_devedor.value := pk_devedores;
                    telefonestipo_fone.value:= 'Celular';
                    telefonesTelefone.Value := copy(linha,714,30);
                    telefones.post;
                  end;


                  if trim(qry_devedor.FieldByName('telefones').value) <> '' then
                  begin
                    inc(pk_telefones);
                    telefones.append;
                    telefonesid.value := pk_telefones;
                    telefonespk_devedor.value := pk_devedores;
                    telefonestipo_fone.value:= 'Residencial';
                    telefonesTelefone.Value := qry_devedor.FieldByName('telefones').value;
                    telefones.post;
                  end;

                  if trim(qry_devedor.FieldByName('trab_fones').value) <> '' then
                  begin
                    inc(pk_telefones);
                    telefones.append;
                    telefonesid.value := pk_telefones;
                    telefonespk_devedor.value := pk_devedores;
                    telefonestipo_fone.value:= 'Trabalho';
                    telefonesTelefone.Value := qry_devedor.FieldByName('trab_fones').value;
                    telefones.post;
                  end;

                  if trim(qry_devedor.FieldByName('prim_ref_pessoal_fones').value) <> '' then
                  begin
                    inc(pk_telefones);
                    telefones.append;
                    telefonesid.value := pk_telefones;
                    telefonespk_devedor.value := pk_devedores;
                    telefonestipo_fone.value:= '(RF1)'+qry_devedor.FieldByName('prim_ref_pessoal').value;
                    telefonesTelefone.Value := qry_devedor.FieldByName('prim_ref_pessoal_fones').value;
                    telefones.post;
                  end;

                  if trim(qry_devedor.FieldByName('seg_ref_pessoal_fones').value) <> '' then
                  begin
                    inc(pk_telefones);
                    telefones.append;
                    telefonesid.value := pk_telefones;
                    telefonespk_devedor.value := pk_devedores;
                    telefonestipo_fone.value:= '(RF2)'+qry_devedor.FieldByName('seg_ref_pessoal').value;
                    telefonesTelefone.Value := qry_devedor.FieldByName('seg_ref_pessoal_fones').value;
                    telefones.post;
                  end;

                end;
                inc(pk_devedores);

              end;
              //else
              //  memo1.Lines.Add('Devedor já cadastrado = '+copy(linha,4,14));


             end
             else if ( copy(linha,1,2) = '03') then // titulos
             begin

              //contrato := copy(linha,8,12);
              //numeroTitulo:= copy(linha,44,20);
              chaveTitulo := IntToStr( urotinas.ValInt ( copy(linha,20,12) ));
              tipoTitulo  := copy(linha,6,2);

              sql := 'select * from titulos where '+
                 ' tipo_titulo='''+tipoTitulo+''' and pk_cliente='+
                 lk_cliente.KeyValue+' and pk_devedor='+qry_devedor.fieldByName('pk_devedor').asstring+' and (motivo_baixa is null or motivo_baixa='''')';

              if ( tipoTitulo <> 'FT' ) and (tipoTitulo <> 'FC') then
              begin
                sql := sql + ' and chave_titulo='+chaveTitulo;
              end;


              qry_titulos.close;
              qry_titulos.SQL.Text := sql;
              try
                qry_titulos.open;
              except
                  memo1.Lines.Add('------------------------------------');
                  memo1.Lines.Add('sql = '+sql+' conta '+intTostr(conta));
                  memo1.Lines.Add('------------------------------------');
              end;

              if copy( linha,3,1) = 'I' then // inclusão
              begin

                if (tipoTitulo <> 'FT') and (tipoTitulo <> 'FC') and (qry_titulos.recordCount >0 ) then
                  memo1.Lines.Add('Titulo já incluido = '+chaveTitulo+' CPF= '+cpf)
                else
                begin

                  inc(qtd_titulos_inc);
                  if ((tipoTitulo = 'FT') or (tipoTitulo = 'FC')) and (qry_titulos.recordCount >0) then
                  begin
                    qry_titulos.edit;
                  end
                  else
                  begin
                    qry_titulos.append;
                    qry_titulos.fieldbyname('pk_titulo').value := pk_titulos;
                    qry_titulos.fieldbyname('pk_devedor').value := qry_devedor.FieldByName('pk_devedor').value;
                  end;

                  qry_titulos.fieldbyname('pk_cliente').value := lk_cliente.KeyValue;
                  qry_titulos.fieldbyname('chave_titulo').value := chaveTitulo;
                  qry_titulos.fieldbyname('tipo_titulo').value := copy(linha,6,2);
                  qry_titulos.fieldbyname('chave_contrato').value := copy(linha,8,12);
                  qry_titulos.fieldbyname('numero_titulo').value := copy(linha,44,20);
                  qry_titulos.fieldbyname('banco').value := copy(linha,64,3);
                  qry_titulos.fieldbyname('nome_banco').value := copy(linha,67,40);
                  qry_titulos.fieldbyname('agencia').value := copy(linha,107,7);
                  qry_titulos.fieldbyname('conta').value := copy(linha,107,7);
                  qry_titulos.fieldbyname('praca_cheque').value := copy(linha,124,25);
                  qry_titulos.fieldbyname('alinea_devol').value := copy(linha,149,2);
                  qry_titulos.fieldbyname('endossado_cpf').value := copy(linha,151,14);
                  qry_titulos.fieldbyname('endossado').value := copy(linha,154,40);
                  data := copy(linha,235,8);
                  qry_titulos.fieldbyname('EMISSAO').value := StrToDate( copy(data,1,2)+'/'+copy(data,3,2)+'/'+copy(data,5,4) );
                  data := copy(linha,243,8);
                  if data <> '        ' then // VENCICALC
                    qry_titulos.fieldbyname('VENC_ULT_EXTRATO').value := StrToDate( copy(data,1,2)+'/'+copy(data,3,2)+'/'+copy(data,5,4) );
                  data := copy(linha,251,8);
                  qry_titulos.fieldbyname('VENCIMENTO').value := StrToDate( copy(data,1,2)+'/'+copy(data,3,2)+'/'+copy(data,5,4) );
                  qry_titulos.fieldbyname('dias_atraso_remessa').value := copy(linha,259,4);


                  try
                    qry_titulos.fieldbyname('valor_titulo').value := strToFloat(copy(linha,263,11)) / 100;
                    qry_titulos.fieldbyname('valor_principal').value := strToFloat(copy(linha,263,11)) / 100;
                    qry_titulos.fieldbyname('pagamento_minimo').value := strtofloat(copy(linha,286,11))/100;
                  except
                    memo1.Lines.Add('============= ERRO ======== ');
                    memo1.Lines.Add('linha => '+inttostr(conta)+' => '+linha );

                  end;

                  qry_titulos.fieldbyname('seq_arq_inclusao').value := seqArq;
                  //qry_titulos.fieldbyname('valor_avencer_remessa').value := copy(linha,285,11);


                  qry_titulos.fieldbyname('atualizar').value := 'Sim';

                  try
                    qry_titulos.post;
                  except
                      on E: Exception do showmessage('ERRO=> CH TITULO: '+intToStr(pk_titulos)+' CH DEVEDOR: '+qry_devedor.FieldByName('pk_devedor').asstring+' => '+'#13'+E.Message);
                  end;

                  inc(pk_titulos);
                end;

              end
              else
              begin

                podeBaixar := true;
                if ( qry_titulos.recordCount =0 ) then
                begin

                  qry_titulos.close;
                  qry_titulos.SQL.Text := 'select * from titulos where pk_cliente='+lk_cliente.KeyValue+' and (motivo_baixa is null or motivo_baixa='''')and pk_devedor='+qry_devedor.fieldByName('pk_devedor').asstring;
                  qry_titulos.open;

                  if ( qry_titulos.recordCount =0 ) then
                  begin
                    memo1.Lines.Add('Titulo não Alterado (Não existe na base) = '+chaveTitulo);
                    podeBaixar := false;
                  end;

                end;

                if podeBaixar then
                begin

                  if layoutAlteracaoValor then
                  begin
                    chaveTitulo := copy(linha,20,12);



                    qry_evento.Close;
                    qry_evento.open;

                    qry_evento.append;
                    qry_eventochave.value := frotinas.Sequencial('eventos');
                    qry_eventopk_devedor.value := qry_devedor.FieldByName('pk_devedor').value;;
                    qry_eventopk_cliente.value := qry_devedor.FieldByName('pk_cliente').value;;
                    qry_eventoData.value :=  Date;
                    qry_eventoHora.value := FormatDateTime( 'hh:mm:ss', time);
                    qry_eventomotivo.value := ocorrAtualiz;
                    qry_eventoTexto.Value := 'Atualização de Fatura - Dados Anteriores - Chave Tit: '+chaveTitulo+' Ult Atu Extrato: '+
                                             FormatDateTime( 'DD/MM/YYYY',qry_titulos.fieldByName('VENC_ULT_EXTRATO').value)+' Vencimento: '+
                                             FormatDateTime( 'DD/MM/YYYY',qry_titulos.fieldByName('VENCIMENTO').value)+ ' Valor Fatura: '+
                                             qry_titulos.fieldByName('valor_titulo').asstring+'#13'+' Fatura Atualizada: Venc Extrato '+copy(data,1,2)+'/'+copy(data,3,2)+'/'+copy(data,5,4)+
                                             ' Valor Atualizado: '+copy(linha,263,11) ;
                    qry_evento.post;

                    data := copy(linha,243,8);
                    qry_titulos.edit;
                    qry_titulos.fieldByName('VENC_ULT_EXTRATO').value := StrToDate( copy(data,1,2)+'/'+copy(data,3,2)+'/'+copy(data,5,4) );
                    qry_titulos.fieldByName('valor_titulo').value := strToFloat(copy(linha,263,11)) / 100;
                    qry_titulos.fieldByName('valor_principal').value := strToFloat(copy(linha,263,11)) / 100;
                    qry_titulos.fieldByName('pagamento_minimo').value := strToFloat(copy(linha,296,11)) / 100;
                    data := copy(linha,251,8);
                    // vencimento não deve ser atualizado
                    // apenas o venc_ult_extrato, pq a correção é sobre esse campo
                    //qry_titulos.fieldbyname('VENCIMENTO').value := StrToDate( copy(data,1,2)+'/'+copy(data,3,2)+'/'+copy(data,5,4) );
                    qry_titulos.post;
                    qry_evento.Close;
                    qry_evento.open;


                  end
                  else
                  begin
                    inconsistencia := '';
                    motivoBaixa := copy(linha,4,2);
                    //if motivoBaixa <> 'PG' then
                    //begin
                    //  frotinas.Qry_Livre.close;
                    //  frotinas.Qry_Livre.CommandText := 'select count(1) as tot from eventos where pk_devedor='+qry_devedor.FieldByName('pk_devedor').asstring+' and motivo is not null ';
                    //  frotinas.Qry_Livre.open;
                    //  if frotinas.Qry_Livre.fieldbyname('tot').value > 0 then
                    //  begin
                    //    inconsistencia := '( Cliente enviou TR mas devedor já foi acionado) ';
                    //    memo1.Lines.Add('Alerta -> Devedor  '+qry_devedor.FieldByName('nome').asstring+' enviado com TR, porém com registro de acionamento');
                    //  end;
                    //end;

                    if (qry_clientesbaixaTit_Carga.value = 'S') or (qry_clientesbaixaTit_Carga.value = 'B') then // baixa como retirada
                    begin
                      qry_titulos.edit;
                      qry_titulos.fieldbyname('motivo_baixa').value := copy(linha,4,2);
                      qry_titulos.fieldbyname('data_baixa').value := date;
                      qry_titulos.fieldbyname('seq_arq_baixa').value := seqArq;
                      qry_titulos.post;
                    end;

                    // -----------------------------------------------------------------------
                    if copy(linha,4,2) = 'PG' then
                    begin

                      historico := 'Importação de pagamento. '+inconsistencia;
                      // -- grava recibo
                      seq_tabelas.close;
                      seq_tabelas.Parameters.ParamByName('tab').value := 'recibos';
                      seq_tabelas.open;

                      seq_tabelas.edit;
                      seq_tabelasseq.Value := seq_tabelasseq.asInteger + 1;
                      seq_tabelas.post;
                      chave := seq_tabelasseq.Value;

                    end
                    else
                      historico := 'Cliente retirou o Devedor da assessoria ';

                    // grava eventos de baixa ou retirada
                    qry_evento.Close;
                    qry_evento.open;

                    qry_evento.append;
                    qry_eventochave.value := frotinas.Sequencial('eventos');
                    qry_eventopk_devedor.value := qry_devedor.FieldByName('pk_devedor').value;;
                    qry_eventopk_cliente.value := qry_devedor.FieldByName('pk_cliente').value;;
                    qry_eventoData.value :=  Date;
                    qry_eventoHora.value := FormatDateTime( 'hh:mm:ss', time);
                    qry_eventomotivo.value := ocorrBaixaImportada;
                    qry_eventoTexto.Value := historico;
                    qry_evento.post;



                  end;

                end;

              end;

             end;

            except
              memo1.Lines.Add('============= ERRO - GRAVANDO======== ');
              memo1.Lines.Add('linha => '+inttostr(conta)+' => '+linha );
            end;


          end;
          memo1.Lines.Add('Gravado com sucesso.');

          //CloseFile(fFile);

          if not layoutAlteracaoValor then
          begin
            tabelas.first;
            while not tabelas.eof do
            begin
              tabelas.edit;
              if tabelas.FieldByName('tabela').value = 'devedores' then
                 tabelas.FieldByName('seq').asinteger := pk_devedores;
              if tabelas.FieldByName('tabela').value = 'titulos' then
                 tabelas.FieldByName('seq').asinteger := pk_titulos;
              if tabelas.FieldByName('tabela').value = 'telefones' then
                 tabelas.FieldByName('seq').asinteger := pk_telefones;
              tabelas.post;
              tabelas.next;
            end;
          end;
          lb_mens.caption := 'Gravado com sucesso.';

        end;


      end;

      if (cb_gravar.Checked) and (erros = 0) and layoutAlteracaoValor then
      begin

        qry_arqimportado.Append();
        qry_arqimportado.fieldByName('pk_chave').value := frotinas.Sequencial('arq_importados');
        qry_arqimportado.fieldByName('pk_cliente').value := lk_cliente.KeyValue;
        qry_arqimportado.fieldByName('seq_arquivo').value := seqArq;
        qry_arqimportado.fieldByName('data_importado').value := date;
        qry_arqimportado.fieldByName('qtde_clientes').value := qtd_clientes;
        qry_arqimportado.fieldByName('qtde_titulos_inc').value := qtd_titulos_inc;
        qry_arqimportado.fieldByName('qtde_titulos_excl_pgt').value := qtd_titulos_exc_pg;
        qry_arqimportado.fieldByName('qtde_titulos_excl_ret').value := qtd_titulos_exc_tr;
        qry_arqimportado.post;

      end;

      if (erros = 0) and ( not cb_gravar.Checked) then
        memo1.Lines.Add('=> PRONTO PARA GRAVAR (Para gravar marque a opção de gravar e execute novamente.)');

    end;

    inc(linArq);

    CloseFile(fFile);

  end;

end;

procedure TFrm_Atualizar.sb_gravarConfClick(Sender: TObject);
begin

qry_clientes.Locate('pk_cliente', lk_cliente.KeyValue , []);
lb_status.caption := 'Checando...';

pn_mensagens.Left := 11;
pn_mensagens.Top  := 144;
pn_mensagens.Visible :=true;
refresh;


if (qry_clienteslayout_Inteq.value = 'I') then
  lerArquivoInteq()
else if qry_clienteslayout_Inteq.value = 'P' then // próprio
  lerArquivoPadrao()
else
  lerArquivo();
  //else if tb_clientelayout_Inteq.value = 'S' then // secrel
//  lerArquivoSecrel();

memo_arquivos.Clear;

end;

procedure TFrm_Atualizar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure TFrm_Atualizar.FormShow(Sender: TObject);
begin
tb_assessoria.Open;
qry_clientes.Open;

DBEdit1.text:= fRotinas.Param_String('PASTA_CARG');


end;

procedure TFrm_Atualizar.SpeedButton2Click(Sender: TObject);
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



                      {


                      //
                      // ESTE BLOCO ERA PARA NO CASO DE BAIXA POR PAGAMENTO, JÁ FAZER O ACORDO AUTOMÁTICO, MAS NÃO ACHEI MAIS
                      // INTERESSANTE PQ O ACORDO SÓ PODERÁ SER FEITO DIRETO NA INTERFACE MESMO, PQ DEPENDE DO VALOR RECEBIDO E DESCONTO
                      //

                      principalRec := strtofloat(copy(linha,297,11))/100;
                      jurosRec     := strtofloat(copy(linha,308,11));
                      multaRec     := strtofloat(copy(linha,319,11));
                      valorRec     := principalRec + jurosRec + MultaRec;

                      frotinas.cancelaReciboAnterior( qry_devedor.FieldByName('pk_devedor').asinteger );

                      recibos.append;
                      recibospk_recibo.value := chave;
                      recibospk_devedor.value := qry_devedor.FieldByName('pk_devedor').value;
                      recibospk_cliente.value := qry_devedor.FieldByName('pk_cliente').value;
                      recibosdata.value       := date;
                      reciboshora.value       := FormatDateTime( 'hh:mm:ss', time);
                      recibosusuario_cobrador.value := frotinas.usu_nu;
                      if valorRec>0 then
                      begin
                        recibosprincipal.value   := principalRec;
                        recibosjuros.value       := jurosRec;
                        recibosmulta.value       := multaRec;
                        recibosvalor_liquido.Value:= valorRec;
                      end
                      else
                      begin
                        recibosprincipal.value   := qry_titulos.fieldbyname('principal').value;
                        recibosvalor_liquido.Value:= qry_titulos.fieldbyname('principal').value;
                      end;
                      // calcula retenção

                      recibos.post;
                      qry_titulos.edit;
                      qry_titulos.fieldbyname('pk_recibo').value := recibospk_recibo.value;
                      qry_titulos.post;

                      }

procedure TFrm_Atualizar.sb_PesquisarArquivosClick(Sender: TObject);
var SearchRec: TSearchRec;
 i:integer;
 dbResult : word;

 pasta:string;
begin

  pn_mensagens.Visible :=false;


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
