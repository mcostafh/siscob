unit UDataSourcesDeImportacao;

interface

uses Classes, Db,ADODB, SysUtils,Variants,windows,IdBaseComponent,IdComponent,urotinas,UEstruturasDeDadosParaImportacao;

type

  ImportarRemessas = Class
    private

      _conexao            : TAdoConnection;
      _devedor            : TADODataSet;
      _telefonesDoDevedor : TADODataSet;
      _titulosDoDevedor   : TADODataSet;
      _eventos            : TADODataSet;
      _bxParciais         : TADODataSet;
      _acordos            : TADODataSet;
      _livre              : TADODataSet;
      _livre2             : TADODataSet;

      //function preencheTabelas(Tabela : TADOCommand; camposDaTabela: array of string; dadosDaTabela : array of string; nomeTabela:string; dataAlteracao:string ; horaAlteracao:string; nomeDaTabela:string) : string;

    public

      constructor Create(conexao : TAdoConnection);
      destructor Destroy();

      property conexao  : TAdoConnection read _conexao write _conexao;

      property devedor          : TADODataSet read _devedor write _devedor;
      property titulosDoDevedor : TADODataSet read _titulosDoDevedor write _titulosDoDevedor;
      property telefonesDoDevedor : TADODataSet read _telefonesDoDevedor write _telefonesDoDevedor;
      property eventos : TADODataSet read _eventos write _eventos;
      property bxParciais : TADODataSet read _bxParciais write _bxParciais;
      property acordos : TADODataSet read _acordos write _acordos;

      function pesquisarCodigoDevedor( cliente:integer; devedor:string ) : boolean;
      function pesquisarCodigoDevedorExato( cliente:integer; devedor:string ) : boolean;
      function pesquisarDevedor( cliente:integer; cpfDevedor:string ) : boolean;
      function pesquisarTelefoneDevedor( devedor:integer; telefone:string ) : boolean;
      function pesquisarTituloDoDevedor( cliente:integer; devedor:integer; contrato:string; numeroTitulo:string ; vencimento:TDatetime) : boolean;
      function gravarDadosDoDevedor( objEstruturaDevedor : EstruturaDevedor ) : boolean;
      function gravarDadosDoInquilino( objEstruturaDevedor : EstruturaDevedor ) : boolean;
      function gravarTelefonesDoDevedor( objEstruturaDevedor : EstruturaDevedor; tipo:string; numero:string; ddd:string) : boolean;
      function gravarTitulosDoDevedor( objEstruturaTitulos : EstruturaTitulos ) : boolean;

  end;


  ImportarPagamentos = Class
  private

      _conexao            : TAdoConnection;
      _titulosDoDevedor   : TADODataSet;
      _recibos            : TADODataSet;
      _bxParciais         : TADODataSet;
      _param              : TADODataSet;
      _taxas              : TADODataSet;
      _devedor            : TADODataSet;
      _livre              : TAdoDataSet;
      _livre2             : TAdoDataSet;
      _acordos            : TADODataSet;
      _tipoAtraso         : string;

    public

      constructor Create(conexao : TAdoConnection);
      destructor Destroy();

      property conexao  : TAdoConnection read _conexao write _conexao;

      property titulosDoDevedor : TADODataSet read _titulosDoDevedor write _titulosDoDevedor;
      property recibos : TADODataSet read _recibos write _recibos;
      property bxParciais : TADODataSet read _bxParciais write _bxParciais;
      property param : TADODataSet read _param write _param;
      property taxas : TADODataSet read _taxas write _taxas;
      property devedor : TADODataSet read _devedor write _devedor;
      property acordos : TADODataSet read _acordos write _acordos;
      property livre : TADODataSet read _livre write _livre;
      property livre2 : TADODataSet read _livre2 write _livre2;

      function gravarDadosDoPagamentoTotal( objEstruturaPagamentos : EstruturaPagamentos ) : boolean;
      function gravarPagamentoParcial( objEstruturaPagamentos : EstruturaPagamentos; arquivo:string ) : boolean;
      function gravarPagamentoPadrao( objEstruturaPagamentos : EstruturaPagamentos; arquivo:string ) : boolean;
      function gravarPagamentoPadraoNaoIdent( objEstruturaPagamentos : EstruturaPagamentos; arquivo:string ) : boolean;
      function calculaRetencaoBxParcialNaoIdent(objEstruturaPagamentos : EstruturaPagamentos ):EstruturaPagamentos;
      function pesquisarTituloDoDevedor( cliente:integer; devedor:integer; contrato:string; numeroTitulo:string ):boolean;
      function calculaRetencaoBxParcial(objEstruturaPagamentos : EstruturaPagamentos ):EstruturaPagamentos;
      function pesquisarCodigoDevedor( cliente:integer; devedor:string ) : boolean;
      function pesquisarDevedor( cliente:integer; cpfDevedor:string ) : boolean;

  end;


  ImportarAcordos = Class
    private

      _conexao            : TAdoConnection;
      _devedor            : TADODataSet;
      _acordos            : TADODataSet;

    public

      constructor Create(conexao : TAdoConnection);
      destructor Destroy();

      property conexao  : TAdoConnection read _conexao write _conexao;

      property devedor : TADODataSet read _devedor write _devedor;
      property acordos : TADODataSet read _acordos write _acordos;

      function gravarAcordo( objEstruturaAcordos : EstruturaAcordos ; arquivo:string) : boolean;
      function pesquisarDevedorCGC( cliente:integer; devedor:string ) : boolean;

  end;


  ImportarRetirada = Class
    private

      _conexao            : TAdoConnection;
      _devedor            : TADODataSet;
      _titulos            : TADODataSet;
      _eventos            : TADODataSet;

    public

      constructor Create(conexao : TAdoConnection);
      destructor Destroy();

      property conexao  : TAdoConnection read _conexao write _conexao;

      property devedor : TADODataSet read _devedor write _devedor;
      property titulos : TADODataSet read _titulos write _titulos;
      property eventos : TADODataSet read _eventos write _eventos;

      function gravarRetirada( objEstruturaRetirada : EstruturaRetirada ; arquivo:string; motivo : string) : boolean;
      function gravarRetiradaTitulo( objEstruturaRetirada : EstruturaRetirada ; arquivo:string; motivo : string) : boolean;
      function pesquisarDevedorCGC( cliente:integer; devedor:string ) : boolean;

  end;





implementation

constructor ImportarRemessas.Create(conexao : TAdoConnection);
begin
  _conexao := conexao;

  devedor            := TADODataSet.Create(nil);
  devedor.Connection := Conexao;
  telefonesDoDevedor := TADODataSet.Create(nil);
  telefonesDoDevedor.Connection := Conexao;
  titulosDoDevedor   := TADODataSet.Create(nil);
  titulosDoDevedor.Connection := Conexao;
  eventos            := TADODataSet.Create(nil);
  eventos.Connection := Conexao;

end;

destructor ImportarRemessas.destroy();
begin
  devedor.free;
  telefonesDoDevedor.free;
  titulosDoDevedor.free;
  eventos.free;
end;


constructor ImportarAcordos.Create(conexao : TAdoConnection);
begin
  _conexao := conexao;

  devedor            := TADODataSet.Create(nil);
  devedor.Connection := Conexao;

  acordos            := TADODataSet.Create(nil);
  acordos.Connection := Conexao;


end;

destructor ImportarAcordos.destroy();
begin
  devedor.free;
  acordos.free;
end;

