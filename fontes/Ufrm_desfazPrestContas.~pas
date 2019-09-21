unit Ufrm_desfazPrestContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, DB, ADODB, RxLookup, StdCtrls, Grids, DBGrids,
  Mask, DBCtrls, ToolEdit, CurrEdit, jpeg;

type
  Tfrm_DesfazPrestContas = class(TForm)
    Panel1: TPanel;
    Dts_cliente: TDataSource;
    tb_cliente: TADOTable;
    Panel2: TPanel;
    Label1: TLabel;
    btn_busca: TSpeedButton;
    SpeedButton1: TSpeedButton;
    qry_pendencia: TADOQuery;
    dts_pendencia: TDataSource;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    SpeedButton3: TSpeedButton;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edt_divida: TCurrencyEdit;
    edt_juros: TCurrencyEdit;
    edt_multa: TCurrencyEdit;
    edt_descjuros: TCurrencyEdit;
    edt_descmulta: TCurrencyEdit;
    edt_acrescimos: TCurrencyEdit;
    edt_liquido: TCurrencyEdit;
    edt_retencao: TCurrencyEdit;
    Label23: TLabel;
    edt_descprinciapl: TCurrencyEdit;
    qry_prestcontas: TADODataSet;
    qry_prestcontaspk_prestcontas: TIntegerField;
    qry_prestcontasdata: TDateTimeField;
    qry_prestcontaspk_cliente: TIntegerField;
    qry_prestcontasprincipal: TBCDField;
    qry_prestcontasjuros: TBCDField;
    qry_prestcontasmulta: TBCDField;
    qry_prestcontasdescjuros: TBCDField;
    qry_prestcontasdescmulta: TBCDField;
    qry_prestcontasdescprincipal: TBCDField;
    qry_prestcontaspdescjuros: TBCDField;
    qry_prestcontaspdescmulta: TBCDField;
    qry_prestcontasretencao: TBCDField;
    qry_prestcontasacrescimos: TBCDField;
    qry_prestcontasliquido: TBCDField;
    qry_recibo: TADODataSet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Image1: TImage;
    Label14: TLabel;
    qry_pendenciapk_recibo: TIntegerField;
    qry_pendenciapk_devedor: TIntegerField;
    qry_pendenciadata: TDateTimeField;
    qry_pendenciahora: TStringField;
    qry_pendenciapk_cliente: TIntegerField;
    qry_pendenciaprincipal: TBCDField;
    qry_pendenciajuros: TBCDField;
    qry_pendenciamulta: TBCDField;
    qry_pendenciadesc_principal: TBCDField;
    qry_pendenciadesc_juros: TBCDField;
    qry_pendenciadesc_multa: TBCDField;
    qry_pendenciaacres_protesto: TBCDField;
    qry_pendenciaacres_honorarios: TBCDField;
    qry_pendenciavalor_liquido: TBCDField;
    qry_pendenciataxa_retenc: TBCDField;
    qry_pendenciavalor_retenc: TBCDField;
    qry_pendenciabaixaparcial: TBCDField;
    qry_pendencianome: TStringField;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    edt_bxParcial: TCurrencyEdit;
    qry_pendenciapk_bxparcial: TIntegerField;
    qry_prestcontasbaixaparcial: TBCDField;
    edt_prest: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_buscaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_DesfazPrestContas: Tfrm_DesfazPrestContas;

implementation
uses UDM, URotinas;
{$R *.dfm}

procedure Tfrm_DesfazPrestContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure Tfrm_DesfazPrestContas.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure Tfrm_DesfazPrestContas.btn_buscaClick(Sender: TObject);
var tbaixaparcial,tprincipal,tjuros,tmulta,tdescmulta,tdescjuros,tdescprincipal, tacrescimo, tliquido, tretencao,pdescjuros,pdescmulta,protesto,honorarios : real;
begin

if edt_prest.Text = '' then
begin
  showmessage('Não foi informado o cliente.');
  exit;
