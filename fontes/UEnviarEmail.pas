unit UEnviarEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, DB, ADODB, StdCtrls, DBCtrls, Mask,
  IdAntiFreezeBase, IdAntiFreeze, IdSMTP, IdMessage, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdPOP3;

type
  Tfrm_envioEmail = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Qry_config: TADOQuery;
    Dts_config: TDataSource;
    GroupBox1: TGroupBox;
    Qry_configPK_ORDEM: TBCDField;
    Qry_configCLIENTE: TBCDField;
    Qry_configNOME: TStringField;
    Qry_configFORMATO_DT: TStringField;
    Qry_configCALC_JUROS_CARTAO: TStringField;
    Qry_configOCOR_PAGOU: TBCDField;
    Qry_configOCOR_PAGOU_PARC: TBCDField;
    Qry_configEMAIL_NOME: TStringField;
    Qry_configEMAIL_CONTA: TStringField;
    Qry_configEMAIL_SENHA: TStringField;
    Qry_configEMAIL_SMTP: TStringField;
    Qry_configEMAIL_SMTP_PORTA: TStringField;
    Qry_configEMAIL_REQUER_AUT: TStringField;
    Qry_configEMAIL_ASSUNTO: TStringField;
    Qry_configEMAIL_TITULO: TStringField;
    Qry_configEMAIL_RODAPE: TStringField;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    sb_enviarEmail: TSpeedButton;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edt_nome_de: TDBEdit;
    edt_email_de: TDBEdit;
    edt_nome_para: TDBEdit;
    edt_email: TDBEdit;
    edt_assunto: TEdit;
    edt_titulo: TMemo;
    edt_corpo: TMemo;
    edt_rodape: TMemo;
    MailReceive: TIdPOP3;
    MSG: TIdMessage;
    IdSMTP1: TIdSMTP;
    IdAntiFreeze1: TIdAntiFreeze;
    lb_mens: TLabel;
    Qry_configlogotipo_email: TStringField;
    Qry_configEMAIL_CORPO: TStringField;
    Qry_configOCOR_ENV_EMAIL: TBCDField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sb_enviarEmailClick(Sender: TObject);
    function conectaSMTP():boolean;
    function montarCorpoEmail(para:string; titulo:string; corpo:string; rodape:string):string;
    function gravarEvento():boolean;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_envioEmail: Tfrm_envioEmail;

implementation

uses URotinas,Ucons_cobranca;

{$R *.dfm}

procedure Tfrm_envioEmail.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure Tfrm_envioEmail.FormShow(Sender: TObject);
begin
Qry_config.Open;
Qry_config.Locate('cliente', frm_cons_cobranca.qry_devedores.FieldByName('pk_cliente').Value, []);

edt_assunto.text := Qry_configEMAIL_ASSUNTO.Value;
edt_titulo.text  := Qry_configEMAIL_TITULO.Value;
edt_rodape.text  := Qry_configEMAIL_RODAPE.Value;
edt_corpo.Text   := Qry_configEMAIL_CORPO.value;


end;

function Tfrm_envioEmail.gravarEvento():boolean;
var chave : integer;
begin
//
  with frm_cons_cobranca do
  begin

    chave := frotinas.Sequencial('eventos');

    qry_evento.Close;
    qry_evento.open;

    qry_evento.append;
    qry_eventochave.value := chave;
    qry_eventopk_devedor.value := devedorpk_devedor.Value;
    qry_eventoData.value :=  Date;
    qry_eventoHora.value := FormatDateTime( 'hh:mm:ss', time);
    qry_eventomotivo.value := Qry_configOCOR_ENV_EMAIL.asinteger;
    qry_eventoTexto.Value := edt_corpo.lines.text;
    //qry_eventopk_cobrador.Value := devedorpk_cobrador.Value;
    qry_eventopk_cliente.Value  := devedorpk_cliente.Value;
    qry_evento.post;

    devedor.edit;
    devedormotivo_dialogo.value := qry_eventomotivo.value;
    devedordata_dialogo.value := qry_eventoData.value;
    devedor.post;

  end;

end;

function Tfrm_envioEmail.conectaSMTP():boolean;
begin

  if IdSMTP1.Connected then
    result := IdSMTP1.Connected
  else
  begin
    IdSMTP1.Username            := alltrim(Qry_configEMAIL_CONTA.asstring);
    IdSMTP1.Password            := alltrim(Qry_configEMAIL_SENHA.asstring);
    IdSMTP1.Host                := alltrim(Qry_configEMAIL_SMTP.asstring);
    IdSMTP1.port                := Qry_configEMAIL_SMTP_PORTA.asinteger;
    //IdSMTP1.AuthSchemesSupported:= '';

    if Qry_configEMAIL_REQUER_AUT.asstring = 'S' then
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

function Tfrm_envioEmail.montarCorpoEmail(para:string; titulo:string; corpo:string; rodape:string):string;
var html : string;
begin

  html := '<html>';
  html := html+'<style type="text/css"> ';
  html := html+'td { font-family: Verdana; font-size: 14px;}';
  html := html+'</style>';
  html := html+'<body font="font-family:Verdana; font-size: 14px;" src="cid:logo.jpeg">';
  html := html+'Prezado(a) Sr(a):&nbsp;&nbsp;<b>'+para+'</b><br><br>';
  html := html+'<b>'+titulo+'</b><br><br><br>';
  html := html+corpo+'<br><br>';
  html := html+rodape+'<br><br>';
  html := html+'<img src="cid:logo.jpeg"/>';
  html := html+'</body>';
  html := html+'</html>';

  result:= html;

end;


procedure Tfrm_envioEmail.sb_enviarEmailClick(Sender: TObject);
var Email: Tidmessage;
var Texto:TidText;
var Html:TidText;
var Anexo:TidAttachment;
begin

if edt_email.text = '' then
begin
  showmessage('Não foi informada a conta de e-Mail destino');
  exit;
end;

  {
  servidor: smtp.mail.yahoo.com.br
  porta: 25
  autentica: true
  conta: recuperesolucoescobranca@yhoo.com.br
  }

  lb_mens.Visible := true;
  refresh;
  if not conectaSMTP() then
  begin
    showmessage('Não foi possível conectar ao servidor de e-mails: '+Qry_configEMAIL_SMTP.asstring+'. Verifique se foi efetuado o login de autenticação em seu provedor.');
    exit;
  end;

  Email := TidMessage.Create(nil);

  try

    Email.ContentType :=  'multipart/mixed';

    Texto := TidText.Create( Email.MessageParts);
    Texto.Body.text := 'esta mensagem contém HTML e imagens';
    Texto.ContentType := 'text/plain';

    Html:= TidText.Create( Email.MessageParts);
    Html.Body.Text := montarCorpoEmail( edt_nome_para.text, edt_titulo.lines.text, edt_corpo.lines.text ,edt_rodape.lines.text);
    Html.ContentType := 'text/html';


    Email.subject                   := edt_assunto.text;
    Email.From.Name                 := edt_nome_de.text;
    Email.From.Address              := edt_email_de.text;

    Email.Recipients.EMailAddresses := edt_email.text;

    TIdAttachment.create(Email.MessageParts, TFileName(Qry_configlogotipo_email.asstring));
    IdSMTP1.Send( Email );

    gravarEvento();


  finally
    IdSMTP1.Disconnect;
    close;
  end;


end;

end.
