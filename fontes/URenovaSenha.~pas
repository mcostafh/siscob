unit URenovaSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask, DB, ADODB,
  Grids, DBGrids, ToolEdit, RXDBCtrl, CurrEdit, RXSpin, QRExport, shellapi,
  QRWebFilt;

type
  TFrm_RenovaSenha = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    Dts_Cliente: TDataSource;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    PageControl3: TPageControl;
    TabSheet5: TTabSheet;
    pn_Cad: TPanel;
    SB_Inserir: TSpeedButton;
    SB_Alterar: TSpeedButton;
    SB_Salvar: TSpeedButton;
    SB_Cancelar: TSpeedButton;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    edt_Validade: TDateEdit;
    QRHTMLFilter1: TQRHTMLFilter;
    QRTextFilter1: TQRTextFilter;
    sbt_imprime: TSpeedButton;
    sbt_gerar: TSpeedButton;
    Tb_SenhasGeradas: TADOTable;
    sb_fecar: TSpeedButton;
    TabSheet7: TTabSheet;
    DBGrid3: TDBGrid;
    Dts_SenhasGeradas: TDataSource;
    Qry_SenhasGeradas: TADOQuery;
    Qry_SenhasGeradasPK_ORDEM: TBCDField;
    Qry_SenhasGeradasNOME: TStringField;
    Qry_SenhasGeradasCNPJ_CPF: TStringField;
    Qry_SenhasGeradaschaveLicenca: TStringField;
    Qry_SenhasGeradasSERIAL1: TStringField;
    Qry_SenhasGeradasSERIAL2: TStringField;
    Qry_SenhasGeradasVALIDADE: TDateTimeField;
    Qry_SenhasGeradasRENOVACAO: TDateTimeField;
    Label3: TLabel;
    edt_cnpj: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Tb_SenhasGeradasPK_ORDEM: TBCDField;
    Tb_SenhasGeradasNOME: TStringField;
    Tb_SenhasGeradasCNPJ_CPF: TStringField;
    Tb_SenhasGeradaschaveLicenca: TStringField;
    Tb_SenhasGeradasSERIAL1: TStringField;
    Tb_SenhasGeradasSERIAL2: TStringField;
    Tb_SenhasGeradasVALIDADE: TDateTimeField;
    Tb_SenhasGeradasRENOVACAO: TDateTimeField;
    Qry_Cliente: TADOQuery;
    Qry_ClientePK_ORDEM: TBCDField;
    Qry_ClienteNOME: TStringField;
    Qry_ClienteCNPJ_CPF: TStringField;
    Qry_ClientechaveLicenca: TStringField;
    procedure BitBtn2Click(Sender: TObject);
    procedure SB_InserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_SalvarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure poeCor;
    procedure tiraCor;
    procedure SB_AlterarClick(Sender: TObject);
    procedure SB_CancelarClick(Sender: TObject);
    procedure Dts_ClienteDataChange(Sender: TObject; Field: TField);
    procedure sb_gerarmensalidadeClick(Sender: TObject);
    procedure sbt_imprimeClick(Sender: TObject);
    procedure sbt_gerarClick(Sender: TObject);
    procedure gravarSenhaGerada;
    procedure sb_fecarClick(Sender: TObject);
    procedure Qry_SenhasGeradasBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function  tiraSinalCPF(cnpj:string):string;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_RenovaSenha: TFrm_RenovaSenha;

implementation

{$R *.dfm}
uses UDM, URotinas, UQrSenhas, USenha;
procedure TFrm_RenovaSenha.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TFrm_RenovaSenha.SB_InserirClick(Sender: TObject);
begin
pn_Cad.enabled := true;
tiraCor;
Qry_Cliente.Append;
SB_Salvar.Enabled := true;
SB_Cancelar.enabled:=true;
SB_Inserir.enabled := false;

end;

procedure TFrm_RenovaSenha.FormShow(Sender: TObject);
begin

Qry_Cliente.open;
Qry_SenhasGeradas.open;

poeCor;

end;

