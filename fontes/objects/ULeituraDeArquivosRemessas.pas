unit ULeituraDeArquivosRemessas;

interface

uses Classes, Db,ADODB, SysUtils,Variants,windows,IdBaseComponent,IdComponent,UEstruturasDeDadosParaImportacao, UDataSourcesDeImportacao, urotinas ;


type

  TResultArray = array of string; //<== Definição do tipo


  LerArquivoRemessa = Class
    private

    _objEstruturaInquilino : EstruturaDevedor;
    _objEstruturaDevedor   : EstruturaDevedor;
    _objEstruturaTitulos   : EstruturaTitulos;
    _objEstruturaPagamentos: EstruturaPagamentos;
    _objEstruturaAcordos   : EstruturaAcordos;
    _objEstruturaRetirada  : EstruturaRetirada;
    _objImportarRemessa    : ImportarRemessas;

    _tipoDoRegistro : string;
    _pk_cliente     : integer;
    _errosArquivo   : string;

    public

      constructor Create();
      destructor Destroy();

      property objEstruturaInquilino   : EstruturaDevedor read _objEstruturaInquilino write _objEstruturaInquilino;

      property objEstruturaDevedor   : EstruturaDevedor read _objEstruturaDevedor write _objEstruturaDevedor;
      property objEstruturaTitulos   : EstruturaTitulos read _objEstruturaTitulos write _objEstruturaTitulos;
      property objEstruturaPagamentos: EstruturaPagamentos read _objEstruturaPagamentos write _objEstruturaPagamentos;
      property objEstruturaAcordos   : EstruturaAcordos read _objEstruturaAcordos write _objEstruturaAcordos;
      property objEstruturaRetirada  : EstruturaRetirada read _objEstruturaRetirada write _objEstruturaRetirada;
      property objImportarRemessa    : ImportarRemessas read _objImportarRemessa write _objImportarRemessa;
      property tipoDoRegistro        : string read _tipoDoRegistro write _tipoDoRegistro;
      property pk_cliente            : integer read _pk_cliente write _pk_cliente;

      property errosArquivo : string read _errosArquivo write _errosArquivo;

      function lerRemessaSecrel( linhaDeDados :string ) : boolean;
      function lerRemessaEsplanada( linhaDeDados :string ) : boolean;
      function lerRemessaEletroCentral( linhaDeDados :string ) : string;
      function lerRemessaRedesplan( linhaDeDados :string ) : boolean;
      function lerRemessaMaresia( linhaDeDados :string ; nomeFantasia:string) : boolean;
      function lerRemessaCasaPio( linhaDeDados :string ; nomeFantasia:string) : boolean;
      function lerRemessaPadrao( linhaDeDados :string ) : string;

      function lerRemessaArrudaContato( linhaDeDados :string  ; tipo:string) : string;
      //function lerRemessaArrudaDivida( linhaDeDados :string ) : string;

      function lerPagamentosRedesplan( linhaDeDados :string ) : boolean;
      function lerAcordosRedesplan( linhaDeDados :string ) : boolean;


      function lerPagamentosCasaPio( linhaDeDados :string ) : boolean;
      function lerRetiradaRedeSplan( linhaDeDados :string ) : boolean;

      function lerPagamentosPadrao( linhaDeDados :string ) : string;
      function lerRetiradaPadrao( linhaDeDados :string ) : string;




  end;


implementation

constructor LerArquivoRemessa.Create;
begin
//
end;

destructor LerArquivoRemessa.destroy;
begin
//
end;

function LerArquivoRemessa.lerRemessaSecrel( linhaDeDados :string ) : boolean;
var contaTelefones : integer;
begin

  objEstruturaDevedor.limparBuffer();


  if copy(linhaDeDados,1,1) = '2' then
    tipoDoRegistro := 'CLIENTE'
  else if copy(linhaDeDados,1,1) = '3' then
    tipoDoRegistro := 'CONTRATO'
  else if copy(linhaDeDados,1,1) = '4' then
    tipoDoRegistro := 'PARCELAS'
  else if copy(linhaDeDados,1,1) = '5' then
    tipoDoRegistro := 'PREV_ACORDO'
  else if copy(linhaDeDados,1,1) = '6' then
    tipoDoRegistro := 'PRODUTOS';

  if tipoDoRegistro = 'CLIENTE' then
  begin

    objEstruturaDevedor.pk_cliente := _pk_cliente;

    objEstruturaDevedor.codigo     := copy(linhaDeDados,63,14);
    objEstruturaDevedor.cgc_cpf    := copy(linhaDeDados,63,14);
    objEstruturaDevedor.nome       := copy(linhaDeDados,13,50);;

    objEstruturaDevedor.rg         := '';
    objEstruturaDevedor.orgao_rg        := '';
    objEstruturaDevedor.data_nasc       := StrToDate( copy(linhaDeDados, 78,2)+'/'+copy(linhaDeDados, 80,2)+'/'+copy(linhaDeDados, 82,2));

    objEstruturaDevedor.tipo_logradouro := copy(linhaDeDados, 110,1);
    objEstruturaDevedor.logradouro      := copy(linhaDeDados, 112,70);
    objEstruturaDevedor.complemento     := copy(linhaDeDados, 182,40)+','+copy(linhaDeDados, 228,3);
    objEstruturaDevedor.numero          := copy(linhaDeDados, 222,6);
    objEstruturaDevedor.ponto_referencia:= copy(linhaDeDados, 232,100);
    objEstruturaDevedor.cep             := copy(linhaDeDados, 332,8);
    objEstruturaDevedor.bairro          := copy(linhaDeDados, 340,30);
    objEstruturaDevedor.cidade          := copy(linhaDeDados, 370,30);
    objEstruturaDevedor.uf              := copy(linhaDeDados, 400,2);

    //objEstruturaDevedor.telefones        := '';
    objEstruturaDevedor.email            := '';
    objEstruturaDevedor.trabalho_nome    := copy(linhaDeDados, 402,40);
    objEstruturaDevedor.trab_logradouro  := copy(linhaDeDados, 402,2)+' '+copy(linhaDeDados, 444,70);
    objEstruturaDevedor.trab_complemento := copy(linhaDeDados, 514,40);
    objEstruturaDevedor.trab_numero      := copy(linhaDeDados, 554,6);
    objEstruturaDevedor.trab_cep         := copy(linhaDeDados, 560,8);
    objEstruturaDevedor.trab_bairro      := copy(linhaDeDados, 568,30);
    objEstruturaDevedor.trab_cidade      := copy(linhaDeDados, 598,30);
    objEstruturaDevedor.trab_uf          := copy(linhaDeDados, 628,2);
    objEstruturaDevedor.trab_ponto_refer := '';
    //objEstruturaDevedor.trab_fones       := copy(linhaDeDados, 628,12);

    contaTelefones := 1 ;

    //objEstruturaDevedor.tiposTelefones[contaTelefones] := 'Residencial';
    //objEstruturaDevedor.numerosTelefones[contaTelefones] := copy(linhaDeDados, 86,11);
    //inc(contaTelefones);

    //objEstruturaDevedor.tiposTelefones[contaTelefones] := 'Celular';
    //objEstruturaDevedor.numerosTelefones[contaTelefones] := copy(linhaDeDados, 98,11);
    //inc(contaTelefones);

    //objEstruturaDevedor.tiposTelefones[contaTelefones] := 'Trabalho';
    //objEstruturaDevedor.numerosTelefones[contaTelefones] := copy(linhaDeDados, 630,11);
    //inc(contaTelefones);

  end;

end;

