unit UEnviarReceberEmails;

interface

uses Classes, Db,ADODB, UCriptografarDados,SysUtils,Variants,IdSMTP,IdMessageClient,IdTCPClient,
     windows,IdTCPConnection,IdPOP3,IdMessage,IdAntiFreezeBase,IdAntiFreeze,IdBaseComponent,IdComponent ;

type

  OperacaoReceberEmails = Class
    private


      FUtilizaServicoEmail: boolean;
      FArquivosRecebidos  : string ;
      FComputador         : string;
      FUsername           : string;
      FPassword           : string;
      FHost               : string;
      Fport               : integer;
      FServidorRequerAut  : string;
      FcontaDestino       : string;
      FtipoLogin          : string;

      FchaveCriptografia  : string;
      FtextoDoEmail       : string;
      FConexao            : TAdoConnection;

      FtbTabelas          : TADOQuery;
      FtbPessoas          : TADOQuery;
      FtbCheques          : TADOQuery;
      FtbEventos          : TADOQuery;
      FtbNegociacao       : TADOQuery;
      FtbCorrecao         : TADOQuery;

      function formataDadosDoEmailRecebido(textoDoEmail:string) : string;
      function preencheTabelas(Tabela : TADOQuery; camposDaTabela: array of string; dadosDaTabela : array of string; nomeTabela:string; dataAlteracao:string ; horaAlteracao:string; nomeDaTabela:string) : string;
      function conectarPOP3 : boolean;
      function receberEmailServidor : string;
    public
      constructor Create(conexao : TAdoConnection);
      destructor Destroy();

      property ArquivosRecebidos: string read FArquivosRecebidos write FArquivosRecebidos;
      property chaveCriptografia: string read FchaveCriptografia write FchaveCriptografia;
      property textoDoEmail : string read FtextoDoEmail write FtextoDoEmail;

      property UtilizaServicoEmail : boolean read FUtilizaServicoEmail write FUtilizaServicoEmail;
      property tipoLogin : string read FtipoLogin write FtipoLogin;
      property contaDestino : String read FcontaDestino write FcontaDestino;
      property conexao  : TAdoConnection read FConexao write FConexao;
      property Computador: string read FComputador write FComputador;
      property Username : string read FUsername write FUsername;
      property Password : string read FPassword write FPassword;
      property Host     : string read FHost write FHost;
      property port     : integer read Fport write Fport;
      property ServidorRequerAut : string read FServidorRequerAut write FServidorRequerAut;

      property tbTabelas    : TADOQuery read FtbTabelas write FtbTabelas;
      property tbPessoas    : TADOQuery read FtbPessoas write FtbPessoas;
      property tbCheques    : TADOQuery read FtbCheques write FtbCheques;
      property tbEventos    : TADOQuery read FtbEventos write FtbEventos;
      property tbNegociacao : TADOQuery read FtbNegociacao write FtbNegociacao;
      property tbCorrecao   : TADOQuery read FtbCorrecao write FtbCorrecao;

      function receberEmails:string;

  end;


  OperacaoEnviarEmails = Class
    private

      FComputador   : string;
      FUsername     : string;
      FContaOrigem  : string;
      FPassword     : string;
      FHost         : string;
      Fport         : integer;
      FContaDestino : string;
      FServidorRequerAut : string;
      FUtilizaServicoEmail: boolean;

      FConexao : TAdoConnection;
      FchaveCriptografia : string;
      function formataData(data:TDateTime): string;
      function formataDataHora(data:TDateTime): string;
      function formataHora(data:TDateTime): string;
      function formataDadosDasTabelasParaEnviar(tabela:string) : string;
      function conectarSMTP : boolean;

    public
      constructor Create();
      //destructor Destroy;

      property UtilizaServicoEmail: boolean read FUtilizaServicoEmail write FUtilizaServicoEmail;
      property conexao      : TAdoConnection read FConexao write FConexao;
      property Computador   : string read FComputador write FComputador;
      property Username     : string read FUsername write FUsername;
      property ContaOrigem  : string read FContaOrigem write FContaOrigem;
      property Password     : string read FPassword write FPassword;
      property ContaDestino : string read FContaDestino write FContaDestino;
      property Host         : string read FHost write FHost;
      property port         : integer read Fport write Fport;
      property ServidorRequerAut : string read FServidorRequerAut write FServidorRequerAut;

      property chaveCriptografia: string read FchaveCriptografia write FchaveCriptografia;

      function enviarEmails:string;

  end;

