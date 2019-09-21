unit UEstruturasDeDadosParaImportacao;

interface

uses SysUtils;

type

  TStringArray = array of string;

  EstruturaDevedor = Class
    private

      _data_limpa      : tdatetime;

      _pk_devedor      : integer;
      _inserir         : boolean;
      _cgc_cpf         : string;
      _nome            : string;
      _pk_cliente      : integer;
      _rg              : string;
      _codigo          : string;
      _data_nasc       : tdatetime;
      _orgao_rg        : string;
      _profissao       : string;
      _sexo            : string;
      _tipo_logradouro : string;
      _logradouro      : string;
      _numero          : string;
      _bairro          : string;
      _cidade          : string;
      _uf              : string;
      _complemento     : string;
      _ponto_referencia : string;
      _cep              : string;
      _email            : string;

      _trabalho_nome    : string;
      _trab_logradouro  : string;
      _trab_numero      : string;
      _trab_bairro      : string;
      _trab_cidade      : string;
      _trab_uf          : string;
      _trab_complemento : string;
      _trab_ponto_refer :string;
      _trab_cep         : string;

       _tiposTelefones1 : string;
      _numerosTelefones1 : string;
      _dddTelefones1     : string;

      _tiposTelefones2 : string;
      _numerosTelefones2 : string;
      _dddTelefones2     : string;

      _tiposTelefones3 : string;
      _numerosTelefones3 : string;
      _dddTelefones3     : string;

      _tiposTelefones4 : string;
      _numerosTelefones4 : string;
      _dddTelefones4     : string;
      _observacao : string;

    public

      constructor Create();
      destructor Destroy();

      procedure limparBuffer;

      property pk_devedor : integer read _pk_devedor write _pk_devedor;
      property inserir : boolean read _inserir write _inserir;
      property cgc_cpf : string read _cgc_cpf write _cgc_cpf;
      property nome : string read _nome write _nome;
      property pk_cliente : integer read _pk_cliente write _pk_cliente;
      property rg : string read _rg write _rg;
      property data_nasc : tdatetime read _data_nasc write _data_nasc;
      property codigo : string read _codigo write _codigo;
      property orgao_rg : string read _orgao_rg write _orgao_rg;
      property profissao : string read _profissao write _profissao;
      property sexo : string read _sexo write _sexo;


      property tipo_logradouro : string read _tipo_logradouro write _tipo_logradouro;
      property logradouro : string read _logradouro write _logradouro;
      property numero : string read _numero write _numero;
      property bairro : string read _bairro write _bairro;
      property cidade : string read _cidade write _cidade;
      property uf : string read _uf write _uf;
      property complemento : string read _complemento write _complemento;
      property ponto_referencia : string read _ponto_referencia write _ponto_referencia;
      property cep : string read _cep write _cep;
      property email : string read _email write _email;

      property trabalho_nome : string read _trabalho_nome write _trabalho_nome;
      property trab_logradouro : string read _trab_logradouro write _trab_logradouro;
      property trab_numero : string read _trab_numero write _trab_numero;
      property trab_bairro : string read _trab_bairro write _trab_bairro;
      property trab_cidade:string read _trab_cidade write _trab_cidade;
      property trab_uf : string read _trab_uf write _trab_uf;
      property trab_complemento : string read _trab_complemento write _trab_complemento;
      property trab_ponto_refer:string read _trab_ponto_refer write _trab_ponto_refer;
      property trab_cep : string read _trab_cep write _trab_cep;

      property data_limpa : tdatetime  read _data_limpa write _data_limpa;

      property tiposTelefones1 : string read _tiposTelefones1 write _tiposTelefones1;
      property numerosTelefones1 : string read _numerosTelefones1 write _numerosTelefones1;
      property dddTelefones1 : string read _dddTelefones1 write _dddTelefones1;

      property tiposTelefones2 : string read _tiposTelefones2 write _tiposTelefones2;
      property numerosTelefones2 : string read _numerosTelefones2 write _numerosTelefones2;
      property dddTelefones2 : string read _dddTelefones2 write _dddTelefones2;

      property tiposTelefones3 : string read _tiposTelefones3 write _tiposTelefones3;
      property numerosTelefones3 : string read _numerosTelefones3 write _numerosTelefones3;
      property dddTelefones3 : string read _dddTelefones3 write _dddTelefones3;

      property tiposTelefones4 : string read _tiposTelefones4 write _tiposTelefones4;
      property numerosTelefones4 : string read _numerosTelefones4 write _numerosTelefones4;
      property dddTelefones4 : string read _dddTelefones4 write _dddTelefones4;

      property observacao: string read _observacao write _observacao;

  end;


  EstruturaTitulos = Class
    private

      _pk_titulo          : integer;
      _inserir            : boolean;
      _pk_devedor         : integer;
      _pk_cliente         : integer;
      _tipo_titulo        : string;
      _chave_contrato     : string;
      _numero_titulo      : string;
      _banco              : string;
      _nome_banco         : string;
      _agencia            : string;
      _conta              : string;
      _praca_cheque       : string;
      _cheque             : string;
      _alinea_devol       : string;
      _endosado_cpf       : string;
      _endossado          : string;
      _emissao            : Tdatetime;
      _vencimento         : TDatetime;
      _valor_principal    : real;
      _seq_arq_inclusao   : integer;
      _data_limpa         : tdatetime;
      _atualizar          : string;
      _Data_inclusao      : TDateTime;
      _dias_atraso_remessa: integer;
      _venc_ult_extrato   : TDateTime;
      _pagamento_minimo   : real;


    public

      constructor Create();
      destructor Destroy();

      procedure limparBuffer;
      property data_limpa : tdatetime  read _data_limpa write _data_limpa;

      property pk_titulo : integer read _pk_titulo write _pk_titulo;
      property pk_devedor : integer read _pk_devedor write _pk_devedor;
      property pk_cliente : integer read _pk_cliente write _pk_cliente;
      property inserir : boolean read _inserir write _inserir;
      property tipo_titulo : string read _tipo_titulo write _tipo_titulo;
      property contrato : string read _chave_contrato write _chave_contrato;
      property numeroTitulo : string read _numero_titulo write _numero_titulo;
      property banco : string read _banco write _banco;
      property nome_banco : string read _nome_banco write _nome_banco;
      property agencia : string read _agencia write _agencia;
      property conta : string read _conta write _conta;
      property praca_cheque : string read _praca_cheque write _praca_cheque;
      property cheque : string read _cheque write _cheque;
      property alinea_devol : string read _alinea_devol write _alinea_devol;
      property endosado_cpf : string read _endosado_cpf write _endosado_cpf;
      property endossado : string read _endossado write _endossado;
      property emissao : Tdatetime read _emissao write _emissao;
      property vencimento : TDatetime read _vencimento write _vencimento;
      property valor_principal : real read _valor_principal write _valor_principal;
      property seq_arq_inclusao : integer read _seq_arq_inclusao write _seq_arq_inclusao;
      property atualizar : string read _atualizar write _atualizar;

      property data_inclusao : Tdatetime read _Data_inclusao write _Data_inclusao;
      property dias_atraso_remessa : Integer read _dias_atraso_remessa write _dias_atraso_remessa;
      property venc_ult_extrato : TdateTime read _venc_ult_extrato write _venc_ult_extrato;
      property pagamento_minimo : real read _pagamento_minimo write _pagamento_minimo;


    end;


  EstruturaPagamentos = Class
    private

      _data_limpa         : tdatetime;
      _pk_titulo          : integer;
      _inserir            : boolean;
      _pk_devedor         : integer;
      _pk_cliente         : integer;
      _codigo             : string;
      _diasAtraso         : integer;
      _cgc_cpf            : string;
      _tipo               : string;
      _forma_retenc       : string;
      _data_pgto          : Tdatetime;
      _data_venc          : Tdatetime;
      _numero_titulo      : string;
      _contrato           : string;
      _valor_pgto         : real;
      _valor_retenc       : real;
      _saldo_divida       : real;
      _perc_retenc        : real;

      _observacao         : string;

    public

      constructor Create();
      destructor Destroy();

      procedure limparBuffer;

      property pk_titulo : integer read _pk_titulo write _pk_titulo;
      property pk_devedor : integer read _pk_devedor write _pk_devedor;
      property pk_cliente : integer read _pk_cliente write _pk_cliente;
      property cgc_cpf : string read _cgc_cpf write _cgc_cpf;
      property codigo : string read _codigo write _codigo;
      property diasAtraso : integer read _diasAtraso write _diasAtraso;
      property tipo : string read _tipo write _tipo;
      property forma_retenc : string read _forma_retenc write _forma_retenc;

      property inserir : boolean read _inserir write _inserir;

      property data_pgto : TdateTime read _data_pgto write _data_pgto;
      property data_venc : TdateTime read _data_venc write _data_venc;
      property numero_titulo : string read _numero_titulo write _numero_titulo;
      property contrato : string read _contrato write _contrato;
      property valor_pgto : real read _valor_pgto write _valor_pgto;
      property saldo_divida : real read _saldo_divida write _saldo_divida;
      property valor_retenc : real read _valor_retenc write _valor_retenc;
      property perc_retenc : real read _perc_retenc write _perc_retenc;

      property observacao : string read _observacao write _observacao;

    end;

  EstruturaAcordos = Class
    private

      _data_limpa         : tdatetime;
      _inserir            : boolean;
      _pk_devedor         : integer;
      _pk_cliente         : integer;
      _cgc_cpf            : string;
      _codigo             : string;


      _data_acordo        : Tdatetime;
      _total_acordo       : real;

      _data_entrada       : Tdatetime;
      _valor_entrada      : real;

      _qtde_parcelas      : integer;
      _valor_parcela      : real;

      _linha              : string;


    public

      constructor Create();
      destructor Destroy();

      procedure limparBuffer;

      property pk_devedor : integer read _pk_devedor write _pk_devedor;
      property pk_cliente : integer read _pk_cliente write _pk_cliente;
      property cgc_cpf : string read _cgc_cpf write _cgc_cpf;
      property codigo : string read _codigo write _codigo;
      property linha : string read _linha write _linha;

      property inserir : boolean read _inserir write _inserir;

      property data_acordo : TdateTime read _data_acordo write _data_acordo;
      property total_acordo : real read _total_acordo write _total_acordo;

      property data_entrada : TdateTime read _data_entrada write _data_entrada;
      property valor_entrada : real read _valor_entrada write _valor_entrada;

      property qtde_parcelas : integer read _qtde_parcelas write _qtde_parcelas;
      property valor_parcela : real read _valor_parcela write _valor_parcela;


    end;

  EstruturaRetirada = Class
    private

      _data_limpa         : tdatetime;
      _inserir            : boolean;
      _pk_devedor         : integer;
      _pk_cliente         : integer;
      _pk_titulo          : integer;
      _cgc_cpf            : string;
      _codigo             : string;
      _contrato           : string;
      _numero_titulo      : string;


      _data_Retirada        : Tdatetime;

      _linha              : string;

    public

      constructor Create();
      destructor Destroy();

      procedure limparBuffer;

      property pk_titulo : integer read _pk_titulo write _pk_titulo;
      property pk_devedor : integer read _pk_devedor write _pk_devedor;
      property pk_cliente : integer read _pk_cliente write _pk_cliente;
      property cgc_cpf : string read _cgc_cpf write _cgc_cpf;
      property codigo : string read _codigo write _codigo;
      property linha : string read _linha write _linha;
      property contrato : string read _contrato write _contrato;
      property numero_titulo : string read _numero_titulo write _numero_titulo;

      property inserir : boolean read _inserir write _inserir;

      property data_retirada : TdateTime read _data_retirada write _data_retirada;

    end;