function LerArquivoRemessa.lerRemessaRedesplan( linhaDeDados :string ) : boolean;
var contaTelefones : integer;
begin


  objEstruturaDevedor.limparBuffer();


  if alltrim(copy(linhaDeDados,1,1)) = 'D' then // dados do débito
  begin

    if alltrim(copy(linhaDeDados,81,1)) = 'F' then
      objEstruturaDevedor.cgc_cpf    := alltrim(copy(linhaDeDados,85,11))
    else
      objEstruturaDevedor.cgc_cpf    := alltrim(copy(linhaDeDados,82,14));

    objEstruturaDevedor.nome       := alltrim(copy(linhaDeDados,96,64));
    objEstruturaDevedor.codigo     := IntToStr(strToInt(copy(linhaDeDados,47,18)));
    objEstruturaDevedor.pk_cliente := _pk_cliente;

    objEstruturaDevedor.rg         := alltrim(copy(linhaDeDados,243,11));
    objEstruturaDevedor.orgao_rg   := alltrim(copy(linhaDeDados,254,5));
    objEstruturaDevedor.data_nasc  := StrToDate( copy(linhaDeDados, 338,2)+'/'+copy(linhaDeDados, 336,2)+'/'+copy(linhaDeDados,332 ,4));
    objEstruturaDevedor.sexo       := alltrim(copy(linhaDeDados,289,1));
    objEstruturaDevedor.profissao  := alltrim(copy(linhaDeDados,259,30));


    //objEstruturaDevedor.tipo_logradouro := copy(linhaDeDados, 110,1);
    objEstruturaDevedor.logradouro      := alltrim(copy(linhaDeDados, 340,25));
    objEstruturaDevedor.complemento     := copy(linhaDeDados, 371,10);
    objEstruturaDevedor.numero          := copy(linhaDeDados, 365,6);

    objEstruturaDevedor.bairro          := alltrim(copy(linhaDeDados, 381,13));
    objEstruturaDevedor.cep             := alltrim(copy(linhaDeDados, 394,8));
    objEstruturaDevedor.cidade          := alltrim(copy(linhaDeDados, 402,15));
    objEstruturaDevedor.uf              := alltrim(copy(linhaDeDados, 417,2));
    //    objEstruturaDevedor.email           := copy(linhaDeDados, 313,70);

    objEstruturaDevedor.tiposTelefones1 := 'Residencial Fixo';
    objEstruturaDevedor.numerosTelefones1 := alltrim(copy(linhaDeDados, 419,4)) + ' '+alltrim(copy(linhaDeDados, 423,8));
    inc(contaTelefones);

    //objEstruturaDevedor.ponto_referencia:= copy(linhaDeDados, 232,100);

    objEstruturaDevedor.trabalho_nome    := copy(linhaDeDados, 521,40);
    objEstruturaDevedor.trab_logradouro  := copy(linhaDeDados, 561,25);
    objEstruturaDevedor.trab_complemento := copy(linhaDeDados, 592,10);
    objEstruturaDevedor.trab_numero      := copy(linhaDeDados, 586,6);
    objEstruturaDevedor.trab_cep         := copy(linhaDeDados, 615,8);
    objEstruturaDevedor.trab_bairro      := copy(linhaDeDados, 602,13);
    objEstruturaDevedor.trab_cidade      := copy(linhaDeDados, 623,15);
    objEstruturaDevedor.trab_uf          := copy(linhaDeDados, 638,2);
    //objEstruturaDevedor.trab_ponto_refer := '';

    objEstruturaDevedor.tiposTelefones2 := 'Empresa Fixo';
    objEstruturaDevedor.numerosTelefones2 := alltrim(copy(linhaDeDados, 640,4)) + ' '+alltrim(copy(linhaDeDados, 644,8));
    inc(contaTelefones);

    objEstruturaDevedor.tiposTelefones3 := 'Celular';
    objEstruturaDevedor.numerosTelefones3 := alltrim(copy(linhaDeDados, 652,4)) + ' '+alltrim(copy(linhaDeDados, 656,9));
    inc(contaTelefones);


    { Títulos }

    objEstruturaTitulos.limparBuffer;

    //objEstruturaTitulos.pk_devedor := pk_devedor;
    objEstruturaTitulos.pk_cliente := _pk_cliente;

    objEstruturaTitulos.data_inclusao:= date;


    if strToInt(copy(linhaDeDados,65,16)) > 0 then
    begin
      objEstruturaTitulos.tipo_titulo := 'DP';
      objEstruturaTitulos.numeroTitulo := alltrim(copy(linhaDeDados,65,16));

      if alltrim(copy(linhaDeDados,168,15)) <> '' then
        objEstruturaTitulos.valor_principal := strToFloat(copy(linhaDeDados,168,15))/100;

      if alltrim(copy(linhaDeDados,160,8)) <> '' then
        objEstruturaTitulos.vencimento := strToDate(copy(linhaDeDados,166,2)+'/'+copy(linhaDeDados,164,2)+'/'+copy(linhaDeDados,160,4));


    end
    else if alltrim(copy(linhaDeDados,1199,16) ) <> '' then
    begin

      objEstruturaTitulos.tipo_titulo := 'FC';
      objEstruturaTitulos.numeroTitulo := copy(linhaDeDados,1200,16) ;  // número do cartão
      objEstruturaTitulos.contrato := copy(linhaDeDados,183,30) ;  // nome do produto

      if alltrim(copy(linhaDeDados,168,15)) <> '' then
        objEstruturaTitulos.valor_principal := strToFloat(copy(linhaDeDados,168,15))/100;

        //objEstruturaTitulos.valor_principal := strToFloat(copy(linhaDeDados,1528,15))/100; // campo : totalDividaVencidoAVencer

      if alltrim(copy(linhaDeDados,160,8)) <> '' then
        objEstruturaTitulos.vencimento := strToDate(copy(linhaDeDados,166,2)+'/'+copy(linhaDeDados,164,2)+'/'+copy(linhaDeDados,160,4));

      if strtoint(copy(linhaDeDados,1496,15)) >0 then
        objEstruturaTitulos.pagamento_minimo := strToFloat(copy(linhaDeDados,1496,15)) / 100;

      if strtoint(copy(linhaDeDados,1469,4)) >0 then
        objEstruturaTitulos.dias_atraso_remessa := strToInt(copy(linhaDeDados,1469,4));

      if alltrim(copy(linhaDeDados,1473,8)) <> '' then
        objEstruturaTitulos.venc_ult_extrato := strToDate(copy(linhaDeDados,1479,2)+'/'+copy(linhaDeDados,1477,2)+'/'+copy(linhaDeDados,1473,4));



    end;

    objEstruturaTitulos.atualizar := 'S';

    //if alltrim(copy(linhaDeDados,210,2)) <> '' then
    //objEstruturaTitulos.emissao := strToDate(copy(linhaDeDados,210,2)+'/'+copy(linhaDeDados,212,2)+'/'+copy(linhaDeDados,214,4));

  end;
  result:=true;
end;

function split(texto: string; caracter:string): TResultArray;
var partes : TResultArray;
var elem, posicao: integer;
var linha, linha2:string;
var contaAspas : integer;
begin

  if caracter = '' then
    caracter := '|';

  elem:=0;
  contaAspas:=0;

  linha := texto;
  linha2:= texto;
  while length(linha)>0 do
  begin
    posicao := pos( caracter ,linha );
    elem := elem + 1;
    if posicao>0 then
    begin
      linha:= copy(linha, posicao+1, length(linha) );
      if length(linha)=0 then
        inc(elem);
    end
    else
      linha:='';
  end;


  SetLength(partes,elem);

  linha := texto;
  elem  := 0;
  while length(linha)>0 do
  begin

    posicao := pos( caracter ,linha );

    if posicao>0 then
    begin

      if copy(linha,1,1)=caracter then
        partes[elem] := ''
      else
        partes[elem] := copy(linha, 1, posicao-1);

      elem := elem + 1;
      linha:= copy(linha, posicao+1, length(linha) );
    end
    else
    begin

      partes[elem] := linha;

      linha:='';

    end;

  end;

  result := partes;