function ImportarAcordos.pesquisarDevedorCGC( cliente:integer; devedor:string ) : boolean;
begin

  _devedor.close;
  _devedor.commandText := 'select pk_devedor,pk_cliente, nome, codigo_no_cliente, motivo_dialogo,data_dialogo, pk_cobrador,Agendado_Data, Agendado_tipo,Agendado_hora  from devedores where cgc_cpf ='''+devedor+''''+
                                    ' and pk_cliente='+intToStr(cliente);

  _devedor.open;
  result := _devedor.recordCount>0;



end;

function ImportarAcordos.gravarAcordo( objEstruturaAcordos : EstruturaAcordos ; arquivo: string ) : boolean;
var hoje:TDateTime;
var valor_ret:real ;
var atraso,chaveOcorr:integer;
var conta:integer;
var prxVenc, ultVenc:TdateTime;
begin

  hoje := date;

  if (objEstruturaAcordos.valor_entrada>0) and (pesquisarDevedorCGC(objEstruturaAcordos.pk_cliente, objEstruturaAcordos.cgc_cpf)) then
  begin

    _acordos.close;
    _acordos.CommandText := 'select * from parcelas_acordo where pagamento is null and pk_cliente='+inttostr(objEstruturaAcordos.pk_cliente)+
    ' and pk_devedor='+intToStr(_devedor.fieldByName('pk_devedor').value) +
    ' and data_acordo = '''+FormatDateTime( frotinas.formato_data_banco(),objEstruturaAcordos.data_acordo)+''''+
    ' order by vencimento';
    _acordos.open;

    // todo: verificar se vencimento j� existe
//    if not _acordos.locate('data_acordo',   FormatDateTime( frotinas.formato_data_banco(),objEstruturaAcordos.data_acordo),[]) then
    if _acordos.recordCount=0 then
    begin

      _acordos.append;
      _acordos.fieldByName('numero').value := '1';
      _acordos.fieldByName('pk_parcela').value := frotinas.Sequencial('parcelas_acordo');


      _acordos.fieldByName('pk_cliente').value   := objEstruturaAcordos.pk_cliente;
      _acordos.fieldByName('pk_devedor').value   := _devedor.fieldByName('pk_devedor').value;
      _acordos.fieldByName('tipo_acordo').value   := 'E';  // entrada
      _acordos.fieldByName('data_acordo').value   := objEstruturaAcordos.data_acordo;
      _acordos.fieldByName('valor_acordo').value   := objEstruturaAcordos.total_acordo;

      if objEstruturaAcordos.qtde_parcelas = 0 then // acordo a vista, ent�o a data venc estar chegando correta no arquivo
        _acordos.fieldByName('vencimento').value   := objEstruturaAcordos.data_entrada
      else //  acordo com mais de uma parcela, a data venc estar errada no arquivo, ent�o pega a pr�pria data do acordo
        _acordos.fieldByName('vencimento').value   := objEstruturaAcordos.data_acordo; //objEstruturaAcordos.data_entrada;


      _acordos.fieldByName('valor_parcela').value   := objEstruturaAcordos.valor_entrada;

      _acordos.fieldByName('pk_cobrador').value   := _devedor.fieldbyname('pk_cobrador').value;

      _acordos.fieldByName('observacao').value   := 'Arquivo: '+arquivo+' Linha: '+objEstruturaAcordos.linha;

      _acordos.post;

      conta:=1;
      //ultVenc := objEstruturaAcordos.data_entrada ;
      prxvenc := objEstruturaAcordos.data_entrada ;


      while conta<= objEstruturaAcordos.qtde_parcelas do
      begin

        _acordos.append;
        _acordos.fieldByName('pk_parcela').value := frotinas.Sequencial('parcelas_acordo');

        _acordos.fieldByName('numero').value := '1/'+intToStr(conta);
        _acordos.fieldByName('pk_cliente').value   := objEstruturaAcordos.pk_cliente;
        _acordos.fieldByName('pk_devedor').value   := _devedor.fieldByName('pk_devedor').value;
        _acordos.fieldByName('tipo_acordo').value   := 'P';
        _acordos.fieldByName('data_acordo').value   := objEstruturaAcordos.data_acordo;
        _acordos.fieldByName('valor_acordo').value   := objEstruturaAcordos.total_acordo;


        _acordos.fieldByName('vencimento').value   := prxvenc;
        _acordos.fieldByName('valor_parcela').value   := objEstruturaAcordos.valor_parcela;
        _acordos.fieldByName('pk_cobrador').value   := _devedor.fieldbyname('pk_cobrador').value;

        _acordos.post;

        prxvenc := urotinas.proximoVenc( prxvenc, urotinas.Day(prxvenc) );

        inc(conta);
      end;

    end;

  end;


end;



constructor ImportarRetirada.Create(conexao : TAdoConnection);
begin
  _conexao := conexao;

  devedor            := TADODataSet.Create(nil);
  devedor.Connection := Conexao;

  titulos            := TADODataSet.Create(nil);
  titulos.Connection := Conexao;

  eventos            := TADODataSet.Create(nil);
  eventos.Connection := Conexao;


end;

destructor ImportarRetirada.destroy();
begin
  devedor.free;
  titulos.free;
end;

function ImportarRetirada.pesquisarDevedorCGC( cliente:integer; devedor:string ) : boolean;
begin

  _devedor.close;
  _devedor.commandText := 'select pk_devedor, nome, codigo_no_cliente, motivo_dialogo,data_dialogo, pk_cobrador,Agendado_Data, Agendado_tipo,Agendado_hora  from devedores where cgc_cpf ='''+devedor+''''+
                                    ' and pk_cliente='+intToStr(cliente);

  _devedor.open;
  result := _devedor.recordCount>0;



end;

function ImportarRetirada.gravarRetirada( objEstruturaRetirada : EstruturaRetirada ; arquivo: string; motivo :string ) : boolean;
var hoje:TDateTime;
var valor_ret:real ;
var atraso,chaveOcorr:integer;
var conta:integer;
var prxVenc, ultVenc:TdateTime;
begin

  hoje := date;

  if (objEstruturaRetirada.pk_devedor>0) and (pesquisarDevedorCGC(objEstruturaRetirada.pk_cliente, objEstruturaRetirada.cgc_cpf)) then
  begin


    _titulos.close;
    _titulos.CommandText := 'select motivo_baixa,data_baixa from titulos where (motivo_baixa='''' or motivo_baixa is null ) and pk_cliente='+IntToStr(objEstruturaRetirada.pk_cliente)+' and pk_devedor='+IntToStr(objEstruturaRetirada.pk_devedor);
    _titulos.open;


    while not _titulos.eof do
    begin
      _titulos.edit;
      _titulos.fieldByName('motivo_baixa').value := 'TR';
      _titulos.fieldByName('data_baixa').value := objEstruturaRetirada.data_retirada;
      _titulos.post;
      _titulos.next;
    end;

    if motivo <> '' then
    begin

      frotinas.Qry_Livre.Close;
      frotinas.Qry_Livre.CommandText := 'select * from ocorrencias where nome=''99-Atualiza��o D�vida'' ';
      frotinas.Qry_Livre.open;

      if frotinas.Qry_Livre.recordCount>0 then
      begin

        chaveOcorr := frotinas.Qry_Livre.fieldByName('pk_ocorr').value;

        eventos.Close;
        eventos.commandText := 'select * from eventos where 1=2';
        eventos.open;

        eventos.append;
        eventos.FieldByName('chave').value := frotinas.Sequencial('eventos');
        eventos.FieldByName('pk_cliente').value := objEstruturaRetirada.pk_cliente;
        eventos.FieldByName('pk_devedor').value := objEstruturaRetirada.pk_devedor;
        eventos.FieldByName('Data').value :=  Date;
        eventos.FieldByName('Hora').value := FormatDateTime( 'hh:mm:ss', time);
        eventos.FieldByName('motivo').value := chaveOcorr;
        eventos.FieldByName('Texto').value := motivo ;
        eventos.post;

      end;

    end;
  end;


end;

function ImportarRetirada.gravarRetiradaTitulo( objEstruturaRetirada : EstruturaRetirada ; arquivo: string; motivo :string ) : boolean;
var hoje:TDateTime;
var valor_ret:real ;
var atraso,chaveOcorr:integer;
var conta:integer;
var prxVenc, ultVenc:TdateTime;
begin

  hoje := date;

  if (objEstruturaRetirada.pk_devedor>0) and (pesquisarDevedorCGC(objEstruturaRetirada.pk_cliente, objEstruturaRetirada.cgc_cpf)) then
  begin



    _titulos.close;
    _titulos.CommandText := 'select motivo_baixa,data_baixa from titulos where (motivo_baixa='''' or motivo_baixa is null ) and pk_cliente='+
                               IntToStr(objEstruturaRetirada.pk_cliente)+' and pk_devedor='+IntToStr(objEstruturaRetirada.pk_devedor)+
                               ' and numero_titulo = '''+objEstruturaRetirada.numero_titulo+'''';
    urotinas.log(_titulos.CommandText ) ;
    _titulos.open;


    while not _titulos.eof do
    begin
      urotinas.log( FormatDateTime( 'DD/MM/YYYY',objEstruturaRetirada.data_retirada ))  ;
      _titulos.edit;
      _titulos.fieldByName('motivo_baixa').value := 'TR';
      _titulos.fieldByName('data_baixa').value := objEstruturaRetirada.data_retirada;
      _titulos.post;
      _titulos.next;
    end;

    if motivo <> '' then
    begin

      frotinas.Qry_Livre.Close;
      frotinas.Qry_Livre.CommandText := 'select * from ocorrencias where nome=''99-Atualiza��o D�vida'' ';
      frotinas.Qry_Livre.open;

      if frotinas.Qry_Livre.recordCount>0 then
      begin

        chaveOcorr := frotinas.Qry_Livre.fieldByName('pk_ocorr').value;

        eventos.Close;
        eventos.commandText := 'select * from eventos where 1=2';
        eventos.open;

        eventos.append;
        eventos.FieldByName('chave').value := frotinas.Sequencial('eventos');
        eventos.FieldByName('pk_cliente').value := objEstruturaRetirada.pk_cliente;
        eventos.FieldByName('pk_devedor').value := objEstruturaRetirada.pk_devedor;
        eventos.FieldByName('Data').value :=  Date;
        eventos.FieldByName('Hora').value := FormatDateTime( 'hh:mm:ss', time);
        eventos.FieldByName('motivo').value := chaveOcorr;
        eventos.FieldByName('Texto').value := motivo ;
        eventos.post;

      end;

    end;
  end;


end;


constructor ImportarPagamentos.Create(conexao : TAdoConnection);
begin
  _conexao := conexao;

  _tipoAtraso := '';

  livre            := TADODataSet.Create(nil);
  livre.Connection := Conexao;

  livre2            := TADODataSet.Create(nil);
  livre2.Connection := Conexao;


  titulosDoDevedor            := TADODataSet.Create(nil);
  titulosDoDevedor.Connection := Conexao;

  devedor            := TADODataSet.Create(nil);
  devedor.Connection := Conexao;

  bxParciais            := TADODataSet.Create(nil);
  bxParciais.Connection := Conexao;

  acordos            := TADODataSet.Create(nil);
  acordos.Connection := Conexao;


  recibos            := TADODataSet.Create(nil);
  recibos.Connection := Conexao;

  param            := TADODataSet.Create(nil);
  param.Connection := Conexao;

  taxas            := TADODataSet.Create(nil);
  taxas.Connection := Conexao;


end;

destructor ImportarPagamentos.destroy();
begin
  titulosDoDevedor.free;
  recibos.free;
  param.free;
end;

function ImportarPagamentos.pesquisarCodigoDevedor( cliente:integer; devedor:string ) : boolean;
begin

  _devedor.close;
  _devedor.commandText := 'select pk_devedor, nome, codigo_no_cliente, motivo_dialogo,data_dialogo,pk_cobrador,Agendado_Data, Agendado_tipo,Agendado_hora from devedores where codigo_no_cliente like ''%'+devedor+'%'''+
                                    ' and pk_cliente='+intToStr(cliente);

  _devedor.open;
  result := _devedor.recordCount>0;