var Criptografar: CriptografarDados;
    MSG    : TIdMessage;
    IdSMTP1: TIdSMTP;
    FIdAntiFreeze1: TIdAntiFreeze;
    IdPOP31: TIdPOP3;

implementation

constructor OperacaoEnviarEmails.Create();
begin
  chaveCriptografia := '12112005';
    MSG             := TIdMessage.Create(nil);
    IdSMTP1         := TIdSMTP.Create(nil);
    FIdAntiFreeze1  := TIdAntiFreeze.Create(nil);
    IdPOP31         := TIdPOP3.Create(nil);

end;


function OperacaoEnviarEmails.conectarSMTP : boolean;
begin

  if IdSMTP1.Connected then
    result := IdSMTP1.Connected
  else
  begin
    IdSMTP1.Username            := Username;
    IdSMTP1.Password            := Password;
    IdSMTP1.Host                := Host;
    IdSMTP1.port                := port;

    if ServidorRequerAut = 'S' then
      IdSMTP1.AuthenticationType  := atLogin
    else
      IdSMTP1.AuthenticationType  := atNone;

    try
      IdSMTP1.Connect();
    except
    end;
    result := IdSMTP1.Connected;
  end;

end;


function OperacaoEnviarEmails.enviarEmails : string;
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
    result:='Não gerado Arquivo de envio.';
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

function OperacaoEnviarEmails.formataDadosDasTabelasParaEnviar( tabela:string) : string;
var  qry: TADODataSet;
var cabecalho, registro,conteudo, campo:string;
var i:integer;
var fieldDef : TFieldDef;
begin


  qry := TADODataSet.Create(nil);
  with qry do
  begin
    Connection := conexao;
    CommandText       := 'select * from '+tabela+' where ENVIO is null';
    open;
  end;
  if qry.recordCount = 0 then
    exit;

  cabecalho := '     [NOMEDATABELA]='+tabela+'; [CAMPOSDATABELA]='+IntToStr(qry.FieldCount )+';';
  for i := 0 to qry.FieldCount - 1 do
     cabecalho := cabecalho + Qry.Fields[i].FieldName + ';';

  conteudo := '';
  registro := '';
  while not qry.eof do
  begin
    registro := '[DATAALT]='+formataData(qry.fieldbyname('alteracao').asDateTime)+'[HORAALT]='+formataHora(qry.fieldbyname('alteracao').AsDateTime)+';';
    for i := 0 to qry.FieldCount - 1 do
    begin
      campo := '';
      fieldDef := qry.FieldDefList.Find( Qry.Fields[i].FieldName );
      if (FieldDef.DataType = ftInteger) or (FieldDef.DataType = ftSmallInt) then
        campo := IntToStr( Qry.Fields[i].asInteger )
      else if (FieldDef.DataType = ftFloat) or (FieldDef.DataType = ftBCD) then
        campo := FloatToStr( Qry.Fields[i].asFloat )
      else if (FieldDef.DataType = ftWideString) or (FieldDef.DataType = ftString) or (FieldDef.DataType = ftFixedChar) or (FieldDef.DataType = ftMemo) or (FieldDef.DataType = ftBlob) then
        campo := Qry.Fields[i].AsString
      else if FieldDef.DataType = ftDateTime then
        campo := FormataDataHora(Qry.Fields[i].AsDateTime);
      registro := registro+campo+';';
    end;

    conteudo := conteudo+registro+'[FIMREG]';

    qry.edit;
    qry.FieldByName('envio').value := now;
    qry.post;

    qry.next;
  end;

  qry.Free;

  result := cabecalho+conteudo;