end;


function LerArquivoRemessa.lerRemessaPadrao( linhaDeDados :string ) : string;
var contaTelefones : integer;
var cpf:string;
var valor : string;
var parte : TResultArray;

begin


  objEstruturaDevedor.limparBuffer();

  try


    if alltrim(copy(linhaDeDados,1,1)) = 'D' then // dados do débito
    begin



    {
H;0
 0        1         2       3         4              5         6         7       8      9            10        11      12       13     14     15               16           17        18                        19            20     21           22            23      24     25    26      27      28              29              30            31         32           33                34              35            36         37         38            39           40        41         42        43          44            45         46
tipo|cpf        |codigo|nome           |      rg   | órgão|dt nasci  |Sexo| profissão  |logradouro|numero|bairro   |cidade   |uf|complemento|ponto ref         |cep     |email               |tel resid fixo| tel cel1  |tel cel 2|Nome trab|logradouro trab|numero|bairro|cidade|estado|complemento|ponto de referência|cep         |Telefone 1  |Telefone 2 |observação cliente|tipo do título|núm. contrato|núm. título|Emissao    |vencimento |valor titulo|cód.banco|nome banco|cód agência|cta corrente|pça do cheque|alinea|cpf sacado|nome sacado
D   |24539783300|000004|Manuel Ferreira|99999999000|ssp-ce|25/12/1980|M   |Analista    |Três      |131   |Messejana|Fortaleza|Ce|BL 06 ap00 |lagoa de messejana|60000000|manuel@codigo.com.br|85-988999999  |85-30009999|         |         |               |      |      |      |      |           |                   |            |85-988990000|85-30999999|          |                  |CH            |  00056632323| 0001-2    | 01/01/2016| 20/02/2016| 200.00     | 001     | BB       |  1234-5   |  4444-5    | Fortaleza   |      |          |



    }

      parte := split(linhaDeDados, '|');
      if (Length(parte)<>47 ) then
      begin
           result:='A quantidade de colunas '+intToStr(Length(parte))+ ' difere da quantidade de colunas para o arquivo de remessa (47)\r\n'+linhaDeDados;
           exit;
      end;



      objEstruturaDevedor.cgc_cpf    := urotinas.limpaFormatacao((parte[1]));
      objEstruturaDevedor.codigo     := alltrim(parte[2]);// IntToStr(strToInt(copy(linhaDeDados,47,18)));
      objEstruturaDevedor.nome       := alltrim(parte[3]);
      objEstruturaDevedor.pk_cliente := _pk_cliente;

      objEstruturaDevedor.rg         := alltrim(parte[4]);
      objEstruturaDevedor.orgao_rg   := alltrim(parte[5]);
      if (alltrim(parte[6])<>'') and (alltrim(parte[6])<>' ') and (StrToDate( alltrim(parte[6]) ) >0) then
        objEstruturaDevedor.data_nasc  := StrToDate( alltrim(parte[6]) );// copy(linhaDeDados, 338,2)+'/'+copy(linhaDeDados, 336,2)+'/'+copy(linhaDeDados,332 ,4));

      objEstruturaDevedor.sexo       := alltrim(parte[7]);
      objEstruturaDevedor.profissao  := alltrim(parte[8]);


      objEstruturaDevedor.logradouro      := alltrim(parte[9]);
      objEstruturaDevedor.numero          := alltrim(parte[10]);
      objEstruturaDevedor.bairro          := alltrim(parte[11]);
      objEstruturaDevedor.cidade          := alltrim(parte[12]);
      objEstruturaDevedor.uf              := alltrim(parte[13]);
      objEstruturaDevedor.complemento     := alltrim(parte[14]);
      objEstruturaDevedor.ponto_referencia:= alltrim(parte[15]);
      objEstruturaDevedor.cep             := alltrim(parte[16]);

      objEstruturaDevedor.email           := alltrim(parte[17]);

      if alltrim(parte[18]) <> '' then
      begin
        objEstruturaDevedor.tiposTelefones1 := 'Residencial Fixo';
        objEstruturaDevedor.numerosTelefones1 := alltrim(parte[18]);
        inc(contaTelefones);
      end;


      if alltrim(parte[19]) <> '' then
      begin
        objEstruturaDevedor.tiposTelefones2 := 'Celular 1';
        objEstruturaDevedor.numerosTelefones2 := alltrim(parte[19]);
        inc(contaTelefones);
      end;


      if alltrim(parte[20]) <> '' then
      begin
        objEstruturaDevedor.tiposTelefones3 := 'Celular 2';
        objEstruturaDevedor.numerosTelefones3 := alltrim(parte[20]);
        inc(contaTelefones);
      end;

      objEstruturaDevedor.trabalho_nome    := alltrim(parte[21]);
      objEstruturaDevedor.trab_logradouro  := alltrim(parte[22]);
      objEstruturaDevedor.trab_numero      := alltrim(parte[23]);
      objEstruturaDevedor.trab_bairro      := alltrim(parte[24]);
      objEstruturaDevedor.trab_cidade      := alltrim(parte[25]);
      objEstruturaDevedor.trab_uf          := alltrim(parte[26]);
      objEstruturaDevedor.trab_complemento := alltrim(parte[27]);
      objEstruturaDevedor.trab_ponto_refer := alltrim(parte[28]);
      objEstruturaDevedor.trab_cep         := alltrim(parte[29]);

      if alltrim(parte[30]) <> '' then
      begin
        objEstruturaDevedor.tiposTelefones2 := 'Telefone trab 1;';
        objEstruturaDevedor.numerosTelefones2 := alltrim(parte[30]);
        inc(contaTelefones);
      end;

      if alltrim(parte[31]) <> '' then
      begin
        objEstruturaDevedor.tiposTelefones4 := 'Telefone trab 1';
        objEstruturaDevedor.numerosTelefones4 := alltrim(parte[31]);
        inc(contaTelefones);
      end;

      objEstruturaDevedor.observacao       := alltrim(parte[32]);

      { Títulos }

      objEstruturaTitulos.limparBuffer;

      objEstruturaTitulos.pk_cliente := _pk_cliente;

      objEstruturaTitulos.data_inclusao:= date;

      objEstruturaTitulos.tipo_titulo := alltrim(parte[33]);
      objEstruturaTitulos.contrato := copy(alltrim(parte[34]),1,20);
      objEstruturaTitulos.numeroTitulo := copy(alltrim(parte[35]),1,20);

      if (alltrim(parte[36]) <> '') and (alltrim(parte[36]) <> ' ') and (StrToDate( alltrim(parte[36]) ) >0) then
        objEstruturaTitulos.emissao := strToDate(alltrim(parte[36]));
      if (alltrim(parte[37]) <> '') and (alltrim(parte[37]) <> ' ') and (StrToDate( alltrim(parte[37]) ) >0) then
      begin
        objEstruturaTitulos.vencimento := strToDate(alltrim(parte[37]));
        if objEstruturaTitulos.tipo_titulo = 'FC' then
          objEstruturaTitulos.venc_ult_extrato := objEstruturaTitulos.vencimento;
      end;


      if alltrim(parte[38]) <> '' then
      begin
        valor := alltrim(parte[38]);
        if pos('.',valor)>0 then
          valor := StringReplace(valor, '.', ',', [rfReplaceAll]);
        objEstruturaTitulos.valor_principal := strToFloat(valor);
      end;


      objEstruturaTitulos.banco := alltrim(parte[39]);
      objEstruturaTitulos.nome_banco := alltrim(parte[40]);
      objEstruturaTitulos.agencia := alltrim(parte[41]);
      objEstruturaTitulos.conta := alltrim(parte[42]);
      objEstruturaTitulos.cheque := alltrim(parte[43]);
      objEstruturaTitulos.alinea_devol := alltrim(parte[44]);
      objEstruturaTitulos.endosado_cpf := alltrim(parte[45]);
      objEstruturaTitulos.endossado := alltrim(parte[46]);


      objEstruturaTitulos.atualizar := 'S';

    end;


  finally
  end;


  result:='';