end;

function ImportarPagamentos.pesquisarTituloDoDevedor( cliente:integer; devedor:integer; contrato:string; numeroTitulo:string ) : boolean;
begin

  result := false;
  if cliente >0 then
    result := true;
  if devedor>0 then
    result := true;
  if numeroTitulo<>'' then
    result := true;

  if result then
  begin
    _titulosDoDevedor.close;
    _titulosDoDevedor.commandText := 'select * from titulos where (motivo_baixa is null or motivo_baixa='''') and pk_recibo is null and numero_titulo like ''%'+numeroTitulo+'%'''+
                                                                            ' and pk_devedor='+intToStr(devedor)+' and chave_contrato = ''%'+contrato+'%''';

    _titulosDoDevedor.open;
    result := _titulosDoDevedor.recordCount > 0;
  end;


end;

function ImportarPagamentos.calculaRetencaoBxParcial(objEstruturaPagamentos : EstruturaPagamentos):EstruturaPagamentos;
var percRetencao,valorRetencao, valorPgto:real;
var formaRetencao:string;
var hoje,venc:TDateTime;

begin

  valorRetencao := 0;

  if _tipoAtraso = '' then
  begin
    livre.Close();
    livre.CommandText := 'select tipoatraso from clientes where pk_cliente= '+intToStr(objEstruturaPagamentos.pk_cliente);
    livre.open();
    if livre.fieldByName('tipoatraso').asstring = 'A' then
      _tipoatraso := 'A'
    else
      _tipoatraso := 'M';
  end;



  valorPgto := objEstruturaPagamentos.valor_pgto;

  _taxas.close;
  _taxas.CommandText := 'select * from taxas_clientes where pk_cliente='+IntToStr(objEstruturaPagamentos.pk_cliente);
  _taxas.open;


  if (_tipoatraso = 'A') and (_titulosDoDevedor.recordCount>0) then // atraso no titulo
  begin
    if _titulosDoDevedor.recordCount>0 then
      venc := _titulosDoDevedor.fieldByName('vencimento').value
    else
      venc := date;
  end
  else
  begin
    frotinas.Qry_Livre.Close;
    frotinas.Qry_Livre.CommandText := 'select min(vencimento) as vencimento, pk_devedor from titulos where (data_baixa is null or data_baixa='''') and vencimento is not null and pk_devedor='+ intToStr(objEstruturaPagamentos.pk_devedor)+' group by pk_devedor';
    urotinas.log('  SQL: '+frotinas.Qry_Livre.CommandText);
    frotinas.Qry_Livre.open;
    urotinas.log('setar vencimento');
    if frotinas.Qry_Livre.recordCount >0 then
      venc:= frotinas.Qry_Livre.FieldByName('vencimento').value;
  end;

  hoje := date;


  if objEstruturaPagamentos.pk_devedor >0 then
  begin

    urotinas.log('calcular atraso - ImportarPagamentos.calculaRetencaoBxParcial ');

    objEstruturaPagamentos.diasAtraso   := Trunc(hoje - venc);
    objEstruturaPagamentos.perc_retenc  := 0;
    objEstruturaPagamentos.valor_retenc := 0;
    
    urotinas.log('atraso '+inttostr(objEstruturaPagamentos.diasAtraso ));

    _taxas.First;

    while not _taxas.eof do
    begin
      urotinas.log(_taxas.fieldByName('faixa1').asstring+' '+_taxas.fieldByName('faixa2').asstring+' '+_taxas.fieldByName('perc_ret').asstring);
      if (objEstruturaPagamentos.diasAtraso >= _taxas.fieldByName('faixa1').AsInteger )
      and ( (_taxas.fieldByName('faixa2').AsInteger = 0) or (objEstruturaPagamentos.diasAtraso  <= _taxas.fieldByName('faixa2').AsInteger) ) then
      begin
        urotinas.log('atrsado maior faixa1 ');
        urotinas.log('calcular faixa 2'  );
        urotinas.log('pega perc ret '+ _taxas.fieldByName('perc_ret').asstring);
          objEstruturaPagamentos.perc_retenc := _taxas.fieldByName('perc_ret').AsFloat;
          objEstruturaPagamentos.forma_Retenc:= _taxas.fieldByName('forma_ret').asstring;
      end;
      _taxas.next;
    end;

    valorRetencao :=0;
    if (objEstruturaPagamentos.perc_retenc > 0) and (valorPgto>0) then
    begin
        urotinas.log('vai calcular reten��o');
        valorRetencao := valorPgto * (objEstruturaPagamentos.perc_retenc/100);
        objEstruturaPagamentos.valor_retenc := valorRetencao;
    end;

    urotinas.log('reten��o  '+floattostr(valorRetencao));

  end;
  urotinas.log('retornar');
  result := objEstruturaPagamentos;

end;


function ImportarPagamentos.calculaRetencaoBxParcialNaoIdent(objEstruturaPagamentos : EstruturaPagamentos):EstruturaPagamentos;
var percRetencao,valorRetencao, valorPgto:real;
var formaRetencao:string;
var hoje,venc:TDateTime;

begin

  valorRetencao := 0;

  _tipoatraso := 'M';



  valorPgto := objEstruturaPagamentos.valor_pgto;

  _taxas.close;
  _taxas.CommandText := 'select * from taxas_clientes where pk_cliente='+IntToStr(objEstruturaPagamentos.pk_cliente);
  _taxas.open;


  frotinas.Qry_Livre.Close;
  frotinas.Qry_Livre.CommandText := 'select min(vencimento) as vencimento, pk_devedor from titulos where vencimento is not null and pk_devedor='+ intToStr(objEstruturaPagamentos.pk_devedor)+' group by pk_devedor';
  urotinas.log('  SQL: '+frotinas.Qry_Livre.CommandText);
  frotinas.Qry_Livre.open;
  urotinas.log('setar vencimento');

  if frotinas.Qry_Livre.recordCount >0 then
    venc:= frotinas.Qry_Livre.FieldByName('vencimento').value;

  hoje := date;


  if objEstruturaPagamentos.pk_devedor >0 then
  begin

    urotinas.log('calcular atraso - ImportarPagamentos.calculaRetencaoBxParcial ');

    objEstruturaPagamentos.diasAtraso   := Trunc(hoje - venc);
    objEstruturaPagamentos.perc_retenc  := 0;
    objEstruturaPagamentos.valor_retenc := 0;
    
    urotinas.log('atraso '+inttostr(objEstruturaPagamentos.diasAtraso ));

    _taxas.First;

    while not _taxas.eof do
    begin
      urotinas.log(_taxas.fieldByName('faixa1').asstring+' '+_taxas.fieldByName('faixa2').asstring+' '+_taxas.fieldByName('perc_ret').asstring);
      if (objEstruturaPagamentos.diasAtraso >= _taxas.fieldByName('faixa1').AsInteger )
      and ( (_taxas.fieldByName('faixa2').AsInteger = 0) or (objEstruturaPagamentos.diasAtraso  <= _taxas.fieldByName('faixa2').AsInteger) ) then
      begin
        urotinas.log('atrsado maior faixa1 ');
        urotinas.log('calcular faixa 2'  );
        urotinas.log('pega perc ret '+ _taxas.fieldByName('perc_ret').asstring);
          objEstruturaPagamentos.perc_retenc := _taxas.fieldByName('perc_ret').AsFloat;
          objEstruturaPagamentos.forma_Retenc:= _taxas.fieldByName('forma_ret').asstring;
      end;
      _taxas.next;
    end;

    valorRetencao :=0;
    if (objEstruturaPagamentos.perc_retenc > 0) and (valorPgto>0) then
    begin
        urotinas.log('vai calcular reten��o');
        valorRetencao := valorPgto * (objEstruturaPagamentos.perc_retenc/100);
        objEstruturaPagamentos.valor_retenc := valorRetencao;
    end;

    urotinas.log('reten��o  '+floattostr(valorRetencao));

  end;
  urotinas.log('retornar');
  result := objEstruturaPagamentos;

end;




function ImportarPagamentos.gravarPagamentoParcial( objEstruturaPagamentos : EstruturaPagamentos; arquivo:string  ) : boolean;
var hoje,dtAgendar, dtAcordoPago:TDateTime;
var valor_ret:real ;
var atraso,chaveOcorr:integer;
var parte : TStringList;
var i:integer;

begin

  hoje := date;

  parte := TStringList.Create;

  parte.clear;
  ExtractStrings(['\'],[], PChar(arquivo), parte);

  arquivo := parte[parte.count-1];


  if objEstruturaPagamentos.valor_pgto>0 then
  begin


    //atraso := objEstruturaPagamentos.diasAtraso;
    urotinas.log('vai calcular reten�ao '+objEstruturaPagamentos.cgc_cpf);
    objEstruturaPagamentos := calculaRetencaoBxParcial(objEstruturaPagamentos );

    _bxParciais.close;
    _bxParciais.CommandText := 'select * from baixasparciais where pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor)+' and arquivo='''+arquivo+''''   ;
    _bxParciais.open;


    if (_bxParciais.recordCount=0) and (_devedor.recordCount>0) then
    begin

      _bxParciais.append;
      _bxParciais.fieldByName('pk_bxparcial').value := frotinas.Sequencial('baixasparciais');
      _bxParciais.fieldByName('pk_devedor').value   := objEstruturaPagamentos.pk_devedor;
      _bxParciais.fieldByName('data').value   := objEstruturaPagamentos.data_pgto;
      _bxParciais.fieldByName('historico').value   := 'Arquivo: '+arquivo;
      _bxParciais.fieldByName('valor').value   := objEstruturaPagamentos.valor_pgto;

      _bxParciais.fieldByName('arquivo').value   := arquivo;
      _bxParciais.fieldByName('taxa_retenc').value   := objEstruturaPagamentos.perc_retenc;
      _bxParciais.fieldByName('valor_retenc').value   := objEstruturaPagamentos.valor_retenc;
      _bxParciais.fieldByName('atraso').value   := objEstruturaPagamentos.diasAtraso;

      _bxParciais.post;

      {
      // descobre parametro com tipo de ocorrencia
      _param.close;
      _param.CommandText := 'select * from param where nome_param=''PAGOUPARC''';
      _Param.open;

      if (_param.recordCount>0) then
      begin
        chaveOcorr := _param.fieldByname('valor_param').asinteger;
        frotinas.gravaRealizouPGT( chaveOcorr, objEstruturaPagamentos.pk_devedor, 'Cr�ditos  R$ '+FloatToStr(objEstruturaPagamentos.valor_pgto), true);
      end;

      }


      {atualizar pgto na parcela}

      // verifica se � pagto entrada - sempre a entrada � gravada na mesma data do acordo
      _acordos.close;
      _acordos.CommandText := 'select * from parcelas_acordo where pagamento is null and pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor) +
        ' and tipo_acordo=''E'' and vencimento <= '''+FormatDateTime( frotinas.formato_data_banco(), objEstruturaPagamentos.data_pgto) +''' order by vencimento desc';
      _acordos.open;

      if _acordos.recordCount>0 then
      begin

        {mesmo que tenha mais de um acordo em aberto, o sistema vai pegar a parcela de entrada referente ao �ltimo acordo}
        _acordos.edit;
        _acordos.fieldByName('pagamento').value := objEstruturaPagamentos.data_pgto;
        _acordos.fieldByName('valor_pgto').value := objEstruturaPagamentos.valor_pgto;
        _acordos.post;

        {verifica se teve outro acordo anterior com tipo entrada e n�o teve pagamento}

        _acordos.next; { order DESC, vai para o acordo anterior e marca como quebra de acordo}
        if not _acordos.eof then
        begin
          _acordos.edit;
          _acordos.fieldByName('tipo_acordo').value := 'Q';
          _acordos.post;

          dtAcordoPago := _acordos.fieldByName('data_acordo').value;

          _acordos.close;
          _acordos.CommandText := 'select * from parcelas_acordo where pagamento is null and pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor) +
          ' and tipo_acordo=''P'' and data_acordo = '''+FormatDateTime( frotinas.formato_data_banco(), dtAcordoPago)+
          ''' order by vencimento ';
          _acordos.open;

          while not _acordos.eof do
          begin
            _acordos.edit;
            _acordos.fieldByName('tipo_acordo').value := 'Q';
            _acordos.post;

            _acordos.next;
          end;


        end;


      end
      else
      begin


        _acordos.close;
        _acordos.CommandText := 'select * from parcelas_acordo where pagamento is null and pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor) +
          ' and tipo_acordo=''P''  order by vencimento ';
        _acordos.open;

        if _acordos.recordCount > 0 then
        begin
          _acordos.edit;
          _acordos.fieldByName('pagamento').value := objEstruturaPagamentos.data_pgto;
          _acordos.fieldByName('valor_pgto').value := objEstruturaPagamentos.valor_pgto;
          _acordos.post;
        end;


      end;

      {realizar agendamento para a pr�xima parcela}

      _acordos.close;
      _acordos.CommandText := 'select * from parcelas_acordo where pagamento is null and pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor) +
        ' and tipo_acordo=''P'' and vencimento > '''+FormatDateTime( frotinas.formato_data_banco(), objEstruturaPagamentos.data_pgto) +''' order by vencimento';
      _acordos.open;

      if _acordos.recordCount>0 then
      begin
        dtAgendar := _acordos.fieldbyname('vencimento').value;

        dtAgendar := dtAgendar - 5;
        if DayOfWeek(dtAgendar) = 1 then // domingo
          dtAgendar := dtAgendar + 1
        else if DayOfWeek(dtAgendar) = 7 then // sabado
          dtAgendar := dtAgendar - 1;

        _devedor.Edit;
        _devedor.fieldbyname('Agendado_Data').Value := dtAgendar;
        _devedor.fieldbyname('Agendado_tipo').Value := '2';
        _devedor.fieldbyname('Agendado_hora').Value := '08:00';
        _devedor.fieldbyname('Agendado_cobrador').Value := _devedor.fieldbyname('pk_cobrador').Value ;
        _devedor.post;

      end;

      if objEstruturaPagamentos.saldo_divida <= 0 then // baixa - retirada
      begin


        _param.close;
        _param.CommandText := 'select * from param where nome_param=''PAGOU''';
        _Param.open;

        chaveOcorr := _param.fieldByname('valor_param').asinteger;
        frotinas.gravaRealizouPGT( chaveOcorr, objEstruturaPagamentos.pk_devedor, 'Retirada ', false);

        _titulosDoDevedor.close;
        _titulosDoDevedor.CommandText := 'select motivo_baixa,data_baixa from titulos where (motivo_baixa is null or motivo_baixa ='''') and pk_cliente='+IntToStr(objEstruturaPagamentos.pk_cliente)+' and pk_devedor='+IntToStr(objEstruturaPagamentos.pk_devedor);
        _titulosDoDevedor.open;


        while not _titulosDoDevedor.eof do
        begin
          _titulosDoDevedor.edit;
          _titulosDoDevedor.fieldByName('motivo_baixa').value := 'PG';
          _titulosDoDevedor.fieldByName('data_baixa').value := hoje;
          _titulosDoDevedor.post;
          _titulosDoDevedor.next;
        end;

      end;


    end;

  end;



end;

function ImportarPagamentos.gravarPagamentoPadrao( objEstruturaPagamentos : EstruturaPagamentos; arquivo:string  ) : boolean;
var hoje,dtAgendar, dtAcordoPago:TDateTime;
var valor_ret:real ;
var atraso,chaveOcorr:integer;
var parte : TStringList;
var i:integer;
var podeGravar:boolean;
var sql:string;
begin

  hoje := date;

  parte := TStringList.Create;

  parte.clear;
  ExtractStrings(['\'],[], PChar(arquivo), parte);

  arquivo := parte[parte.count-1];




  if objEstruturaPagamentos.valor_pgto>0 then
  begin

    _titulosDoDevedor.close;
    _titulosDoDevedor.commandText := 'select pk_titulo, motivo_baixa,data_baixa, vencimento from titulos where numero_titulo like ''%'+objEstruturaPagamentos.numero_Titulo+'%'''+
                                      ' and pk_cliente='+intToStr(objEstruturaPagamentos.pk_cliente)+
                                      ' and pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor);
    if objEstruturaPagamentos.contrato<>'' then
      _titulosDoDevedor.commandText :=  _titulosDoDevedor.commandText  + ' and chave_contrato like ''%'+objEstruturaPagamentos.contrato+'%''';

    _titulosDoDevedor.open;


    urotinas.log('calcular reten�ao '+objEstruturaPagamentos.cgc_cpf);

    objEstruturaPagamentos := calculaRetencaoBxParcial(objEstruturaPagamentos);

    _bxParciais.close;

    sql := 'select * from baixasparciais where pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor);

    if _titulosDoDevedor.recordCount>0 then
      sql := sql + ' and ( pk_titulo is null or pk_titulo='+_titulosDoDevedor.fieldByName('pk_titulo').asstring+') ' ;

    sql := sql + ' and data = '''+FormatDateTime(frotinas.formato_data_banco(),objEstruturaPagamentos.data_pgto)+'''';

    sql := sql + ' and valor ='+ StringReplace( FloatToStr(objEstruturaPagamentos.valor_pgto) , ',', '.', [rfReplaceAll])  ;


    _bxParciais.CommandText := sql;


    _bxParciais.open;


    if (_bxParciais.recordCount=0) and (_devedor.recordCount>0) and (_titulosDoDevedor.recordCount>0) then
    begin

      _bxParciais.append;
      _bxParciais.fieldByName('pk_bxparcial').value := frotinas.Sequencial('baixasparciais');
      _bxParciais.fieldByName('pk_devedor').value   := objEstruturaPagamentos.pk_devedor;

      if _titulosDoDevedor.recordCount>0 then
        _bxParciais.fieldByName('pk_titulo').value   := _titulosDoDevedor.fieldByName('pk_titulo').value;

      _bxParciais.fieldByName('data').value   := objEstruturaPagamentos.data_pgto;
      _bxParciais.fieldByName('historico').value   := 'Arquivo: '+arquivo+' N.Contrato: '+objEstruturaPagamentos.contrato+' N.Tit: '+objEstruturaPagamentos.numero_Titulo ;
      _bxParciais.fieldByName('valor').value   := objEstruturaPagamentos.valor_pgto;

      _bxParciais.fieldByName('arquivo').value   := arquivo;
      _bxParciais.fieldByName('taxa_retenc').value   := objEstruturaPagamentos.perc_retenc;
      _bxParciais.fieldByName('valor_retenc').value   := objEstruturaPagamentos.valor_retenc;
      _bxParciais.fieldByName('atraso').value   := objEstruturaPagamentos.diasAtraso;


      _bxParciais.post;

      {
      // descobre parametro com tipo de ocorrencia
      _param.close;
      _param.CommandText := 'select * from param where nome_param=''PAGOUPARC''';
      _Param.open;

      if (_param.recordCount>0) then
      begin
        chaveOcorr := _param.fieldByname('valor_param').asinteger;
        frotinas.gravaRealizouPGT( chaveOcorr, objEstruturaPagamentos.pk_devedor, 'Cr�ditos  R$ '+FloatToStr(objEstruturaPagamentos.valor_pgto), true);
      end;

      }


      {atualizar pgto na parcela}

      // verifica se � pagto entrada - sempre a entrada � gravada na mesma data do acordo
      _acordos.close;
      _acordos.CommandText := 'select * from parcelas_acordo where pagamento is null and pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor) +
        ' and tipo_acordo=''E'' and vencimento <= '''+FormatDateTime( frotinas.formato_data_banco(), objEstruturaPagamentos.data_pgto) +''' order by vencimento desc';
      _acordos.open;

      if _acordos.recordCount>0 then
      begin

        {mesmo que tenha mais de um acordo em aberto, o sistema vai pegar a parcela de entrada referente ao �ltimo acordo}
        _acordos.edit;
        _acordos.fieldByName('pagamento').value := objEstruturaPagamentos.data_pgto;
        _acordos.fieldByName('valor_pgto').value := objEstruturaPagamentos.valor_pgto;
        _acordos.post;

        {verifica se teve outro acordo anterior com tipo entrada e n�o teve pagamento}

        _acordos.next; { order DESC, vai para o acordo anterior e marca como quebra de acordo}
        if not _acordos.eof then
        begin
          _acordos.edit;
          _acordos.fieldByName('tipo_acordo').value := 'Q';
          _acordos.post;

          dtAcordoPago := _acordos.fieldByName('data_acordo').value;

          _acordos.close;
          _acordos.CommandText := 'select * from parcelas_acordo where pagamento is null and pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor) +
          ' and tipo_acordo=''P'' and data_acordo = '''+FormatDateTime( frotinas.formato_data_banco(), dtAcordoPago)+
          ''' order by vencimento ';
          _acordos.open;

          while not _acordos.eof do
          begin
            _acordos.edit;
            _acordos.fieldByName('tipo_acordo').value := 'Q';
            _acordos.post;

            _acordos.next;
          end;


        end;


      end
      else
      begin


        _acordos.close;
        _acordos.CommandText := 'select * from parcelas_acordo where pagamento is null and pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor) +
          ' and tipo_acordo=''P''  order by vencimento ';
        _acordos.open;

        if _acordos.recordCount > 0 then
        begin
          _acordos.edit;
          _acordos.fieldByName('pagamento').value := objEstruturaPagamentos.data_pgto;
          _acordos.fieldByName('valor_pgto').value := objEstruturaPagamentos.valor_pgto;
          _acordos.post;
        end;


      end;

      {realizar agendamento para a pr�xima parcela}

      _acordos.close;
      _acordos.CommandText := 'select * from parcelas_acordo where pagamento is null and pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor) +
        ' and tipo_acordo=''P'' and vencimento > '''+FormatDateTime( frotinas.formato_data_banco(), objEstruturaPagamentos.data_pgto) +''' order by vencimento';
      _acordos.open;

      if _acordos.recordCount>0 then
      begin
        dtAgendar := _acordos.fieldbyname('vencimento').value;

        dtAgendar := dtAgendar - 5;
        if DayOfWeek(dtAgendar) = 1 then // domingo
          dtAgendar := dtAgendar + 1
        else if DayOfWeek(dtAgendar) = 7 then // sabado
          dtAgendar := dtAgendar - 1;

        _devedor.Edit;
        _devedor.fieldbyname('Agendado_Data').Value := dtAgendar;
        _devedor.fieldbyname('Agendado_tipo').Value := '2';
        _devedor.fieldbyname('Agendado_hora').Value := '08:00';
        _devedor.fieldbyname('Agendado_cobrador').Value := _devedor.fieldbyname('pk_cobrador').Value ;
        _devedor.post;

      end;

      if objEstruturaPagamentos.saldo_divida <= 0 then // baixa - retirada
      begin


        _param.close;
        _param.CommandText := 'select * from param where nome_param=''PAGOU''';
        _Param.open;

        // 24/04/2016 - melhor nb�o gravar historico para n�o confundir
        //chaveOcorr := _param.fieldByname('valor_param').asinteger;
        //frotinas.gravaRealizouPGT( chaveOcorr, objEstruturaPagamentos.pk_devedor, 'Retirada ', false);

        _titulosDoDevedor.first;
        while not _titulosDoDevedor.eof do
        begin
          _titulosDoDevedor.edit;
          _titulosDoDevedor.fieldByName('motivo_baixa').value := 'PG';
          _titulosDoDevedor.fieldByName('data_baixa').value := objEstruturaPagamentos.data_pgto;
          _titulosDoDevedor.post;
          _titulosDoDevedor.next;
        end;

      end;


    end;

  end;



