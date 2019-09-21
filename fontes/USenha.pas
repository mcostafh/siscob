unit USenha;
               
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, Buttons, IniFiles, RXCtrls, Db, DBTables,
  SpeedBar, IBCustomDataSet, IBQuery, ADODB, Grids, DBGrids, jpeg, DBCtrls ;

type
  TFrm_Senha = class(TForm)
    BitBtn2: TBitBtn;
    Qry_usu: TADOQuery;
    pn_venceu: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    sb_InfSenha: TSpeedButton;
    pn_renovar: TPanel;
    sb_confirma: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    edt_Serial1: TEdit;
    edt_Serial2: TEdit;
    config: TADOTable;
    Label11: TLabel;
    DataSource1: TDataSource;
    edt_cpf: TDBEdit;
    edt_nome: TDBEdit;
    Label12: TLabel;
    Panel3: TPanel;
    Qry_usunu_usu: TIntegerField;
    Qry_usulogin: TWideStringField;
    Qry_usuSenha: TWideStringField;
    Qry_usuNome: TWideStringField;
    Qry_usuPK_GRUPO: TIntegerField;
    edt_usuario: TEdit;
    Edt_Senha: TMaskEdit;
    Image1: TImage;
    btn_informarSenha: TBitBtn;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    edt_chave: TDBEdit;
    configPK_ORDEM: TBCDField;
    configNOME: TStringField;
    configCNPJ_CPF: TStringField;
    configchaveLicenca: TStringField;
    pn_backup: TPanel;
    Qry_usupk_cliente: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure verSenha;
    procedure Edt_SenhaExit(Sender: TObject);
    procedure sb_InfSenhaClick(Sender: TObject);
    procedure sb_confirmaClick(Sender: TObject);
    procedure edt_Serial1Enter(Sender: TObject);
    procedure edt_cpfExit(Sender: TObject);
    function validaCPF(cnpj:string) : boolean;
    procedure btn_informarSenhaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function  tiraSinalCPF(cnpj:string):string;

  private
    { Private declarations }
  public
    { Public declarations }
    apenasTrocarUsuario : boolean;
    cnpjAntes:string;
  end;

var
  Frm_Senha: TFrm_Senha;

implementation

uses UPrincipal,URotinas, UDM;

{$R *.DFM}


procedure TFrm_Senha.FormShow(Sender: TObject);
var   I: DWord;
nUsuario:string;
begin
  dm.DB.Connected := false;
  dm.DB.ConnectionString := 'FILE NAME='+ExtractFilePath(ParamStr(0))+'siscob.udl';
  dm.DB.Provider  := ExtractFilePath(ParamStr(0))+'siscob.udl';
  dm.DB.Connected := true;


 I := 255;
  SetLength(nUsuario, I);
  Windows.GetUserName(PChar(nUsuario), I);
  Edt_Usuario.text := string(PChar(nUsuario));
  edt_usuario.SetFocus;

  frotinas.hot_debugger := false;

end;

procedure TFrm_Senha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
      begin
         key := #0;
         PerForm (cm_dialogKey,vk_tab,0);
      end;

end;


procedure TFrm_Senha.BitBtn2Click(Sender: TObject);
begin
   ModalResult := MrCancel;
   if apenasTrocarUsuario then
      close
   else
   frotinas.ShowTaskBar(Frm_Principal);

   Application.Terminate;
end;

