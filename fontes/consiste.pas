{------------------------------------------------------------------------}
{                                                                        }
{  consiste.pas                                                          }
{  Copyright (c) 1996-2003. Emerson de Almeida Carneiro.                 }
{  http://www.fteam.com    -   e.carneiro@fteam.com                      }
{                                                                        }
{  Rotinas de consistências diversas para utilização geral.              }
{  Compatível com todas as versões do Delphi e Kylix.                    }
{                                                                        }
{------------------------------------------------------------------------}
{  24/12/2002 - versão inicial                                           }
{------------------------------------------------------------------------}
unit consiste;

{$I defs.inc}

//------------------------------------------------------------------------
// Todas as rotinas podem funcionar de duas maneiras, de acordo com a
// existência da constante LOCK_ON_ERROR:
// 1. Se ocorrer um erro, elas travam a operação retornando False.
// 2. Se ocorrer um erro, elas informam que o valor informado é inválido
//    e questionam o usuário sobre o prosseguimento nesta condição.
//------------------------------------------------------------------------
{$DEFINE LOCK_ON_ERROR}
//------------------------------------------------------------------------

interface

uses
  SysUtils, Messages, msgs;

type

  {----------------------------------------------------------------------}
  { tipos de dados personalizados                                        }
  {----------------------------------------------------------------------}
  TUF = String[2];
  TCNPJ = String[14];
  TCPF = String[11];
  TCEP = String[8];
  TInscEst = String[20];
  TEMail = String[50];
  TURL = String[60];

  {----------------------------------------------------------------------}
  { formatação                                                           }
  {----------------------------------------------------------------------}
  function Formata_CPF(ACPF: TCPF): String;
  function Formata_CNPJ(ACNPJ: TCNPJ): String;
  function Formata_CEP(ACEP: TCEP): String;

  {----------------------------------------------------------------------}
  { consistência                                                         }
  {----------------------------------------------------------------------}
  function Consiste_UF(AUF: TUF
    {$IFDEF DELPHI5_LVL}; AShowErrMsg: Boolean = True{$ENDIF}): Boolean;
  function Consiste_CNPJ(ACNPJ: TCNPJ
    {$IFDEF DELPHI5_LVL}; AShowErrMsg: Boolean = True{$ENDIF}): Boolean;
  function Consiste_CPF(ACPF: TCPF
    {$IFDEF DELPHI5_LVL}; AShowErrMsg: Boolean = True{$ENDIF}): Boolean;
  function Consiste_EMail(AEMail: TEMail
    {$IFDEF DELPHI5_LVL}; AShowErrMsg: Boolean = True{$ENDIF}): Boolean;
  function Consiste_URL(AURL: TURL
    {$IFDEF DELPHI5_LVL}; AShowErrMsg: Boolean = True{$ENDIF}): Boolean;

resourcestring

  {$IFDEF LOCK_ON_ERROR}
  SCHK_UFError = 'Unidade Federativa é inválida.';
  SCHK_CnpjError = 'O CNPJ informado é inválido.';
  SCHK_CpfError = 'O CPF informado é inválido.';
  SCHK_MailError = 'O endereço eletrônico informado é inválido.';
  SCHK_URLError = 'A URL informada é inválido.';
  {$ELSE}
  SCHK_UFError = 'Unidade Federativa "%s" é inválida.' + #13 +
    'Deseja prosseguir mesmo assim ?';
  SCHK_CnpjError = 'O CNPJ "%s" é inválido.' + #13 +
    'Deseja prosseguir mesmo assim ?';
  SCHK_CpfError = 'O CPF "%s" é inválido.' + #13 +
    'Deseja prosseguir mesmo assim ?';
  SCHK_MailError = 'O endereço eletrônico "%s" é inválido.' + #13 +
    'Deseja prosseguir mesmo assim ?';
  SCHK_URLError = 'A URL "%s" é inválida.' + #13 +
    'Deseja prosseguir mesmo assim ?';
  {$ENDIF}

implementation

{------------------------------------------------------------------------}
{ formatação                                                             }
{------------------------------------------------------------------------}

{------------------------------------------------------------------------}
{  Formata_CPF                                                           }
{  Retorna uma string contendo o número de CPF formatado.                }
{------------------------------------------------------------------------}
function Formata_CPF(ACPF: TCPF): String;
begin
  Result := ACPF[1] + ACPF[2] + ACPF[3] + '.' +
    ACPF[4] + ACPF[5] + ACPF[6] + '.' +
    ACPF[7] + ACPF[8] + ACPF[9] + '-' + ACPF[10] + ACPF[11];
end;


{------------------------------------------------------------------------}
{  Formata_CNPJ                                                          }
{  Retorna uma string contendo o número de um CNPJ formatado.            }
{------------------------------------------------------------------------}
function Formata_CNPJ(ACNPJ: TCNPJ): String;
begin
  Result := ACNPJ[1] + ACNPJ[2] + '.' +
    ACNPJ[3] + ACNPJ[4] + ACNPJ[5] + '.' +
    ACNPJ[6] + ACNPJ[7] + ACNPJ[8] + '/' +
    ACNPJ[9] + ACNPJ[10] + ACNPJ[11] + ACNPJ[12] + '-' +
    ACNPJ[13] + ACNPJ[14];
end;


{------------------------------------------------------------------------}
{  Formata_CEP                                                           }
{  Retorna uma string contendo o número de um CEP formatado.             }
{------------------------------------------------------------------------}
function Formata_CEP(ACEP: TCEP): String;
begin
  Result := ACEP[1] + ACEP[2] + ACEP[3] + ACEP[4] + ACEP[5] + '-' +
    ACEP[6] + ACEP[7] + ACEP[8];
end;


{------------------------------------------------------------------------}
{ consistência                                                           }
{------------------------------------------------------------------------}

{------------------------------------------------------------------------}
{  Consiste_UF                                                           }
{  Consistência de Estado da União Federativa Brasileira.                }
{------------------------------------------------------------------------}
function Consiste_UF(AUF: TUF
  {$IFDEF DELPHI5_LVL}; AShowErrMsg: Boolean = True{$ENDIF}): Boolean;
const
  _uf: array[1..27] of TUF = (
    'MG', 'SP', 'RJ', 'AL', 'AM', 'BA', 'DF', 'MS', 'MT',
    'TO', 'AC', 'MA', 'RO', 'RR', 'PE', 'RS', 'PA', 'PB',
    'CE', 'GO', 'SC', 'ES', 'AP', 'PI', 'RN', 'SE', 'PR'
  );
var
  i: Byte;
begin
  Result := True;
  AUF := UpperCase(Trim(AUF));
  if (AUF = '') then Exit;
  Result := False;
  for i := Low(_uf) to High(_uf) do
    if (_uf[i] = AUF) then
    begin
      Result := True;
      Break;
    end;
  if (not Result) then
  begin
    {$IFDEF DELPHI5_LVL}
    if AShowErrMsg then
    begin
    {$ENDIF}
      {$IFDEF LOCK_ON_ERROR}
      ErrorMessage(SCHK_UFError);
      {$ELSE}
      Result := WarningMessage(Format(SCHK_UFError, [AUF]));
      {$ENDIF}
    {$IFDEF DELPHI5_LVL}
    end else
      Result := False;
    {$ENDIF}
  end;
end;


{------------------------------------------------------------------------}
{  Consiste_CNPJ                                                         }
{  Consistência de CGC (CNPJ). O parâmetro deve ser enviado SEM nenhuma  }
{  formatação.                                                           }
{------------------------------------------------------------------------}
function Consiste_CNPJ(ACNPJ: TCNPJ
  {$IFDEF DELPHI5_LVL}; AShowErrMsg: Boolean = True{$ENDIF}): Boolean;
var
  Digitos: array[1..SizeOf(TCNPJ)] of Byte;
  n: Byte;
  i, Resto: {$IFDEF DELPHI5_LVL}ShortInt{$ELSE}SmallInt{$ENDIF};
  DV1, DV2: {$IFDEF DELPHI5_LVL}ShortInt{$ELSE}SmallInt{$ENDIF};
  Calculo: Integer;
//  tmp: TCNPJ;
begin
  Result := True;
  if (ACNPJ = '') then Exit;
//  tmp := ACNPJ;
  n := SizeOf(TCNPJ);
  // completa o número com zeros à direita
  while (Length(ACNPJ) < n) do
  begin
    ACNPJ := ACNPJ + '0';
    n:= n -1;
  end;
  // processa o número informado
//  for i := 1 to n do
  for i := Low(Digitos) to High(Digitos) do
  begin
    Digitos[i] := 0;
    if (ACNPJ[i] in ['0'..'9']) then
      Digitos[i] := StrToInt(ACNPJ[i]);
//      Digitos[i] := 9;
  end;
  // obtém o primeiro dígito verificador do CGC
  Calculo :=
    (5 * Digitos[1]) + (4 * Digitos[2]) + (3 * Digitos[3]) +
    (2 * Digitos[4]) + (9 * Digitos[5]) + (8 * Digitos[6]) +
    (7 * Digitos[7]) + (6 * Digitos[8]) + (5 * Digitos[9]) +
    (4 * Digitos[10]) + (3 * Digitos[11]) + (2 * Digitos[12]);
  Resto := Calculo mod 11;
  if (Resto = 0) or (Resto = 1) then
    DV1 := 0
  else
    DV1 := 11 - Resto;
  // obtém o segundo dígito verificador do CGC
  Calculo :=
    (6 * Digitos[1]) + (5 * Digitos[2]) + (4 * Digitos[3]) +
    (3 * Digitos[4]) + (2 * Digitos[5]) + (9 * Digitos[6]) +
    (8 * Digitos[7]) + (7 * Digitos[8]) + (6 * Digitos[9]) +
    (5 * Digitos[10]) + (4 * Digitos[11]) + (3 * Digitos[12]) +
    (2 * DV1);
  Resto := Calculo mod 11;
  if (Resto = 0) or (Resto = 1) then
    DV2 := 0
  else
    DV2 := 11 - Resto;
  // compara os dígitos
  Result := (Digitos[13] = DV1) and (Digitos[14] = DV2);
  if (not Result) then
  begin
    {$IFDEF DELPHI5_LVL}
    if AShowErrMsg then
    begin
    {$ENDIF}
      {$IFDEF LOCK_ON_ERROR}
      ErrorMessage(SCHK_CnpjError);
      {$ELSE}
      Result := WarningMessage(Format(SCHK_CnpjError, [Formata_CNPJ(ACNPJ)]));
      {$ENDIF}
    {$IFDEF DELPHI5_LVL}
    end else
      Result := False;
    {$ENDIF}
  end;
end;


{------------------------------------------------------------------------}
{  ConsisteCPF                                                           }
{  Consistência de números de inscrição de CPF.                          }
{  O argumento deve ser enviado SEM formatação.                          }
{------------------------------------------------------------------------}
function Consiste_CPF(ACPF: TCPF
  {$IFDEF DELPHI5_LVL}; AShowErrMsg: Boolean = True{$ENDIF}): Boolean;
//const
//  _len_max = 11;
var
  Digitos: array[1..SizeOf(TCPF)] of Byte;
  i, n: {$IFDEF DELPHI5_LVL}ShortInt{$ELSE}SmallInt{$ENDIF};
  DV1, DV2: {$IFDEF DELPHI5_LVL}ShortInt{$ELSE}SmallInt{$ENDIF};
  Calculo: Integer;
begin
  Result := True;
  if (ACPF = '') then Exit;
  n := SizeOf(TCPF);
  while (Length(ACPF) < n) do
  begin
    ACPF := ACPF + '0';
    n := n-1;
  end;
  for i := Low(Digitos) to High(Digitos) do
  begin
    Digitos[i] := 0;
    if (ACPF[i] in ['0'..'9']) then
      Digitos[i] := StrToInt(ACPF[i]);
  end;
  // obtém o primeiro dígito verificador
  Calculo := (10 * Digitos[1]) +
    (9 * Digitos[2]) + (8 * Digitos[3]) + (7 * Digitos[4]) +
    (6 * Digitos[5]) + (5 * Digitos[6]) + (4 * Digitos[7]) +
    (3 * Digitos[8]) + (2 * Digitos[9]);
  DV1 := 11 - (Calculo mod 11);
  if (DV1 >= 10) then DV1 := 0;
  // obtém o segundo dígito verificador
  Calculo := (11 * Digitos[1]) + (10 * Digitos[2]) +
    (9 * Digitos[3]) + (8 * Digitos[4]) + (7 * Digitos[5]) +
    (6 * Digitos[6]) + (5 * Digitos[7]) + (4 * Digitos[8]) +
    (3 * Digitos[9]) + (2 * DV1);
  DV2 := 11 - (Calculo mod 11);
  if (DV2 >= 10) then DV2 := 0;
  // compara os dígitos
  Result := (Digitos[10] = DV1) and (Digitos[11] = DV2);
  if (not Result) then
  begin
    {$IFDEF DELPHI5_LVL}
    if AShowErrMsg then
    begin
    {$ENDIF}
      {$IFDEF LOCK_ON_ERROR}
      ErrorMessage(SCHK_CpfError);
      {$ELSE}
      Result := WarningMessage(Format(SCHK_CpfError, [Formata_CPF(ACPF)]));
      {$ENDIF}
    {$IFDEF DELPHI5_LVL}
    end else
      Result := False;
    {$ENDIF}
  end;
end;


{------------------------------------------------------------------------}
{  Consiste_EMail                                                        }
{  Consistência de endereço eletrônico (E-Mail)                          }
{------------------------------------------------------------------------}
function Consiste_EMail(AEMail: TEMail
  {$IFDEF DELPHI5_LVL}; AShowErrMsg: Boolean = True{$ENDIF}): Boolean;
var
  p, n: {$IFDEF DELPHI5_LVL}Integer{$ELSE}SmallInt{$ENDIF};
begin
  Result := True;
  n := Length(Trim(AEMail));
  if (n > 0) then
  begin
    p := Pos('@', AEMail);
    // sinal de @
    if (p = 0) then
    begin
      {$IFDEF DELPHI5_LVL}
      if AShowErrMsg then
      begin
      {$ENDIF}
        {$IFDEF LOCK_ON_ERROR}
        ErrorMessage(SCHK_MailError);
        Result := False;
        {$ELSE}
        Result := WarningMessage(Format(SCHK_MailError, [AEMail]));
        {$ENDIF}
      {$IFDEF DELPHI5_LVL}
      end else
        Result := False;
      {$ENDIF}
    end
    // algum texto antes do @
    else if (Length(Copy(AEMail, 1, p - 1)) = 0) then
    begin
      {$IFDEF DELPHI5_LVL}
      if AShowErrMsg then
      begin
      {$ENDIF}
        {$IFDEF LOCK_ON_ERROR}
        ErrorMessage(SCHK_MailError);
        Result := False;
        {$ELSE}
        Result := WarningMessage(Format(SCHK_MailError, [AEMail]));
        {$ENDIF}
      {$IFDEF DELPHI5_LVL}
      end else
        Result := False;
      {$ENDIF}
    end
    // algum texto depois do @
    else if (Length(Copy(AEMail, p + 1, Length(AEMail))) = 0) then
    begin
      {$IFDEF DELPHI5_LVL}
      if AShowErrMsg then
      begin
      {$ENDIF}
        {$IFDEF LOCK_ON_ERROR}
        ErrorMessage(SCHK_MailError);
        Result := False;
        {$ELSE}
        Result := WarningMessage(Format(SCHK_MailError, [AEMail]));
        {$ENDIF}
      {$IFDEF DELPHI5_LVL}
      end else
        Result := False;
      {$ENDIF}
    end
    // ponto depois do @
    else if (Pos('.', Copy(AEMail, p + 1, Length(AEMail))) = 0) then
    begin
      {$IFDEF DELPHI5_LVL}
      if AShowErrMsg then
      begin
      {$ENDIF}
        {$IFDEF LOCK_ON_ERROR}
        ErrorMessage(SCHK_MailError);
        Result := False;
        {$ELSE}
        Result := WarningMessage(Format(SCHK_MailError, [AEMail]));
        {$ENDIF}
      {$IFDEF DELPHI5_LVL}
      end else
        Result := False;
      {$ENDIF}
    end;
  end;
end;


{------------------------------------------------------------------------}
{  ConsisteURL                                                           }
{  Consistência de URL (site web)                                        }
{------------------------------------------------------------------------}
function Consiste_URL(AURL: TURL
  {$IFDEF DELPHI5_LVL}; AShowErrMsg: Boolean = True{$ENDIF}): Boolean;
var
  {$IFDEF DELPHI5_LVL}
  n: Integer;
  {$ELSE}
  n: SmallInt;
  {$ENDIF}
begin
	Result := True;
  n := Length(Trim(AURL));
	if (n = 0) then Exit;
  if (Pos('.', AURL) > 0) then
  begin
    {$IFDEF DELPHI5_LVL}
    if AShowErrMsg then
    begin
    {$ENDIF}
      {$IFDEF LOCK_ON_ERROR}
      ErrorMessage(SCHK_URLError);
      Result := False;
      {$ELSE}
      Result := WarningMessage(Format(SCHK_URLError, [AURL]));
      {$ENDIF}
    {$IFDEF DELPHI5_LVL}
    end else
      Result := False;
    {$ENDIF}
  end;
end;


end.