end;

function ImportarPagamentos.gravarPagamentoPadraoNaoIdent( objEstruturaPagamentos : EstruturaPagamentos; arquivo:string  ) : boolean;
var hoje,dtAgendar, dtAcordoPago:TDateTime;
var valor_ret:real ;
var atraso,chaveOcorr:integer;
var parte : TStringList;
var i:integer;
var podeGravar:boolean;
var sql,historico:string;
begin

  hoje := date;

  parte := TStringList.Create;

  parte.clear;
  ExtractStrings(['\'],[], PChar(arquivo), parte);

  arquivo := parte[parte.count-1];




  if objEstruturaPagamentos.valor_pgto>0 then
  begin

    _titulosDoDevedor.close;
    _titulosDoDevedor.commandText := 'select pk_titulo, motivo_baixa,data_baixa, vencimento from titulos where numero_titulo like ''%'+objEstruturaPagamentos.numero_Titulo+'%'''+
                                      ' and pk_cliente='+intToStr(objEstruturaPagamentos.pk_cliente)+
                                      ' and pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor);
    if objEstruturaPagamentos.contrato<>'' then
      _titulosDoDevedor.commandText :=  _titulosDoDevedor.commandText  + ' and chave_contrato like ''%'+objEstruturaPagamentos.contrato+'%''';

    _titulosDoDevedor.open;


    urotinas.log('calcular reten�ao '+objEstruturaPagamentos.cgc_cpf);


    _bxParciais.close;

    sql := 'select * from baixasparciais where pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor);

    if _titulosDoDevedor.recordCount>0 then
    begin
      objEstruturaPagamentos := calculaRetencaoBxParcial(objEstruturaPagamentos);
      sql := sql + ' and ( pk_titulo is null or pk_titulo='+_titulosDoDevedor.fieldByName('pk_titulo').asstring+') ' ;
    end
    else
    begin
      objEstruturaPagamentos := calculaRetencaoBxParcialNaoIdent(objEstruturaPagamentos);
      sql := sql + ' and pk_titulo is null ';
    end;

    historico := 'N.Tit: '+objEstruturaPagamentos.numero_Titulo;

    sql := sql + ' and data = '''+FormatDateTime(frotinas.formato_data_banco(),objEstruturaPagamentos.data_pgto)+'''';

    sql := sql + ' and valor ='+ StringReplace( FloatToStr(objEstruturaPagamentos.valor_pgto) , ',', '.', [rfReplaceAll])  ;

    sql := sql + ' and historico = '''+historico+'''' ;

    urotinas.log('SQL - pgto nindent: '+sql);

    _bxParciais.CommandText := sql;


    _bxParciais.open;


    if (_bxParciais.recordCount=0) and (_devedor.recordCount>0)  then
    begin

      _bxParciais.append;
      _bxParciais.fieldByName('pk_bxparcial').value := frotinas.Sequencial('baixasparciais');
      _bxParciais.fieldByName('pk_devedor').value   := objEstruturaPagamentos.pk_devedor;

      if _titulosDoDevedor.recordCount>0 then
        _bxParciais.fieldByName('pk_titulo').value   := _titulosDoDevedor.fieldByName('pk_titulo').value;

      _bxParciais.fieldByName('data').value   := objEstruturaPagamentos.data_pgto;
      _bxParciais.fieldByName('historico').value   := historico;
      _bxParciais.fieldByName('valor').value   := objEstruturaPagamentos.valor_pgto;

      _bxParciais.fieldByName('arquivo').value   := arquivo;
      _bxParciais.fieldByName('taxa_retenc').value   := objEstruturaPagamentos.perc_retenc;
      _bxParciais.fieldByName('valor_retenc').value   := objEstruturaPagamentos.valor_retenc;
      _bxParciais.fieldByName('atraso').value   := objEstruturaPagamentos.diasAtraso;


      _bxParciais.post;

      {atualizar pgto na parcela}

      // verifica se � pagto entrada - sempre a entrada � gravada na mesma data do acordo
      _acordos.close;
      _acordos.CommandText := 'select * from parcelas_acordo where pagamento is null and pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor) +
        ' and tipo_acordo=''E'' and vencimento <= '''+FormatDateTime( frotinas.formato_data_banco(), objEstruturaPagamentos.data_pgto) +''' order by vencimento desc';
      _acordos.open;

      if _acordos.recordCount>0 then
      begin

        {mesmo que tenha mais de um acordo em aberto, o sistema vai pegar a parcela de entrada referente ao �ltimo acordo}
        _acordos.edit;
        _acordos.fieldByName('pagamento').value := objEstruturaPagamentos.data_pgto;
        _acordos.fieldByName('valor_pgto').value := objEstruturaPagamentos.valor_pgto;
        _acordos.post;

        {verifica se teve outro acordo anterior com tipo entrada e n�o teve pagamento}

        _acordos.next; { order DESC, vai para o acordo anterior e marca como quebra de acordo}
        if not _acordos.eof then
        begin
          _acordos.edit;
          _acordos.fieldByName('tipo_acordo').value := 'Q';
          _acordos.post;

          dtAcordoPago := _acordos.fieldByName('data_acordo').value;

          _acordos.close;
          _acordos.CommandText := 'select * from parcelas_acordo where pagamento is null and pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor) +
          ' and tipo_acordo=''P'' and data_acordo = '''+FormatDateTime( frotinas.formato_data_banco(), dtAcordoPago)+
          ''' order by vencimento ';
          _acordos.open;

          while not _acordos.eof do
          begin
            _acordos.edit;
            _acordos.fieldByName('tipo_acordo').value := 'Q';
            _acordos.post;

            _acordos.next;
          end;


        end;


      end
      else
      begin


        _acordos.close;
        _acordos.CommandText := 'select * from parcelas_acordo where pagamento is null and pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor) +
          ' and tipo_acordo=''P''  order by vencimento ';
        _acordos.open;

        if _acordos.recordCount > 0 then
        begin
          _acordos.edit;
          _acordos.fieldByName('pagamento').value := objEstruturaPagamentos.data_pgto;
          _acordos.fieldByName('valor_pgto').value := objEstruturaPagamentos.valor_pgto;
          _acordos.post;
        end;


      end;

      {realizar agendamento para a pr�xima parcela}

      _acordos.close;
      _acordos.CommandText := 'select * from parcelas_acordo where pagamento is null and pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor) +
        ' and tipo_acordo=''P'' and vencimento > '''+FormatDateTime( frotinas.formato_data_banco(), objEstruturaPagamentos.data_pgto) +''' order by vencimento';
      _acordos.open;

      if _acordos.recordCount>0 then
      begin
        dtAgendar := _acordos.fieldbyname('vencimento').value;

        dtAgendar := dtAgendar - 5;
        if DayOfWeek(dtAgendar) = 1 then // domingo
          dtAgendar := dtAgendar + 1
        else if DayOfWeek(dtAgendar) = 7 then // sabado
          dtAgendar := dtAgendar - 1;

        _devedor.Edit;
        _devedor.fieldbyname('Agendado_Data').Value := dtAgendar;
        _devedor.fieldbyname('Agendado_tipo').Value := '2';
        _devedor.fieldbyname('Agendado_hora').Value := '08:00';
        _devedor.fieldbyname('Agendado_cobrador').Value := _devedor.fieldbyname('pk_cobrador').Value ;
        _devedor.post;

      end;

      if objEstruturaPagamentos.saldo_divida <= 0 then // baixa - retirada
      begin


        _param.close;
        _param.CommandText := 'select * from param where nome_param=''PAGOU''';
        _Param.open;

        // 24/04/2016 - melhor nb�o gravar historico para n�o confundir
        //chaveOcorr := _param.fieldByname('valor_param').asinteger;
        //frotinas.gravaRealizouPGT( chaveOcorr, objEstruturaPagamentos.pk_devedor, 'Retirada ', false);

        _titulosDoDevedor.first;
        while not _titulosDoDevedor.eof do
        begin
          _titulosDoDevedor.edit;
          _titulosDoDevedor.fieldByName('motivo_baixa').value := 'PG';
          _titulosDoDevedor.fieldByName('data_baixa').value := objEstruturaPagamentos.data_pgto;
          _titulosDoDevedor.post;
          _titulosDoDevedor.next;
        end;

      end;


    end;
    

  end;



end;


function ImportarPagamentos.gravarDadosDoPagamentoTotal( objEstruturaPagamentos : EstruturaPagamentos  ) : boolean;
var chave : integer;
begin

    _titulosDoDevedor.close;
    _titulosDoDevedor.commandText := 'select * from titulos where numero_titulo like ''%'+objEstruturaPagamentos.numero_Titulo+'%'''+
                                      ' and pk_cliente='+intToStr(objEstruturaPagamentos.pk_cliente)+
                                      ' and pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor);
    _titulosDoDevedor.open;

    _recibos.close;
    _recibos.commandText := 'select * from recibos where 1=2';
    _recibos.open;

    if objEstruturaPagamentos.saldo_divida > 0 then
    begin
      // baixa parcial deixando saldo
      // todo: aguardando confirma��o george; lan�a hist�rico, altera vencimento para data acordo + 25dias

    end
    else
    begin

      while not _titulosDoDevedor.eof do
      begin
        _titulosDoDevedor.edit();
        _titulosDoDevedor.fieldbyname('motivo_baixa').value := 'PG';
        _titulosDoDevedor.fieldbyname('data_baixa').value := date;
        _titulosDoDevedor.post();
        _titulosDoDevedor.next()
      end;

      if objEstruturaPagamentos.tipo <> 'D' then
      begin

        _param.close;
        _param.commandText := 'select * from param where nome_param=''PAGOU''';
        _param.open;

        // descobre parametro com tipo de ocorrencia
        if (_param.recordCount>0) then
          frotinas.gravaRealizouPGT( _param.fieldByname('valor_param').asinteger, objEstruturaPagamentos.pk_devedor, 'Realizou pagamento total de R$ '+FloatToStr(objEstruturaPagamentos.valor_pgto) ,true);
      end;


  end;

end;

function ImportarPagamentos.pesquisarDevedor( cliente:integer; cpfDevedor:string ) : boolean;
begin

  result := false;
  if cpfDevedor <> '' then
    result := true;
  if cliente>0 then
    result := true;

  if result then
  begin
    _devedor.close;
    _devedor.commandText := 'select * from devedores where cgc_cpf='''+cpfDevedor+''' and pk_cliente='+intToStr(cliente);
    _devedor.open;
    result := _devedor.recordCount > 0;
  end;
end;


function ImportarRemessas.pesquisarCodigoDevedor( cliente:integer; devedor:string ) : boolean;
begin

  _devedor.close;
  _devedor.commandText := 'select * from devedores where codigo like ''%'+devedor+'%'''+
                                    ' and pk_cliente='+intToStr(cliente);

  _devedor.open;
  result := _devedor.recordCount>0;



end;

function ImportarRemessas.pesquisarCodigoDevedorExato( cliente:integer; devedor:string ) : boolean;
begin

  _devedor.close;
  _devedor.commandText := 'select * from devedores where codigo = '''+devedor+''''+
                                    ' and pk_cliente='+intToStr(cliente);

  _devedor.open;
  result := _devedor.recordCount>0;



end;

function ImportarRemessas.pesquisarTituloDoDevedor( cliente:integer; devedor:integer; contrato:string; numeroTitulo:string ; vencimento: TDatetime) : boolean;

begin

  result := false;
  if cliente >0 then
    result := true;
  if devedor>0 then
    result := true;
  if numeroTitulo<>'' then
    result := true;

  if result then
  begin
    _titulosDoDevedor.close;
    _titulosDoDevedor.commandText := 'select * from titulos where numero_titulo='''+numeroTitulo+
                                      ''' and chave_contrato='''+contrato+''' and pk_cliente='+intToStr(cliente)+
                                      ' and pk_devedor='+intToStr(devedor)+' and vencimento='''+FormatDateTime(frotinas.formato_data_banco(), vencimento)+'''';



    _titulosDoDevedor.open;
    result := _titulosDoDevedor.recordCount > 0;
  end;


end;

function ImportarRemessas.gravarTitulosDoDevedor( objEstruturaTitulos : EstruturaTitulos ) : boolean;
var ocorrAtualiz  : integer;
var vlr:string;
begin

  if not pesquisarTituloDoDevedor( objEstruturaTitulos.pk_cliente, objEstruturaTitulos.pk_devedor, objEstruturaTitulos.contrato, objEstruturaTitulos.numeroTitulo ,objEstruturaTitulos.vencimento) then
  begin
      _titulosDoDevedor.append;
      _titulosDoDevedor.fieldByName('pk_titulo').value  := objEstruturaTitulos.pk_titulo;
      _titulosDoDevedor.fieldByName('pk_devedor').value := objEstruturaTitulos.pk_devedor;
      _titulosDoDevedor.fieldByName('pk_cliente').value := objEstruturaTitulos.pk_cliente;

      _titulosDoDevedor.fieldByName('tipo_titulo').value      := objEstruturaTitulos.tipo_titulo;
      _titulosDoDevedor.fieldByName('chave_contrato').value   := objEstruturaTitulos.contrato;
      _titulosDoDevedor.fieldByName('numero_titulo').value    := objEstruturaTitulos.numerotitulo;
      _titulosDoDevedor.fieldByName('banco').value            := objEstruturaTitulos.banco;
      _titulosDoDevedor.fieldByName('nome_banco').value       := objEstruturaTitulos.nome_banco;
      _titulosDoDevedor.fieldByName('agencia').value          := objEstruturaTitulos.agencia;
      _titulosDoDevedor.fieldByName('conta').value            := objEstruturaTitulos.conta;
      _titulosDoDevedor.fieldByName('praca_cheque').value     := objEstruturaTitulos.praca_cheque;
      _titulosDoDevedor.fieldByName('cheque').value           := objEstruturaTitulos.cheque;
      _titulosDoDevedor.fieldByName('alinea_devol').value     := objEstruturaTitulos.alinea_devol;
      _titulosDoDevedor.fieldByName('endossado_cpf').value    := objEstruturaTitulos.endosado_cpf;
      _titulosDoDevedor.fieldByName('endossado').value        := objEstruturaTitulos.endossado;
      _titulosDoDevedor.fieldByName('emissao').value          := objEstruturaTitulos.emissao;
      _titulosDoDevedor.fieldByName('vencimento').value       := objEstruturaTitulos.vencimento;
      _titulosDoDevedor.fieldByName('valor_principal').value  := objEstruturaTitulos.valor_principal;
      _titulosDoDevedor.fieldByName('valor_titulo').value     := objEstruturaTitulos.valor_principal;
      _titulosDoDevedor.fieldByName('chave_titulo').value     := objEstruturaTitulos.contrato;

      _titulosDoDevedor.fieldByName('seq_arq_inclusao').value := objEstruturaTitulos.seq_arq_inclusao;
      _titulosDoDevedor.fieldByName('Data_inclusao').value := objEstruturaTitulos.Data_inclusao;
      _titulosDoDevedor.fieldByName('dias_atraso_remessa').value := objEstruturaTitulos.dias_atraso_remessa;
      _titulosDoDevedor.fieldByName('venc_ult_extrato').value := objEstruturaTitulos.venc_ult_extrato;
      _titulosDoDevedor.fieldByName('pagamento_minimo').value := objEstruturaTitulos.pagamento_minimo;

      _titulosDoDevedor.fieldByName('motivo_baixa').value := '';
      _titulosDoDevedor.fieldByName('data_baixa').value := null; //objEstruturaTitulos.data_limpa;



      _titulosDoDevedor.fieldByName('atualizar').value        := objEstruturaTitulos.atualizar;

      _titulosDoDevedor.post;


  end
  else if objEstruturaTitulos.tipo_titulo = 'FC' then
  begin

    frotinas.Qry_Livre.Close;
    frotinas.Qry_Livre.CommandText := 'select * from ocorrencias where nome=''99-Atualiza��o D�vida'' ';
    frotinas.Qry_Livre.open;
    if frotinas.Qry_Livre.recordCount>0 then
    begin
      ocorrAtualiz := frotinas.Qry_Livre.fieldByName('pk_ocorr').value;
      eventos.Close;
      eventos.commandText := 'select * from eventos where 1=2';
      eventos.open;

      vlr:=FloatToStr(objEstruturaTitulos.valor_principal);
      eventos.append;
      eventos.FieldByName('chave').value := frotinas.Sequencial('eventos');
      eventos.FieldByName('pk_devedor').value := objEstruturaTitulos.pk_devedor;
      eventos.FieldByName('pk_cliente').value := objEstruturaTitulos.pk_cliente;
      eventos.FieldByName('Data').value :=  Date;
      eventos.FieldByName('Hora').value := FormatDateTime( 'hh:mm:ss', time);
      eventos.FieldByName('motivo').value := ocorrAtualiz;
      eventos.FieldByName('Texto').Value := 'Atualiza��o de Fatura - Dados Anteriores - Chave Tit: '+_titulosDoDevedor.fieldByName('pk_titulo').asstring+' Ult Atu Extrato: '+
                               FormatDateTime( 'DD/MM/YYYY',_titulosDoDevedor.fieldByName('VENC_ULT_EXTRATO').value)+' Vencimento: '+
                               FormatDateTime( 'DD/MM/YYYY',_titulosDoDevedor.fieldByName('VENCIMENTO').value)+ ' Valor Fatura: '+
                               FloatToStr(_titulosDoDevedor.fieldByName('valor_titulo').AsFloat)+'#13'+' Fatura Atualizada: Venc Extrato '+FormatDateTime( 'DD/MM/YYYY',objEstruturaTitulos.vencimento)+
                               ' Valor Atualizado: '+vlr ;
      eventos.post;




    end;


  end;

end;



function ImportarRemessas.gravarDadosDoDevedor( objEstruturaDevedor : EstruturaDevedor ) : boolean;
begin

  //if not pesquisarDevedor( objEstruturaDevedor.pk_cliente, objEstruturaDevedor.cgc_cpf ) then
  //begin
      if objEstruturaDevedor.inserir then
      begin
        _devedor.append;
        _devedor.fieldByName('pk_devedor').value := objEstruturaDevedor.pk_devedor;
        _devedor.fieldByName('pk_cliente').value := objEstruturaDevedor.pk_cliente;
        _devedor.fieldByName('cgc_cpf').value    := objEstruturaDevedor.cgc_cpf;
      end
      else
       _devedor.edit;

      _devedor.fieldByName('codigo').value     := objEstruturaDevedor.codigo;
      _devedor.fieldByName('nome').value       := objEstruturaDevedor.nome;
      _devedor.fieldByName('data_nasc').value  := objEstruturaDevedor.data_nasc;
      _devedor.fieldByName('rg').value         := objEstruturaDevedor.rg;
      _devedor.fieldByName('orgao_rg').value   := objEstruturaDevedor.orgao_rg;
      _devedor.fieldByName('sexo').value       := objEstruturaDevedor.sexo;
      _devedor.fieldByName('profissao').value       := objEstruturaDevedor.profissao;


      _devedor.fieldByName('tipo_logradouro').value:= objEstruturaDevedor.tipo_logradouro;
      _devedor.fieldByName('logradouro').value := objEstruturaDevedor.logradouro;
      _devedor.fieldByName('numero').value     := objEstruturaDevedor.numero;
      _devedor.fieldByName('bairro').value      := objEstruturaDevedor.bairro;
      _devedor.fieldByName('cidade').value     := objEstruturaDevedor.cidade;
      _devedor.fieldByName('uf').value         := objEstruturaDevedor.uf;
      _devedor.fieldByName('complemento').value:= objEstruturaDevedor.complemento;
      _devedor.fieldByName('ponto_referencia').value:= objEstruturaDevedor.ponto_referencia;
      _devedor.fieldByName('cep').value        := objEstruturaDevedor.cep;
      _devedor.fieldByName('email').value      := objEstruturaDevedor.email;
      _devedor.fieldByName('trabalho_nome').value:= objEstruturaDevedor.trabalho_nome;
      _devedor.fieldByName('trab_logradouro').value := objEstruturaDevedor.trab_logradouro;
      _devedor.fieldByName('trab_numero').value := objEstruturaDevedor.trab_numero;
      _devedor.fieldByName('trab_bairro').value := objEstruturaDevedor.trab_bairro;
      _devedor.fieldByName('trab_cidade').value := objEstruturaDevedor.trab_cidade;
      _devedor.fieldByName('trab_uf').value     := objEstruturaDevedor.trab_uf;
      _devedor.fieldByName('trab_complemento').value := objEstruturaDevedor.trab_complemento;
      _devedor.fieldByName('trab_ponto_refer').value := objEstruturaDevedor.trab_ponto_refer;
      _devedor.fieldByName('trab_cep').value         := objEstruturaDevedor.trab_cep;
      _devedor.post;

  //end;
  gravarTelefonesDoDevedor(objEstruturaDevedor, objEstruturaDevedor.tiposTelefones1, objEstruturaDevedor.numerosTelefones1,objEstruturaDevedor.dddTelefones1);
  gravarTelefonesDoDevedor(objEstruturaDevedor, objEstruturaDevedor.tiposTelefones2, objEstruturaDevedor.numerosTelefones2,objEstruturaDevedor.dddTelefones2);
  gravarTelefonesDoDevedor(objEstruturaDevedor, objEstruturaDevedor.tiposTelefones3, objEstruturaDevedor.numerosTelefones3,objEstruturaDevedor.dddTelefones3);
  gravarTelefonesDoDevedor(objEstruturaDevedor, objEstruturaDevedor.tiposTelefones4, objEstruturaDevedor.numerosTelefones4,objEstruturaDevedor.dddTelefones4);

end;

function ImportarRemessas.gravarDadosDoInquilino( objEstruturaDevedor : EstruturaDevedor ) : boolean;
begin


     _devedor.edit;

    _devedor.fieldByName('email_inq').value      := objEstruturaDevedor.email;
    _devedor.fieldByName('nome_inq').value:= objEstruturaDevedor.nome;
    _devedor.fieldByName('cpf_inq').value:= objEstruturaDevedor.cgc_cpf;
    _devedor.fieldByName('logradouro_inq').value := objEstruturaDevedor.logradouro;
    _devedor.fieldByName('numero_inq').value := objEstruturaDevedor.numero;
    _devedor.fieldByName('bairro_inq').value := objEstruturaDevedor.bairro;
    _devedor.fieldByName('cidade_inq').value := objEstruturaDevedor.cidade;
    _devedor.fieldByName('uf_inq').value     := objEstruturaDevedor.uf;
    _devedor.fieldByName('compl_inq').value := objEstruturaDevedor.complemento;

    _devedor.post;

    gravarTelefonesDoDevedor(objEstruturaDevedor, objEstruturaDevedor.tiposTelefones1, objEstruturaDevedor.numerosTelefones1,objEstruturaDevedor.dddTelefones1);
    gravarTelefonesDoDevedor(objEstruturaDevedor, objEstruturaDevedor.tiposTelefones2, objEstruturaDevedor.numerosTelefones2,objEstruturaDevedor.dddTelefones2);
    gravarTelefonesDoDevedor(objEstruturaDevedor, objEstruturaDevedor.tiposTelefones3, objEstruturaDevedor.numerosTelefones3,objEstruturaDevedor.dddTelefones3);
    gravarTelefonesDoDevedor(objEstruturaDevedor, objEstruturaDevedor.tiposTelefones4, objEstruturaDevedor.numerosTelefones4,objEstruturaDevedor.dddTelefones4);

end;

function ImportarRemessas.gravarTelefonesDoDevedor( objEstruturaDevedor : EstruturaDevedor; tipo:string; numero:string; ddd:string) : boolean;
var x : integer;
begin

  //For x:=1 to Length(objEstruturaDevedor.tiposTelefones) do
  //begin

    if (tipo <> '') and not pesquisarTelefoneDevedor( objEstruturaDevedor.pk_devedor, numero) then
    begin
        _telefonesDoDevedor.append;
        _telefonesDoDevedor.fieldByName('pk_devedor').value := objEstruturaDevedor.pk_devedor;
        _telefonesDoDevedor.fieldByName('id').value := frotinas.Sequencial('telefones');
        _telefonesDoDevedor.fieldByName('tipo_fone').value := tipo;
        _telefonesDoDevedor.fieldByName('ddd').value := ddd;
        _telefonesDoDevedor.fieldByName('telefone').value := numero;
        _telefonesDoDevedor.post;

    end;
  //end;

end;

function ImportarRemessas.pesquisarTelefoneDevedor( devedor:integer; telefone:string ) : boolean;
begin

  result := false;
  if telefone <> '' then
    result := true;
  if devedor>0 then
    result := true;

  if result then
  begin
    _telefonesDoDevedor.close;
    _telefonesDoDevedor.commandText := 'select * from telefones where telefone='''+telefone+''' and pk_devedor='+intToStr(devedor);
    _telefonesDoDevedor.open;
    result := _telefonesDoDevedor.recordCount > 0;
  end;

end;

function ImportarRemessas.pesquisarDevedor( cliente:integer; cpfDevedor:string ) : boolean;
begin

  result := false;
  if cpfDevedor <> '' then
    result := true;
  if cliente>0 then
    result := true;

  if result then
  begin
    _devedor.close;
    _devedor.commandText := 'select * from devedores where cgc_cpf='''+cpfDevedor+''' and pk_cliente='+intToStr(cliente);
    _devedor.open;
    result := _devedor.recordCount > 0;
  end;
end;

{
function ImportacaoRemessas.enviarEmails : string;
var  qry: TADOQuery;
var texto,nomeArquivo:string;
var F : TextFile;
begin


  texto := '';
  texto := texto + formataDadosDasTabelasParaEnviar('TABELAS');
  texto := texto + formataDadosDasTabelasParaEnviar('PESSOAS');
  texto := texto + formataDadosDasTabelasParaEnviar('CHEQUES');
  texto := texto + formataDadosDasTabelasParaEnviar('EVENTOS');
  texto := texto + formataDadosDasTabelasParaEnviar('NEGOCIACAO');
  texto := texto + formataDadosDasTabelasParaEnviar('TABELACORRECAO');

  Criptografar  := CriptografarDados.Create;
  result := Criptografar.Crypt('E', texto, chaveCriptografia);
  Criptografar.free;


  nomeArquivo := 'C:\Sistemas\Arquivos';
  if not DirectoryExists(nomeArquivo) then
    CreateDir(nomeArquivo);


  nomeArquivo := nomeArquivo+'\'+formatDateTime('yyyymmdd_hhmmss',now())+'.txt';
  try
    AssignFile(F,nomeArquivo);
    Rewrite(F);
    writeLn( F, 'COMPUTADORORIGEM='+computador);
    writeLn( F, result);
  except
    result:='N�o gerado Arquivo de envio.';
    CloseFile(F);
    exit;
  end;
  CloseFile(F);



  if utilizaServicoEmail then
  begin
    if conectarSMTP then
    begin
      try

        //qry := TADOQuery.Create(nil);
        //qry.Connection := Conexao;
        //qry.SQL.Text := 'select * from TABELAS where TIPO=''P'' and NOME<>'''+computador+'''';
        //qry.Open;

        //while not qry.eof do
        //begin
          msg.Clear;
          with msg do
          begin
              subject                   := qry.fieldByName('nome').asString;
              From.Text                 := contaOrigem;
              Recipients.EMailAddresses := contaDestino;
              body.Text                 := result;
              LoadFromFile(nomeArquivo);
          end;
          IdSMTP1.Send( msg );
          //qry.next;
        //end;

        //qry.Destroy;
      finally
        //if desconectaAoEnviar then
          IdSMTP1.Disconnect;
      end;
    end;

  end;


end;

}



end.