procedure TFrm_RenovaSenha.SB_SalvarClick(Sender: TObject);
begin
Qry_cliente.Post;

poeCor;
pn_Cad.enabled := false;
SB_Inserir.enabled := true;
SB_Alterar.enabled := true;
SB_Salvar.enabled := false;
SB_Cancelar.enabled := false;
end;

procedure TFrm_RenovaSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
      begin
         key := #0;
         PerForm (cm_dialogKey,vk_tab,0);
      end;

end;

procedure TFrm_RenovaSenha.poeCor;
var i:integer;
begin

  for i:=0 to ComponentCount-1 do
  begin
     if (Components[i].ClassName = 'TEdit') or
        (Components[i].ClassName = 'TDBEdit') or
        (Components[i].ClassName = 'TDBListBox') or
        (Components[i].ClassName = 'TMaskEdit')          or
        (Components[i].ClassName = 'TDBComboBox') or
        (Components[i].ClassName = 'TRxDBCalcEdit')          or
        (Components[i].ClassName = 'TRxDBComboBox') or
        (Components[i].ClassName = 'TDBLookupComboBox') or
        (Components[i].ClassName = 'TDBLookupListBox') or
        (Components[i].ClassName = 'TComboBox')      or
        (Components[i].ClassName = 'TDBMemo')            or
        (Components[i].ClassName = 'TRxDBLookupCombo')          or
        (Components[i].ClassName = 'TRxDBRichEdit')      or
        (Components[i].ClassName = 'TDBDateEdit') or
        (Components[i].ClassName = 'TCurrencyEdit') then
     begin
        Tedit(Components[i]).Color        := clInfoBk; //$00404000;
        TEdit(Components[i]).Font.Color   := clActiveCaption; //ClBlack;
     end;

  end;
end;

procedure TFrm_RenovaSenha.tiraCor;
var i:integer;
begin
  for i:=0 to ComponentCount-1 do
  begin
     if (Components[i].ClassName = 'TEdit') or
        (Components[i].ClassName = 'TDBEdit') or
        (Components[i].ClassName = 'TDBListBox') or
        (Components[i].ClassName = 'TDBComboBox') or
        (Components[i].ClassName = 'TRxDBComboBox') or
        (Components[i].ClassName = 'TDBLookupComboBox') or
        (Components[i].ClassName = 'TDBLookupListBox') or
        (Components[i].ClassName = 'TDBMemo')            or
        (Components[i].ClassName = 'TMaskEdit')          or
        (Components[i].ClassName = 'TRxDBCalcEdit')          or
        (Components[i].ClassName = 'TRxDBLookupCombo')          or
        (Components[i].ClassName = 'TDBDateEdit')      or
        (Components[i].ClassName = 'TRxDBRichEdit')      or
        (Components[i].ClassName = 'TComboBox')      or
        (Components[i].ClassName = 'TCurrencyEdit') then
     begin
        Tedit(Components[i]).Color        := clWindow;
        TEdit(Components[i]).Font.Color   := clBlack;
     end;
  end;


end;

procedure TFrm_RenovaSenha.SB_AlterarClick(Sender: TObject);
begin
pn_Cad.enabled := true;
tiraCor;
Qry_Cliente.edit;
SB_Salvar.Enabled := true;
SB_Cancelar.enabled:=true;
SB_Alterar.enabled :=false;

end;

procedure TFrm_RenovaSenha.SB_CancelarClick(Sender: TObject);
begin
poeCor;
Qry_Cliente.Cancel;
pn_Cad.enabled := false;
SB_Inserir.enabled := true;
SB_Alterar.enabled := true;
SB_Salvar.enabled := false;
SB_Cancelar.enabled := false;

end;

procedure TFrm_RenovaSenha.Dts_ClienteDataChange(Sender: TObject;
  Field: TField);
var pagos:boolean;
begin


end;

procedure TFrm_RenovaSenha.sb_gerarmensalidadeClick(Sender: TObject);
var dtinicio:TDateTime;
begin

end;


