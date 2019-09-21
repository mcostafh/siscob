unit UFrm_config;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadPadrao, DBTables, DB, ADODB, ComCtrls, RXCtrls, ExtCtrls,
  SpeedBar, StdCtrls, Mask, DBCtrls, Grids, DBGrids, ToolEdit, RXDBCtrl,
  Buttons, RxLookup;

type
  TFrm_config = class(TFrm_PadCad)
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Panel6: TPanel;
    DBRadioGroup3: TDBRadioGroup;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label12: TLabel;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    Query1PK_ORDEM: TBCDField;
    Query1CLIENTE: TBCDField;
    Query1NOME: TStringField;
    Query1FORMATO_DT: TStringField;
    Query1OCOR_PAGOU: TBCDField;
    Query1OCOR_PAGOU_PARC: TBCDField;
    Query1EMAIL_NOME: TStringField;
    Query1EMAIL_CONTA: TStringField;
    Query1EMAIL_SENHA: TStringField;
    Query1EMAIL_SMTP: TStringField;
    Query1EMAIL_SMTP_PORTA: TStringField;
    Query1EMAIL_REQUER_AUT: TStringField;
    Query1EMAIL_ASSUNTO: TStringField;
    Query1EMAIL_TITULO: TStringField;
    Query1EMAIL_RODAPE: TStringField;
    Query1nm_cliente: TStringField;
    qry_cliente: TADOQuery;
    dts_cliente: TDataSource;
    Qry_ocorr: TADOQuery;
    Dts_ocorr: TDataSource;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Query1CALC_JUROS_CARTAO: TStringField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    Label14: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Query1logotipo_email: TStringField;
    Label15: TLabel;
    DBEdit8: TDBEdit;
    Query1EMAIL_CORPO: TStringField;
    Label16: TLabel;
    DBMemo4: TDBMemo;
    Label17: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Query1OCOR_ENV_EMAIL: TBCDField;
    procedure Query1CalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Query1AfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_config: TFrm_config;

implementation

uses URotinas;

{$R *.dfm}

procedure TFrm_config.Query1CalcFields(DataSet: TDataSet);
begin
  inherited;

  if Query1CLIENTE.asinteger>0 then
  begin
    frotinas.Qry_Livre.close;
    frotinas.Qry_Livre.CommandText := 'select * from clientes where pk_cliente='+Query1CLIENTE.AsString;
    frotinas.Qry_Livre.open;
    if frotinas.Qry_Livre.recordCount>0 then
      Query1nm_cliente.value := frotinas.Qry_Livre.FieldByName('nome').Value;
  end;

end;

procedure TFrm_config.FormShow(Sender: TObject);
begin
  inherited;
janela := 'Configuraes1';


  Query1.open;
qry_cliente.open;
Qry_ocorr.Open;

end;

procedure TFrm_config.Query1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  Query1pk_ordem.Value := frotinas.sequencial('tb_config');
end;

end.
