unit UQrSenhas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, QuickRpt, ExtCtrls, QRCtrls, StdCtrls, Mask, DBCtrls;

type
  TQr_Senhas = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    ADOQuery1: TADOQuery;
    Qrlb_Titulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape1: TQRShape;
    qrlb_senha1: TQRLabel;
    qrlb_Senha2: TQRLabel;
    qrlb_renovar: TQRLabel;
    ADOQuery1PK_ORDEM: TBCDField;
    ADOQuery1NOME: TStringField;
    ADOQuery1CNPJ_CPF: TStringField;
    ADOQuery1chaveLicenca: TStringField;
    ADOQuery1SERIAL1: TStringField;
    ADOQuery1SERIAL2: TStringField;
    ADOQuery1VALIDADE: TDateTimeField;
    ADOQuery1RENOVACAO: TDateTimeField;
    DataSource1: TDataSource;
    Label1: TLabel;
    Validade: TQRLabel;
    QRDBText3: TQRDBText;
    function  tiraSinalCPF(cnpj:string):string;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Qr_Senhas: TQr_Senhas;

implementation

{$R *.dfm}

uses UDM,Urotinas, URenovaSenha;

procedure TQr_Senhas.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var cnpj,rData:real;
chaveLic:String;
begin
 {
  //ADOQuery1.First;
  //while not ADOQuery1.eof do
  //begin

    cnpj  := strtoFloat(tiraSinalCPF(ADOQuery1CNPJ_CPF.value));
    chaveLic :=  ADOQuery1chaveLicenca.asstring;
    rdata := Round( ( ( cnpj /100500) * strtofloat(chaveLic) ) / 100500 );
    qrlb_senha1.caption := renSenha_Converte(  floattostr( rdata  ), true);
    chaveLic           := FormatDateTime( 'DDMMYY',Frm_RenovaSenha.edt_Validade.date);
    chaveLic           := chaveLic + sDigito(chaveLic);
    qrlb_Senha2.caption := renSenha_Converte( chaveLic , false);

    Frm_RenovaSenha.gravarSenhaGerada(ADOQuery1CNPJ_CPF.asstring, ADOQuery1Nome.asstring,qrlb_senha1.caption,qrlb_Senha2.caption);

  //  ADOQuery1.next;
  //end;
  //ADOQuery1.First; }

    qrlb_senha1.caption := ADOQuery1SERIAL1.value;
    qrlb_Senha2.caption := ADOQuery1SERIAL2.value;

 end;

function TQr_Senhas.tiraSinalCPF(cnpj:string):string;
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