end;

function LerArquivoRemessa.lerRemessaArrudaContato( linhaDeDados :string  ; tipo: string ) : string;
var contaTelefones ,k: integer;
var cpf:string;
var valor : string;
var parte : TResultArray;

begin



    objEstruturaDevedor.limparBuffer();

  try


    {
H;0
 0        1    2     3        4        5         6         7     8      9     10    11      12   13 14   15
Unidade;Nome;Tipo;Telefone;Celular;Endere‡o;Complemento;Bairro;Cidade;Estado;CEP;CPF/CNPJ;E-mail;  ;   ;
0102 A;PORTO FREIRE ENGENHARIA;Propriet rio;;;Rua Greg¢rio Fran‡a;0102 A;Parque Iracema;Fortaleza;CE;60824-120;01064644000106;"milenaugusta@portofreire.com.br;juliana.lima@portofreire.com.br;lucilio.lessa@gmail.com";;;
0201 A;FATIMA DEBORA COSTA E SILVA DE A BESSA;63038994391;Residente;;;Rua Greg¢rio Fran‡a;0201 A;Parque Iracema;Fortaleza;CE;60824-120;63038994391;condominio08@sj.com.br;;;
;ROJANEA MARIA SCHACHNER;Propriet rio;85 3279 2055;85 9.8907 1151;Rua Greg¢rio Fran‡a;0201 A;Parque Iracema;Fortaleza;CE;60824-120;22013946368;"romadeus@hotmail.com;vmarili@yahoo.com.br";;;



    }

      parte := split(linhaDeDados, ';');
      if (Length(parte)<12) then
      begin
           result:='A quantidade de colunas '+intToStr(Length(parte))+ ' difere da quantidade de colunas para o arquivo de remessa (12)\r\n';
           exit;
      end;



      objEstruturaDevedor.cgc_cpf    := urotinas.limpaFormatacao((parte[11]));
      objEstruturaDevedor.codigo     := alltrim(parte[0]);// IntToStr(strToInt(copy(linhaDeDados,47,18)));
      objEstruturaDevedor.nome       := alltrim(parte[1]);
      objEstruturaDevedor.pk_cliente := _pk_cliente;


      objEstruturaDevedor.logradouro      := alltrim(parte[5]);
      objEstruturaDevedor.bairro          := alltrim(parte[7]);
      objEstruturaDevedor.cidade          := alltrim(parte[8]);
      objEstruturaDevedor.uf              := alltrim(parte[9]);
      objEstruturaDevedor.cep             := alltrim(parte[10]);
      objEstruturaDevedor.complemento     := alltrim(parte[6]);

      objEstruturaDevedor.email           := alltrim(parte[12]);

      k:=13;
      while k<Length(parte) do
      begin
        if pos( '@',parte[k])>0 then
          objEstruturaDevedor.email := objEstruturaDevedor.email +';'+ alltrim(parte[k] );
        inc(k);
      end;


      if alltrim(parte[3]) <> '' then
      begin
        objEstruturaDevedor.tiposTelefones1 := tipo+' Fixo ';

        //if pos('(',parte[3])>0 then
        //begin
        //  objEstruturaDevedor.dddTelefones1 := copy(parte[3],2,2);
          objEstruturaDevedor.numerosTelefones1 := parte[3]; //copy(parte[3],5, Length(parte[3]));
        {end
        else if copy(parte[3],3,1) = ' ' then
        begin
          objEstruturaDevedor.dddTelefones1 := copy(parte[3],1,2);
          objEstruturaDevedor.numerosTelefones1 := copy(parte[3],4, Length(parte[3]));
        end;
        }
        inc(contaTelefones);
      end;


      if alltrim(parte[4]) <> '' then
      begin
        objEstruturaDevedor.tiposTelefones2 := tipo+' Cel ';

        //if pos('(',parte[4])>0 then
        //begin
          //objEstruturaDevedor.dddTelefones2 := copy(parte[4],2,2);
          objEstruturaDevedor.numerosTelefones2 := parte[4]; //copy( parte[4],5, Length(parte[4]));
        {end
        else if copy(parte[4],3,1) = ' ' then
        begin
          objEstruturaDevedor.dddTelefones2 := copy(parte[4],1,2);
          objEstruturaDevedor.numerosTelefones2 := copy(parte[3],4, Length(parte[4]));
        end;
        }

        inc(contaTelefones);
      end;


      //if alltrim(parte[20]) <> '' then
      //begin
      //  objEstruturaDevedor.tiposTelefones3 := 'Celular 2';
      //  objEstruturaDevedor.numerosTelefones3 := alltrim(parte[20]);
      //  inc(contaTelefones);
      //end;



      objEstruturaTitulos.atualizar := 'S';



  finally
  end;


  result:='';

end;

function LerArquivoRemessa.lerPagamentosPadrao( linhaDeDados :string ) : string;
var creditos : integer;
var parte : TResultArray;
var valor: string;
begin

  objEstruturaPagamentos.limparBuffer();

  linhaDeDados :=alltrim(linhaDeDados);
  if (linhaDeDados <> ' ') and (linhaDeDados <> '') then
  begin


    try

{
H;0
    0           1                2             3           4                    5
cpf        |contrato   |número do título|data pagamento|valor pagamento| saldo da dívida
24539783300|00056632323|0001-2          |02/02/2016    | 100,00        |  100,00

}
      parte := split(linhaDeDados, '|');
      urotinas.log('lendo pagamentos '+linhaDeDados);

      if (Length(parte)<>7) and (Length(parte)<>8) then
      begin
        result:='A quantidade de colunas '+intToStr(Length(parte))+ ' difere da quantidade de colunas para o arquivo de remessa (7)';
        exit;
      end;

      urotinas.log('  cpf '+urotinas.limpaFormatacao(alltrim(parte[1])) );

      objEstruturaPagamentos.cgc_cpf    := urotinas.limpaFormatacao(alltrim(parte[1]));
      objEstruturaPagamentos.pk_cliente := _pk_cliente;
      objEstruturaPagamentos.contrato   := alltrim(parte[2]);
      objEstruturaPagamentos.numero_titulo   := alltrim(parte[3]);
      objEstruturaPagamentos.data_pgto    := strToDate(alltrim(parte[4]));

      urotinas.log('  valor pgto '+alltrim(parte[5]));

      valor := alltrim(parte[5]);

      if pos('.',valor)>0 then
          valor := StringReplace(valor, '.', ',', [rfReplaceAll]);
      objEstruturaPagamentos.valor_pgto   := strToFloat(valor);

      urotinas.log('  valor saldo '+alltrim(parte[6]));

      valor := alltrim(parte[6]);
      if pos('.',valor)>0 then
          valor := StringReplace(valor, '.', ',', [rfReplaceAll]);

      objEstruturaPagamentos.saldo_divida  := strToFloat(valor);

      if Length(parte)=8 then
        objEstruturaPagamentos.observacao  := alltrim(parte[7]);

    finally
    end;


  end;