end;


function OperacaoEnviarEmails.formataDataHora(data:TDateTime): string;
begin
  result := '';
  if data > 0 then
  begin
    result := FormatDateTime('dd/mm/yyyy hh:mm:ss',data);
  end;
end;

function OperacaoEnviarEmails.formataData(data:TDateTime): string;
begin
  result := '';
  if data > 0 then
  begin
    result := FormatDateTime('dd/mm/yyyy',data);
  end;
end;
function OperacaoEnviarEmails.formataHora(data:TDateTime): string;
begin
  result := '';
  if data > 0 then
  begin
    result := FormatDateTime('hh:mm:ss',data);
  end;
end;




destructor OperacaoReceberEmails.Destroy();
begin
  tbTabelas.free;
  tbPessoas.free;
  tbCheques.free;
  tbEventos.free;
  tbNegociacao.free;
end;

constructor OperacaoReceberEmails.Create(conexao : TAdoConnection);
begin
  chaveCriptografia := '12112005';

  MSG             := TIdMessage.Create(nil);
  IdSMTP1         := TIdSMTP.Create(nil);
  FIdAntiFreeze1  := TIdAntiFreeze.Create(nil);
  IdPOP31         := TIdPOP3.Create(nil);

  tbTabelas    := TADOQuery.Create(nil);
  tbTabelas.Connection := conexao;
  tbTabelas.SQL.text       := 'select * from TABELAS';
  tbTabelas.open;

  tbPessoas    := TADOQuery.Create(nil);
  tbPessoas.Connection := conexao;
  tbPessoas.SQL.text       := 'select * from PESSOAS where 1=2';
  tbPessoas.open;

  tbCheques    := TADOQuery.Create(nil);
  tbCheques.Connection := conexao;
  tbCheques.SQL.text       := 'select * from CHEQUES where 1=2';
  tbCheques.open;

  tbEventos    := TADOQuery.Create(nil);
  tbEventos.Connection := conexao;
  tbEventos.SQL.text       := 'select * from EVENTOS where 1=2';
  tbEventos.open;

  tbNegociacao := TADOQuery.Create(nil);
  tbNegociacao.Connection := conexao;
  tbNegociacao.SQL.text       := 'select * from NEGOCIACAO where 1=2';
  tbNegociacao.open;

  tbCorrecao := TADOQuery.Create(nil);
  tbCorrecao.Connection := conexao;
  tbCorrecao.SQL.text       := 'select * from TABELACORRECAO';
  tbCorrecao.open;

end;

