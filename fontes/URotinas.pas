unit URotinas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, jpeg, ExtCtrls, ADODB, RxGIF, PicClip, DBCtrls;

type

  TResultArray = array of string; //<== Defini��o do tipo

  TFRotinas = class(TForm)

    Qry_Sequencial: TADOQuery;
    tbl_Temp: TADOTable;
    Qry_Livre: TADODataSet;
    Qry_Sequencialseq: TIntegerField;
    Qry_Sequencialtabela: TStringField;
    qry_livre2: TADODataSet;
    ADOCommand1: TADOCommand;
    Image1: TImage;
    OpenDialog1: TOpenDialog;

    procedure janelas(janela:string ; nome:string ; palavras:string; menu_princ:string);

    Function acessoValido(janela:string ; palavra:string) : boolean;
    Function Sequencial(pTabela : String) : Integer;

    procedure registraDataServidor();
    Function lerDataServidor() : tDatetime;

    function Param_String(Sigla:string):string;
    function Param_Number(Sigla:string):real;
    function Param_Data(Sigla:string):Tdate;
    function SetParam_String(Sigla:string; valor:string):string;

    function checaValidadeLicenca(validade:TDateTime):boolean;

    Procedure gravaRealizouPGT(chaveOcorrencia : integer; chaveDevedor:integer; obs:string; atualizaNoDevedor:boolean);
    Procedure rateiaRecibo();
    function validaLimiteUsuariosLogados(usuario:integer) : boolean;
    procedure cancelaReciboAnterior(devedor : integer);
    function temAcordoPendente(devedor : integer) : real;
    function excluirRecibos(recibo : real; somenteEmAberto:boolean) : boolean;

    Procedure reprocessaRetencaoBaixaParcialHandara();


    procedure ShowTaskBar(F : Tform);
    procedure HideTaskBar(F : Tform);
    procedure StandardArea(F : Tform);
    procedure FullScreenArea(F : Tform);

    function formato_data_banco() : string;

    function copyField(var vLinha:string;vSeparador:String):string ;

    Function SaltaFeriado(dData:TDateTime):Integer;

  private
    { Private declarations }

  public
    { Public declarations }
      TbTmp_NCampo : Array[1..99] of String;
      TbTmp_TCampo : Array[1..99] of Variant;
      TbTmp_SCampo : Array[1..99] of Integer;
      TbTmp_iCampo : Array[1..5]  of string;



      hot_debugger      : boolean;
      usu_nu            :integer;
      pk_cliente        :integer;
      Usu_Login         : string;
      Usu_Nome          : string;
      Usu_nivel         : integer;
      Usu_Grupo         : integer;
      dtValidade   : TDateTime;


      parte : TResultArray;

      Function CriaTabela(sTabela:string):String;
      Procedure AddCampoTabela(sCampo:string ; sTipo:Variant ; iTamanho:integer);
      Procedure DropAllTabelaTmp;
      Procedure AddIndexTmp(sCampos:string);
      Procedure backupAutomatico(pasta_backup : string; forcarBackup: boolean);

  end;

var
  FRotinas: TFRotinas;

function naturezaDeInclusaoSPCComboDB(combo: TDBComboBox): string;
function motivosDeExclusaoSPCComboDB(combo: TDBComboBox): string;
function split(texto: string; caracter:string): TResultArray;

function tiposDeTituloComboDB(combo: TDBComboBox): string;
function tiposDeTituloCombo(combo: TComboBox): string;

function Padl(Texto: string; Tam: Integer): string;
function Padr(Texto: string; Tam: Integer): string;
function PadrAsteristico(Texto: string; Tam: Integer): string;
function Padlzero(Texto: string; Tam: Integer): string;
function Extenso(pValor: Real): string;
function TiraCifra(Valor: string): string;
function fExtenso(nValor: Real): string;
function ExtensoMil(cVlr: string): string;
function LenNum(Numero: Real): Integer;
function sDigito(Numero:string):String;
function limpaFormatacao(cpf: string): string;
function primeiraPalavra(nome: string): string;
Function DiadaSemana(Data : TDateTime) : string;
function Alltrim (Cadeia : string) : string;

Function Mes_Port(dData:TDateTime):String;
Function Ano_Port(ano:integer):String;

function renSenha_Converte(Texto: string;AcumulaContador:boolean): string;
function renSenha_Reverte(Texto: string): string;

function reportToCsv(pastaArquivo:string; nomeArquivo: string; qry:TADOQuery):string;


{******************}
Function RTrim(ST:String):String;
//Function Alltrim(ST:String):String;
function mUpperCase (nome : string) : string;
Function Espaco_Esquerdo(ST:String;T:Integer):String;
Function Espaco(ST:String;T:Integer):String;
Function EspacoE(ST:String;T:Integer):String;
Function Caractere_Direita(ST:String;caracter:string;T:Integer):String;
Function repeteCaractere(Caracter:string;T:Integer):String;

function FormatCGC(CGC: string): string;
function FormatCPF(CPF_: string): string;
function TestCpf(Cpf_Cgc: string; tipo: string): boolean;
function TestCgf(InscEst: string): boolean;
function Converte(Entrada: string): string;
function LCase(X: Char): Char;
function Arredonda(Valor: Real): Real;
function SoNumero(n :string): boolean;
{**********************************}

Function ValInt(ST:String):Integer;
Function So_Nome(N:TFileName):String;
Function CriptoSergio(ST:String):String;
Function DesCriptoSergio(ST:String):String;
Function StrZero(N:Integer;C:Byte):String;
Function Data_Ing(S:String):String;
Function Redondo(V:Real;D:Byte):Extended;
Function DigitoEAN13(Cod:String):String;
Function Bug2000: Boolean;
Function Corta_2casas(V:Real):Real;
Function UltimoDia(S:String):TDateTime;
Function UltimoDiaMes(D:TDateTime) : TDateTime;
Function Year(dData:TDateTime;idigitos : integer = 4) : Integer;
Function Month(dData:TDateTime) : Integer;
Function Day(dData:TDateTime) : Integer;
Function proximoVenc(data:TDateTime; diaVenc:integer) : TDateTime;
Function divide(valor1: real; valor2:real) : real;
{**********************************}

function renSenha_senha1(cnpj: string; chaveLic: integer): string;
function tiraSinalCPF(cnpj:string):string;

function log(texto:string):string;


implementation
uses UDM;

{$R *.DFM}


Procedure TFRotinas.reprocessaRetencaoBaixaParcialHandara;
var atraso : integer;
var hoje : TDateTime;
var perc_retenc,valor_pgto, valor_retenc : real;
var cperc_retenc,cvalor_retenc : string;
begin

  hoje := date;
  hot_debugger:= true;

  qry_livre.Close;
  qry_livre.CommandText := 'select b.*, t.vencimento from baixasparciais b inner join titulos t on ( t.pk_titulo = b.pk_titulo) where b.pk_titulo is not null ';
  log(qry_livre.CommandText);
  qry_livre.open;


  log('bx paciais: '+ inttostr(qry_livre.recordCount));
  
  qry_livre2.close;
  qry_livre2.CommandText := 'select * from taxas_clientes where pk_cliente=87 order by faixa1 ';
  qry_livre2.open;

  qry_livre.First;

  while not qry_livre.eof do
  begin

    atraso := Trunc(hoje - qry_livre.fieldByname('vencimento').value);

    log('recNo '+inttostr(qry_livre.recNo));
    log('chave bx '+ qry_livre.fieldByname('pk_bxparcial').asstring + ' ch titulo: '+ qry_livre.fieldByname('pk_titulo').asstring );
    log('atraso: '+intToStr(atraso));
    log('ret anterior: '+qry_livre.fieldByname('valor_retenc').asstring);

    qry_livre2.First;
    while not qry_livre2.eof do
    begin
      if (atraso >= qry_livre2.fieldByName('faixa1').AsInteger ) and ( (qry_livre2.fieldByName('faixa2').AsInteger = 0) or (atraso  <= qry_livre2.fieldByName('faixa2').AsInteger) ) then
        perc_retenc := qry_livre2.fieldByName('perc_ret').AsFloat;
      qry_livre2.next;
    end;


    valor_pgto := qry_livre.fieldByname('valor').asfloat;
    valor_retenc:= (perc_retenc/100) * valor_pgto ;
    log('valor pgto: '+floattoStr(valor_pgto ));
    log('taxa rentec: '+floattoStr(perc_retenc));
    log('valor rentec: '+floattoStr(valor_retenc));

    try

      cvalor_retenc := StringReplace(floatTostr(valor_retenc), ',', '.', [rfReplaceAll]);
      cperc_retenc  := StringReplace(floatTostr(perc_retenc), ',', '.', [rfReplaceAll]);

      log('vai gravar: '+'update baixasparciais set taxa_retenc = '+cperc_retenc+', valor_retenc= '+cvalor_retenc+', atraso='+intToStr(atraso)+' where pk_bxparcial= '+qry_livre.fieldByname('pk_bxparcial').asstring );
      ADOCommand1.CommandText := 'update baixasparciais set taxa_retenc = '+cperc_retenc+', valor_retenc= '+cvalor_retenc+', atraso='+intToStr(atraso)+' where pk_bxparcial= '+qry_livre.fieldByname('pk_bxparcial').asstring ;
      ADOCommand1.Prepared;
      ADOCommand1.Execute;
    Except
       on E: Exception do log(E.Message);
    end;

    qry_livre.next;
  end;

  log('fim ');


end;



function split(texto: string; caracter:string): TResultArray;
var partes : TResultArray;
var elem, posicao: integer;
var linha, linha2:string;
begin


  elem:=0;

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

    posicao := pos( caracter,linha );

    if posicao>0 then
    begin

      if copy(linha,1,1)='|' then
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