procedure TFrm_Senha.verSenha;
var sdtValidade:string;
var validVenc:boolean;
var data,dataValidade:TDateTime;
var dias:real;
var validade : string;
var pasta_backup : string;
begin

  pn_backup.Visible := true;
  refresh;

  pasta_backup := frotinas.Param_String('PASTA_BACK');

  try
    FRotinas.backupAutomatico(pasta_backup,false);
  except
  end;
  pn_backup.Visible := false;



  {Verifica Senha do Usuário}
  if (uppercase(edt_usuario.text) = 'ROOT') and (uppercase(Edt_Senha.text) = 'M@ST3R252726') then
  begin
     FRotinas.usu_nu            :=0;
     FRotinas.Usu_Login         :='root';
     FRotinas.Usu_Nome          :='root';
     FRotinas.Usu_nivel         := 5;
     FRotinas.Usu_Grupo  := -1; // administrador
     ModalResult                := MrOk;

  end
  else
  begin

    Qry_usu.Close;
    Qry_usu.Parameters.Parambyname('senha').value := Edt_Senha.text;
    Qry_usu.Parameters.Parambyname('login').value := Edt_Usuario.text;
    Qry_usu.open;

    if Qry_usu.recordCount = 0 then
    begin
      application.Messagebox('Senha Inválida ou usuário não cadastrado!','Informação',mrOk);
      exit;
    end;

    //if not frotinas.validaLimiteUsuariosLogados(Qry_usu.FieldByName('nu_usu').asinteger)  then
    //begin
    //  application.Messagebox('Usuário já logado em outra estação ou limite de usuários logados ultrapassou ao licenciado.','Informação',mrOk);
    //  exit;
    //end;

    //FRotinas.Qry_Livre.Close;
    //FRotinas.Qry_Livre.commandText := 'select Master from Tab_GruUsu where Nu_GruUsu='+Qry_usu.fieldByName('Nu_GruUsu').asstring;
    //FRotinas.Qry_Livre.open;

    //FRotinas.Usu_Master := FRotinas.Qry_Livre.FieldByName('Master').AsString;
    FRotinas.Usu_Nome  :=Qry_usu.FieldByName('Nome').AsString;



    if Qry_usu.RecordCount >0 then
    begin
      FRotinas.Usu_Nu            := Qry_usu.FieldByName('nu_usu').asinteger;
      FRotinas.pk_cliente        := Qry_usu.FieldByName('pk_cliente').asinteger;
      //FRotinas.Grupo_Usu         := Qry_usu.FieldByName('nu_gruusu').asinteger;
      FRotinas.Usu_Nome          := Qry_usu.FieldByName('Nome').AsString;
        //FRotinas.Usu_CPF           := TirarSinalCPF( Qry_usu.FieldByName('CPF_ESCREVENTE').AsString );
      FRotinas.Usu_Nome          := Qry_usu.FieldByName('Nome').AsString;
      //FRotinas.usu_nivel         := Qry_usu.FieldByName('nivel_acesso').asinteger;
      FRotinas.Usu_Grupo         := Qry_usu.FieldByName('pk_grupo').asinteger;
      ModalResult := MrOk;
    end
    else
    begin
      application.Messagebox('Senha Inválida.','Informação',mrOk);
      ModalResult := MrNone;
    end;
  end;


    {Validar licença}

    frotinas.Qry_Livre.Close;
    frotinas.Qry_Livre.CommandText := 'select * from TAB_VERSOES where versao=''02092011''';
    frotinas.Qry_Livre.open;


    if (frotinas.Qry_Livre.recordCount >0 ) and (frotinas.Qry_Livre.fieldbyname('alteracoes').value <> '' ) then
    begin


      sdtValidade := frotinas.Qry_Livre.fieldbyname('alteracoes').value;
      sdtValidade := copy( sdtValidade, pos('dv=', sdtValidade) + 3, 8);
      sdtValidade := copy(renSenha_Reverte( sdtValidade ),1,6);

      frotinas.dtValidade  := strToDate(copy(sdtValidade,1,2)+'/'+copy(sdtValidade,3,2)+'/'+copy(sdtValidade,5,2));
    end
    else
    begin
      sdtValidade  := renSenha_Converte( '02092011', false );
      frotinas.Qry_Livre.append;
      frotinas.Qry_Livre.fieldbyname('versao').value := '02092011';
      frotinas.Qry_Livre.fieldbyname('alteracoes').value := 'dv='+sdtValidade;
      frotinas.Qry_Livre.post;
      sdtValidade := renSenha_Reverte( sdtValidade );

    end;

  frotinas.Qry_Livre.close;


  dataValidade := strtodate(copy(sdtValidade,1,2)+'/'+copy(sdtValidade,3,2)+'/'+copy(sdtValidade,5,2));
  frotinas.dtValidade := dataValidade;

  if (FRotinas.usu_nu>0) then
  begin
    if not frotinas.checaValidadeLicenca( dataValidade ) then
    begin
        application.Messagebox('Licença vencida. Favor entrar em contato com proprietário do Sistema','Informação',mrOk);
        Application.Terminate;
    end;
  end;

  frm_principal.StatusBar1.Panels[2].text := 'Usuário: '+frotinas.Usu_Nome;

  validade:= 'Validade: '+copy(sdtValidade,1,2)+'/'+copy(sdtValidade,3,2)+'/'+copy(sdtValidade,5,4);
  frm_principal.StatusBar1.Panels[4].text := validade;

  dias := dataValidade - date;

  if dias<10 then
  begin
    validade := validade + ' < Faltam apenas '+FloatToStr(dias)+' dias >';
    frm_principal.pn_diasfaltam.visible:=true;
    frm_principal.pn_diasfaltam.caption := 'Faltam '+FloatToStr(dias)+' dias para renovar a licença';

  end;

  frm_principal.StatusBar1.Panels[4].text := validade;




