unit UCadUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadPadrao, DB, Grids, DBGrids, DBTables, ADODB, ComCtrls,
  RXCtrls, ExtCtrls, SpeedBar, StdCtrls, Mask, DBCtrls, RxLookup;

type
  TFrm_CadUsu = class(TFrm_PadCad)
    DBGrid1: TDBGrid;
    Query1nu_usu: TIntegerField;
    Query1login: TWideStringField;
    Query1Senha: TWideStringField;
    Query1Nome: TWideStringField;
    tabelas: TADODataSet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    tabelastabela: TStringField;
    tabelasseq: TIntegerField;
    Label3: TLabel;
    lk_grupo: TRxDBLookupCombo;
    qry_grupos: TADOQuery;
    dts_grupo: TDataSource;
    Query1PK_GRUPO: TIntegerField;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Query1logado: TStringField;
    cb_logado: TCheckBox;
    Query1nivel_acesso: TIntegerField;
    Query1pk_cliente: TIntegerField;
    Label2: TLabel;
    Qry_clientes: TADOQuery;
    dts_clientes: TDataSource;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SpeedbarSection3: TSpeedbarSection;
    cb_limparCliente: TCheckBox;
    procedure SB_SalvarClick(Sender: TObject);
    procedure Query1BeforePost(DataSet: TDataSet);
    procedure Query1AfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cb_logadoClick(Sender: TObject);
    procedure Query1BeforeEdit(DataSet: TDataSet);
    procedure Query1BeforeInsert(DataSet: TDataSet);
    procedure cb_limparClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadUsu: TFrm_CadUsu;

implementation
uses UPrincipal, UDM, urotinas;

{$R *.dfm}

procedure TFrm_CadUsu.SB_SalvarClick(Sender: TObject);
var seq:integer;
begin
  if Query1nu_usu.asInteger = 0 then
  begin
    tabelas.close;
    tabelas.Parameters.ParamByName('tb').value := 'usuarios';
    tabelas.Open;
    seq :=tabelasseq.asinteger;
    tabelas.edit;
    tabelasseq.Value :=tabelasseq.asinteger + 1;
    tabelas.post;

    Query1nu_usu.Value := seq;
  end;
  inherited;

end;

procedure TFrm_CadUsu.Query1BeforePost(DataSet: TDataSet);
begin
  inherited;
//Query1nivel_acesso.Value := cb_acesso.ItemIndex+1;
  cb_logado.Enabled := false;

end;

procedure TFrm_CadUsu.Query1AfterScroll(DataSet: TDataSet);
begin
  inherited;

  if Query1logado.value = '' then
    cb_logado.Checked := false
  else
    cb_logado.Checked := true;

end;

procedure TFrm_CadUsu.FormCreate(Sender: TObject);
begin
  inherited;
qry_grupos.Open;
qry_clientes.Open;
janela:='cadusuarios';

end;

procedure TFrm_CadUsu.cb_logadoClick(Sender: TObject);
begin
  inherited;
   if (DataSource1.State = dsEdit) or (DataSource1.State = dsInsert) then
   begin
    if cb_logado.Checked then
      Query1logado.value := 'S'
    else
      Query1logado.value := '';
   end;

end;

procedure TFrm_CadUsu.Query1BeforeEdit(DataSet: TDataSet);
begin
  inherited;
cb_logado.Enabled := true;

end;

procedure TFrm_CadUsu.Query1BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  cb_logado.Enabled := true;

end;

procedure TFrm_CadUsu.cb_limparClienteClick(Sender: TObject);
begin
  inherited;

  frotinas.Qry_Livre.close;
  frotinas.Qry_Livre.CommandText := 'select * from usuarios where nu_usu='+Query1nu_usu.AsString;
  frotinas.Qry_Livre.open;
  frotinas.Qry_Livre.edit;
  frotinas.Qry_Livre.FieldByName('pk_cliente').value := null;
  frotinas.Qry_Livre.post;


  Query1.close;
  Query1.open;

end;

end.