end;

function LerArquivoRemessa.lerRetiradaPadrao( linhaDeDados :string ) : string;
var creditos : integer;
var parte : TResultArray;

begin

  objEstruturaRetirada.limparBuffer();  // a estrutura de pagamento tem os campos necessários para a retirada

  linhaDeDados :=alltrim(linhaDeDados);
  if (linhaDeDados <> ' ') and (linhaDeDados <> '') then
  begin


    try

{
H;0
    0           1                2
tipo|cpf        |contrato   |número do título
R   |24539783300|00056632323|0001-2

}

      parte := split(linhaDeDados, '|');

      if Length(parte)<4 then
      begin
        result:='A quantidade de colunas '+intToStr(Length(parte))+ ' difere da quantidade de colunas para o arquivo de remessa (7)';
        exit;
      end;

      objEstruturaRetirada.cgc_cpf    := urotinas.limpaFormatacao(alltrim(parte[1]));
      objEstruturaRetirada.pk_cliente := _pk_cliente;
      objEstruturaRetirada.contrato   := alltrim(parte[2]);
      objEstruturaRetirada.numero_titulo   := alltrim(parte[3]);
      objEstruturaRetirada.data_retirada := date;

    finally
    end;


  end;

end;

function LerArquivoRemessa.lerRemessaMaresia( linhaDeDados :string; nomeFantasia:string ) : boolean;
var contaTelefones : integer;
var cpf:string;
begin


  objEstruturaDevedor.limparBuffer();



  objEstruturaDevedor.cgc_cpf    := alltrim(copy(linhaDeDados,6,14));

  objEstruturaDevedor.nome       := alltrim(copy(linhaDeDados,56,40));
  //objEstruturaDevedor.codigo     := IntToStr(strToInt(copy(linhaDeDados,47,18)));

  objEstruturaDevedor.pk_cliente := _pk_cliente;

  //objEstruturaDevedor.rg         := alltrim(copy(linhaDeDados,243,11));
  //  objEstruturaDevedor.orgao_rg   := alltrim(copy(linhaDeDados,254,5));
  //  objEstruturaDevedor.data_nasc  := StrToDate( copy(linhaDeDados, 338,2)+'/'+copy(linhaDeDados, 336,2)+'/'+copy(linhaDeDados,332 ,4));
  //  objEstruturaDevedor.sexo       := alltrim(copy(linhaDeDados,289,1));
  //  objEstruturaDevedor.profissao  := alltrim(copy(linhaDeDados,259,30));


    //objEstruturaDevedor.tipo_logradouro := copy(linhaDeDados, 110,1);
    objEstruturaDevedor.logradouro      := alltrim(copy(linhaDeDados, 96,40));
    //objEstruturaDevedor.complemento     := copy(linhaDeDados, 371,10);
    //objEstruturaDevedor.numero          := copy(linhaDeDados, 365,6);

    objEstruturaDevedor.bairro          := alltrim(copy(linhaDeDados, 136,20));
    objEstruturaDevedor.cep             := alltrim(copy(linhaDeDados, 156,8));
    objEstruturaDevedor.cidade          := alltrim(copy(linhaDeDados, 164,20));
    objEstruturaDevedor.uf              := alltrim(copy(linhaDeDados, 184,2));
    //    objEstruturaDevedor.email           := copy(linhaDeDados, 313,70);

    objEstruturaDevedor.tiposTelefones1 := 'Residencial Fixo';
    objEstruturaDevedor.numerosTelefones1 := alltrim(copy(linhaDeDados, 186,3)) + ' '+alltrim(copy(linhaDeDados, 189,8));
    inc(contaTelefones);

    objEstruturaDevedor.tiposTelefones2 := 'Segundo Fixo';
    objEstruturaDevedor.numerosTelefones2 := alltrim(copy(linhaDeDados, 228,20));
    inc(contaTelefones);

    //objEstruturaDevedor.ponto_referencia:= copy(linhaDeDados, 232,100);

    //objEstruturaDevedor.trabalho_nome    := copy(linhaDeDados, 521,40);
    //objEstruturaDevedor.trab_logradouro  := copy(linhaDeDados, 561,25);
    //objEstruturaDevedor.trab_complemento := copy(linhaDeDados, 592,10);
    //objEstruturaDevedor.trab_numero      := copy(linhaDeDados, 586,6);
    //objEstruturaDevedor.trab_cep         := copy(linhaDeDados, 615,8);
    //objEstruturaDevedor.trab_bairro      := copy(linhaDeDados, 602,13);
    //objEstruturaDevedor.trab_cidade      := copy(linhaDeDados, 623,15);
    //objEstruturaDevedor.trab_uf          := copy(linhaDeDados, 638,2);
    //objEstruturaDevedor.trab_ponto_refer := '';

    //objEstruturaDevedor.tiposTelefones2 := 'Empresa Fixo';
    //objEstruturaDevedor.numerosTelefones2 := alltrim(copy(linhaDeDados, 640,4)) + ' '+alltrim(copy(linhaDeDados, 644,8));
    //inc(contaTelefones);

    //objEstruturaDevedor.tiposTelefones3 := 'Celular';
    //objEstruturaDevedor.numerosTelefones3 := alltrim(copy(linhaDeDados, 652,4)) + ' '+alltrim(copy(linhaDeDados, 656,9));
    //inc(contaTelefones);


    { Títulos }

    objEstruturaTitulos.limparBuffer;

    //objEstruturaTitulos.pk_devedor := pk_devedor;
    objEstruturaTitulos.pk_cliente := _pk_cliente;

    objEstruturaTitulos.data_inclusao:= date;


    if strToInt(copy(linhaDeDados,30,13)) > 0 then
    begin
      objEstruturaTitulos.tipo_titulo := alltrim(copy(linhaDeDados,2,1));;
      objEstruturaTitulos.numeroTitulo := alltrim(copy(linhaDeDados,45,6))+'/'+alltrim(copy(linhaDeDados,51,2));

      objEstruturaTitulos.valor_principal := strToFloat(copy(linhaDeDados,30,13))/100;

      if alltrim(copy(linhaDeDados,20,10)) <> '' then
        objEstruturaTitulos.vencimento := strToDate(copy(linhaDeDados,20,10));


    end;

    objEstruturaTitulos.banco := alltrim(copy(linhaDeDados,53,3));;


    objEstruturaTitulos.atualizar := 'S';

    //if alltrim(copy(linhaDeDados,210,2)) <> '' then
    //objEstruturaTitulos.emissao := strToDate(copy(linhaDeDados,210,2)+'/'+copy(linhaDeDados,212,2)+'/'+copy(linhaDeDados,214,4));




end;

