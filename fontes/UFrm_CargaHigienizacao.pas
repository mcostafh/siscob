unit UFrm_CargaHigienizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls,  Gauges,  FileCtrl, Mask, DBCtrls,
  DB, ADODB, RxLookup, UEstruturasDeDadosParaImportacao, UDataSourcesDeImportacao, ULeituraDeArquivosRemessas;

type
  TFrm_CargaHigienizacao = class(TForm)
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
    tb_assessoria: TADOTable;
    qry_seqArq: TADOQuery;
    lb_mens: TLabel;
    qry_devedor: TADOQuery;
    tabelas: TADOTable;
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
    cb_gravar: TCheckBox;
    qry_arqimportado: TADODataSet;
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
    qry_eventopk_cliente: TIntegerField;
    telefonessms: TStringField;
    telefonesDDD: TStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure sb_PesquisarArquivosClick(Sender: TObject);
    procedure lerArquivo();
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
  Frm_CargaHigienizacao: TFrm_CargaHigienizacao;

implementation

uses UPrincipal, UDM, URotinas,Uqr_rels, uRecebimento;

{$R *.dfm}

procedure TFrm_CargaHigienizacao.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure TFrm_CargaHigienizacao.sb_PesquisarArquivosClick(Sender: TObject);
begin
OpenDialog1.InitialDir := 'C:\';
OpenDialog1.Execute;
DBEdit1.text := OpenDialog1.FileName;
memo_arquivos.Lines.Add(DBEdit1.text);

end;


procedure TFrm_CargaHigienizacao.lerArquivo();

var F,fFile : TextFile;
var linha, seqArq, data,regAnterior:string;
var conta,total,erros, pk_devedores, pk_titulos,pk_telefones,chave :integer;
var chaveTitulo,contrato, numeroTitulo : string;
var historico:string;
var principalRec, jurosRec,multaRec,valorRec : real;
var cpf:string;
var podeBaixar :boolean;
var mensErro, inconsistencia, motivoBaixa:string;
var linArq : integer;

var parte : TStringList;

var col : integer;