implementation

  constructor EstruturaDevedor.Create();
  begin
  //
  end;
  destructor EstruturaDevedor.destroy();
  begin
  //
  end;

  constructor EstruturaTitulos.Create();
  begin
  //
  end;
  destructor EstruturaTitulos.destroy();
  begin
  //
  end;

  constructor EstruturaPagamentos.Create();
  begin
  //
  end;
  destructor EstruturaPagamentos.destroy();
  begin
  //
  end;

  constructor EstruturaAcordos.Create();
  begin
  //
  end;
  destructor EstruturaAcordos.destroy();
  begin
  //
  end;


  constructor EstruturaRetirada.Create();
  begin
  //
  end;
  destructor EstruturaRetirada.destroy();
  begin
  //
  end;


  procedure EstruturaAcordos.limparBuffer;
  begin
      _pk_devedor      := 0;
      _pk_cliente      := 0;
      _inserir         := false;
      _cgc_cpf         := '';
      _codigo          := '';

      _data_acordo        := _data_limpa;
      _total_acordo       := 0.00;

      _data_entrada       := _data_limpa;
      _valor_entrada      := 0.00;

      _qtde_parcelas      := 0;
      _valor_parcela      := 0.00;


  end;

  procedure EstruturaRetirada.limparBuffer;
  begin
      _pk_devedor      := 0;
      _pk_cliente      := 0;
      _inserir         := false;
      _cgc_cpf         := '';
      _codigo          := '';
      _pk_titulo       := 0;
      _contrato        := '';
      _numero_titulo   := '';

      _data_retirada        := _data_limpa;

  end;




  procedure EstruturaPagamentos.limparBuffer;
  begin
      _pk_devedor      := 0;
      _pk_cliente      := 0;
      _inserir         := false;
      _cgc_cpf         := '';
      _tipo            := '';
      _forma_retenc    := '';

      _data_pgto        := _data_limpa;
      _data_venc        := _data_limpa;
      _contrato         := '';
      _numero_titulo    := '';
      _valor_pgto       := 0.00;
      _valor_retenc     := 0.00;
      _saldo_divida     := 0.00;
      _perc_retenc      := 0.00;
      _diasAtraso       := 0;


  end;


  procedure EstruturaDevedor.limparBuffer;
  begin
      _pk_devedor      := 0;
      _pk_cliente      := 0;
      _inserir         := false;
      _cgc_cpf         := '';
      _nome            := '';
      _codigo          := '';
      _rg              := '';
      _data_nasc       := _data_limpa;
      _orgao_rg        := '';
      _profissao       := '';
      _sexo            := '';

      _tipo_logradouro := '';
      _logradouro      := '';
      _numero          := '';
      _bairro          := '';
      _cidade          := '';
      _uf              := '';
      _complemento     := '';
      _ponto_referencia := '';
      _cep              := '';
      _email            := '';
      _trabalho_nome    := '';
      _trab_logradouro  := '';
      _trab_numero      := '';
      _trab_bairro      := '';
      _trab_cidade      := '';
      _trab_uf          := '';
      _trab_complemento := '';
      _trab_ponto_refer := '';
      _trab_cep         := '';

      _tiposTelefones1  := '';
      _dddTelefones1    := '';
      _numerosTelefones1:= '';
      _tiposTelefones2  := '';
      _numerosTelefones2:= '';
      _dddTelefones2    := '';
      _tiposTelefones3  := '';
      _numerosTelefones3:= '';
      _dddTelefones3    := '';
      _tiposTelefones4  := '';
      _numerosTelefones4:= '';
      _dddTelefones4    := '';

      _observacao:= '';

  end;


  procedure EstruturaTitulos.limparBuffer;
  begin
      _pk_titulo          := 0;
      _pk_devedor         := 0;
      _pk_cliente         := 0;
      _inserir            := false;
      _tipo_titulo        := '';
      _chave_contrato     := '';
      _numero_titulo      := '';
      _banco              := '';
      _nome_banco         := '';
      _agencia            := '';
      _conta              := '';
      _praca_cheque       := '';
      _cheque             := '';
      _alinea_devol       := '';
      _endosado_cpf       := '';
      _endossado          := '';
      _emissao            := _data_limpa;
      _vencimento         := _data_limpa;
      _valor_principal    := 0;
      _seq_arq_inclusao   := 0;
      _atualizar          := '';

      _Data_inclusao      := _data_limpa;
      _dias_atraso_remessa:= 0;
      _venc_ult_extrato   := _data_limpa;
      _pagamento_minimo   := 0.00;


 {                         qry_titulos.fieldByName('VENC_ULT_EXTRATO').value := StrToDate( copy(data,1,2)+'/'+copy(data,3,2)+'/'+copy(data,5,4) );
                    qry_titulos.fieldByName('valor_titulo').value := strToFloat(copy(linha,263,11)) / 100;
                    qry_titulos.fieldByName('valor_principal').value := strToFloat(copy(linha,263,11)) / 100;
                    qry_titulos.fieldByName('pagamento_minimo').value := strToFloat(copy(linha,296,11)) / 100;
                                          qry_titulos.fieldbyname('motivo_baixa').value := copy(linha,4,2);
                      qry_titulos.fieldbyname('data_baixa').value := date;
                      qry_titulos.fieldbyname('seq_arq_baixa').value := seqArq;
}

  end;


end.