end;

qry_pendencia.close;
qry_pendencia.Parameters.ParamByName('prest').value := edt_prest.Text;
qry_pendencia.Parameters.ParamByName('prest2').value := edt_prest.Text;
qry_pendencia.open;


tprincipal := 0;
tjuros:=0;
tmulta:=0;
tdescmulta:=0;
tdescjuros:=0;
tdescprincipal:=0;
pdescmulta:=0;
tacrescimo:=0;
tliquido:=0;
tretencao :=0.00;
protesto := 0.0;
honorarios:=0.0;
tretencao:=0.0;
tbaixaparcial:=0.0;

while not qry_pendencia.eof do
begin
  tbaixaparcial := tbaixaparcial + qry_pendenciabaixaparcial.asfloat;
  tprincipal := tprincipal + qry_pendenciaprincipal.asfloat;
  tdescprincipal := tdescprincipal + qry_pendenciadesc_principal.AsFloat;
  tjuros     := tjuros + qry_pendenciajuros.asfloat;
  tmulta     := tmulta + qry_pendenciamulta.asfloat;

  tdescjuros := tdescjuros + qry_pendenciadesc_juros.AsFloat;
  tdescmulta := tdescmulta + qry_pendenciadesc_multa.AsFloat;
  protesto   := protesto + qry_pendenciaacres_protesto.asfloat;
  honorarios := honorarios + qry_pendenciaacres_honorarios.AsFloat;
  tliquido   := tliquido + qry_pendenciavalor_liquido.asfloat;
  tretencao  := tretencao + qry_pendenciavalor_retenc.AsFloat;
  qry_pendencia.next;
end;

edt_divida.Value := tprincipal;
edt_descprinciapl.value := tdescprincipal;
edt_juros.value := tjuros;
edt_multa.value := tmulta;
edt_descmulta.value := tdescmulta;
edt_descjuros.value := tdescjuros;
edt_acrescimos.value := protesto + honorarios;
edt_liquido.value := tliquido;
edt_retencao.value := tretencao;
edt_bxParcial.value := tbaixaparcial;


end;

procedure Tfrm_DesfazPrestContas.FormShow(Sender: TObject);
begin
tb_cliente.Open;
end;

procedure Tfrm_DesfazPrestContas.SpeedButton3Click(Sender: TObject);
begin


if MessageDlg('Deseja Desfazer a prestação de contas agora ?',
   mtConfirmation, [mbYes, mbNo],0) = mrYes then
begin

  qry_prestcontas.close;
  qry_prestcontas.Parameters.ParamByName('prest').value := edt_prest.Text;
  qry_prestcontas.open;
  if qry_prestcontas.recordCount>0 then
    qry_prestcontas.delete;

  qry_pendencia.first;
  while not qry_pendencia.eof do
  begin
    qry_recibo.close;
    qry_recibo.Parameters.ParamByName('recibo').value := qry_pendenciapk_recibo.value;
    qry_recibo.open;
    if qry_recibo.recordcount>0 then
    begin
      qry_recibo.edit;
      qry_recibo.fieldbyname('pk_prestcontas').Value := null;
      qry_recibo.post;
    end;

    frotinas.Qry_Livre.close;
    frotinas.Qry_Livre.CommandText := 'select * from baixasparciais where pk_bxparcial='+qry_pendenciapk_bxparcial.asstring;
    frotinas.Qry_Livre.open;
    if frotinas.Qry_Livre.recordCount>0 then
    begin
      while not frotinas.Qry_Livre.eof do
      begin
        frotinas.Qry_Livre.edit;
        frotinas.Qry_Livre.fieldByName('pk_prestcontas').value := null;
        frotinas.Qry_Livre.post;
        frotinas.Qry_Livre.next;
      end;
    end;

    qry_pendencia.next;

  end;

end;

showmessage('Prestação de contas desfeita com sucesso!');
btn_busca.Click;

end;

end.