Function TFRotinas.acessoValido(janela:string ; palavra:string) : boolean;
var select,from,join, where:string;
begin
//

  if not frotinas.validaLimiteUsuariosLogados(frotinas.usu_nu)  then
  begin
    application.Messagebox('Usu�rio j� logado em outra esta��o ou limite de usu�rios logados ultrapassou ao licenciado.','Informa��o',mrOk);
    result:=false;
    exit;
  end;

  if Usu_Grupo = -1 then // administrador
  begin
    result:= true;
    exit;
  end;
  if janela = '' then
  begin
    showmessage('N�o foi informado a janela');
    result:=false;
    exit;
  end;

  select := ' select p.pk_permissao';
  from   := ' from permissoes p';
  join   := ' inner join janelas j on (j.pk_janela=p.pk_janela) ';
  where  := ' where j.opcao_menu='''+janela+''' and pk_grupo='+intToStr(Usu_Grupo);

  if palavra <> '' then
  begin
    join := join + ' inner join janelas_palavras jp on ( jp.pk_palavra=p.pk_palavra and jp.pk_janela = p.pk_janela)';
    where:= where+ ' and jp.palavra like '''+palavra+'%''';

    // verifica se a palavra exibe permiss�o para acesso
    Qry_Livre.close;
    Qry_Livre.CommandText := 'select p.* from janelas_palavras p inner join janelas j on ( j.pk_janela=p.pk_janela) where p.palavra like '''+palavra+'%'' and j.opcao_menu='''+janela+'''';
    Qry_Livre.open;
    if Qry_Livre.recordCount =0 then
    begin
      result:=true;
      exit;
    end;

  end;


  Qry_Livre.close;
  Qry_Livre.CommandText := select+from+join+where;
  Qry_Livre.open;

  result := Qry_Livre.recordCount>0;

end;

Function TFRotinas.Sequencial(pTabela : String) : Integer;
var iSeq : integer;
Begin

   result := 0;
   If pTabela='' then exit;

   pTabela := UpperCase(pTabela);

   try
        FRotinas.Qry_Sequencial.Open;
        FRotinas.Qry_Sequencial.Close;
        FRotinas.Qry_Sequencial.Parameters.ParamByName('Tabela').value := pTabela;
        FRotinas.Qry_Sequencial.Open;
        if FRotinas.Qry_Sequencial.RecordCount = 0 then
        begin
          Qry_Sequencial.append;
          Qry_Sequencialseq.value :=0;
          Qry_Sequencialtabela.value := ptabela;
          Qry_Sequencial.post;
        end;
        Qry_Sequencial.Edit;
        iSeq:=Qry_Sequencial.FieldByName('Seq').AsInteger;
        iSeq:=iSeq+1;
        Qry_Sequencial.FieldByName('Seq').AsInteger := iSeq;
        Qry_Sequencial.Post;
        Result := iSeq;
   Except
        ShowMessage('Erro no Sequencial');
        Result := -1;
   End;

end;

function renSenha_senha1(cnpj: string; chaveLic :integer): string;
var rdata,rcnpj: real;
var senha1:string;
begin

    rcnpj  := strtoFloat(tiraSinalCPF(cnpj));
    rdata := Round( ( ( rcnpj /100500) * chaveLic ) / 100500 );
    senha1:= renSenha_Converte(  floattostr( rdata  ), true);


    result := senha1;
end;

function renSenha_Converte(Texto: string; AcumulaContador:boolean): string;
var senhaAlfa, letras : string;
var k,x:integer;
begin
  letras   := 'DXGBTPFCHOYRQSUDK1A23C45I67J89LMNQ';
  senhaAlfa:='';
  k:=1;
  while k<=length(texto) do
  begin
    if AcumulaContador then
    begin
      x := strtoint(copy(texto,k,1)) + k;
      if copy(senhaAlfa,length(senhaAlfa),1) <> copy(letras,x,1) then
        senhaAlfa := senhaAlfa + copy(letras,x,1);
    end
    else
    begin
      x := strtoint(copy(texto,k,1)) + 1;
      senhaAlfa := senhaAlfa + copy(letras,x,1);
    end;
    inc(k);
  end;
  result := senhaAlfa;
end;

function renSenha_Reverte(Texto: string): string;
var senhaAlfa, letras : string;
var k,x:integer;
begin
  letras   := 'DXGBTPFCHOYRQSUDK1A23C45I67J89LMNQ';
  senhaAlfa:='';
  k:=1;
  while k<=length(texto) do
  begin
    x := pos( copy(texto,k,1) ,letras ) - 1;
    senhaAlfa := senhaAlfa + inttostr(x);
    inc(k);
  end;
  result := senhaAlfa;
end;


Function Year(dData:TDateTime;idigitos : integer = 4) : Integer;
Begin
if iDigitos = 4 then
    result := StrToInt(FormatDateTime( 'YYYY',dData))
else
    result := StrToInt(FormatDateTime( 'YY',dData));

end;

Function Month(dData:TDateTime) : Integer;
Begin
  result := StrToInt(FormatDateTime( 'MM',dData))

end;

Function Day(dData:TDateTime) : Integer;
Begin
  result := StrToInt(FormatDateTime( 'DD',dData))
end;

Function proximoVenc(data:TDateTime; diaVenc:integer) : TDateTime;
Begin
  data := UltimoDiaMes(data);
  data := data + 1;

  result := StrToDate( intToStr(diaVenc) + FormatDateTime( '/MM/YYYY',data) )


end;

function primeiraPalavra(nome: string): string;
begin
  result := copy( nome, 1, pos(' ',nome)-1 ) ;

end;

function log(texto:string):string;
var    f : TextFile;
var linha,nomeArq : string;

begin
  if frotinas.hot_debugger then
  begin

    nomeArq := ExtractFilePath(ParamStr(0))+'\siscob_'+FormatDateTime( 'DDMMYYYY',date)+'.log';

    AssignFile(f,nomeArq);
    {$Iochecks off}
    Append(f);
    {$IoChecks on}
    if IoResult <>0 then
      rewrite(f);
    writeln(f,FormatDateTime( 'DD/MM/YYYY',date)+' '+FormatDateTime( 'hh:mm:ss', time)+' # '+texto);
    CloseFile(f);
 end;

end;

function reportToCsv(pastaArquivo:string; nomeArquivo: string; qry:TADOQuery):string;
var    f : TextFile;
var linha,nomeArq : string;
var countFields, idField : integer;
var aspas : string;
begin

  aspas := '''';
  if pastaArquivo='' then
  begin
    pastaArquivo := ExtractFilePath(ParamStr(0));
    if nomeArquivo ='' then
      nomeArquivo := '\siscob_'+FormatDateTime( 'DDMMYYYY',date)+'.csv';
  end;

  nomeArq := pastaArquivo+'\'+nomeArquivo;  //ExtractFilePath(ParamStr(0))+'\siscob_'+FormatDateTime( 'DDMMYYYY',date)+'.log';

  AssignFile(f,nomeArq);
  {$Iochecks off}
  Append(f);
  {$IoChecks on}
  if IoResult <>0 then
    rewrite(f);


  qry.first;


  countFields := qry.FieldCount;
  linha := '';
  while idField < countFields do
  begin
    linha := linha + qry.fields[idField].FieldName+';';
    inc(idField);
  end;
  writeln(f,linha);


  while not qry.eof do
  begin

    linha := '';
    idField:=0;
    while idField < countFields do
    begin

      if qry.fields[idField].DataType = ftString then
        linha := linha + aspas+qry.FieldByName( qry.fields[idField].FieldName ).asString+';'
      else
        linha := linha + qry.FieldByName( qry.fields[idField].FieldName ).asString+';';

      inc(idField);
    end;

    writeln(f,linha);

    qry.next;
  end;



  CloseFile(f);

end;


function tiraSinalCPF(cnpj:string):string;
begin
  while pos('.',cnpj)>0 do
  begin
   cnpj:=copy(cnpj,1,pos('.',cnpj)-1) + copy(cnpj,pos('.',cnpj)+1,length(cnpj));
  end;
  cnpj:=copy(cnpj,1,pos('/',cnpj)-1) + copy(cnpj,pos('/',cnpj)+1,length(cnpj));
  cnpj:=copy(cnpj,1,pos('-',cnpj)-1) + copy(cnpj,pos('-',cnpj)+1,length(cnpj));
  result:=cnpj;
end;

function limpaFormatacao(cpf: string): string;
var cgccpf:string;
begin
  cgccpf := cpf;
  if pos('.',cgccpf)>0 then
    cgccpf := copy(cgccpf, 1,pos('.',cgccpf)-1)+copy(cgccpf, pos('.',cgccpf)+1, length(cgccpf));
  if pos('.',cgccpf)>0 then
    cgccpf := copy(cgccpf, 1,pos('.',cgccpf)-1)+copy(cgccpf, pos('.',cgccpf)+1, length(cgccpf));
  if pos('.',cgccpf)>0 then
    cgccpf := copy(cgccpf, 1,pos('.',cgccpf)-1)+copy(cgccpf, pos('.',cgccpf)+1, length(cgccpf));
  if pos('/',cgccpf)>0 then
    cgccpf := copy(cgccpf, 1,pos('/',cgccpf)-1)+copy(cgccpf, pos('/',cgccpf)+1, length(cgccpf));
  if pos('-',cgccpf)>0 then
    cgccpf := copy(cgccpf, 1,pos('-',cgccpf)-1)+copy(cgccpf, pos('-',cgccpf)+1, length(cgccpf));
  if pos(' ',cgccpf)>0 then
    cgccpf := copy(cgccpf, 1,pos(' ',cgccpf)-1)+copy(cgccpf, pos(' ',cgccpf)+1, length(cgccpf));
  result := cgccpf;
end;

function FormatCGC(CGC: string): string;
begin
CGC := limpaFormatacao(CGC);
if CGC <> '' then
      FormatCGC := Copy(CGC, 1, 2) + '.' + Copy(CGC, 3, 3) + '.' + Copy(CGC, 6, 3) + '/' + Copy(CGC, 9, 4) + '-' + Copy(CGC, 13, 2)
   else
      FormatCGC := '';
end;


function FormatCPF(CPF_: string): string;
begin
  CPF_ := limpaFormatacao(CPF_);
   if CPF_ <> '' then
      FormatCPF := Copy(CPF_, 1, 3) + '.' + Copy(CPF_, 4, 3) + '.' + Copy(CPF_, 7, 3) + '-' + Copy(CPF_, 10, 2)
   else
      FormatCPF := '';
end;


function Arredonda(Valor: Real): Real;
begin
   Arredonda := StrToFloat(FormatFloat('0.00', Valor));
end;