function LerArquivoRemessa.lerRemessaCasaPio( linhaDeDados :string; nomeFantasia:string ) : boolean;
var contaTelefones : integer;
var cpf:string;
begin



  if copy(linhaDeDados,1,1) = '2' then  // registro 2 = dados dos clientes
  begin

    objEstruturaDevedor.limparBuffer();

    objEstruturaDevedor.cgc_cpf    := alltrim(copy(linhaDeDados,67,11)); // cpf

    objEstruturaDevedor.nome       := alltrim(copy(linhaDeDados,13,50));
    //objEstruturaDevedor.codigo     := IntToStr(strToInt(copy(linhaDeDados,47,18)));

    objEstruturaDevedor.pk_cliente := _pk_cliente;

    objEstruturaDevedor.data_nasc  := StrToDate( copy(linhaDeDados, 78,2)+'/'+copy(linhaDeDados, 80,2)+'/'+copy(linhaDeDados,82 ,4));


    //objEstruturaDevedor.rg         := alltrim(copy(linhaDeDados,243,11));
    //  objEstruturaDevedor.orgao_rg   := alltrim(copy(linhaDeDados,254,5));
    //  objEstruturaDevedor.sexo       := alltrim(copy(linhaDeDados,289,1));
    //  objEstruturaDevedor.profissao  := alltrim(copy(linhaDeDados,259,30));


      objEstruturaDevedor.tipo_logradouro := copy(linhaDeDados, 110,2);
      objEstruturaDevedor.logradouro      := alltrim(copy(linhaDeDados,112 ,70));
      objEstruturaDevedor.complemento     := copy(linhaDeDados, 182,40)+' '+copy(linhaDeDados, 228,4);
      objEstruturaDevedor.numero          := copy(linhaDeDados, 222,5);

      objEstruturaDevedor.ponto_referencia:= copy(linhaDeDados, 232,100);

      objEstruturaDevedor.cep             := alltrim(copy(linhaDeDados, 332,8));
      objEstruturaDevedor.bairro          := alltrim(copy(linhaDeDados, 340,40));
      objEstruturaDevedor.cidade          := alltrim(copy(linhaDeDados, 370,30));
      objEstruturaDevedor.uf              := alltrim(copy(linhaDeDados, 400,2));
      //    objEstruturaDevedor.email           := copy(linhaDeDados, 313,70);


      objEstruturaDevedor.tiposTelefones1 := 'Residencial Fixo';
      objEstruturaDevedor.numerosTelefones1 := alltrim(copy(linhaDeDados, 86,4)) + ' '+alltrim(copy(linhaDeDados, 90,8));
      inc(contaTelefones);

      objEstruturaDevedor.tiposTelefones1 := 'Celular';
      objEstruturaDevedor.numerosTelefones1 := alltrim(copy(linhaDeDados, 98,4)) + ' '+alltrim(copy(linhaDeDados, 102,8));
      inc(contaTelefones);


      objEstruturaDevedor.profissao := copy(linhaDeDados, 672,30);

      objEstruturaDevedor.trabalho_nome    := copy(linhaDeDados, 402,40);
      objEstruturaDevedor.trab_logradouro  := copy(linhaDeDados, 442,3)+' '+copy(linhaDeDados, 444,70);
      objEstruturaDevedor.trab_complemento := copy(linhaDeDados, 514,40);
      objEstruturaDevedor.trab_numero      := copy(linhaDeDados, 554,5);
      objEstruturaDevedor.trab_cep         := copy(linhaDeDados, 560,8);
      objEstruturaDevedor.trab_bairro      := copy(linhaDeDados, 568,30);
      objEstruturaDevedor.trab_cidade      := copy(linhaDeDados, 598,30);
      objEstruturaDevedor.trab_uf          := copy(linhaDeDados, 628,2);
      //objEstruturaDevedor.trab_ponto_refer := '';

      objEstruturaDevedor.tiposTelefones2 := 'Empresa Fixo';
      objEstruturaDevedor.numerosTelefones2 := alltrim(copy(linhaDeDados, 630,4)) + ' '+alltrim(copy(linhaDeDados, 634,8));
      inc(contaTelefones);

      objEstruturaDevedor.tiposTelefones3 := alltrim(copy(linhaDeDados, 802,18));
      objEstruturaDevedor.numerosTelefones3 := alltrim(copy(linhaDeDados, 830,10));
      inc(contaTelefones);

      objEstruturaDevedor.tiposTelefones4 := alltrim(copy(linhaDeDados, 840,18));
      objEstruturaDevedor.numerosTelefones4 := alltrim(copy(linhaDeDados, 868,10));
      inc(contaTelefones);



  end
  else if copy(linhaDeDados,1,1) = '4' then // registro 4 = dados dos titulos
  begin

    { Títulos }

    objEstruturaTitulos.limparBuffer;

    //objEstruturaTitulos.pk_devedor := pk_devedor;
    objEstruturaTitulos.pk_cliente := _pk_cliente;

    objEstruturaTitulos.data_inclusao:= date;


    if strToInt(copy(linhaDeDados,39,12)) > 0 then
    begin
      //objEstruturaTitulos.tipo_titulo := alltrim(copy(linhaDeDados,2,1));;
      objEstruturaTitulos.numeroTitulo := alltrim(copy(linhaDeDados,3,25))+'/'+alltrim(copy(linhaDeDados,28,3));

      objEstruturaTitulos.valor_principal := strToFloat(copy(linhaDeDados,39,12))/100;

      if alltrim(copy(linhaDeDados,31,8)) <> '' then
        objEstruturaTitulos.vencimento := strToDate(copy(linhaDeDados,31,2)+'/'+copy(linhaDeDados,33,2)+'/'+copy(linhaDeDados,35,4));



    end;

    //objEstruturaTitulos.banco := alltrim(copy(linhaDeDados,53,3));;


    objEstruturaTitulos.atualizar := 'S';

    //if alltrim(copy(linhaDeDados,210,2)) <> '' then
    //objEstruturaTitulos.emissao := strToDate(copy(linhaDeDados,210,2)+'/'+copy(linhaDeDados,212,2)+'/'+copy(linhaDeDados,214,4));


  end;


end;


function LerArquivoRemessa.lerPagamentosRedesplan( linhaDeDados :string ) : boolean;
var creditos : integer;
parte : TStringList;
begin

  objEstruturaPagamentos.limparBuffer();

  linhaDeDados :=alltrim(linhaDeDados);
  if (linhaDeDados <> ' ') and (linhaDeDados <> '') then
  begin

    parte := TStringList.Create;
    try

{
DataGeracao;Cartao;CPF;DataPagamento;ValorPago;DiasAtrasoAtual;DiasAtrasoNaDataPagto;SaldoConta;StatusConta;StatusAcordo;DataAcordo;ValorInicialAcordo;SaldoDevedorAcordo;CarteiraContabil;LimiteTotal;LimiteDisponivel
     0        1     2       3            4            5                6                  7           8           9          10             11                12                  13             14        15
}

      parte.Clear;
      linhaDeDados := StringReplace(linhaDeDados, ';;', ';0;', [rfReplaceAll]);
      ExtractStrings([';'],[], PChar(linhaDeDados), parte);


      objEstruturaPagamentos.cgc_cpf    := parte[2];
      objEstruturaPagamentos.pk_cliente := _pk_cliente;
      objEstruturaPagamentos.data_pgto    := strToDate(copy(parte[3],9,2)+'/'+copy(parte[3],6,2)+'/'+copy(parte[3],1,4));
      objEstruturaPagamentos.valor_pgto   := strToFloat(parte[4]);

      objEstruturaPagamentos.diasAtraso   := strToInt(parte[6]);
      objEstruturaPagamentos.saldo_divida  := strToFloat(parte[7]);


    finally
      parte.Free;
    end;


  end;

end;

function LerArquivoRemessa.lerRetiradaRedesplan( linhaDeDados :string ) : boolean;
var creditos : integer;
parte : TStringList;
begin

  objEstruturaRetirada.limparBuffer();

  linhaDeDados :=alltrim(linhaDeDados);
  if (linhaDeDados <> ' ') then
  begin

    parte := TStringList.Create;
    try

{
CPF;CARTAO;VALOR
}

      parte.Clear;
      linhaDeDados := StringReplace(linhaDeDados, ';;', ';0;', [rfReplaceAll]);
      linhaDeDados := StringReplace(linhaDeDados, ';;', ';0;', [rfReplaceAll]);
      linhaDeDados := StringReplace(linhaDeDados, ';;', ';0;', [rfReplaceAll]);
      ExtractStrings([';'],[], PChar(linhaDeDados), parte);


      objEstruturaRetirada.cgc_cpf    := copy(parte[0],4,11);
      objEstruturaRetirada.pk_cliente := _pk_cliente;
      objEstruturaRetirada.data_retirada := date;

    finally
      parte.Free;
    end;


  end;