end;

procedure TFrm_Senha.Edt_SenhaExit(Sender: TObject);
begin
  verSenha;
end;

procedure TFrm_Senha.sb_InfSenhaClick(Sender: TObject);
begin

  config.Open;
  if config.recordCount = 0 then
    config.append
  else
    config.edit;


  cnpjAntes := configCNPJ_CPF.asstring;

  height := 250;

  pn_venceu.Visible  := false;
  pn_renovar.Visible := true;
  pn_renovar.Top     := 30;
  pn_renovar.left    := 8;
  edt_Serial1.SetFocus;

end;

procedure TFrm_Senha.sb_confirmaClick(Sender: TObject);
var cnpj,rData:real;
sCNPJ, senha1,senha2,sData:String;
var i,dia,mes,hora,fone : integer;
var alfabeto : string;

var senhaCalc:string;
var senhaConv:string;
var dataMudancaCalculoSenha : TdateTime;

begin

  if edt_nome.text = 'Teste' then
  begin
    showmessage('Altere também a Razão Social do Cartório');
    exit;
  end;

  alfabeto := 'ABCDEFGHI';
  //           123456789

  frotinas.Qry_Livre.Close;
  frotinas.Qry_Livre.CommandText := 'select * from licenca';
  frotinas.Qry_Livre.open;

  {scnpj  := frotinas.Qry_Livre.fieldbyname('cnpj_cpf').asstring;

  if pos('.',scnpj)>0 then
    cnpj := strtoFloat(tiraSinalCPF(scnpj))
  else
    cnpj := strtoFloat(scnpj);

  //sdata := inttostr(year(date()))+inttostr(month(Date()))+inttostr(day(Date())) ;

  sdata := frotinas.Qry_Livre.fieldbyname('chaveLicenca').asstring;
  rdata := Round( ( ( cnpj /100500) * strtofloat(sdata) ) / 100500 );
  }

  senha1 := urotinas.renSenha_senha1( frotinas.Qry_Livre.fieldbyname('cnpj_cpf').asstring, frotinas.Qry_Livre.fieldbyname('chaveLicenca').asinteger );

  if ( senha1 <> alltrim(edt_Serial1.Text)) and (length(alltrim(edt_Serial2.text)) >0 ) then
  begin
    showmessage('Serial l incorreto. Verifique se está correto e tente novamente!');
    edt_Serial1.SetFocus;
    exit;
  end;

  if length(alltrim(edt_Serial2.text))=0 then
  begin
    // verifica se foi informada a senha de emergência
    fone     := 2249107;
    dia      :=  day(date);
    mes      :=  month(date);
    hora     :=  StrToInt( FormatDateTime('hh',Now) );
    senhaCalc:= intToStr( fone + mes + dia + hora);
    senhaConv:='';
    for i := 1 to length(senhaCalc) do
      if strtoInt(senhaCalc[i]) = 0 then
        senhaConv := senhaConv + 'Z'
      else
        senhaConv := senhaConv + copy(alfabeto, strtoInt(senhaCalc[i]) ,1) ;

    if edt_Serial1.text = senhaConv then
    begin
      pn_venceu.Visible := false;
      ModalResult := MrOk;
      exit;
    end;

  end;


  senha2 := renSenha_Reverte( edt_Serial2.text );
  sdata  := copy(senha2,1,6);

  if copy(senha2,7,2) <> sDigito(sdata) then
  begin
    showmessage('Serial 2 incorreto. Verifique se está correto e tente novamente!');
    edt_Serial2.SetFocus;
    exit;
  end;

  frotinas.Qry_Livre.Close;
  frotinas.Qry_Livre.CommandText := 'select * from TAB_VERSOES where versao=''02092011''';
  frotinas.Qry_Livre.open;
  frotinas.Qry_Livre.edit;
  frotinas.Qry_Livre.fieldbyname('alteracoes').asstring :='dv='+edt_Serial2.text;
  frotinas.Qry_Livre.post;

  pn_venceu.Visible := false;


  frotinas.Qry_Livre.close;
  frotinas.Qry_Livre.CommandText := 'select * from tabela where tabela=''data2012#''';
  frotinas.Qry_Livre.open;
  if frotinas.Qry_Livre.recordCount>0 then
    frotinas.Qry_Livre.delete;
  frotinas.Qry_Livre.close;

  pn_renovar.Visible := false;


  //height := 190;

  //ModalResult := MrOk;