function SoNumero(n: string): boolean;
var numeros:string;
begin
    numeros := '0123456789';
    result := true;
    while length(n)>0 do
    begin
      if pos( copy(n,1,1),numeros )=0 then
        result:=false;

      n := copy(n,2,length(n));
  end;

end;




function TestCpf(Cpf_CGC: string; tipo: string): boolean;
var
   Som_1, Som_2, Cont, Ct1, Cal_V1, Cal_V2, Cal_D: integer;
   Cpf: string[14];
   Cgc: string[18];
{Cpf_Cgc Tipo(F-Pessoa Fisica J-Pessoa Jur�dica}
begin
   If (Cpf_CGC[1]=' ') or (Cpf_CGC[1]='_')  then
   Begin
      result := true;
      exit;
   End;
   Som_1 := 0;
   Som_2 := 0;
   Cal_V1 := 0;
   Cal_V2 := 0;
   if (tipo = 'F') then
      begin
         Cpf := Cpf_Cgc;
         Ct1 := 2;
         for cont := 9 downto 1 do
            begin
               Som_1 := (Som_1 + (StrToInt(Cpf[Cont]) * Ct1));
               Ct1 := Ct1 + 1;
            end;
         Ct1 := 2;
         for cont := 10 downto 1 do
            begin
               Som_2 := (Som_2 + (StrToInt(Cpf[Cont]) * Ct1));
               Ct1 := Ct1 + 1;
            end;
      end;
   if (tipo = 'F') then
      begin
         Cal_D := 11 - (Som_1 mod 11);
         Cal_V1 := (Cal_D - StrToInt(Cpf[10]));
         Cal_D := 11 - (Som_2 mod 11);
         Cal_V2 := (Cal_D - StrToInt(Cpf[11]));
      end;

   if (Tipo = 'J') then
      begin
         Cgc := Cpf_Cgc;
         Ct1 := 2;
         for cont := 12 downto 1 do
            begin
               Som_1 := (Som_1 + (StrToInt(Cgc[Cont]) * Ct1));
               Ct1 := Ct1 + 1;
               if (Ct1 = 10) then Ct1 := 2;
            end;
         Ct1 := 2;
         for cont := 13 downto 1 do
            begin
               Som_2 := (Som_2 + (StrToInt(Cgc[Cont]) * Ct1));
               Ct1 := Ct1 + 1;
               if (Ct1 = 10) then Ct1 := 2;
            end;
      end;
   if (Tipo = 'J') then
      begin
         Cal_D := 11 - (Som_1 mod 11);
         Cal_V1 := (Cal_D - StrToInt(Cgc[13]));
         Cal_D := 11 - (Som_2 mod 11);
         Cal_V2 := (Cal_D - StrToInt(Cgc[14]));
      end;
   if (Cal_V1 > 9) then
      Cal_V1 := 0;
   if (Cal_V2 > 9) then
      Cal_V2 := 0;
   if (Cal_V1 <> 0) or (Cal_V2 <> 0) then
      TestCpf := false
   else
      TestCpf := true;
end;



function TestCgf(InscEst: string): boolean;
var
   Cgf: string[12];
   Cont, mult, Acumula: Integer;
begin
   If InscEst='' then exit;
   If (InscEst[1]=' ') or (InscEst[1]='_') then
   Begin
        Result := true;
        Exit;
   End;
   try
        Cgf := InscEst;
        Cont := 1;
        Mult := 1;
        Acumula := 0;
        repeat
           if (Cont <> 3) and (Cont <> 7) then
           begin
                try
                   Acumula := Acumula + ((10 - mult) * (Strtoint(Cgf[cont])));
                except
                End;
                Mult := Mult + 1;
           end;
           Cont := Cont + 1;
        until Cont = 11;
        Acumula := 11 - (Acumula mod 11);
        if Acumula > 9 then Acumula := 0;
        Result := (Acumula = (Strtoint(CGF[12])));
   except
        ShowMessage('Erro no teste de Inscri��o Estadual');
        result:=true;
   End;
end;


function LCase(X: Char): Char; {Fun��o para Converter toda a Frase em letras minusculas.}
begin
   if (Ord(X) > 64) and (Ord(X) < 91) then
      LCase := Chr(Ord(X) + 32)
   else
      Lcase := X;
end;


function Converte(Entrada: string): string;
var Tam: Integer;
   I: Integer;
begin

   Tam := Length(Entrada);

   for I := 1 to Tam do
   begin
         Entrada[I] := Lcase(Entrada[I]); {Converte toda a Frase para Minuscula}
   end;

   for I := 1 to Tam do
   begin
      if (Entrada[I] = ' ') and (I <> Tam) then
         Entrada[I + 1] := UpCase(Entrada[I + 1])
      else if (Entrada[I] = '/') and (I <> Tam) then
         Entrada[I + 1] := UpCase(Entrada[I + 1])
      else if (Entrada[I] = '.') and (I <> Tam) then
        Entrada[I + 1] := UpCase(Entrada[I + 1]);
   end;

   for I := 1 to Tam do {Testa o 'E' sozinho - Ok}
   begin
     if (Entrada[I] = 'E') and (Entrada[I - 1] = ' ') and (Entrada[I + 1] = ' ') and (I <> Tam) then
         Entrada[I] := LCase(Entrada[I]);
     if (I = Tam) and (Entrada[I - 1] = ' ') then
         Entrada[I] := LCase(Entrada[I]);
   end;

   for I := 1 to Tam do {Testa o 'A' sozinho - Ok}
   begin
     if (Entrada[I] = 'A') and (Entrada[I - 1] = ' ') and (Entrada[I + 1] = ' ') and (I <> Tam) then
        Entrada[I] := LCase(Entrada[I]);
     if (I = Tam) and (Entrada[I - 1] = ' ') then
        Entrada[I] := LCase(Entrada[I]);
   end;

   for I := 1 to Tam do {Testa o 'Da, De, Do' sozinho - Ok}
   begin
      if (Entrada[I] = 'D') and (Entrada[I - 1] = ' ') and (Entrada[I + 2] = ' ') and ((Entrada[I + 1] = 'a') or (Entrada[I + 1] = 'e') or (Entrada[I + 1] = 'o')) and (I <> Tam) then
        Entrada[I] := LCase(Entrada[I]);
      if (I = Tam - 1) and (Entrada[I] = 'D') and (Entrada[I - 1] = ' ') and ((Entrada[I + 1] = 'a') or (Entrada[I + 1] = 'e') or (Entrada[I + 1] = 'o')) and (I <> Tam) then
        Entrada[I] := LCase(Entrada[I]);
   end;

   for I := 1 to Tam do {Testa o 'P/' sozinho - Ok}
   begin
      if (Entrada[I] = 'P') and (Entrada[I - 1] = ' ') and (Entrada[I + 2] = ' ') and (Entrada[I + 1] = '/') and (I <> Tam) then
          Entrada[I] := LCase(Entrada[I]);
   End;

   for I := 1 to Tam do {Testa o 'Das, Dos' sozinho - Ok}
   begin
      if (Entrada[I] = 'D') and (Entrada[I - 1] = ' ') and (Entrada[I + 2] = 's') and (Entrada[I + 3] = ' ') and ((Entrada[I + 1] = 'a') or (Entrada[I + 1] = 'o')) and (I <> Tam) then
          Entrada[I] := LCase(Entrada[I]);
      if (I = Tam - 2) and (Entrada[I] = 'D') and (Entrada[I - 1] = ' ') and (Entrada[I + 2] = 's') and ((Entrada[I + 1] = 'a') or (Entrada[I + 1] = 'o')) and (I <> Tam) then
          Entrada[I] := LCase(Entrada[I]);
   end;

   Entrada[1] := Upcase(Entrada[1]); {Converte a Primeira Letra da Frase para Maiuscula.}
   Converte := Entrada;

end;

function motivosDeExclusaoSPCComboDB(combo: TDBComboBox): string;
begin
  combo.Items.Add('1  - Pagamento da divida');
  combo.Items.Add('2  - Renegocia��o da divida');
  combo.Items.Add('3  - Inclus�o Indevida');
  combo.Items.Add('4  - Ordem Judicial');
  combo.Items.Add('5  - Corre��o do Endere�o');
  combo.Items.Add('6  - Atualiza��o de Valor - valoriza��o');
  combo.Items.Add('7  - Atualiza��o de valor - pagamento parcial');
  combo.Items.Add('8  - Atualiza��o de data');
  combo.Items.Add('9  - Corre��o de Nome');
  combo.Items.Add('10 - Corre��o de n�mero do contrato');
  combo.Items.Add('10 - Corre��o de v�rios dados(valor+datas)');
  combo.Items.Add('12 - Baixa por perda de controle de base');
  combo.Items.Add('13 - Motivo n�o identificado');
  combo.Items.Add('95 - Comunicado devolvido pelo correio');
  combo.Items.Add('96 - Determina��o Judicial');
  combo.Items.Add('97 - Decurso de Prazo');
  combo.Items.Add('99 - Motivo de baixa n�o identificado');

end;

function naturezaDeInclusaoSPCComboDB(combo: TDBComboBox): string;
begin
  combo.Items.Add('0  - Outras atividades');
  combo.Items.Add('15 - Fabrica��o de produtos aliment�cios');
  combo.Items.Add('17 - Fabrica��o de produtos texteis');
  combo.Items.Add('18 - Fabrica��o de artigos de vestu�rio e acess�rio');
  combo.Items.Add('20 - Fabrica��o de produtos de madeira');
  combo.Items.Add('21 - Fabrica��o de celulose, papel e produtos de papel');
  combo.Items.Add('22 - Edi�ao, impress�o e reprodu��o de grava��es ');
  combo.Items.Add('24 - Fabrica��o de produtos qu�micos ');
  combo.Items.Add('25 - Fabrica��o de artigos de borracha e pl�tico ');
  combo.Items.Add('27 - Metal�rgica b�sica ');
  combo.Items.Add('36 - Fabricacao de Moveis e Industrias Diversas ');
  combo.Items.Add('37 - Reciclagem');
  combo.Items.Add('45 - Constru��o');
  combo.Items.Add('50 - Com�rcio e Repara��o Ve�culos Aut. e Mot.');
  combo.Items.Add('51 - comercio atacadista');
  combo.Items.Add('70 - Atividades Imobili�rias');
  combo.Items.Add('74 - Presta��o de Servi�os');
  combo.Items.Add('80 - Educa��o');
  combo.Items.Add('85 - Sa�de e Servi�os Sociais');

end;


function tiposDeTituloComboDB(combo: TDBComboBox): string;
begin

  combo.Items.Add('CH');
  combo.Items.Add('DP');
  combo.Items.Add('BO');
  combo.Items.Add('CC');
  combo.Items.Add('CD');
  combo.Items.Add('CPR');
  combo.Items.Add('CP');
  combo.Items.Add('NE');
  combo.Items.Add('LT');

end;

function tiposDeTituloCombo(combo: TComboBox): string;
begin

  combo.Items.Add('CH');
  combo.Items.Add('DP');
  combo.Items.Add('BO');
  combo.Items.Add('CC');
  combo.Items.Add('CD');
  combo.Items.Add('CPR');
  combo.Items.Add('CP');
  combo.Items.Add('NE');

end;

function Padl(Texto: string; Tam: Integer): string;
var tamtex, n: integer;
begin
   tamtex := Length(Texto);
   Result := Texto;
   if tamtex > tam then Result := Copy(Texto, tamtex - tam + 1, tam);
   if tamtex < tam then for n := tamtex to tam do Result := ' ' + Result;
end;

function Padr(Texto: string; Tam: Integer): string;
var tamtex, n: integer;
begin
   tamtex := Length(Texto);
   Result := Texto;
   if tamtex > tam then
      Result := Copy(Texto, 1, tam);
   if tamtex < tam then
      for n := tamtex to tam do
         Result := Result + ' ';
end;

function PadrAsteristico(Texto: string; Tam: Integer): string;
var tamtex, n: integer;
begin
   tamtex := Length(Texto);
   Result := Texto;
   if tamtex > tam then
      Result := Copy(Texto, 1, tam);
   if tamtex < tam then
      for n := tamtex to tam do
         Result := Result + '*';
end;



function LenNum(Numero: Real): Integer;
var
   cNumero: string;
begin
   cNumero := FormatFloat('0.000E+00', Numero);
   Result := StrToInt(Copy(cNumero, Length(cNumero) - 1, 2)) + 1
end;

function Padlzero(Texto: string; Tam: Integer): string;
var
   tamtex, n: integer;
begin
   tamtex := Length(Texto);
   Result := Texto;
   if tamtex > tam then
      Result := Copy(Texto, tamtex - tam + 1, tam);
   if tamtex < tam then
      for n := (tamtex + 1) to tam do
         Result := '0' + Result;
end;


function Extenso(pValor: Real): string;
var
   nParte1, nParte2: Comp;
   xExt1, xExt2, xJuncao: string;
begin
   nParte1 := Int(pValor);
   nParte2 := Round((pValor - nParte1) * 100);
   xExt1 := fExtenso(nParte1);
   xExt2 := fExtenso(nParte2);
   if ((Length(xExt1) = 0) and (Length(xExt2) = 0))
      then xExt1 := 'zero';

   if xExt1 = 'um'
      then xExt1 := xExt1 + ' real'
   else if xExt1 <> '' then xExt1 := xExt1 + ' reais';


   if Length(xExt2) > 0
      then
      if xExt2 = 'um'
         then xExt2 := xExt2 + ' centavo'
      else xExt2 := xExt2 + ' centavos';

   if ((Length(xExt1) = 0) or (Length(xExt2) = 0))
      then xJuncao := ''
   else xJuncao := ' e ';

   Result := xExt1 + xJuncao + xExt2;
end;



function fExtenso(nValor: Real): string;
const
   aExSP: array[1..8] of string = ('', ' mil', ' milhoes', ' bilhoes', ' trilhoes',
      'quadrilhoes', ' quinqualhoes', ' sextalhoes');
   aExSS: array[1..8] of string = ('', ' mil', ' milhao ', ' bilhao ', ' trilhao ',
      ' quadrilhao ', ' quinqualhao ', ' sextalhao');
var
   NumGrupos, n, nn: Integer;
   cValor, tExtenso, xExtenso, cGrupo: string;
begin
   NumGrupos := ((LenNum(nValor) + 2) div 3);
   cValor := PadlZero(FloattoStr(nValor), NumGrupos * 3);
   tExtenso := '';
   xExtenso := '';

   for n := 1 to NumGrupos do
      begin
         cGrupo := Copy(cValor, n * 3 - 2, 3);
         xExtenso := ExtensoMil(cGrupo);
         nn := NumGrupos - n + 1;
         if Length(xExtenso) > 0 then
            begin
               if cGrupo = '001' then
                  xExtenso := xExtenso + aExSS[nn]
               else
                  xExtenso := xExtenso + aExSP[nn];
               if Length(tExtenso) > 0 then
                  tExtenso := tExtenso + ' ';
               tExtenso := tExtenso + xExtenso;
            end;
      end;
   Result := tExtenso;
end;

function ExtensoMil(cVlr: string): string;
const
   aExp: array[1..37] of string = (
      'um', 'dois', 'tres', 'quatro', 'cinco', 'seis', 'sete', 'oito', 'nove', 'dez',
      'onze', 'doze', 'treze', 'quatorze', 'quinze', 'dezesseis', 'dezessete',
      'dezoito', 'dezenove', 'vinte', 'trinta', 'quarenta', 'cinquenta', 'sessenta',
      'setenta', 'oitenta', 'noventa', 'cem', 'duzentos', 'trezentos', 'quatrocentos',
      'quinhentos', 'seiscentos', 'setecentos', 'oitocentos', 'novecentos', 'cento'
      );
var
   c1, c2, c3: string;
   e1, e2, e3, cJuncao1, cJuncao2: string;
   n1, n2, n3, n23: Integer;
begin
   c1 := Copy(cVlr, 1, 1);
   c2 := Copy(cVlr, 2, 1);
   c3 := Copy(cVlr, 3, 1);
   n1 := StrToInt(c1);
   n2 := StrToInt(c2);
   n3 := StrToInt(c3);
   e1 := '';
   e2 := '';
   e3 := '';
   n23 := StrToInt(c2 + c3);
   if n1 > 0 then
      if ((n1 = 1) and ((n2 + n3) > 0)) then
         e1 := aExP[37]
      else
         e1 := aExp[27 + n1];
   if n2 > 1 then
      begin
         e2 := aExp[18 + n2];
         if n3 > 0 then
            e3 := aExp[n3];
      end
   else
      begin
         e2 := '';
         if n23 > 0 then
            e3 := aExp[n23];
      end;
   if ((n1 = 0) or (n23 = 0)) then
      cJuncao1 := ''
   else
      cJuncao1 := ' e ';
   if ((Length(e2) = 0) or (Length(e3) = 0)) then
      cJuncao2 := ''
   else
      cJuncao2 := ' e ';
   Result := e1 + cJuncao1 + e2 + cJuncao2 + e3;
end;


function TiraCifra(Valor: string): string;
var I: Integer;
   Resultado: string;
   Vetor: array[1..25] of string;
begin
   Resultado := '';
   if Valor <> '' then
      begin
         for i := 1 to Length(Valor) do Vetor[I] := Valor[I];
         for i := 1 to Length(Valor) do
            begin
               if (Vetor[I] <> '.') and (Vetor[I] <> 'R') and (Vetor[I] <> '$') then
                  begin
                     Resultado := Resultado + Vetor[I];
                  end;
            end;
         TiraCifra := Resultado;
      end
   else
      Valor := '0';
end;

{Manuel Costa 1.10.2001}
{Criar Tabelas Tempor�rias no Banco de Dados }
{Recebe uma Descri��o para a Tabela e Retorna}
{o Nome Criado para a Tabela.                }
Function TFRotinas.CriaTabela(sTabela:string):String;
Var Numero,i,t : Integer;
    NomeTab: string;
    Pasta:string;
    SearchRec: TSearchRec;
    AtePonto:integer;
    CamposIndice:String;
Begin

   if TbTmp_NCampo[1]='' then
   begin
      showmessage('N�o foi Adicionado Campos a Tabela');
      result:='';
      exit;
   end;

   Numero:=0;

   Pasta:=ExtractFilePath(ParamStr(0));
   i:=FindFirst(Pasta+'*.db', faAnyFile, SearchRec);
   while i=0 do
   begin
     AtePonto:=Pos('.',SearchRec.Name)-5;
     if StrToInt(copy(SearchRec.Name,5,AtePonto)) > Numero then
        Numero:= StrToInt(copy(SearchRec.Name,5,AtePonto));
      i:=FindNext(SearchRec);
   end;

   Numero:=Numero + 1;

   NomeTab := 'TMP_'+IntToStr(Numero);

   try

   with tbl_Temp do
   begin
        Active := False;
        //DatabaseName :=ExtractFilePath(ParamStr(0));
        //TableType    := ttDefault;
        TableName    := NomeTab;
        with FieldDefs do
        begin
             Clear;

             {Bloco que define os Compos da Tabela Tempor�ria, partir do vetor}
             {Inicializado na rotina que chamar� a cria��o de tabelas}
             i:=1;
             t:=99;
             while i<=t do
             begin
                  if TbTmp_NCampo[i]='' then
                     break;
                  add(TbTmp_NCampo[i],TbTmp_TCampo[i], TbTmp_SCampo[i],False);
                  i:=i+1;
             end;
        end;

        CamposIndice:='';
        i:=1;
        While i<=10 do
        begin
             if TbTmp_iCampo[i]='' then
                break;
             if i>1 then
                CamposIndice:=CamposIndice+'; ';
             CamposIndice:=CamposIndice+TbTmp_iCampo[i];
             i:=i+1;
        end;

        //CreateTable;
        //if i>1 then
        //  AddIndex(NomeTab,CamposIndice	,[ixPrimary]);

   end;

   except
         showmessage('Ocorreu Erro ao tentar Criar a Tabela Tempor�ria'+sTabela);
         result:='';
         exit;
   end;


   {Limpando array dos Campos}
   AddCampoTabela('Limpar'       , '',0);

   result:=NomeTab;
End;

{Manuel Costa 1.10.2001}
{Apaga todas as Tabelas Tempor�rias Geradas pela Fun��o CriaTabela, at� a Data }
{atual, sempre ser� a primeira vez que algum usu�rio entrar no Sistema         }
Procedure TFRotinas.DropAllTabelaTmp;
var select:string;
var i:integer;
 dbResult : word;
 Pasta:string;
 NomeTabela:String;
 SearchRec: TSearchRec;
begin

    Pasta:=ExtractFilePath(ParamStr(0));
    i:=FindFirst(Pasta+'*.db', faAnyFile, SearchRec);
    while i=0 do
    begin
      DeleteFile(Pasta+SearchRec.Name);
      i:=FindNext(SearchRec);
    end;

    i:=FindFirst(Pasta+'*.px', faAnyFile, SearchRec);
    while i=0 do
    begin
      DeleteFile(Pasta+SearchRec.Name);
      i:=FindNext(SearchRec);
    end;

    i:=FindFirst(Pasta+'*.mb', faAnyFile, SearchRec);
    while i=0 do
    begin
      DeleteFile(Pasta+SearchRec.Name);
      i:=FindNext(SearchRec);
    end;

end;

{Manuel Costa 1.10.2001}
{Adiciona Campos para criar a Tabela Tempor�ria}
{sCampo='Limpar' Inicializa Vetores, � bom sempre iniciar assim}
Procedure TFRotinas.AddCampoTabela(sCampo:string; sTipo:Variant ;iTamanho:integer);
Var i,t:integer;
begin
{Verifica se Limpa Array}
t:=99;
if UpperCase(sCampo)='LIMPAR' then
begin
     i:=1;
     while i<=t do
     begin
          TbTmp_NCampo[i]:='';
          tbTmp_TCampo[i]:='';
          tbTmp_SCampo[i]:=0;
          i:=i+1;
     end;

     i:=1;
     while i<=5 do
     begin
         TbTmp_iCampo[i]:='';
         i:=i+1;
     end;
     exit;
end;
i:=1;
while i<=t do
begin
  if TbTmp_NCampo[i] = '' then
      Break;
  i:=i+1;
end;

if i=t then
begin
   showmessage('A fun��o que cria tabela tempor�ria est� preparada para criar'+#13+
               'apenas 99 Campos na Tabela');
   exit;
end;

TbTmp_NCampo[i] := sCampo;
TbTmp_TCampo[i] := sTipo;
TbTmp_SCampo[i] := iTamanho;
end;


Procedure TFRotinas.AddIndexTmp(sCampos:string);
var i:integer;
begin
if sCampos='' then
   exit;
i:=1;
while i<=5 do
begin
  if TbTmp_iCampo[i] = '' then
      Break;
  i:=i+1;
end;

if i>5 then
begin
   showmessage('Em tabelas tempor�rias s�o permitidos apenas 5 �ndices');
   exit;
end;

TbTmp_iCampo[i]:=sCampos;

end;


{ retorna nome do arquivo sem extens�o }
Function So_Nome(N:TFileName):String;
Var S:String;
    x:Integer;
Begin
s:=''; result:='';
For x:=1 to Length(N) do
  Begin
    If N[x]='.' then begin result:=S; exit; End;
    S:=S+N[x];
  End;
End;


// retorna valor inteiro de uma String
Function ValInt(ST:String):Integer;
Var X : Byte;
    S : String;
Begin
S:='';
For x:=1 to Length(ST) do
   If ST[x] in ['0','1','2','3','4','5','6','7','8','9'] then S:=S+ST[x];
If S='' then S:='0';
Result:=StrToInt(S);
End;




// = StrZero do Clipper
Function StrZero(N:Integer;C:Byte):String;
Var
    S:String;
Begin
S:='0000000000000000000000'+IntToStr(N);
S:=Copy(S,Length(S)-C+1,C);
result:=S;
End;



// Retorna string Criptografada pelo protocolo Sergio
Function CriptoSergio(ST:String):String;
Var A : Array[0..9] of Char;
    L:Byte;
    S,NS:String;
Begin
A[0]:='7';
A[1]:='5';
A[2]:='3';
A[3]:='1';
A[4]:='0';
A[5]:='2';
A[6]:='4';
A[7]:='6';
A[8]:='8';
A[9]:='9';
NS:='';
If ST<>'' then
Begin
  S:='';
  For L:=1 to Length(ST) do
     S:=S + StrZero( Ord(ST[l]) ,3);
  For L:=1 to Length(S) do
     NS:=NS + A[ StrToInt(S[L]) ] ;
End;
Result:=NS;
End;


// restorna String Descriptografa pelo protocolo Sergio
Function DesCriptoSergio(ST:String):String;
Var A : Array[0..9] of Char;
    L:Byte;
    S,NS:String;
Begin
A[0]:='4';
A[1]:='3';
A[2]:='5';
A[3]:='2';
A[4]:='6';
A[5]:='1';
A[6]:='7';
A[7]:='0';
A[8]:='8';
A[9]:='9';
NS:='';
If ST<>'' then
Begin
  For L:=0 to Trunc(Length(ST)/3)-1 do
     NS:=NS + A[ StrToInt(ST[1+L*3+0]) ] + A[StrToInt(ST[1+L*3+1])] + A[StrToInt(ST[1+L*3+2])];
  S:='';
  For L:=0 to Trunc(Length(NS)/3)-1 do
     S:=S + Chr( StrToInt( NS[1+L*3+0] + NS[1+L*3+1] + NS[1+L*3+2] ) );
End;
Result:=S;
End;



Function Right(S:String;T:Byte):String;
Var sx:String;
Begin
sx:='                                       '+S;
sx:=copy(sx,Length(sx)-T+1,T);
result:=sx;
End;


Function Data_Ing(S:String):String;
Var D:String[2];
    M:String[3];
    A:String[4];
Begin
D:=FormatDateTime('DD',StrtoDate(S));
M:=FormatDateTime('mmm',StrtoDate(S));
A:=FormatDateTime('YYYY',StrtoDate(S));
If UpperCase(M)='JAN' then M:='jan';
If UpperCase(M)='FEV' then M:='feb';
If UpperCase(M)='MAR' then M:='mar';
If UpperCase(M)='ABR' then M:='apr';
If UpperCase(M)='MAI' then M:='may';
If UpperCase(M)='JUN' then M:='jun';
If UpperCase(M)='JUL' then M:='jul';
If UpperCase(M)='AGO' then M:='aug';
If UpperCase(M)='SET' then M:='sep';
If UpperCase(M)='OUT' then M:='oct';
If UpperCase(M)='NOV' then M:='nov';
If UpperCase(M)='DEZ' then M:='dec';
result := D +'-'+ M + '-' + A;
End;

Function Redondo(V:Real;D:Byte):Extended;
Var S : String;
Begin
S := FloattoStrF(V ,ffFixed ,20,D);
Delete(S , pos(S,',') , 1);
Result := strToCurr( S );
End;


Function DigitoEAN13(Cod:String):String;
Var
 V : Array[2..13] of 0..9;
 SomaPar,SomaImpar,Soma:Integer;
 Subtrai:String[3];
Begin
result:='';
If Length(Cod)<12 then
Begin
  result:='e';
  Exit;
End;
Try
  V[13]:=StrtoInt(Cod[ 1]);
  V[12]:=StrtoInt(Cod[ 2]);
  V[11]:=StrtoInt(Cod[ 3]);
  V[10]:=StrtoInt(Cod[ 4]);
  V[ 9]:=StrtoInt(Cod[ 5]);
  V[ 8]:=StrtoInt(Cod[ 6]);
  V[ 7]:=StrtoInt(Cod[ 7]);
  V[ 6]:=StrtoInt(Cod[ 8]);
  V[ 5]:=StrtoInt(Cod[ 9]);
  V[ 4]:=StrtoInt(Cod[10]);
  V[ 3]:=StrtoInt(Cod[11]);
  V[ 2]:=StrtoInt(Cod[12]);
Except
  result:='e';
End;
If result='' then
Begin
  SomaPar  :=V[12]+V[10]+V[08]+V[06]+V[04]+V[02];
  SomaImPar:=V[13]+V[11]+V[09]+V[07]+V[05]+v[03];
  Soma := SomaImpar+(SomaPar*3);
  Subtrai := StrZero(100-Soma,3);
  result:= Subtrai[3];
End;
End;


//                                                   //
// Testa se o Windows est� preparado para o ano 2000 //
//                                                   //
function Bug2000: Boolean;
begin
result := (length(datetostr(Now)) <> 10);
end;


Function Corta_2casas(V:Real):Real;
Var S : String;
Begin
S := FloattoStrF(V ,ffFixed ,20,3);
Delete(S , pos(S,',') , 1);
S := Copy(S, 1 , Length(S)-1);
Result := StrToFloat( S );
End;



Function UltimoDia(S:String):TDateTime;
var d : TDateTime;
Begin
try
  d:=StrtoDate('01/'+S);
Except
  result:=StrtoDate('01/01/1990');
End;
While FormatDateTime('MM',d)=Copy(S,1,2) do
Begin
  d:=d+1;
End;
d:=d-1;
result:=d;
End;

Function UltimoDiaMes(d:TDateTime):TDateTime;
var s:string;
Begin
s:=FormatDateTime('MM',d);
While FormatDateTime('MM',d)=Copy(S,1,2) do
Begin
  d:=d+1;
End;
d:=d-1;
result:=d;
End;

{C�lculo de D�gito Verificador - Peso 9}
function sDigito(Numero:string):String;
var p_cont,p_soma,p_peso,p_dig : integer;
    sDig:string;
begin
  if length(Numero)=0 then
     Result:='0';
  p_soma:=0;
  p_peso:=9;
  p_cont:=Length(Numero);
  while p_cont>1 do
  begin
      p_soma:=p_soma+StrtoInt(copy(Numero,p_cont,1)) * p_peso;
      if p_peso=1 then
         p_peso:=9
      else
         p_Peso:=P_Peso -1;
      p_cont:=p_Cont -1;
  end;
  p_dig:= (p_soma mod 11);
  if p_dig>10 then
    sDig := '0'
  else
    sDig := IntToStr(p_dig);

  result:=sDig;
  
end;


function TFRotinas.Param_String(Sigla:string):string;
begin
Qry_Livre.close;
Qry_Livre.CommandText := 'select * from param where NOME_PARAM='''+sigla+'''';
Qry_Livre.open;
if Qry_Livre.recordcount=0 then
   result:='N'
else
   result:=Qry_Livre.fieldbyname('valor_param').asstring;
end;

function TFRotinas.SetParam_String(Sigla:string; valor:string):string;
begin
  Qry_Livre.close;
  Qry_Livre.CommandText := 'select * from param where NOME_PARAM='''+sigla+'''';
  Qry_Livre.open;
  if Qry_Livre.recordcount=0 then
  begin
    Qry_Livre.append;
    Qry_Livre.FieldByName('PK_PARAM').value := Sequencial('param');
    Qry_Livre.FieldByName('NOME_PARAM').value := sigla;
  end;
  Qry_Livre.edit;
  Qry_Livre.FieldByName('valor_param').value := valor;
  Qry_Livre.post;
end;

function TFRotinas.Param_Number(Sigla:string):real;
begin
Qry_Livre.close;
Qry_Livre.CommandText := 'select * from tab_param where sigla='''+sigla+'''';
Qry_Livre.open;
if Qry_Livre.recordcount=0 then
   result:=0
else
   result:=Qry_Livre.fieldbyname('cont_valor').asinteger;
end;

function TFRotinas.Param_Data(Sigla:string):Tdate;
begin
Qry_Livre.close;
Qry_Livre.CommandText := 'select * from tab_param where sigla='''+sigla+'''';
Qry_Livre.open;
if Qry_Livre.recordcount=0 then
   result:=Date
else
   result:=Qry_Livre.fieldbyname('cont_Data').Value;
end;


procedure TFRotinas.janelas(janela:string; nome:string; palavras:string; menu_princ:string);
var palavra:string;
var continua:boolean;
var pk_janela:integer;
begin

Qry_Livre.Close;
Qry_Livre.CommandText := 'select * from janelas where opcao_menu='''+janela+'''';
Qry_Livre.open;
if Qry_Livre.recordCount = 0 then
begin
  Qry_Livre.append;
  Qry_Livre.FieldByName('pk_janela').value := sequencial('janelas');
  Qry_Livre.FieldByName('opcao_menu').value := janela;
  Qry_Livre.FieldByName('opcao_menu_princ').value :=menu_princ ;
  Qry_Livre.FieldByName('nome').value := nome;
  Qry_Livre.post;
end;
pk_janela := Qry_Livre.FieldByName('pk_janela').value;

if palavras<>'' then
begin
  Qry_Livre.Close;
  Qry_Livre.CommandText := 'select * from janelas_palavras where pk_janela='+inttostr(pk_janela);
  Qry_Livre.open;

  continua:=true;
  while continua do
  begin

    palavra := palavras;
    if pos(';',palavras)>0 then
    begin
      palavra := copy(palavras,1, pos(';', palavras) -1 );
      palavras := copy(palavras, pos(';', palavras) +1, Length(palavras) );
    end
    else
    begin
      palavra := palavras;
      palavras := '';
    end;

    if not Qry_Livre.Locate('palavra', palavra, []) then
    begin
      Qry_Livre.append();
      Qry_Livre.FieldByName('pk_palavra').value := sequencial('janelas_palavras');
      Qry_Livre.FieldByName('pk_janela').value  := pk_janela;
      Qry_Livre.FieldByName('palavra').value  := palavra;
      Qry_Livre.post;
    end;

    if palavras = '' then
      continua := false;

  end;


end;

end;


Function TFRotinas.lerDataServidor(): TDateTime;
var data:TDateTime;
begin
  data := date;
  Qry_Livre.close;
  Qry_Livre.CommandText := 'select * from tabela where tabela=''data2012#''';
  Qry_Livre.open;
  if Qry_Livre.recordCount > 0 then
  begin
     data:= Qry_Livre.FieldByName('seq').value;
  end;
  result:= data;

end;

procedure TFRotinas.registraDataServidor();
var data:TDateTime;
begin
  data:=date;

  Qry_Livre.close;
  Qry_Livre.CommandText := 'select * from tabela where tabela=''data2012#''';
  Qry_Livre.open;
  if Qry_Livre.recordCount = 0 then
  begin
    Qry_Livre.append;
    Qry_Livre.FieldByName('tabela').value := 'data2012#';
    Qry_Livre.post();
  end;

  if Qry_Livre.FieldByName('seq').value < data then
  begin
    Qry_Livre.edit;
    Qry_Livre.FieldByName('seq').value := data;
    Qry_Livre.post();
  end;

end;

procedure TFRotinas.FullScreenArea(F : Tform);
{ seta area para full screen }
var
rcWork: TRect;
begin
rcWork.Top:=0;
rcWork.Left:=0;
rcWork.Bottom:=GetSystemMetrics(SM_CYSCREEN);
rcWork.Right:=GetSystemMetrics(SM_CXSCREEN);
SystemParametersInfo (SPI_SETWORKAREA, 0, @rcWork, SPIF_SENDCHANGE);
f.Height := screen.Height;
f.Width := screen.Width;
end;

procedure TFRotinas.StandardArea(F : Tform);
{ retorna o padr�o}
var
hApp: HWND;
rcApp, rcWork: TRect;
begin
{ prepare a padrao para o fullscreen area }
rcWork.Top:=0;
rcWork.Left:=0;
rcWork.Bottom:= GetSystemMetrics(SM_CYSCREEN);
rcWork.Right:= GetSystemMetrics(SM_CXSCREEN);

{handle para barra de tarefas}
hApp := FindWindow('Shell_TrayWnd', '');
if hApp <> 0 then begin
GetWindowRect(hApp, rcApp);
if rcApp.Right=rcApp.Right then rcWork.Left:=rcApp.Right;
if rcApp.Bottom=rcApp.Bottom then rcWork.Top:=rcApp.Bottom;
if rcApp.Left>0 then
rcWork.Right:=rcApp.Left;
if rcApp.Top>0 then
rcWork.Bottom:=rcApp.Top;
end;

SystemParametersInfo (SPI_SETWORKAREA, 0, @rcWork, SPIF_SENDCHANGE );
end;

procedure TFRotinas.HideTaskBar(F : Tform);
var
hApp: HWND;
begin
hApp := FindWindow('Shell_TrayWnd', '');
if hApp <> 0 then begin
{ esconde barra de tarefas}
ShowWindow(hApp, SW_HIDE);
FullScreenArea(f);
end;
end;

procedure TFRotinas.ShowTaskBar(F : Tform);
var
hApp: HWND;
begin
hApp := FindWindow('Shell_TrayWnd', '');
if hApp <> 0 then begin
{Mostra a barra de tarefas}
ShowWindow(hApp, SW_RESTORE);
StandardArea(f);
end;
end;


procedure TFRotinas.cancelaReciboAnterior(devedor : integer) ;
begin
  Qry_Livre.close;
  Qry_Livre.CommandText := 'select * from recibos where data_receb is null and data_canc is null and pk_devedor='+intToStr(devedor);
  Qry_Livre.open;
  if Qry_Livre.recordCount >0 then
  begin
    Qry_Livre.edit;
    Qry_Livre.fieldByName('data_canc').value := date;
    Qry_Livre.fieldByName('hora_canc').value       := FormatDateTime( 'hh:mm:ss', time);
    Qry_Livre.fieldByName('usuario_canc').value := frotinas.usu_nu;
    Qry_Livre.fieldByName('observacao').value := 'Novo recibo gerado';
    Qry_Livre.post;
  end;

end;

function TFRotinas.temAcordoPendente(devedor : integer) : real;
begin
  Qry_Livre.close;
  Qry_Livre.CommandText := 'select * from recibos where data_receb is null and data_canc is null and pk_devedor='+intToStr(devedor);
  Qry_Livre.open;

  result := Qry_Livre.fieldByName('pk_recibo').asfloat;

end;

function TFRotinas.excluirRecibos(recibo : real; somenteEmAberto:boolean) : boolean;
var exclui:boolean;
begin
    exclui := true;
    if somenteEmAberto then
    begin

      frotinas.Qry_Livre.close();
      frotinas.Qry_Livre.CommandText := 'select * from recibos where data_receb is null and pk_recibo = '+floattostr(recibo);
      frotinas.Qry_Livre.open;
      exclui:=frotinas.Qry_Livre.recordcount >0;

    end;

    if exclui then
    begin
      frotinas.Qry_Livre.close();
      frotinas.Qry_Livre.CommandText := 'select * from titulos where pk_recibo = '+floattostr(recibo);
      frotinas.Qry_Livre.open;

      while not frotinas.Qry_Livre.Eof do
      begin
          frotinas.Qry_Livre.edit;
          frotinas.Qry_Livre.fieldByName('pk_recibo').asstring := '';
          frotinas.Qry_Livre.fieldByName('desc_juros').value := 0;
          frotinas.Qry_Livre.fieldByName('desc_multa').value := 0;
          frotinas.Qry_Livre.fieldByName('desc_principal').value := 0;
          frotinas.Qry_Livre.fieldByName('acres_protesto').value := 0;
          frotinas.Qry_Livre.fieldByName('valor_liquido').value := 0;
          frotinas.Qry_Livre.fieldByName('valor_retenc').value := 0;
          frotinas.Qry_Livre.fieldByName('motivo_baixa').asstring := '';
          frotinas.Qry_Livre.fieldByName('usuario_baixa').asstring := '';
          frotinas.Qry_Livre.fieldByName('data_baixa').asstring := '';
          frotinas.Qry_Livre.post;
          frotinas.Qry_Livre.next;
      end;

      frotinas.ADOCommand1.CommandText := 'delete from recibos where pk_recibo='+floattostr(recibo);
      frotinas.ADOCommand1.Prepared;
      frotinas.ADOCommand1.Execute;
  end;

  result := exclui;



end;
Function DiadaSemana(Data : TDateTime) : string;
const
  semana : array[1..7] of string = ('Domingo','Segunda','Ter�a','Quarta','Quinta','Sexta', 'S�bado');
begin
  Result := semana[DayOfWeek(Data)]
end;

Procedure TFRotinas.gravaRealizouPGT(chaveOcorrencia : integer; chaveDevedor:integer; obs:string; atualizaNoDevedor:boolean);
begin
  if chaveOcorrencia <=0 then
  begin
    showmessage('N�o foi informada a chave da ocorr�ncia.  ');
    exit;
  end;
  if chaveDevedor <=0 then
  begin
    showmessage('N�o foi informada a chave do Devedor  ');
    exit;
  end;

  qry_livre2.close;
  qry_livre2.commandText := 'select * from eventos where 1=2';
  qry_livre2.open;

  qry_livre2.append;
  qry_livre2.fieldByName('chave').value := frotinas.Sequencial('eventos');
  qry_livre2.fieldByName('pk_devedor').value := chaveDevedor;
  qry_livre2.fieldByName('Data').value :=  Date;
  qry_livre2.fieldByName('Hora').value := FormatDateTime( 'hh:mm:ss', time);
  qry_livre2.fieldByName('motivo').value := chaveOcorrencia;
  qry_livre2.fieldByName('Texto').Value := obs;
  qry_livre2.post;

  if atualizaNoDevedor then
  begin

    qry_livre.close;
    qry_livre.commandText := 'select * from devedores where pk_devedor='+IntToStr( chaveDevedor) ;
    qry_livre.open;

    qry_livre.edit;
    qry_livre.fieldByName('motivo_dialogo').value := chaveOcorrencia;
    qry_livre.fieldByName('data_dialogo').value := Date;
    qry_livre.post;
    qry_livre.next;

  end;


end;

Procedure TFRotinas.rateiaRecibo();
var conta:integer;
var dif,pjuros, pmulta,pprincipal, liquido, pliquido, tdesc_juros, tdesc_multa, tdesc_principal, tdesc_acrescimo, tliquido, tretencao ,tacrescimo, tjuros, tmulta: real;
begin

    qry_livre2.close;
    qry_livre2.CommandText := 'select * from titulos where pk_recibo = '+qry_livre.fieldByName('pk_recibo').asstring;
    qry_livre2.open;

    tdesc_juros:=0;
    tdesc_multa:=0;
    tdesc_principal:=0;
    tdesc_acrescimo := 0;
    liquido:=0;
    tliquido:=0;
    tretencao:=0;
    pprincipal:=0;
    pmulta:=0;
    pjuros:=0;
    tjuros:=0;
    tmulta:=0;

    if qry_livre2.recordCount>1 then
    begin

      while not qry_livre2.eof do
      begin

        if qry_livre2.fieldByName('atu_juros').asfloat>0 then
          pjuros    := qry_livre2.fieldByName('atu_juros').asfloat / qry_livre.fieldByName('juros').asfloat;

        if (qry_livre.fieldByName('multa').asfloat>0) and (qry_livre2.fieldByName('atu_multa').asfloat>0) then
          pmulta    := qry_livre2.fieldByName('atu_multa').asfloat / qry_livre.fieldByName('multa').asfloat;

        pprincipal:= qry_livre2.fieldByName('valor_principal').asfloat / qry_livre.fieldByName('principal').asfloat;

        qry_livre2.edit;

        if pJuros>0 then
          qry_livre2.fieldByName('desc_juros').value := ( qry_livre.fieldByName('desc_juros').asfloat * pJuros );
        if pmulta >0 then
          qry_livre2.fieldByName('desc_multa').value := (qry_livre.fieldByName('desc_multa').asfloat * pmulta);

        qry_livre2.fieldByName('desc_principal').value := (qry_livre.fieldByName('desc_principal').asfloat * pprincipal) ;
        qry_livre2.fieldByName('acres_protesto').value := (qry_livre.fieldByName('acres_protesto').value * pprincipal);

        liquido := (qry_livre2.fieldByName('valor_principal').asfloat +
                    qry_livre2.fieldByName('atu_juros').asfloat +
                    qry_livre2.fieldByName('atu_multa').asfloat +
                    qry_livre2.fieldByName('acres_protesto').asfloat )
                    -
                   (qry_livre2.fieldByName('desc_juros').asfloat +
                    qry_livre2.fieldByName('desc_multa').asfloat +
                    qry_livre2.fieldByName('desc_principal').asfloat);

        qry_livre2.fieldByName('valor_liquido').value := liquido;
        qry_livre2.fieldByName('valor_retenc').value := (liquido / qry_livre.fieldByName('valor_liquido').asfloat) *
                                                         qry_livre.fieldByName('valor_retenc').asfloat;
        qry_livre2.post;

        tjuros          := tjuros + qry_livre2.fieldByName('atu_juros').asfloat;
        tmulta          := tmulta + qry_livre2.fieldByName('atu_multa').asfloat;
        tdesc_juros     := tdesc_juros + qry_livre2.fieldByName('desc_juros').asfloat;
        tdesc_multa     := tdesc_multa + qry_livre2.fieldByName('desc_multa').asfloat;
        tdesc_principal := tdesc_principal + qry_livre2.fieldByName('desc_principal').asfloat;
        tacrescimo      := tacrescimo + qry_livre2.fieldByName('acres_protesto').asfloat;

        tliquido := tliquido + qry_livre2.fieldByName('valor_liquido').asfloat;
        tretencao := tretencao + qry_livre2.fieldByName('valor_retenc').asfloat;

        qry_livre2.next;

      end;

      qry_livre2.edit;

      if qry_livre.fieldByName('juros').asfloat > tdesc_juros then
        qry_livre2.fieldByName('atu_juros').asfloat := qry_livre2.fieldByName('atu_juros').asfloat +
                                                     (qry_livre.fieldByName('juros').asfloat - tjuros);
      if qry_livre.fieldByName('multa').asfloat > tdesc_juros then
        qry_livre2.fieldByName('atu_multa').asfloat := qry_livre2.fieldByName('atu_multa').asfloat +
                                                     (qry_livre.fieldByName('multa').asfloat - tmulta);

      if qry_livre.fieldByName('desc_juros').asfloat > tdesc_juros then
        qry_livre2.fieldByName('desc_juros').asfloat := qry_livre2.fieldByName('desc_juros').asfloat +
                                                      (qry_livre.fieldByName('desc_juros').asfloat - tdesc_juros);

      if qry_livre.fieldByName('desc_multa').asfloat > tdesc_multa then
        qry_livre2.fieldByName('desc_multa').asfloat := qry_livre2.fieldByName('desc_multa').asfloat +
                                                      (qry_livre.fieldByName('desc_multa').asfloat - tdesc_multa);

      if qry_livre.fieldByName('desc_principal').asfloat > tdesc_principal then
        qry_livre2.fieldByName('desc_principal').asfloat := qry_livre2.fieldByName('desc_principal').asfloat +
                                                      (qry_livre.fieldByName('desc_principal').asfloat - tdesc_principal);

      if qry_livre.fieldByName('acres_protesto').asfloat > tacrescimo then
        qry_livre2.fieldByName('acres_protesto').asfloat := qry_livre2.fieldByName('acres_protesto').asfloat +
                                                      (qry_livre.fieldByName('acres_protesto').asfloat - tacrescimo);

      if qry_livre.fieldByName('valor_liquido').asfloat > tliquido then
      begin
        dif := qry_livre.fieldByName('valor_liquido').asfloat - tliquido;
        qry_livre2.fieldByName('valor_liquido').asfloat := qry_livre2.fieldByName('valor_liquido').asfloat + dif;
        qry_livre2.fieldByName('desc_juros').asfloat := qry_livre2.fieldByName('desc_juros').asfloat - dif;

      end;

      if qry_livre.fieldByName('valor_retenc').asfloat > tretencao then
        qry_livre2.fieldByName('valor_retenc').asfloat := qry_livre2.fieldByName('valor_retenc').asfloat +
                                                          (qry_livre.fieldByName('valor_retenc').asfloat - tretencao);

      qry_livre2.post;

    end
    else
    begin
      if qry_livre2.recordCount=1 then
      begin
        qry_livre2.edit;
        qry_livre2.fieldByName('desc_juros').value := qry_livre.fieldByName('desc_juros').asfloat;
        qry_livre2.fieldByName('desc_multa').value := qry_livre.fieldByName('desc_multa').asfloat;
        qry_livre2.fieldByName('desc_principal').value := qry_livre.fieldByName('desc_principal').asfloat;
        qry_livre2.fieldByName('acres_protesto').value := qry_livre.fieldByName('acres_protesto').asfloat;
        qry_livre2.fieldByName('valor_retenc').value := qry_livre.fieldByName('valor_retenc').asfloat;
        qry_livre2.fieldByName('valor_liquido').value := qry_livre.fieldByName('valor_liquido').asfloat;
        qry_livre2.post;
      end;
    end;

end;

function TFRotinas.validaLimiteUsuariosLogados(usuario:integer) : boolean;
begin
//
  Qry_Livre.close;
  Qry_Livre.commandText := 'select * from usuarios where nu_usu='+intTostr(usuario);
  Qry_Livre.open;
  if Qry_Livre.fieldByName('logado').value = 'S' then
    result := false
  else
    result := true;

end;

function TFRotinas.checaValidadeLicenca(validade:TDateTime) : boolean;
var data, dataUltEvento:TDateTime;
var licencaValida:boolean;
var diasValidade:integer;
begin

  data := date;

  Qry_Livre.close;
  Qry_Livre.commandText := 'select max(data) as data from eventos ';
  Qry_Livre.open;

  licencaValida := true;
  log('�ltima da evento '+inttostr(Qry_Livre.recordCount));

  if (Qry_Livre.recordCount >0) and (Qry_Livre.fieldByName('data').asstring <> '') then
  begin
    log('data do evento '+Qry_Livre.fieldByName('data').asstring);
    dataUltEvento := strToDate(Qry_Livre.fieldByName('data').asstring);
    if dataUltEvento > data then
      licencaValida :=false;
  end;

  if licencaValida then
  begin
    if data>validade then
      licencaValida := false;
  end;

  if licencaValida then
  begin
    diasValidade := Trunc( validade - data );
    if  diasValidade < 8 then
      showmessage('Favor entrar em contato com o propriet�rio do sistema para adquirir uma nova vers�o. Faltam '+intToStr(diasValidade)+' para expirar.' );
  end;

  result := licencaValida;

end;
function mUpperCase(Nome : string) : string;
var
  i, j, p: Integer;
  s: String;
Const
  Acentos:Array[1..13,1..2] of String =  ( ( '�', '�'),  ('�', '�'),
  ('�', '�'),  ('�', '�'), ('�', '�'), ('�', '�'), ('�', '�'), ('�', '�'),
  ('�', '�'), ('�', '�'),  ('�', '�'), ('�', '�'),('c', '�') );
begin
  Nome:= uppercase(Nome);
  for i := 1 to Length(Nome) do
    for j := 1 to High(Acentos) do
      if Nome[i] = Acentos[j, 1] then
      begin
        p := Pos(Nome[i], Nome);
        Delete(Nome, p, 1);
        Insert(Acentos[j, 2], Nome, p);
      end;
  Result := Nome;
end; { Alltrim }
function centraliza(Texto: string; Tam : Integer): string;
var tamtex, resto: integer;
var resto2 :real;
begin
   Texto  := alltrim(texto);
   tamtex := Length(Texto);
   if tamTex<tam then
   begin
     resto  := (tam - tamtex)+1;
     resto2 := resto / 2;
     resto  := StrToInt(FormatFloat('###',Resto2));
     texto  := espaco(' ',resto)+Texto+espaco(' ',resto);
   end;
   Result := Texto;
end;
function TFRotinas.copyField(var vLinha:string;vSeparador:string):string ;
var field:string;
begin
  field    := copy(vLinha,1,pos(vSeparador,vLinha) -1);
  vLinha   := copy(vLinha,pos(vSeparador,vLinha) +1,length(vLinha));
  result:= field;
end;

function TFRotinas.formato_data_banco() : string;
var formato_dt : string;
begin
  Qry_Livre2.close;
  Qry_Livre2.CommandText := 'select * from param where nome_param=''FORMATO_DT''';
  Qry_Livre2.open;
  if (Qry_Livre2.recordCount>0) and ( pos('/',Qry_Livre2.fieldByName('valor_param').value)>0  ) then
    formato_dt := Qry_Livre2.fieldByName('valor_param').value
  else
    formato_dt := 'MM/DD/YYYY';

  result := formato_dt;
end;

procedure TFRotinas.backupAutomatico(pasta_backup:string; forcarBackup: boolean );
var  path, arquivo, dia, mes,ano : string;
var
  F,SearchRec : TSearchRec;
  retorno, i, conta, job : Integer;
  nomeFile : string;

begin


  {
  Qry_Livre2.close;
  Qry_Livre2.CommandText := 'select * from param where nome_param=''PASTA_PATH''';
  Qry_Livre2.open;

  if Qry_Livre2.recordCount=0 then
  begin
      Qry_Livre2.Append;
      Qry_Livre2.fieldByName('pk_param').value:= Sequencial('param');
      Qry_Livre2.fieldByName('nome_param').value:= 'PASTA_PATH';
      Qry_Livre2.fieldByName('valor_param').value:= ExtractFilePath(ParamStr(0));
      Qry_Livre2.Post;
  end;


  Qry_Livre2.close;
  Qry_Livre2.CommandText := 'select * from param where nome_param=''PASTA_BACK''';
  Qry_Livre2.open;

  if Qry_Livre2.recordCount>0 then
  begin
  }

  frotinas.hot_debugger := false;
  if pasta_backup = ''  then
    pasta_backup := frotinas.Param_String('PASTA_BACKSRV'); //Qry_Livre2.fieldByName('valor_param').value;

  if pasta_backup = ''  then
  begin
    path := ExtractFilePath(ParamStr(0))+'backup\';

    if not DirectoryExists(path) then
      ForceDirectories(path);

    pasta_backup := path;

  end;


  log('pasta_backup '+pasta_backup);
  if pasta_backup <> '' then
  begin

    log('entrou  pasta_backup <> "" ');

    Qry_Livre.close;
    Qry_Livre.CommandText := 'select * from tabela where seq=-99999';
    Qry_Livre.open;

    if Qry_Livre.recordCount=0 then
    begin
      Qry_Livre.Append;
      Qry_Livre.fieldByName('seq').value:= -99999;
      Qry_Livre.Post;
    end;


    //dia := FormatDateTime( 'dd', date);
    //mes := FormatDateTime( 'mm', date);
    //ano := FormatDateTime( 'yyyy', date);


    arquivo := 'siscob_'+FormatDateTime( 'YYYYMMDD',date)+'.bkp';
    log('arquivo '+arquivo);

    log('arquivo= '+arquivo + ' tabela = '+Qry_Livre.fieldByName('tabela').asstring );

    if (Qry_Livre.fieldByName('tabela').asstring <> arquivo ) or (forcarBackup) then
    begin

        job := frotinas.Sequencial('jobs');

        frotinas.qry_livre2.close;
        frotinas.qry_livre2.CommandText := 'select * from jobs where job='+intTostr(job);
        frotinas.qry_livre2.open;

        conta:=0;
        i:=FindFirst(path+'*.bkp', faAnyFile, SearchRec);
        while i=0 do
        begin
          nomeFile := SearchRec.Name;
          if pos('bkp', nomeFile)>0 then
          begin
            frotinas.qry_livre2.append;
            frotinas.qry_livre2.fieldByName('job').value := job;
            frotinas.qry_livre2.fieldByName('descricao').value := nomeFile;
            frotinas.qry_livre2.post;
          end;
          i:=FindNext(SearchRec);
          conta := conta + 1;
        end;
        frotinas.qry_livre2.close;
        frotinas.qry_livre2.CommandText := 'select * from jobs where job='+intTostr(job)+' order by descricao';
        frotinas.qry_livre2.open;

        conta:=frotinas.qry_livre2.recordCount;
        while not frotinas.qry_livre2.eof do
        begin
          if conta>5 then
            DeleteFile(path+frotinas.qry_livre2.fieldByName('descricao').value);
          conta:= conta -1;
          frotinas.qry_livre2.next;
        end;

          //DeleteFile(SearchRec.Name);

        frotinas.ADOCommand1.Prepared := true;
        frotinas.ADOCommand1.CommandText := 'delete from jobs where job='+intToStr(job);
        frotinas.ADOCommand1.Execute;

        try

          Qry_Livre.Edit;
          Qry_Livre.fieldByName('tabela').value := arquivo;
          Qry_Livre.post;

          ADOCommand1.CommandText := ' BACKUP DATABASE cobranca TO DISK = ''' + pasta_backup+arquivo+''' WITH FORMAT, MEDIANAME = ''Z_SQLServerBackups'', NAME = ''Full Backup of AdventureWorks2012''';
          ADOCommand1.Prepared;
          ADOCommand1.Execute;

          //log('movendo arquivo : '+path+arquivo+' para '+pasta_backup+arquivo);

          //if pasta_backup <> 'N' then
          //  moveFile(Pchar(path+arquivo),Pchar(pasta_backup+arquivo));


        except

        end;

    end;


  end;




end;



Function TFRotinas.SaltaFeriado(dData:TDateTime):Integer;
begin
    Qry_Livre.close;
    Qry_Livre.commandtext := 'select * from Feriados where pk_feriado='+formatdateTime('DD/MM/YYYY',dData);
    Qry_Livre.open;
    result := Qry_Livre.recordcount;
end;
Function Mes_Port(dData:TDateTime):String;
Var M:String;
Begin
M:=FormatDateTime( 'MM',dData);
If M='01' then M:='Janeiro';
If M='02' then M:='Fevereiro';
If M='03' then M:='Mar�o';
If M='04' then M:='Abril';
If M='05' then M:='Maio';
If M='06' then M:='Junho';
If M='07' then M:='Julho';
If M='08' then M:='Agosto';
If M='09' then M:='Setembro';
If M='10' then M:='Outubro';
If M='11' then M:='Novembro';
If M='12' then M:='Dezembro';
result := M;
End;
Function Ano_Port(ano:integer):String;
Var M:String;
Begin
if ano<2000 then
  m:=fextenso(ano)
else
begin
  m:=fextenso(2)+' mil';
  if ano>2000 then
    m:=m+' e '+fextenso(ano-2000)
end;
result := M;
End;
Function Espaco(ST:String;T:Integer):String;
Begin
If Length(ST)>T then 
Begin
  ST:=Copy(ST,1,T);
End
Else
Begin
  While Length(ST)<T do
  Begin
    ST:=ST+' ';
  End;
End;
result:=ST;
End;

Function EspacoE(ST:String;T:Integer):String;
Begin
If Length(ST)>T then
Begin
  ST:=Copy(ST,1,T);
End
Else
Begin
  While Length(ST)<T do
  Begin
    ST:=' '+ST;
  End;
End;
result:=ST;
End;


function Alltrim (Cadeia : string) : string;
  var Inicio, Fim : integer;
begin
  Inicio := 1;
  while (Copy(Cadeia, Inicio, 1) = ' ') and (Inicio < Length(Cadeia)) do
    Inc(Inicio);
  Fim := Length(Cadeia);
  while (Copy(Cadeia, Fim, 1) = ' ') and (Fim > Inicio) do
    Dec(Fim);
  Result := Copy(Cadeia, Inicio, Fim-Inicio+1)
end; { Alltrim }

Function RTrim(ST:String):String;
Var N,X: Byte;
    NS:String;
Begin
NS:=''; N:=0;
For x:=Length(ST) downto 1 do
Begin
  If (ST[x]<>' ') and (N=0) then N:=x;
End;
NS:=Copy(ST,1,N);
result:=NS;
End;
Function Espaco_Esquerdo(ST:String;T:Integer):String;
Begin
St := '                                                                            ' + ST;
result := Copy(St , Length(ST)-T+1, T );
End;

Function Caractere_Direita(ST:String;Caracter:string;T:Integer):String;
var tudo:string;
var i,j:integer;
Begin
ST:=alltrim(ST);
tudo:='';
if length(ST)>0 then
  j:= length(ST)+1
else
  j:= 1;

for i:=j to T do
begin
  ST:=ST+caracter;
end;
result := ST;
End;

Function repeteCaractere(Caracter:string;T:Integer):String;
var st:string;
var i:integer;
Begin
st:='';

for i:=1 to T do
begin
  ST:=ST+caracter;
end;
result := ST;
End;

Function divide(valor1: real; valor2:real) : real;
begin
  if (valor1>0 ) and (valor2>0) then
    result := valor1 / valor2
  else
    result := 0.00;
end;

end.