var contaCol: integer;
var campo:string;


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
      ReadLn(fFile,linha);

      while not eof(fFile) do
      begin

         lb_mens.caption := 'Checando arquivo ('+intToStr(total)+')';
         refresh;

         ReadLn(fFile,linha);

         if (linha <>'') and (linha <> '  ') then

           // -----------------------------
           // CPF|Ddd1|Telefone1|Ddd2|Telefone2|Ddd3|Telefone3|DDD_Celular1|Celular1

           parte.Clear;
           linha := StringReplace(linha, '||', '| |', [rfReplaceAll]);
           ExtractStrings(['|'],[], PChar(linha), parte);


           inc(conta);

           // CPF|Ddd1|Telefone1|Ddd2|Telefone2|Ddd3|Telefone3|DDD_Celular1|Celular1

           cpf := parte[0];
           cpf := urotinas.limpaFormatacao(cpf);

           qry_devedor.close;
           qry_devedor.Parameters.ParamByName('cpf').value := cpf;
           qry_devedor.Parameters.ParamByName('cliente').value := lk_cliente.KeyValue;
           qry_devedor.open;

           if qry_devedor.recordCount =0 then
           begin
              memo1.Lines.Add('ERRO=> Devedor n�o localizado -> linha '+inttostr(conta)+' Conte�do Linha: '+linha);
           end;

         end;

      end;

      lb_mens.caption := '';


      if ( erros>0 ) then
      begin
        //CloseFile(fFile);
        memo1.Lines.Add('************************************************************************************************************************************************************** ');
        memo1.Lines.Add('* N�O FOI POSS�VEL FAZER A CARGA. ERROS DETECTADOS '+inttostr(erros)+' ERROS. ');
        memo1.Lines.Add('* VERIFIQUE AS MENSAGENS DE ERROS ACIMA.');
        memo1.Lines.Add('************************************************************************************************************************************************************** ');

      end
      else
      begin

        memo1.Lines.Add('Total de Linhas: '+intToStr(conta));
        memo1.Lines.Add('Pronto para importar...');

        if cb_gravar.Checked then
        begin

          lb_mens.caption := 'Gravando...';

          tabelas.Open;
          tabelas.first;
          while not tabelas.eof do
          begin
            if tabelas.FieldByName('tabela').value = 'telefones' then
               pk_telefones := tabelas.FieldByName('seq').asinteger + 2;
            tabelas.next;
          end;


          conta:=0;
          Gauge_atualizando.MinValue := 0;
          Gauge_atualizando.MaxValue := total;
          Gauge_atualizando.Visible := true;

          memo1.Clear;

          reset(fFile);
          ReadLn(fFile,linha);

          while not eof(fFile) do
          begin

            ReadLn(fFile,linha);

            if (linha <>'') and (linha <> '  ') then
            begin
               // -----------------------------
               // CPF|Ddd1|Telefone1|Ddd2|Telefone2|Ddd3|Telefone3|DDD_Celular1|Celular1

               parte.Clear;
               linha := StringReplace(linha, '||', '|@|', [rfReplaceAll]);
               linha := StringReplace(linha, '||', '|@|', [rfReplaceAll]);
               linha := StringReplace(linha, '||', '|@|', [rfReplaceAll]);
               ExtractStrings(['|'],[], PChar(linha), parte);


               inc(conta);
               Gauge_atualizando.AddProgress(1);
               refresh;

               if ( alltrim(parte[0]) <> '@' )  then // cpf devedor
               begin

                cpf := parte[0];
                cpf := urotinas.limpaFormatacao(cpf);

                qry_devedor.close;
                qry_devedor.Parameters.ParamByName('cpf').value := cpf;
                qry_devedor.Parameters.ParamByName('cliente').value := lk_cliente.KeyValue;
                qry_devedor.open;

                pk_devedores := qry_devedor.FieldByName('pk_devedor').AsInteger;
                if qry_devedor.RecordCount > 0 then
                begin

                  memo1.Lines.Add('Importando telefones de '+qry_devedor.FieldByName('pk_devedor').asstring+' '+qry_devedor.FieldByName('nome').asstring);


                  telefones.close;
                  telefones.Parameters.ParamByName('devedor').value := pk_devedores;
                  telefones.open;

                  if (trim(parte[1]) <> '@') or (trim(parte[2]) <> '@') then // dd 1 telefone
                  begin
                    inc(pk_telefones);
                    telefones.append;
                    telefonesid.value := pk_telefones;
                    telefonespk_devedor.value := pk_devedores;
                    telefonestipo_fone.value:= 'Hig Tel';
                    telefonesDDD.value := parte[1];
                    telefonesTelefone.Value := parte[2];
                    telefones.post;
                  end;

                  if (trim(parte[3]) <> '@') or (trim(parte[4]) <> '@') then // dd 1 telefone
                  begin
                    inc(pk_telefones);
                    telefones.append;
                    telefonesid.value := pk_telefones;
                    telefonespk_devedor.value := pk_devedores;
                    telefonestipo_fone.value:= 'Hig Tel';
                    telefonesDDD.value := parte[3];
                    telefonesTelefone.Value := parte[4];
                    telefones.post;
                  end;

                  if (trim(parte[5]) <> '@') or (trim(parte[6]) <> '@') then // dd 1 telefone
                  begin
                    inc(pk_telefones);
                    telefones.append;
                    telefonesid.value := pk_telefones;
                    telefonespk_devedor.value := pk_devedores;
                    telefonestipo_fone.value:= 'Hig Tel';
                    telefonesDDD.value := parte[5];
                    telefonesTelefone.Value := parte[6];
                    telefones.post;
                  end;
                  if (trim(parte[7]) <> '@')  then // dd 1 telefone
                  begin
                    inc(pk_telefones);
                    telefones.append;
                    telefonesid.value := pk_telefones;
                    telefonespk_devedor.value := pk_devedores;
                    telefonestipo_fone.value:= 'Hig Cel';
                    telefonesDDD.value := parte[7];
                    telefonesTelefone.Value := parte[8];
                    telefones.post;
                  end;

                end;


               end;
            end;

          end;
          memo1.Lines.Add('Gravado com sucesso.');

          //CloseFile(fFile);

          tabelas.first;
          while not tabelas.eof do
          begin
            tabelas.edit;
            if tabelas.FieldByName('tabela').value = 'telefones' then
               tabelas.FieldByName('seq').asinteger := pk_telefones;
            tabelas.post;
            tabelas.next;
          end;

          lb_mens.caption := 'Gravado com sucesso.';

      end;

      if erros = 0 then
        memo1.Lines.Add('=> PRONTO PARA GRAVAR (Para gravar marque a op��o de gravar e execute novamente.)');

    end;

    inc(linArq);

    CloseFile(fFile);

  end;

end;



procedure TFrm_CargaHigienizacao.sb_gravarConfClick(Sender: TObject);
begin

tb_cliente.Locate('pk_cliente', lk_cliente.KeyValue , []);
lb_status.caption := 'Checando...';

  lerArquivo()

end;

procedure TFrm_CargaHigienizacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure TFrm_CargaHigienizacao.FormShow(Sender: TObject);
begin
tb_assessoria.Open;
tb_cliente.Open;
end;

procedure TFrm_CargaHigienizacao.SpeedButton2Click(Sender: TObject);
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
                      // ESTE BLOCO ERA PARA NO CASO DE BAIXA POR PAGAMENTO, J� FAZER O ACORDO AUTOM�TICO, MAS N�O ACHEI MAIS
                      // INTERESSANTE PQ O ACORDO S� PODER� SER FEITO DIRETO NA INTERFACE MESMO, PQ DEPENDE DO VALOR RECEBIDO E DESCONTO
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
                      // calcula reten��o

                      recibos.post;
                      qry_titulos.edit;
                      qry_titulos.fieldbyname('pk_recibo').value := recibospk_recibo.value;
                      qry_titulos.post;

                      }

end.