procedure TFrm_RenovaSenha.sbt_imprimeClick(Sender: TObject);
begin
  gravarSenhaGerada;

  Application.CreateForm(TQr_Senhas, Qr_Senhas);
  Qr_Senhas.qrlb_renovar.caption := 'Data para renovação ';
  Qr_Senhas.Qrlb_Titulo.caption := 'Senhas de Renovação até '+edt_Validade.Text;


  Qr_Senhas.ADOQuery1.open;

  Qr_Senhas.QuickRep1.preview;

  //Qr_Senhas.QuickRep1.ExportToFilter(TQRHTMLDocumentFilter.Create('teste.html'));

  Qr_Senhas.QuickRep1.ExportFilter.Free;


  Qr_Senhas.destroy;


end;

procedure TFrm_RenovaSenha.gravarSenhaGerada;
var where : string;
var cnpj,rData:real;
chaveLic,senha1, senha2:String;

begin


  Qry_SenhasGeradas.First;
  while not Qry_SenhasGeradas.eof do
  begin

    //cnpj  := strtoFloat(tiraSinalCPF(Qry_SenhasGeradasCNPJ_CPF.value));
    //chaveLic :=  Qry_SenhasGeradaschaveLicenca.asstring;
    //rdata := Round( ( ( cnpj /100500) * strtofloat(chaveLic) ) / 100500 );
    senha1:= urotinas.renSenha_senha1(Qry_SenhasGeradasCNPJ_CPF.asstring, Qry_SenhasGeradaschaveLicenca.asinteger); //renSenha_Converte(  floattostr( rdata  ), true);


    chaveLic           := FormatDateTime( 'DDMMYY',edt_Validade.date);
    chaveLic           := chaveLic + sDigito(chaveLic);
    Senha2 := renSenha_Converte( chaveLic , false);

    Qry_SenhasGeradas.edit;
    Qry_SenhasGeradasVALIDADE.value := edt_Validade.Date;
    Qry_SenhasGeradasSERIAL1.value := Senha1;
    Qry_SenhasGeradasSERIAL2.value := Senha2;
    Qry_SenhasGeradas.post;

    Qry_SenhasGeradas.next;
  end;
  Qry_SenhasGeradas.First;
{
//Tb_SenhasGeradas.open;
Tb_SenhasGeradas.edit;
//Tb_SenhasGeradasCNPJ_CPF.value         := cnpj;
//Tb_SenhasGeradasNOME.value         := nome;
Tb_SenhasGeradasVALIDADE.value := edt_Validade.Date;
Tb_SenhasGeradasSERIAL1.value := serial1;
Tb_SenhasGeradasSERIAL2.value := serial2;

Tb_SenhasGeradas.post;
}



end;

procedure TFrm_RenovaSenha.sbt_gerarClick(Sender: TObject);
var where, senha1, senha2: string;
var cnpj,rData:real;
chaveLic:String;
begin

  gravarSenhaGerada;

  Application.CreateForm(TQr_Senhas, Qr_Senhas);

  Qr_Senhas.ADOQuery1.open;

  Qr_Senhas.QuickRep1.ExportToFilter(TQRAsciiExportFilter.Create('c:\sistemas\SenhaRenovacao.txt'));
  Qr_Senhas.QuickRep1.ExportFilter.Free;

  Qr_Senhas.destroy;


  ShellExecute(handle,'open','c:\sistemas\SenhaRenovacao.txt',0,0,SW_NORMAL);



end;

procedure TFrm_RenovaSenha.sb_fecarClick(Sender: TObject);
begin
close;
end;

procedure TFrm_RenovaSenha.Qry_SenhasGeradasBeforePost(DataSet: TDataSet);
begin
  if Qry_SenhasGeradasPK_ORDEM.asstring = '' then
    Qry_SenhasGeradasPK_ORDEM.value := frotinas.Sequencial('LINCENCAS_CLIENTE');


end;

procedure TFrm_RenovaSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

function TFrm_RenovaSenha.tiraSinalCPF(cnpj:string):string;
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
