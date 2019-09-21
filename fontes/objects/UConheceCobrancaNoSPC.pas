unit UConheceCobrancaNoSPC;

interface

uses Classes, Db,ADODB, SysUtils,Variants,windows,IdBaseComponent,IdComponent,urotinas;

type



  RemessaAoSPC = Class
    private

      _conexao            : TAdoConnection;
      _cliente            : TADODataSet;
      _titulosEmAtraso    : TADODataSet;

    public

      constructor Create(conexao : TAdoConnection);
      destructor Destroy();

      property conexao  : TAdoConnection read _conexao write _conexao;

      property cliente          : TADODataSet read _cliente write _cliente;
      property titulosEmAtraso : TADODataSet read _titulosEmAtraso write _titulosEmAtraso;

      function pesquisarCliente( cliente:integer) : boolean;
      function pesquisarTitulosEmAtraso( cliente:integer; tipoDeTitulos:string; diasDeAtraso:integer ) : boolean;

  end;







implementation

constructor RemessaAoSPC.Create(conexao : TAdoConnection);
begin
  _conexao := conexao;

  cliente            := TADODataSet.Create(nil);
  cliente.Connection := Conexao;

  titulosEmAtraso    := TADODataSet.Create(nil);
  titulosEmAtraso.Connection := Conexao;


end;

destructor RemessaAoSPC.destroy();
begin
  cliente.free;
  titulosEmAtraso.free;
end;



function RemessaAoSPC.pesquisarCliente( cliente:integer ) : boolean;

begin

  result := false;
  if cliente >0 then
    result := true;

  if result then
  begin
    _cliente.close;
    _cliente.commandText := 'select * from clientes where pk_cliente='+inttostr(cliente);
    _cliente.open;
    result := _cliente.recordCount > 0;
  end;


end;




function RemessaAoSPC.pesquisarTitulosEmAtraso( cliente:integer; tipoDeTitulos:string; diasDeAtraso:integer ) : boolean;
var sql,tiposTmp : string;
var dt : Tdatetime;
var posicao, elem:integer;
var partes : TResultArray;
begin

  result := false;

  sql := 'SELECT t.*, d.nome ';
  sql := sql+' FROM titulos t ';
  sql := sql+' inner join devedores d on ( d.pk_devedor = t.pk_devedor and d.pk_cliente = t.pk_cliente) ';

  sql := sql+' WHERE (t.motivo_baixa is null or t.motivo_baixa='''') and t.pk_cliente = '+inttostr(cliente);


  // TODO: quando criar a tabela de eventos do SPC, verificar se o título NÃO foi enviado ainda para o SPC


  dt := date;
  dt := dt - diasDeAtraso;
  sql := sql + ' and t.vencimento <'''+FormatDateTime(frotinas.formato_data_banco(),dt)+'''';

  if tipoDeTitulos <> '' then
  begin

    partes := urotinas.split(tipoDeTitulos, ',');
    elem:=0;
    tiposTmp:='';

    if Length(partes)>0 then
    begin
      while elem <Length(partes) do
      begin
        if tiposTmp <> '' then
          tiposTmp := tiposTmp+',';
        tiposTmp := tiposTmp + '''' + partes[elem] + '''';
        inc(elem);
      end;
      sql := sql + ' and t.tipo_titulo in ('+tiposTmp+') ';
    end;

  end;




  _titulosEmAtraso.close;
  _titulosEmAtraso.commandText := sql;
  _titulosEmAtraso.open;

  result := _titulosEmAtraso.recordCount > 0;


{
  if objEstruturaDevedor.inserir then
  begin
        _devedor.append;
        _devedor.fieldByName('pk_devedor').value := objEstruturaDevedor.pk_devedor;
        _devedor.fieldByName('pk_cliente').value := objEstruturaDevedor.pk_cliente;
        _devedor.fieldByName('cgc_cpf').value    := objEstruturaDevedor.cgc_cpf;
      end
      else
       _devedor.edit;

      _devedor.fieldByName('codigo_no_cliente').value     := objEstruturaDevedor.codigo;
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
  gravarTelefonesDoDevedor(objEstruturaDevedor, objEstruturaDevedor.tiposTelefones1, objEstruturaDevedor.numerosTelefones1);
  gravarTelefonesDoDevedor(objEstruturaDevedor, objEstruturaDevedor.tiposTelefones2, objEstruturaDevedor.numerosTelefones2);
  gravarTelefonesDoDevedor(objEstruturaDevedor, objEstruturaDevedor.tiposTelefones3, objEstruturaDevedor.numerosTelefones3);
  gravarTelefonesDoDevedor(objEstruturaDevedor, objEstruturaDevedor.tiposTelefones4, objEstruturaDevedor.numerosTelefones4);
 }
end;




end.