end;

function LerArquivoRemessa.lerPagamentosCasaPio( linhaDeDados :string ) : boolean;
var creditos : integer;
parte : TStringList;
begin


  if copy(linhaDeDados,1,1) = '2' then  // registro 1 = dados dos clientes
  begin

    objEstruturaDevedor.limparBuffer();

    objEstruturaDevedor.cgc_cpf    := alltrim(copy(linhaDeDados,66,11));
    objEstruturaDevedor.pk_cliente := _pk_cliente;

  end
  else if (copy(linhaDeDados,1,1) = '4') and (copy(linhaDeDados,2,1) = 'R') then
  begin
    objEstruturaPagamentos.limparBuffer();

    try

      objEstruturaPagamentos.pk_cliente := _pk_cliente;
      objEstruturaPagamentos.cgc_cpf := objEstruturaDevedor.cgc_cpf;
      objEstruturaPagamentos.numero_titulo := alltrim(copy(linhaDeDados,3,25))+'/'+alltrim(copy(linhaDeDados,28,3));
      objEstruturaPagamentos.tipo  := alltrim(copy(linhaDeDados,51,1));


    finally
    end;


  end;

end;



function LerArquivoRemessa.lerAcordosRedesplan( linhaDeDados :string ) : boolean;
var creditos : integer;
parte : TStringList;
begin

  objEstruturaAcordos.limparBuffer();

  linhaDeDados :=alltrim(linhaDeDados);
  if (linhaDeDados <> ' ') then
  begin

    parte := TStringList.Create;
    try
//ID_CONTA;CPF;SALDOATUALFINAL;STATUSCONTA;DATAACORDO;DATAVENCIMENTOCOBRANCA;VALORACORDO;DATAVENCIMENTOENTRADA;VALORENTRADAACO;QUANTIDADEPARCELAS;VALORPARCELA1;QTDPAGREALIZADO;TOTALPAGAMENTOS;USUARIORESPONSAVELACORDO;CARTAO;NOME;NOMELOGRADOURO;BAIRRO;CIDADE;UF;DDD_RES;TEL_RES;DDD_COM;TEL_COM;DDD_CEL;TEL_CEL;DDD_REF1;TEL_REF1;DDD_REF2;TEL_REF2
//   0      1         2             3          4               5                 6                7                   8             9                  10

      parte.Clear;
      linhaDeDados := StringReplace(linhaDeDados, ';;', ';-;', [rfReplaceAll]);
      ExtractStrings([';'],[], PChar(linhaDeDados), parte);

      if parte[1] <> '' then
      begin

        objEstruturaAcordos.linha    := linhaDeDados;
        objEstruturaAcordos.cgc_cpf    := copy(parte[1],4,11);
        objEstruturaAcordos.pk_cliente := _pk_cliente;

        objEstruturaAcordos.data_acordo    := strToDate(parte[4]);
        objEstruturaAcordos.total_acordo   := strToFloat(parte[6] ); // strToFloat(StringReplace(parte[6], ',', '.', [rfReplaceAll, rfIgnoreCase]));

        objEstruturaAcordos.data_entrada   := strToDate(parte[7]);
        objEstruturaAcordos.valor_entrada   := strToFloat(parte[8]);

        objEstruturaAcordos.qtde_parcelas   := strToint(parte[9]);
        objEstruturaAcordos.valor_parcela   := strToFloat(parte[10] );// strToFloat(StringReplace(parte[10], ',', '.', [rfReplaceAll, rfIgnoreCase]));


      end;


    finally
      parte.Free;
    end;


  end;

end;



function LerArquivoRemessa.lerRemessaEsplanada( linhaDeDados :string ) : boolean;
var contaTelefones : integer;
var cpf:string;
begin


  objEstruturaDevedor.limparBuffer();

  cpf := objEstruturaDevedor.cgc_cpf;

  //if not pesquisarDevedor(pk_cliente, objEstruturaDevedor.cgc_cpf) then
  //begin

    objEstruturaDevedor.cgc_cpf    := alltrim(copy(linhaDeDados,257,18));
    objEstruturaDevedor.nome       := alltrim(copy(linhaDeDados,23,50));
    //objEstruturaDevedor.codigo     := copy(linhaDeDados,47,18);
    objEstruturaDevedor.pk_cliente := pk_cliente;

    //objEstruturaDevedor.rg         := '';
    //objEstruturaDevedor.orgao_rg        := '';
    //objEstruturaDevedor.data_nasc       := StrToDate( copy(linhaDeDados, 78,2)+'/'+copy(linhaDeDados, 80,2)+'/'+copy(linhaDeDados, 82,2));

    //objEstruturaDevedor.tipo_logradouro := copy(linhaDeDados, 110,1);
    objEstruturaDevedor.logradouro      := alltrim(copy(linhaDeDados, 73,50));
    objEstruturaDevedor.bairro          := alltrim(copy(linhaDeDados, 123,14));
    objEstruturaDevedor.cep             := alltrim(copy(linhaDeDados, 137,8));
    objEstruturaDevedor.cidade          := alltrim(copy(linhaDeDados, 145,15));
    objEstruturaDevedor.uf              := alltrim(copy(linhaDeDados, 160,2));
//    objEstruturaDevedor.email           := copy(linhaDeDados, 313,70);

    //objEstruturaDevedor.complemento     := copy(linhaDeDados, 182,40)+','+copy(linhaDeDados, 228,3);
    //objEstruturaDevedor.numero          := copy(linhaDeDados, 222,6);
    //objEstruturaDevedor.ponto_referencia:= copy(linhaDeDados, 232,100);

    //objEstruturaDevedor.telefones        := '';
    //objEstruturaDevedor.trabalho_nome    := copy(linhaDeDados, 402,40);
    //objEstruturaDevedor.trab_logradouro  := copy(linhaDeDados, 402,2)+' '+copy(linhaDeDados, 444,70);
    //objEstruturaDevedor.trab_complemento := copy(linhaDeDados, 514,40);
    //objEstruturaDevedor.trab_numero      := copy(linhaDeDados, 554,6);
    //objEstruturaDevedor.trab_cep         := copy(linhaDeDados, 560,8);
    //objEstruturaDevedor.trab_bairro      := copy(linhaDeDados, 568,30);
    //objEstruturaDevedor.trab_cidade      := copy(linhaDeDados, 598,30);
    //objEstruturaDevedor.trab_uf          := copy(linhaDeDados, 628,2);
    //objEstruturaDevedor.trab_ponto_refer := '';

    objEstruturaDevedor.tiposTelefones1 := 'Residencial';
    objEstruturaDevedor.numerosTelefones1 := alltrim(copy(linhaDeDados, 162,18));
    inc(contaTelefones);

    objEstruturaDevedor.tiposTelefones2 := 'Residencial 2';
    objEstruturaDevedor.numerosTelefones2 := alltrim(copy(linhaDeDados, 180,18));
    inc(contaTelefones);


  //end;

  objEstruturaTitulos.limparBuffer;

  //objEstruturaTitulos.pk_devedor := pk_devedor;
  objEstruturaTitulos.pk_cliente := pk_cliente;
  objEstruturaTitulos.tipo_titulo := 'DP';
  objEstruturaTitulos.numeroTitulo := alltrim(copy(linhaDeDados,198,8))+alltrim(copy(linhaDeDados,206,4));

  if alltrim(copy(linhaDeDados,241,16)) <> '' then
    objEstruturaTitulos.valor_principal := strToFloat(copy(linhaDeDados,241,16));
  if alltrim(copy(linhaDeDados,222,2)) <> '' then
    objEstruturaTitulos.vencimento := strToDate(copy(linhaDeDados,222,2)+'/'+copy(linhaDeDados,224,2)+'/'+copy(linhaDeDados,226,4));

  if alltrim(copy(linhaDeDados,210,2)) <> '' then
    objEstruturaTitulos.emissao := strToDate(copy(linhaDeDados,210,2)+'/'+copy(linhaDeDados,212,2)+'/'+copy(linhaDeDados,214,4));

  objEstruturaTitulos.atualizar := 'S';


