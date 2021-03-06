unit UValidarBatimentoCarteira;

interface

uses Classes, Db,ADODB, SysUtils,Variants,windows,IdBaseComponent,IdComponent,urotinas,UEstruturasDeDadosParaImportacao;

type

  ValidarRemessas = Class
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

      function devedorRegistrado( cliente:integer; cpfDevedor:string ) : boolean;
      function tituloRegistrado( cliente:integer; devedor:integer; contrato:string; numeroTitulo:string ) : boolean;

  end;


  ValidarPagamentos = Class
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

      function pagamentoRegistrado( objEstruturaPagamentos : EstruturaPagamentos; arquivo:string ) : integer;
      function pesquisarTituloDoDevedor( cliente:integer; devedor:integer; contrato:string; numeroTitulo:string ):boolean;
      function pesquisarCodigoDevedor( cliente:integer; devedor:string ) : boolean;
      function pesquisarDevedor( cliente:integer; cpfDevedor:string ) : boolean;
  end;




  ValidarRetirada = Class
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

      function tituloRetirado( objEstruturaRetirada : EstruturaRetirada ; arquivo:string; motivo : string) : boolean;
      function pesquisarDevedorCGC( cliente:integer; devedor:string ) : boolean;

  end;





implementation

constructor ValidarRemessas.Create(conexao : TAdoConnection);
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

destructor ValidarRemessas.destroy();
begin
  devedor.free;
  telefonesDoDevedor.free;
  titulosDoDevedor.free;
  eventos.free;
end;




constructor ValidarRetirada.Create(conexao : TAdoConnection);
begin
  _conexao := conexao;

  devedor            := TADODataSet.Create(nil);
  devedor.Connection := Conexao;

  titulos            := TADODataSet.Create(nil);
  titulos.Connection := Conexao;

  eventos            := TADODataSet.Create(nil);
  eventos.Connection := Conexao;


end;

destructor ValidarRetirada.destroy();
begin
  devedor.free;
  titulos.free;
end;

function ValidarRetirada.pesquisarDevedorCGC( cliente:integer; devedor:string ) : boolean;
begin

  _devedor.close;
  _devedor.commandText := 'select pk_devedor, nome, codigo_no_cliente, motivo_dialogo,data_dialogo, pk_cobrador,Agendado_Data, Agendado_tipo,Agendado_hora  from devedores where cgc_cpf ='''+devedor+''''+
                                    ' and pk_cliente='+intToStr(cliente);

  _devedor.open;
  result := _devedor.recordCount>0;



end;


function ValidarRetirada.tituloRetirado( objEstruturaRetirada : EstruturaRetirada ; arquivo: string; motivo :string ) : boolean;
var hoje:TDateTime;
var valor_ret:real ;
var atraso,chaveOcorr:integer;
var conta:integer;
var prxVenc, ultVenc:TdateTime;
begin

  hoje := date;
  result := false;

  if (objEstruturaRetirada.pk_devedor>0) and (pesquisarDevedorCGC(objEstruturaRetirada.pk_cliente, objEstruturaRetirada.cgc_cpf)) then
  begin



    _titulos.close;
    _titulos.CommandText := 'select motivo_baixa,data_baixa from titulos where (motivo_baixa='''' or motivo_baixa is null ) and pk_cliente='+
                               IntToStr(objEstruturaRetirada.pk_cliente)+' and pk_devedor='+IntToStr(objEstruturaRetirada.pk_devedor)+
                               ' and numero_titulo = '''+objEstruturaRetirada.numero_titulo+''' and motivo_baixa is not null and motivo_baixa is not null <> '''' ';
    urotinas.log(_titulos.CommandText ) ;
    _titulos.open;



    result := _titulos.recordCount=0;


  end;


end;


constructor ValidarPagamentos.Create(conexao : TAdoConnection);
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

destructor ValidarPagamentos.destroy();
begin
  titulosDoDevedor.free;
  recibos.free;
  param.free;
end;

function ValidarPagamentos.pesquisarCodigoDevedor( cliente:integer; devedor:string ) : boolean;
begin

  _devedor.close;
  _devedor.commandText := 'select pk_devedor, nome, codigo_no_cliente, motivo_dialogo,data_dialogo,pk_cobrador,Agendado_Data, Agendado_tipo,Agendado_hora from devedores where codigo_no_cliente like ''%'+devedor+'%'''+
                                    ' and pk_cliente='+intToStr(cliente);

  _devedor.open;
  result := _devedor.recordCount>0;



end;

function ValidarPagamentos.pesquisarTituloDoDevedor( cliente:integer; devedor:integer; contrato:string; numeroTitulo:string ) : boolean;
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
                                                                            ' and pk_devedor='+intToStr(devedor);

    _titulosDoDevedor.open;
    result := _titulosDoDevedor.recordCount > 0;
  end;


end;


{
result: 0=registrado, 1=titulo n�o encontrado, 2=pagamento n�o encontrado
}

function ValidarPagamentos.pagamentoRegistrado( objEstruturaPagamentos : EstruturaPagamentos; arquivo:string  ) : integer;
var hoje,dtAgendar, dtAcordoPago:TDateTime;
var valor_ret:real ;
var atraso,chaveOcorr:integer;
var parte : TStringList;
var i:integer;
var podeGravar:boolean;
var sql:string;
begin

  result := 0;
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

    if _titulosDoDevedor.recordCount >0 then
    begin

      _bxParciais.close;

      sql := 'select * from baixasparciais where pk_devedor='+intToStr(objEstruturaPagamentos.pk_devedor);

      if _titulosDoDevedor.recordCount>0 then
        sql := sql + ' and ( pk_titulo is null or pk_titulo='+_titulosDoDevedor.fieldByName('pk_titulo').asstring+') ' ;

      sql := sql + ' and data = '''+FormatDateTime(frotinas.formato_data_banco(),objEstruturaPagamentos.data_pgto)+'''';

      sql := sql + ' and valor ='+ StringReplace( FloatToStr(objEstruturaPagamentos.valor_pgto) , ',', '.', [rfReplaceAll])  ;


      _bxParciais.CommandText := sql;


      _bxParciais.open;


      if _bxParciais.recordCount=0 then
        result := 2; // pagamento n�o encontrado

    end
    else
      result := 1; // t�tulo n�o encontrado

  end;



end;



function ValidarPagamentos.pesquisarDevedor( cliente:integer; cpfDevedor:string ) : boolean;
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



function ValidarRemessas.tituloRegistrado( cliente:integer; devedor:integer; contrato:string; numeroTitulo:string ) : boolean;
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
                                      ' and pk_devedor='+intToStr(devedor);

    _titulosDoDevedor.open;
    result := _titulosDoDevedor.recordCount > 0;
  end;


end;



function ValidarRemessas.devedorRegistrado( cliente:integer; cpfDevedor:string ) : boolean;
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



end.