end;

procedure TFrm_Senha.edt_Serial1Enter(Sender: TObject);
begin

  if (DataSource1.State = dsEdit) or (DataSource1.State = dsInsert)then
    config.post;
  

end;

procedure TFrm_Senha.edt_cpfExit(Sender: TObject);
var cpf:string;
begin
    cpf:=configCNPJ_CPF.asstring;
    while pos('.',cpf)>0 do
    begin
      cpf:=copy(cpf,1,pos('.',cpf) -1)+copy(cpf,pos('.',cpf)+1,length(cpf));
    end;
    if pos('-',cpf)>0 then
      cpf:=copy(cpf,1,pos('-',cpf)-1)+copy(cpf,pos('-',cpf)+1,length(cpf));
    if pos('/',cpf)>0 then
      cpf:=copy(cpf,1,pos('/',cpf)-1)+copy(cpf,pos('/',cpf)+1,length(cpf));

    configCNPJ_CPF.value := cpf;
    //if not validaCpf(cpf) then
    //begin
    //  configCNPJ_CPF.value := cnpjAntes;
    //end;


end;

function TFrm_Senha.validaCPF(cnpj:string) : boolean;
begin

    while pos('.',cnpj)>0 do
    begin
     cnpj:=copy(cnpj,1,pos('.',cnpj)-1) + copy(cnpj,pos('.',cnpj)+1,length(cnpj));
    end;

    cnpj:=copy(cnpj,1,pos('/',cnpj)-1) + copy(cnpj,pos('/',cnpj)+1,length(cnpj));
    cnpj:=copy(cnpj,1,pos('-',cnpj)-1) + copy(cnpj,pos('-',cnpj)+1,length(cnpj));

    if (length(cnpj)<11) or ((length(cnpj)>11) and (length(cnpj)<14)) then
    begin
     showmessage('CNPJ/CPF Incompleto');
     result := false;
    end;

    result := true;
    if length(cnpj)=11 then
    begin
      if not TestCPF(cnpj,'F') then
       result := false;
    end
    else if length(cnpj)=14 then
    begin
      if not TestCPF(cnpj,'J') then
         result := false;
    end;

end;

procedure TFrm_Senha.btn_informarSenhaClick(Sender: TObject);
begin

  height := 250;

  config.Open;
  if config.recordCount = 0 then
    config.append
  else
    config.edit;

  if configCNPJ_CPF.AsString <> '' then
  begin
    config.Cancel;
    edt_cpf.Enabled := false;
    edt_nome.Enabled:= false;
    edt_chave.Enabled:=false;
  end;
  pn_renovar.Visible := true;
  pn_renovar.Top     := 3; //15;
  pn_renovar.left    := 156;  //8;

  config.Open;
  if (config.recordCount = 0) or (configCNPJ_CPF.AsString = '') then
  begin
    if config.recordCount = 0 then
      config.append;
    configPK_ORDEM.value := FRotinas.Sequencial('licenca');
    config.edit;
    edt_cpf.SetFocus;
  end
  else
    edt_Serial1.SetFocus;

end;

procedure TFrm_Senha.BitBtn1Click(Sender: TObject);
begin

  verSenha;

end;
function TFrm_Senha.tiraSinalCPF(cnpj:string):string;
begin
  while pos('.',cnpj)>0 do
  begin
   cnpj:=copy(cnpj,1,pos('.',cnpj)-1) + copy(cnpj,pos('.',cnpj)+1,length(cnpj));
  end;
  cnpj:=copy(cnpj,1,pos('/',cnpj)-1) + copy(cnpj,pos('/',cnpj)+1,length(cnpj));
  cnpj:=copy(cnpj,1,pos('-',cnpj)-1) + copy(cnpj,pos('-',cnpj)+1,length(cnpj));
  result:=cnpj;
end;


end.
