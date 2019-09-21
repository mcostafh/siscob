unit UCadPadrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Buttons, ToolWin,  StdCtrls,Db, 
  Mask, DBCtrls, RXCtrls, SpeedBar, AppEvent, ADODB, IBQuery, DBTables;

{
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, RXCtrls, ExtCtrls, SpeedBar, DB, DBTables, Mask;
 }
type
  TOperState   = (OpNone,opNewForInsert,opDelete,opSave,opDiscard,opNewForSerach,OpSearch);
  TRecordState = (rdInactive,rdNewForSearch,rdNewForInsert,rdBrowse,rdEdit);

  TFrm_PadCad = class(TForm)
    ToolBar: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    SB_Inserir: TSpeedItem;
    SB_Alterar: TSpeedItem;
    SB_Excluir: TSpeedItem;
    SB_Salvar: TSpeedItem;
    SB_Cancelar: TSpeedItem;
    SB_Buscar: TSpeedItem;
    SB_Fechar: TSpeedItem;
    Panel1: TPanel;
    lb_acesso: TRxLabel;
    StatusBar1: TStatusBar;
    SpeedBar1: TSpeedBar;
    SpeedbarSection2: TSpeedbarSection;
    sb_Anterior: TSpeedItem;
    sb_primeiro: TSpeedItem;
    sb_proximo: TSpeedItem;
    sb_ultimo: TSpeedItem;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Query1: TADODataSet;
    Table1: TTable;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DataSource1StateChange(Sender: TObject);
    Procedure SetCorEdits(Opcao : Char);
    procedure DataSource1UpdateData(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_InserirClick(Sender: TObject);
    procedure SB_AlterarClick(Sender: TObject);
    procedure SB_ExcluirClick(Sender: TObject);
    procedure SB_SalvarClick(Sender: TObject);
    procedure SB_CancelarClick(Sender: TObject);
    procedure SB_BuscarClick(Sender: TObject);
    procedure Qry_AuditBeforePost(DataSet: TDataSet);
    procedure Qry_AuditAfterPost(DataSet: TDataSet);
    procedure sb_primeiroClick(Sender: TObject);
    procedure sb_AnteriorClick(Sender: TObject);
    procedure sb_proximoClick(Sender: TObject);
    procedure sb_ultimoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Query1AfterOpen(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
    CmdSelect : String;
    CmdOrderBy    : String;
    CmdSelectNull : String;
    OperState     : TOperState;
    RecordState   : TRecordState;
    sOpcao        : Char;
    Acesso_Usu    : String;
    janela        : string;

    procedure Salvar;
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
    procedure Cancela;
    procedure Pesquisa;
    procedure Auditoria;
    procedure SetRecordState(Value : TRecordState);
    function BuildQBE : String;

  end;

var
  Frm_PadCad: TFrm_PadCad;

implementation

uses UDM,Urotinas;

{$R *.dfm}

procedure TFrm_PadCad.FormCreate(Sender: TObject);
begin
  Query1.open;

  janela := ''; // código da janela, verificar no menu principal

  if ColorToRGB(Toolbar.Color) <> ColorToRGB(clBlack) then
    Toolbar.Wallpaper.Bitmap.Handle := LoadBitmap(hInstance, 'BACKGROUND')
  else Toolbar.Wallpaper := nil;
  Toolbar.SetFontDefault;

end;

procedure TFrm_PadCad.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
      begin
         key := #0;
         PerForm (cm_dialogKey,vk_tab,0);
      end;
{Trocando Virgula por Ponto}
//if (Key in [',','.'] and Components[i].ClassName <> 'TEdit' and Components[i].ClassName <> 'TDBEdit') and Components[i].ClassName <> 'TDBMemo')) then
//  Key := DecimalSeparator;

end;

// BuildQBE
function TFrm_PadCad.BuildQBE : String;
var Sep:String;
   j:Integer;
begin
   Sep:='';
   result:='';
   For j:=0 to DataSource1.DataSet.FieldCount -1 do
      if (DataSource1.DataSet.Fields[j].AsString <> '') then begin
         if (DataSource1.DataSet.Fields[j].DataType = ftString) then
            Result := Format('%s %s (%s like ''%s%s'')',[result,Sep,DataSource1.DataSet.Fields[j].FieldName,DataSource1.DataSet.Fields[j].AsString,'%'])
      else
         Result := Format('%s %s (%s = %s)',[Result,Sep,DataSource1.DataSet.Fields[j].FieldName,DataSource1.DataSet.Fields[j].AsString]);
      Sep := 'And';
   end;
end;

// Inserir
procedure TFrm_PadCad.Inserir;
var OldOperState : TOperState;
begin
   OldOperState := OperState;
   OperState := opNewForInsert;
   Try
      if Not TBDEDataSet(DataSource1.DataSet).Active then Begin
         TQuery(DataSource1.DataSet).SQL.Text := CmdSelect + CmdSelectNull;
         TBDEDataSet(DataSource1.DataSet).Open;
      end;
      SetRecordState(RdNewForInsert);
      Query1.Append;
   finally
      OperState := OldOperState;
   end;
    sOpcao := 'I';

end;

// Alterar
procedure TFrm_PadCad.Alterar;
var OldOperState : TOperState;
begin
   OldOperState := OperState;
   try
      DataSource1.DataSet.Edit;
      SetRecordState(rdEdit);
   finally
      OperState := OldOperState;
   end;
   sOpcao:='E';
end;

// Auditoria
procedure TFrm_PadCad.Auditoria;
begin
{
   - No form desejado deverá Re-Escrever esta procedure como segue

   Qry_Audit.Append;
   Qry_AuditTabela.Asstring := 'TAB_BENS';
   Qry_AuditData.AsDate     := date;
   Qry_AuditNu_Usu.AsInteger:= Main.Usu_Nu;
   Qry_AuditObjeto.AsString := 'cadastrobens1';

   if sOpcao='I' then
      Qry_AuditTexto.AsString  := 'Incluido Bem Patrimonial: Computador K6 II 350 MHZ, Num Patrimonial: 0930232'
   else if sOpcao='E' then
      Qry_AuditTexto.AsString  := 'Alterado/Editado Bem Patrimonial: Computador K6 II 350 MHZ, Num Patrimonial: 0930232'
   else if sOpcao='D' then
      Qry_AuditTexto.AsString  := 'Excluido/Deletado Bem Patrimonial: Computador K6 II 350 MHZ, Num Patrimonial: 0930232';
   Qry_Audit.Post;
}
end;

// Excluir
procedure TFrm_PadCad.Excluir;
var OldOperState : TOperState;
begin
   OldOperState := OperState;
   OperState := opSave;
   Try
      Query1.Delete;
      //Query1.ApplyUpdates;
      //Query1.CommitUpdates;
      if Query1.IsEmpty then Begin
         SetRecordState(RdInactive);
      end else
         SetRecordState(RdBrowse);
   Finally
      OperState := OldOperState;
   end;
   sOpcao := 'D';
end;

// Salvar
Procedure TFrm_PadCad.Salvar;
var OldOperState : TOperState;
begin
   OldOperState := OperState;
   OperState := opSave;
   try
      Query1.Post;
      //Query1.ApplyUpdates;
      //Query1.CommitUpdates;
      SetRecordState(rdBrowse);
      if DM.DB.InTransaction then
         DM.DB.CommitTrans;
   Except
      if DM.DB.InTransaction then
         DM.DB.RollbackTrans;
      OperState := OldOperState;
   end;
   OperState := OldOperState;
   sOpcao := 'S';
end;


// Calcela inclusão
procedure TFrm_PadCad.Cancela;
var OldOperState : TOperState;
begin
   OldOperState := OperState;
   OperState := OpDiscard;
   try
      if TBDEDataSet(DataSource1.DataSet).UpdatesPending then
         TBDEDataSet(DataSource1.DataSet).CancelUpdates
      else
         TBDEDataSet(DataSource1.DataSet).Cancel;
      if TBDEDataSet(DataSource1.DataSet).IsEmpty then begin
         SetRecordState(rdInactive);
      end else
         SetRecordState(rdBrowse);
   finally
      OperState := OldOperState;
   end;
   sOpcao := 'C';
end;

{Pesquisar}
procedure TFrm_PadCad.Pesquisa;
Begin
end;


// Setar Status do Record
procedure TFrm_PadCad.SetRecordState(Value : TRecordState);
begin
   RecordState := Value;
   case RecordState of
      rdInactive:
         begin
            SB_Inserir.Enabled  := True;
            SB_Alterar.Enabled  := false;
            SB_Excluir.Enabled  := false;
            SB_Salvar.Enabled   := false;
            SB_Cancelar.Enabled := false;
            sOpcao:='V'; // InatiVo
         end;
      rdNewForSearch:
         begin
            SB_Inserir.Enabled  := True;
            SB_Alterar.Enabled  := false;
            SB_Excluir.Enabled  := false;
            SB_Salvar.Enabled   := True;
            SB_Cancelar.Enabled := True;
            sOpcao:='S'; // InatiVo
         end;
      rdNewForInsert:
         begin
            SB_Inserir.enabled  := False;
            SB_Alterar.Enabled  := false;
            SB_Excluir.Enabled  := false;
            SB_Salvar.Enabled   := true;
            SB_Cancelar.Enabled := true;
            sOpcao:='I'; // Inserir
         end;
      rdEdit:
         begin
            SB_Inserir.enabled  := False;
            SB_Alterar.Enabled  := false;
            SB_Excluir.Enabled  := false;
            SB_Salvar.Enabled   := true;
            SB_Cancelar.Enabled := true;
            sOpcao:='E'; // Editar
         end;
      rdBrowse:
         begin
            SB_Inserir.enabled  := True;
            if Query1.IsEmpty then Begin
               SB_Alterar.Enabled  := false;
               SB_Excluir.Enabled  := false;
            end
            else begin
               SB_Alterar.Enabled  := true;
               SB_Excluir.Enabled  := true;
            end;
            SB_Salvar.Enabled   := false;
            SB_Cancelar.Enabled := false;
            sOpcao:='B'; // Browser
         end;
   end;

   SetCorEdits(sOpcao);

end;
procedure TFrm_PadCad.DataSource1UpdateData(Sender: TObject);
var ret : integer;
begin
  if OperState = opNone then begin
      if RecordState = rdNewForSearch then
         Cancela
      else begin
         ret:=Application.MessageBox('Deseja Salvar as Alterações',
            'Confirmação',MB_YESNOCANCEL + MB_ICONQUESTION);
         case ret of
            idYes: Salvar;
            idNo : cancela;
            idCancel: Cancela;
         end;
      end;
  end;

end;

procedure TFrm_PadCad.DataSource1StateChange(Sender: TObject);
begin
   //if frotinas.Acesso_Usu = 'L' then
   //begin
   //   SB_Inserir.Enabled  := false;
   //   SB_Alterar.Enabled  := false;
   //   SB_Excluir.Enabled  := false;
   //   lb_acesso.Caption   := 'Acesso Leitura';
   //end;


  if DataSource1.State = dsEdit then
     SetRecordState(rdEdit);

  if Query1.Active then
    StatusBar1.Panels[1].text := FormatFloat('000000',Query1.RecordCount)+' Registro(s)';



end;

Procedure TFrm_PadCad.SetCorEdits(Opcao : Char);
var i:integer;
begin

   //  Inclusão ou Edição, coloca Cor Branco no Fundo dos Campos
   if Opcao in ['E','I'] then
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
              (Components[i].ClassName = 'TCurrencyEdit') then
           begin
              Tedit(Components[i]).Color        := clWindow;
              TEdit(Components[i]).Font.Color   := clBlack;
           end;
        end
   else
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
              (Components[i].ClassName = 'TDBMemo')            or
              (Components[i].ClassName = 'TRxDBLookupCombo')          or
              (Components[i].ClassName = 'TDBDateEdit') or
              (Components[i].ClassName = 'TCurrencyEdit') then
           begin
              Tedit(Components[i]).Color        := $00F4F5F7; //clSilver; 
              TEdit(Components[i]).Font.Color   := clNavy; //clActiveCaption ; //ClBlack;
           end;

        end;

end;




procedure TFrm_PadCad.SB_FecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrm_PadCad.SB_InserirClick(Sender: TObject);
var i:integer;
begin
   {Descobre o Primeiro Componente da Tela, para setar o Focu}
{   for i:=0 to ComponentCount-1 do
        if (Components[i].ClassName = 'TEdit') or
              (Components[i].ClassName = 'TDBEdit') or
              (Components[i].ClassName = 'TDBListBox') or
              (Components[i].ClassName = 'TMaskEdit')          or
              (Components[i].ClassName = 'TDBComboBox') or
              (Components[i].ClassName = 'TRxDBComboBox') or
              (Components[i].ClassName = 'TRxDBCalcEdit')          or
              (Components[i].ClassName = 'TDBLookupComboBox') or
              (Components[i].ClassName = 'TRxDBLookupCombo')          or
              (Components[i].ClassName = 'TDBLookupListBox') or
              (Components[i].ClassName = 'TDBMemo')            or
              (Components[i].ClassName = 'TCurrencyEdit') or
              (Components[i].ClassName = 'TDBDateEdit')     then
        begin
          Try
           Tedit(Components[i]).SetFocus;
          finally
          end;
           break;
        end;}
   inserir;


end;

procedure TFrm_PadCad.SB_AlterarClick(Sender: TObject);
var i:integer;
begin
   if not frotinas.acessoValido(janela,'SB_Alterar') then
   begin
    showmessage('Você não tem permissão para esta opção.');
    exit;
   end;

   alterar;
   {for i:=0 to ComponentCount-1 do
        if (Components[i].ClassName = 'TEdit') or
              (Components[i].ClassName = 'TDBEdit') or
              (Components[i].ClassName = 'TDBListBox') or
              (Components[i].ClassName = 'TMaskEdit')          or
              (Components[i].ClassName = 'TDBComboBox') or
              (Components[i].ClassName = 'TRxDBComboBox') or
              (Components[i].ClassName = 'TDBLookupComboBox') or
              (Components[i].ClassName = 'TRxDBCalcEdit')          or
              (Components[i].ClassName = 'TDBLookupListBox') or
              (Components[i].ClassName = 'TRxDBLookupCombo')          or
              (Components[i].ClassName = 'TDBMemo')            or
              (Components[i].ClassName = 'TCurrencyEdit') or
              (Components[i].ClassName = 'TDBDateEdit')     then
        begin
           try
              Tedit(Components[i]).SetFocus;
           finally
           end;
           break;
        end;  }

end;

procedure TFrm_PadCad.SB_ExcluirClick(Sender: TObject);
begin
   if not frotinas.acessoValido(janela,'SB_Excluir') then  
   begin
    showmessage('Você não tem permissão para esta opção.');
    exit;
   end;

   if MessageDlg('Dejesa realmente Excluir?',
      mtConfirmation, [mbYes, mbNo],0) = mrYes then
      excluir;
end;

procedure TFrm_PadCad.SB_SalvarClick(Sender: TObject);
begin
   if not frotinas.acessoValido(janela,'SB_Salvar') then
   begin
    showmessage('Você não tem permissão para esta opção.');
    exit;
   end;

   salvar;
end;

procedure TFrm_PadCad.SB_CancelarClick(Sender: TObject);
begin
   cancela;
end;

procedure TFrm_PadCad.SB_BuscarClick(Sender: TObject);
begin
   Pesquisa;

end;

procedure TFrm_PadCad.Qry_AuditBeforePost(DataSet: TDataSet);
Var iSeq : integer;
begin
  If Not DM.DB.InTransaction then
        DM.DB.BeginTrans ;
  iSeq:=FRotinas.Sequencial('TAB_AUDIT');
  if iSeq = -1 then
  Begin
     DM.DB.RollbackTrans;
     exit;
  end;
  //Qry_AuditNu_Audit.AsInteger := iSeq;

end;

procedure TFrm_PadCad.Qry_AuditAfterPost(DataSet: TDataSet);
begin
  Auditoria;
end;


procedure TFrm_PadCad.sb_primeiroClick(Sender: TObject);
begin
Query1.First;
end;

procedure TFrm_PadCad.sb_AnteriorClick(Sender: TObject);
begin
Query1.Prior;
end;

procedure TFrm_PadCad.sb_proximoClick(Sender: TObject);
begin
Query1.Next;
end;

procedure TFrm_PadCad.sb_ultimoClick(Sender: TObject);
begin
Query1.Last;
end;

procedure TFrm_PadCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure TFrm_PadCad.Query1AfterOpen(DataSet: TDataSet);
begin
  SetRecordState(rdBrowse);
end;

end.