function OperacaoReceberEmails.receberEmails : string;
var texto, nomeComputador,pathArquivo,arquivo :string;
var i:integer;
var fFile   : TextFile;
var linha   : string;
begin

  if utilizaServicoEmail then
  begin
    if conectarPOP3 then
    begin
      result := receberEmailServidor;
    end;
  end
  else
  begin

    pathArquivo := 'C:\Sistemas\Arquivos';
    if not DirectoryExists(pathArquivo+'\Lidos') then
      CreateDir(pathArquivo+'\lidos');
    pathArquivo := 'C:\Sistemas\Arquivos\';

    //Criptografar  := CriptografarDados.Create;


    i:=0;
    while i< length(ArquivosRecebidos) do
    begin

      arquivo           := copy(ArquivosRecebidos,0, pos(';',ArquivosRecebidos) -1 );
      ArquivosRecebidos := copy(ArquivosRecebidos,pos(';',ArquivosRecebidos) +1, length(ArquivosRecebidos) );


      if FileExists(pathArquivo+'\'+arquivo) then
      begin
        AssignFile(fFile,pathArquivo+'\'+arquivo);
        reset(fFile);
        ReadLn(fFile,nomeComputador);
        nomeComputador := copy(nomeComputador, pos('=',nomeComputador)+1, length(nomeComputador) );
        ReadLn(fFile,texto);
        closeFile(fFile);
        if nomeComputador <> computador then
        begin
          // descritografa e retorna o texto do e-mail
          //texto   := Criptografar.Crypt('D', texto, chaveCriptografia);
          CopyFile(Pchar(pathArquivo+arquivo),Pchar(pathArquivo+'\lidos\'+arquivo),false);
          DeleteFile(Pchar(pathArquivo+arquivo));

          result  := formataDadosDoEmailRecebido(texto);
        end;
        inc(i);
      end;
    end;
    //Criptografar.free;
  end;


end;

function OperacaoReceberEmails.receberEmailServidor : string;
var
  i, iMax: integer;
  nomeComputador,texto:string;
begin

  Criptografar  := CriptografarDados.Create;

  result:='';
  if utilizaServicoEmail then
  begin

    iMax := IdPOP31.CheckMessages;
    for i := 1 to iMax do
    begin
      msg.Clear;
      IdPOP31.Retrieve(i,msg);
      //mensagem.From.Name;
      nomeComputador := msg.Subject;
      texto          := msg.Body.Text;
      try
        // se a mensagem for para o computador apaga
        if nomeComputador = computador then
        begin
          // descritografa e retorna o texto do e-mail
          texto   := Criptografar.Crypt('D', texto, chaveCriptografia);
          result  := result + formataDadosDoEmailRecebido(texto);
          IdPOP31.Delete(i);
        end;
      except
      end;

    end;
  end
  else
  begin

  end;

  Criptografar.free;

end;


function OperacaoReceberEmails.formataDadosDoEmailRecebido(textoDoEmail:string) : string;
var nomeDaTabela,listaDosCamposDaTabela, linhaComDados, dataAlteracao, horaAlteracao:string;
var contaCampos,posNomeDaTabela, contaCamposComDados, posCampos, posCamposDaTabela,numeroDeCampos:integer;
var camposDaTabela : array of string;
var dadosDaTabela : array of string;
begin

  SetLength( camposDaTabela, 0);
  SetLength( dadosDaTabela, 0);


  Criptografar  := CriptografarDados.Create;
  textoDoEmail  := Criptografar.Crypt('D', textoDoEmail, chaveCriptografia);
  Criptografar.free;

  while length(textoDoEmail)>0 do
  begin


    posNomeDaTabela        := pos('[NOMEDATABELA]',textoDoEmail);
    nomeDaTabela           := copy(textoDoEmail, posNomeDaTabela+15, pos(';',textoDoEmail ));
    nomeDaTabela           := copy(nomeDaTabela, 0                 , pos(';',nomeDaTabela )-1);

    posCamposDaTabela      := pos('[CAMPOSDATABELA]',textoDoEmail);
    listaDosCamposDaTabela := copy(textoDoEmail, posCamposDaTabela+17, pos('[DATAALT]',textoDoEmail ));
    listaDosCamposDaTabela := copy(listaDosCamposDaTabela, 0, pos('[DATAALT]',listaDosCamposDaTabela )-1);

    textoDoEmail           := copy(textoDoEmail, pos('[DATAALT]',textoDoEmail ), length(textoDoEmail));

    numeroDeCampos         := StrToInt(  copy(listaDosCamposDaTabela,0,pos(';',listaDosCamposDaTabela)-1 )  );
    listaDosCamposDaTabela := copy(listaDosCamposDaTabela, pos(';',listaDosCamposDaTabela)+1, length(listaDosCamposDaTabela) );

    SetLength( camposDaTabela, numeroDeCampos);
    SetLength( dadosDaTabela, numeroDeCampos);

    // grava lista de campos no array
    contaCampos := 0;
    //listaDosCamposDaTabela := copy(listaDosCamposDaTabela,pos(';',listaDosCamposDaTabela) +1, length(listaDosCamposDaTabela) );
    while length(listaDosCamposDaTabela)>0 do
    begin
      camposDaTabela[contaCampos]  := copy(listaDosCamposDaTabela,0, pos(';',listaDosCamposDaTabela)-1 );
      listaDosCamposDaTabela       := copy(listaDosCamposDaTabela,pos(';',listaDosCamposDaTabela) +1, length(listaDosCamposDaTabela) );
      inc(contaCampos);
    end;


    while (length(textoDoEmail)>0) and ( (pos('[NOMEDATABELA]',textoDoEmail)>6) or (pos('[NOMEDATABELA]',textoDoEmail) = 0) ) do
    begin
      // grava lista de dados no array - retirando data e hora da Alteração
      dataAlteracao := copy(textoDoEmail, pos('=',textoDoEmail)+1, pos('[HORAALT]',textoDoEmail ));
      dataAlteracao := copy(dataAlteracao, 0                      , pos('[HORAALT]',dataAlteracao )-1);

      horaAlteracao  := copy(textoDoEmail, pos('[HORAALT]',textoDoEmail )+10, length(textoDoEmail));
      horaAlteracao  := copy(horaAlteracao, 0                                , pos(';',horaAlteracao )-1);

      //horaAlteracao := copy(textoDoEmail, 0, pos(';',textoDoEmail )-1 );

      textoDoEmail  := copy(textoDoEmail, pos(';',textoDoEmail )+1, length(textoDoEmail));

      linhaComDados       := copy(textoDoEmail, 0, pos('[FIMREG]',textoDoEmail) -1 );
      contaCamposComDados := 0;
      while length(linhaComDados)>0 do
      begin
        dadosDaTabela[contaCamposComDados]  := copy(linhaComDados,0, pos(';',linhaComDados)-1 );
        linhaComDados                       := copy(linhaComDados,pos(';',linhaComDados) +1, length(linhaComDados) );
        inc(contaCamposComDados);
      end;

      textoDoEmail  := copy(textoDoEmail, pos('[FIMREG]',textoDoEmail)+8, length(textoDoEmail));

      if nomeDaTabela = 'TABELAS'        then preencheTabelas(tbTabelas       ,camposDaTabela, dadosDaTabela,'TABELAS'        , dataAlteracao,horaAlteracao, nomeDaTabela);
      if nomeDaTabela = 'PESSOAS'        then preencheTabelas(tbPessoas       ,camposDaTabela, dadosDaTabela,'PESSOAS'        , dataAlteracao,horaAlteracao, nomeDaTabela);
      if nomeDaTabela = 'CHEQUES'        then preencheTabelas(tbCheques       ,camposDaTabela, dadosDaTabela,'CHEQUES'        , dataAlteracao,horaAlteracao, nomeDaTabela);
      if nomeDaTabela = 'EVENTOS'        then preencheTabelas(tbEventos       ,camposDaTabela, dadosDaTabela,'EVENTOS'        , dataAlteracao,horaAlteracao, nomeDaTabela);
      if nomeDaTabela = 'NEGOCIACAO'     then preencheTabelas(tbNegociacao    ,camposDaTabela, dadosDaTabela,'NEGOCIACAO'     , dataAlteracao,horaAlteracao, nomeDaTabela);
      if nomeDaTabela = 'TABELACORRECAO' then preencheTabelas(tbCorrecao      ,camposDaTabela, dadosDaTabela,'TABELACORRECAO' , dataAlteracao,horaAlteracao, nomeDaTabela);
    end;

  end;
//  result;
end;

function OperacaoReceberEmails.preencheTabelas(Tabela : TADOQuery; camposDaTabela: array of string; dadosDaTabela : array of string; nomeTabela:string; dataAlteracao:string ; horaAlteracao:string; nomeDaTabela:string) : string;
var contaCampos, contaLinhas,i: integer;
var achou : integer;
var fieldDef : TFieldDef;
var camposNaoEncontrados: string;
var found : boolean;
var configuracao:TADOQuery;
var dataAlt:TDateTime;
var fFile   : TextFile;
begin

  found := false;
  if nomeTabela='TABELAS' then
    found := Tabela.Locate('TIPO;CODIGO', VarArrayof( [dadosDaTabela[0],dadosDaTabela[1]]),[]);
  if nomeTabela='PESSOAS' then
  begin
    Tabela.close;
    Tabela.SQL.Text := 'select * from PESSOAS where CGCCPF='''+dadosDaTabela[1]+'''';
    Tabela.open;
    found := Tabela.recordCount > 0;
  end;
  if nomeTabela='CHEQUES' then
  begin
    Tabela.close;
    //Tabela.SQL.Text := 'select * from CHEQUES where BANCO='''+dadosDaTabela[2]+''' and AGENCIA='''+dadosDaTabela[3]+''' and CONTA='''+dadosDaTabela[4]+''' and CHEQUE='''+dadosDaTabela[5]+'''';
    Tabela.SQL.Text := 'select * from CHEQUES where CHAVE='+dadosDaTabela[0];
    Tabela.open;
    found := Tabela.recordCount > 0;//Tabela.Locate('BANCO;AGENCIA;CONTA;CHEQUE', VarArrayof( [dadosDaTabela[2],dadosDaTabela[3],dadosDaTabela[4],dadosDaTabela[5]]),[]);
  end;
  // EVENTOS e NEGOCIACAO, não existe alteração. Por isso, caso venha no email será incluido
  if nomeTabela='TABELACORRECAO' then
  begin
    found := Tabela.Locate('ANOMES', dadosDaTabela[0],[]);
  end;


  if found then
  begin
    if ( length(dataAlteracao)>0 ) then
    begin
      dataAlt := strToDateTime(dataAlteracao+' '+horaAlteracao);
      if Tabela.fieldByName('alteracao').Value > dataAlt then
        exit;
    end;
    Tabela.edit;
  end
  else
    Tabela.append;



  AssignFile(fFile,'C:\Sistemas\'+nomeDaTabela+'_'+formatDateTime('yyyymmdd_hhmmss',now())+'.log');
  rewrite(fFile);

  contaCampos := 0;
  while contaCampos < length(camposDaTabela) do
  begin

    writeln(fFile,UpperCase(camposDaTabela[contaCampos]));


    Achou:=-1;
    i:=0;
    while (i<Tabela.FieldCount) and (achou<0) do
    begin
      if UpperCase(Tabela.Fields[i].FieldName) = UpperCase(camposDaTabela[contaCampos]) then
        Achou:=i;
      i:=i+1;
    end;

    if achou >= 0 then
    begin

      try
        fieldDef := Tabela.FieldDefList.Find( Tabela.Fields[achou].FieldName );
        if (FieldDef.DataType = ftInteger) or (FieldDef.DataType = ftSmallInt) then
          Tabela.Fields[achou].value := strToInt( dadosDaTabela[contaCampos] )
        else if (FieldDef.DataType = ftFloat) or (FieldDef.DataType = ftBCD) then
          Tabela.Fields[achou].value := strToFloat( dadosDaTabela[contaCampos] )
        else if (FieldDef.DataType = ftWideString) or (FieldDef.DataType = ftString) or (FieldDef.DataType = ftFixedChar) or (FieldDef.DataType = ftMemo) or (FieldDef.DataType = ftBlob) then
          Tabela.Fields[achou].value := dadosDaTabela[contaCampos]
        else if FieldDef.DataType = ftDateTime then
        begin
          if length(dadosDaTabela[contaCampos])>0 then
            Tabela.Fields[achou].value := strToDateTime( dadosDaTabela[contaCampos] );
        end;
      except
        on E: Exception do writeLn( ffile, E.Message );
      end;

    end
    else
      camposNaoEncontrados := camposNaoEncontrados+' Campo '+UpperCase(camposDaTabela[contaCampos])+' não encontrado/';

    inc(contaCampos);
  end;
  closeFile(fFile);

  Tabela.post;


//
end;


function OperacaoReceberEmails.conectarPOP3 : boolean;
begin

  IdPOP31.Host       := host;
  IdPOP31.Password   := Password;
  IdPOP31.port       := port;
  if tipoLogin = 'U' then
    IdPOP31.Username := userName
  else
    IdPOP31.Username := contaDestino;

  result:=false;
  if not IdPOP31.Connected then
  begin
    try
      IdPOP31.Connect();
      result := true;
    except
      result := false;
    end;
  end;

end;


end.