end;


function LerArquivoRemessa.lerRemessaEletroCentral( linhaDeDados :string ) : string;
var contaTelefones : integer;
var cpf:string;
var colunas :array of String;
var col : integer;

var contaCol: integer;
var res, campo, linhaOrigem:string;

begin

  linhaOrigem := linhaDeDados;
  _errosArquivo := '';
  SetLength(colunas,0);

  res:='';

  // -----------------------------
  // transforma string em array

  SetLength(colunas,0);

  contaCol:=0;
  while (pos(';',linhaDeDados)>0) and (contaCol<21) do
  begin

   SetLength(colunas,contaCol+2);
   campo := copy(linhaDeDados,1, pos(';',linhaDeDados)-1 );
   linhaDeDados := copy(linhaDeDados,pos(';',linhaDeDados)+1, Length(linhaDeDados) );

   colunas[contaCol+1] := campo;
   inc(contaCol);

  end;
  if linhaDeDados <> '' then
  begin
   SetLength(colunas,contaCol+2);
   colunas[contaCol] := linhaDeDados;
  end;
  // --------------------------

  { Layout
  CODIGO;DEVEDOR;CPF;RG;ENDERECO;BAIRRO;CIDADE;UF;CEP;TEL_1;TEL_2;CELULAR;NR_TITULO;DT_LANCAMENTO;DT_VENCIMENTO;VLR_TITULO;VLR_TITULO_ATUALIZADO;CHEQUE_MOT_DEVOLUCAO;BANCO;AGENCIA;CONTA_CORRENTE;OBSERVACOES
     1      2     3   4   5         6      7    8  9   10     11    12       13         14           15              16        17                    18                 19   20       21               22
  }

  objEstruturaDevedor.limparBuffer();

  if (length(colunas[3])>0 )and  (alltrim(colunas[3]) <> 'CPF') and (contaCol+1 = 22) then
  begin

    //cpf := objEstruturaDevedor.cgc_cpf;

    //if not pesquisarDevedor(pk_cliente, objEstruturaDevedor.cgc_cpf) then
    //begin
      res:='R';

      colunas[3] := alltrim(colunas[3]);
      if length(colunas[3]) < 11 then
        colunas[3] := urotinas.Padlzero(colunas[3],11);

      objEstruturaDevedor.cgc_cpf    := urotinas.limpaFormatacao(alltrim(colunas[3]));

      objEstruturaDevedor.nome       := alltrim(colunas[2]);
      objEstruturaDevedor.codigo     := alltrim(colunas[1]);
      objEstruturaDevedor.pk_cliente := pk_cliente;

      //objEstruturaDevedor.rg         := alltrim(colunas[4]);
      //objEstruturaDevedor.orgao_rg        := '';
      //objEstruturaDevedor.data_nasc       := StrToDate( copy(linhaDeDados, 78,2)+'/'+copy(linhaDeDados, 80,2)+'/'+copy(linhaDeDados, 82,2));

      //objEstruturaDevedor.tipo_logradouro := copy(linhaDeDados, 110,1);
      objEstruturaDevedor.logradouro      := alltrim(colunas[5]);
      objEstruturaDevedor.bairro          := alltrim(colunas[6]);
      objEstruturaDevedor.cep             := alltrim(colunas[9]);
      objEstruturaDevedor.cidade          := alltrim(colunas[7]);
      objEstruturaDevedor.uf              := alltrim(colunas[8]);
    //    objEstruturaDevedor.email           := copy(linhaDeDados, 313,70);

      //objEstruturaDevedor.complemento     := copy(linhaDeDados, 182,40)+','+copy(linhaDeDados, 228,3);
      //objEstruturaDevedor.numero          := copy(linhaDeDados, 222,6);
      //objEstruturaDevedor.ponto_referencia:= copy(linhaDeDados, 232,100);

      //objEstruturaDevedor.telefones        := '';
      //objEstruturaDevedor.trabalho_nome    := copy(linhaDeDados, 402,40);
      //objEstruturaDevedor.trab_logradouro  := copy(linhaDeDados, 402,2)+' '+copy(linhaDeDados, 444,70);
      //objEstruturaDevedor.trab_complemento := copy(linhaDeDados, 514,40);
      //objEstruturaDevedor.trab_numero      := copy(linhaDeDados, 554,6);
      //objEstruturaDevedor.trab_cep         := copy(linhaDeDados, 560,8);
      //objEstruturaDevedor.trab_bairro      := copy(linhaDeDados, 568,30);
      //objEstruturaDevedor.trab_cidade      := copy(linhaDeDados, 598,30);
      //objEstruturaDevedor.trab_uf          := copy(linhaDeDados, 628,2);
      //objEstruturaDevedor.trab_ponto_refer := '';

      if alltrim(colunas[10]) <> '' then
      begin
        objEstruturaDevedor.tiposTelefones1 := 'Residencial';
        objEstruturaDevedor.numerosTelefones1 := alltrim(colunas[10]);
        inc(contaTelefones);
      end;

      if alltrim(colunas[11]) <> '' then
      begin
        objEstruturaDevedor.tiposTelefones2 := 'Residencial 2';
        objEstruturaDevedor.numerosTelefones2 := alltrim(colunas[11]);
        inc(contaTelefones);
      end;

      if alltrim(colunas[12]) <> '' then
      begin
        objEstruturaDevedor.tiposTelefones2 := 'Celular';
        objEstruturaDevedor.numerosTelefones2 := alltrim(colunas[12]);
        inc(contaTelefones);
      end;
    //end;

    objEstruturaTitulos.limparBuffer;

    //objEstruturaTitulos.pk_devedor := pk_devedor;
    objEstruturaTitulos.pk_cliente := pk_cliente;
    objEstruturaTitulos.tipo_titulo := 'DP';

    if alltrim(colunas[13]) = '' then
      objEstruturaTitulos.numeroTitulo := colunas[15]
    else
      objEstruturaTitulos.numeroTitulo := alltrim(colunas[13]);

    colunas[16] := urotinas.TiraCifra(colunas[16]);
    if pos('.', colunas[16])>0 then
      colunas[16] := copy(colunas[16], 1, pos('.', colunas[16])-1 ) + copy(colunas[16], pos('.', colunas[16])+1, Length(colunas[16]) );


    if alltrim(colunas[16]) <> '' then
      objEstruturaTitulos.valor_principal := strToFloat(colunas[16]);
    if alltrim(colunas[15]) <> '' then
      objEstruturaTitulos.vencimento := strToDate(colunas[15]);

    if alltrim(colunas[14]) <> '' then
      objEstruturaTitulos.emissao := strToDate(colunas[14]);

    objEstruturaTitulos.atualizar := 'S';

  end
  else
  begin
    if ( contaCol+1<> 22) then
      _errosArquivo := 'TOTAL DE COLUNAS NA LINHA -> '+IntToStr(contaCol+1)+' '+linhaOrigem;

  end;


  result:= res;

end;


end.
