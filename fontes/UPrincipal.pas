unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, RxMenus, ExtCtrls, SpeedBar, PicClip, Placemnt, FileCtrl,
  AppEvent, ImgList, DB, DBTables,IniFiles, IBCustomDataSet, IBQuery, ADODB,
  jpeg, WinSkinData;

type
  TFrm_Principal = class(TForm)
    MainMenu: TRxMainMenu;
    cadastros: TMenuItem;
    cobrancas: TMenuItem;
    Sair1: TMenuItem;
    StatusBar1: TStatusBar;
    AppEvents: TAppEvents;
    Imagens: TImageList;
    FormPlacement1: TFormPlacement;
    Empresascliente: TMenuItem;
    registroscobranca: TMenuItem;
    pn_diasfaltam: TPanel;
    manutencaodevedores: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Ferramentas1: TMenuItem;
    N7: TMenuItem;
    Cargadearquivos1: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    DistribuiodaCarga1: TMenuItem;
    N3: TMenuItem;
    Consultas1: TMenuItem;
    PrestaodeContas1: TMenuItem;
    Image1: TImage;
    Recebimento1: TMenuItem;
    PagamentodeDvida1: TMenuItem;
    DadosdaAssessoria1: TMenuItem;
    PrestaodeContas2: TMenuItem;
    N12: TMenuItem;
    cadusuarios: TMenuItem;
    Gruposdeusurios1: TMenuItem;
    Permisses1: TMenuItem;
    AdministraodoSistema1: TMenuItem;
    transfernciaentreCobradores1: TMenuItem;
    Expurgo1: TMenuItem;
    Ocorrencias1: TMenuItem;
    Demonstrativo1: TMenuItem;
    AuditagemCobradores1: TMenuItem;
    Defasagem1: TMenuItem;
    N13: TMenuItem;
    SkinData1: TSkinData;
    Timer1: TTimer;
    N14: TMenuItem;
    Agendamentosnoacionados1: TMenuItem;
    DesempenhodaCobrana1: TMenuItem;
    N9: TMenuItem;
    BorderodePagamentos1: TMenuItem;
    N6: TMenuItem;
    PrevisodePagamento1: TMenuItem;
    N11: TMenuItem;
    RotinasdeManuteno1: TMenuItem;
    RateiodoReciboentreosTtulos1: TMenuItem;
    LimpaJobs1: TMenuItem;
    N1: TMenuItem;
    Parmetros1: TMenuItem;
    N15: TMenuItem;
    ManutenodeTabelas1: TMenuItem;
    N16: TMenuItem;
    Exportar1: TMenuItem;
    N18: TMenuItem;
    DesfazPrestaodeContas1: TMenuItem;
    RecarregaChaves1: TMenuItem;
    N19: TMenuItem;
    Senhasderenovao1: TMenuItem;
    rocarUsurio1: TMenuItem;
    Configuraes1: TMenuItem;
    Backup1: TMenuItem;
    N17: TMenuItem;
    N20: TMenuItem;
    CargaHigienizao1: TMenuItem;
    ManutencaoCorrigirCpfCrolim: TMenuItem;
    BatimentoentreCarteiras1: TMenuItem;
    MotivosdoSPC1: TMenuItem;
    N21: TMenuItem;
    SPC1: TMenuItem;
    GerarremessaSPC1: TMenuItem;
    CarregarretornodoSPC1: TMenuItem;
    ConsultaeventosdoSPC1: TMenuItem;
    Downloaddearquivosgerados1: TMenuItem;
    procedure AppEventsActionExecute(Action: TBasicAction;
      var Handled: Boolean);
    procedure AppEventsRestore(Sender: TObject);
    procedure FormPlacement1RestorePlacement(Sender: TObject);
    procedure FormPlacement1SavePlacement(Sender: TObject);
    procedure sb_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_SairClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure MainMenuGetImageIndex(Sender: TMenu; Item: TMenuItem;
      State: TMenuOwnerDrawState; var ImageIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure Cargadearquivos1Click(Sender: TObject);
    procedure registroscobrancaClick(Sender: TObject);
    procedure EmpresasclienteClick(Sender: TObject);
    procedure cadusuariosClick(Sender: TObject);
    procedure DistribuiodaCarga1Click(Sender: TObject);
    procedure manutencaodevedoresClick(Sender: TObject);
    procedure PagamentodeDvida1Click(Sender: TObject);
    procedure DadosdaAssessoria1Click(Sender: TObject);
    procedure PrestaodeContas1Click(Sender: TObject);
    procedure PrestaodeContas2Click(Sender: TObject);
    procedure transfernciaentreCobradores1Click(Sender: TObject);
    procedure checaPermissoes;
    procedure Gruposdeusurios1Click(Sender: TObject);
    procedure Permisses1Click(Sender: TObject);
    procedure Expurgo1Click(Sender: TObject);
    procedure Ocorrencias1Click(Sender: TObject);
    procedure Demonstrativo1Click(Sender: TObject);
    procedure AuditagemCobradores1Click(Sender: TObject);
    procedure Defasagem1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Agendamentosnoacionados1Click(Sender: TObject);
    procedure BorderodePagamentos1Click(Sender: TObject);
    procedure DesempenhodaCobrana1Click(Sender: TObject);
    procedure PrevisodePagamento1Click(Sender: TObject);
    procedure RateiodoReciboentreosTtulos1Click(Sender: TObject);
    procedure LimpaJobs1Click(Sender: TObject);
    procedure Parmetros1Click(Sender: TObject);
    procedure ManutenodeTabelas1Click(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
    procedure DesfazPrestaodeContas1Click(Sender: TObject);
    procedure RecarregaChaves1Click(Sender: TObject);
    procedure Senhasderenovao1Click(Sender: TObject);
    procedure rocarUsurio1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure Backup1Click(Sender: TObject);
    procedure CargaHigienizao1Click(Sender: TObject);
    procedure ManutencaoCorrigirCpfCrolimClick(Sender: TObject);
    procedure BatimentoentreCarteiras1Click(Sender: TObject);
    procedure MotivosdoSPC1Click(Sender: TObject);
    procedure GerarremessaSPC1Click(Sender: TObject);

  private
    { Private declarations }
    procedure ManipulaExcecoes(Sender: TObject; E: Exception);
    Procedure MostrarErro(E:EDBEngineError);
  public
    { Public declarations }
    Path, TIPO_DE_ACESSO_BANCO,PathFiguras:String;
    //Procedure VerAcessoUsu(sForm:string);
    //Function SerialNum(FDrive:String) :String;

  end;

var
  Frm_Principal: TFrm_Principal;

implementation

uses UDM, URotinas, USenha,Ufrm_Atualizar, Ucons_cobranca, UCadCliente,
  UCadUsuarios, UFrm_Distribuir, UCadDevedores, URecebimento, uAssessoria,
  Ufrm_relPrestContas, Ufrm_gerarPrestContas, UVersoes, UFrm_Transferir,
  ufrm_cadgruusu, ufrm_permissoes, UFrm_expurgo, ufrm_cadocorr,
  Ufrm_relDemonst, Ufrm_relAuditagem, Ufrm_relDefasagem, 
  Ufrm_relAgendamento, Ufrm_relBordero, Ufrm_RelDesempenho,
  Ufrm_relAcordos, UFrm_RateiaRecibo, UFrm_limparJobs, UCadParam,
  UManTabelas, UFrm_Exportar, Ufrm_desfazPrestContas, UFrm_recarregachaves,
  URenovaSenha, UFrm_config, UFrm_Backup, Ufrm_CargaHigienizacao,
  UFrm_ManutCPFCRolim, UFrm_BatimentoCarteira, UCadMotivosSPC,
  Ufrm_gerarRemessaSPC;


{$R *.dfm}

{$IFDEF WIN32}
  {$R BACKGRND.R32}
{$ELSE}
  {$R BACKGRND.R16}
{$ENDIF}

//Comentários:
//$00C2D1C8 - Cor de Grids
{
SKIN - 49

}


procedure TFrm_Principal.AppEventsActionExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
{$IFNDEF WIN32}
  if Screen.ActiveForm <> nil then Screen.ActiveForm.BringToFront;  // 22/03/2016
{$ENDIF}

end;


procedure TFrm_Principal.AppEventsRestore(Sender: TObject);
begin
{$IFDEF WIN32}
  if NewStyleControls then ShowWindow(Application.Handle, SW_SHOW);   // 22/03/2016
{$ENDIF}

end;


procedure TFrm_Principal.FormPlacement1RestorePlacement(Sender: TObject);
begin
{$IFNDEF WIN32}
  AppTaskbarIcons(True); // 22/03/2016
  Application.BringToFront; // 22/03/2016
{$ENDIF}

end;

procedure TFrm_Principal.FormPlacement1SavePlacement(Sender: TObject);
begin
//  SaveMDIChildren(Self, FormPlacement1.IniFile);
end;

procedure TFrm_Principal.sb_SairClick(Sender: TObject);
begin
        close;
end;


procedure TFrm_Principal.FormCreate(Sender: TObject);
begin
  Application.OnException := ManipulaExcecoes;

  try
    image1.Picture.LoadFromFile('principal.jpg');
  except
    image1.Picture.LoadFromFile('principal.bmp');
  end;

  // desabilita barra windows
  //frotinas.HideTaskBar(Frm_Principal); // 22/03/2016

end;

procedure TFrm_Principal.Btn_SairClick(Sender: TObject);
begin
close;
end;

procedure TFrm_Principal.Sair1Click(Sender: TObject);
begin
if MessageDlg('Dejesa realmente Sair do Sistema?',
   mtConfirmation, [mbYes, mbNo],0) = mrYes then
   Close;
end;


procedure TFrm_Principal.MainMenuGetImageIndex(Sender: TMenu;
  Item: TMenuItem; State: TMenuOwnerDrawState; var ImageIndex: Integer);
begin
  if Item.Tag >= 0 then ImageIndex := Item.Tag;
end;

procedure TFrm_Principal.ManipulaExcecoes(Sender: TObject; E: Exception);
begin
If E Is EDBEngineError Then
  MostrarErro(EDBEngineError(E))
Else
  MessageDlg(E.Message + #13#13 +
  'Entre em contato com o suporte técnico '#13 +
  'Ou o Revendedor autorizado',   mtError, [mbOK], 0);

end;

Procedure TFrm_Principal.MostrarErro(E:EDBEngineError);
Var
   I:Integer;
   texto:String;
Begin
   texto := 'Anote a Mensagem de erro a seguir e comunique imediatamente ao Suporte Técnico!' + #13 + #13 + 'Erro:' + (E.Message) + #13 +
            'Número de Erros:' + IntToStr(E.ErrorCount) + #13 + #13 + #13;
   For I := 0 To E.ErrorCount - 1 Do
   Begin
      texto := texto + 'Mensagem:' + (E.Errors[I].Message) + #13 +
         'Categoria:' + IntToStr(E.Errors[I].Category) + #13 +
         'Código do Erro:' + IntToStr(E.Errors[I].ErrorCode) + #13 +
         'Subcódigo:' + IntToStr(E.Errors[I].SubCode) + #13 +
         'Erro Nativo:' + IntToStr(E.Errors[I].NativeError) + #13 + #13;
   End;

  MessageDlg(Texto,   mtError, [mbOK], 0);


End;


procedure TFrm_Principal.FormShow(Sender: TObject);
var ArqVersoes : TIniFile;
sys000,sys001,sys002,sys003,sys004,sys005,sys006,sys007,sys008:string;
FaltanDias:real;
bPedeSenhaInstalacao:Boolean;

begin

  top:=0;
  left:=0;
  width:= Screen.Width;  // 23/03/2016
  Height:= Screen.Height-30; // 23/03/2016

   StatusBar1.Panels[3].text := FormatDateTime( 'dd/mm/yyyy',date) + ' '+FormatDateTime( 'hh:mm:ss',time)+' - '+urotinas.DiadaSemana(date);

   //Path := ExtractFilePath(ParamStr(0));
   //ArqVersoes := TIniFile.Create(Path+'Versoes.INI');


   {
   sys000     := ArqVersoes.ReadString('BMPS' , 'SYS000', ''); //Nome da Empresa
   sys001     := ArqVersoes.ReadString('BMPS' , 'SYS001', ''); //Data última Instalação
   sys002     := ArqVersoes.ReadString('BMPS' , 'SYS002', ''); //Em Demonstração, Quantos dias em Demonstração
   sys003     := ArqVersoes.ReadString('BMPS' , 'SYS003', ''); //Data Última Execução
   sys004     := ArqVersoes.ReadString('BMPS' , 'SYS004', ''); //Quantos Dias já executou
   Sys005     := ArqVersoes.ReadString('BMPS' , 'SYS005', ''); //Letra de Driver onde se localiza o Sistema
   Sys006     := ArqVersoes.ReadString('BMPS' , 'SYS006', ''); //Número Série do HD onde Foi Instalado o Sistema
   Sys007     := ArqVersoes.ReadString('BMPS' , 'SYS007', ''); //Se já inspirou a licença
   Sys008     := ArqVersoes.ReadString('BMPS' , 'SYS008', ''); //Se é Locação


   bPedeSenhaInstalacao:=false;
   if length(sys001)=0 then
      bPedeSenhaInstalacao:=true;

   if Length(sys002)>0 then
      if (uppercase(Sys002)='S') and (length(Sys004)>0) then
         if StrToInt(Sys004) > 15 then
            bPedeSenhaInstalacao:=true;
    }
   //if Length(Sys006)>0 then
   //   if sys006 <> SerialNum(sys005) then
   //      bPedeSenhaInstalacao:=true;

   //if length(sys007)>0 then
   //      bPedeSenhaInstalacao:=true;

   //if Length(sys008)>0 then
   //   if date - StrToDate(sys001) >90 then
   //      bPedeSenhaInstalacao:=true;

   //if date - StrToDate(sys001) >180 then
   //      bPedeSenhaInstalacao:=true;

   //if bPedeSenhaInstalacao then
   //begin
   //  ArqVersoes.WriteString('BMPS', 'SYS007', 'C');
   //  ArqVersoes.WriteString('BMPS', 'SYS006', Sys006+'C');
     //Application.CreateForm(TFrm_Instalar, Frm_Instalar);
     //Frm_Instalar.showmodal;
     //if Frm_Instalar.ModalResult = mrCancel then
     //begin
     //   Frm_Instalar.Destroy;
     //   Application.Terminate;
     //   exit;
     //end;
     //Frm_Instalar.Destroy;
   //end
   //else if Length(sys002)>0 then
   //if uppercase(Sys002)='S' then
   //begin
   //   if (length(sys004)=0) then
   //   begin
   //      ArqVersoes.WriteString('BMPS', 'SYS004', '1');
   //      ArqVersoes.WriteString('BMPS', 'SYS003', DateToStr(Date));
   //   end
   //   else
   //   begin
    //     ArqVersoes.WriteString('BMPS', 'SYS004', InttoStr(StrToInt(sys004)+1));
   //      ArqVersoes.WriteString('BMPS', 'SYS003', DateToStr(Date));
   //   end;

   //end;

   {se Locado ou em demonstração, verifica quantos dias faltam}
   //if not bPedeSenhaInstalacao then
   //begin
   //  if Length(sys008)>0 then
   //      FaltanDias:=(StrToDate(sys001)-date);
   //  if Length(sys002)>0 then
   //      FaltanDias:=(StrToDate(sys001)-date);
   //end;

   //if ((sys002='S') or (sys008='S')) and (FaltanDias<10) then
   //begin

      //pn_diasfaltam.visible:=true;
      //pn_diasfaltam.caption := 'Faltam '+FloatToStr(FaltanDias)+' dias para renovar a licença';
   //end;
   //ArqVersoes.Free;


  dm.DB.Connected := false;
  dm.DB.ConnectionString := 'FILE NAME='+ExtractFilePath(ParamStr(0))+'siscob.udl';
  dm.DB.Provider  := ExtractFilePath(ParamStr(0))+'siscob.udl';
  //dm.DB.Connected := true;

   DM.DB.close;
   try
     DM.DB.Connected:=true;
   Except
     showmessage('Não foi possível acessar ao banco de dados! Verifique com seu DBA se o banco de dados está ligado.');
     Application.Terminate;
     exit;
   End;

   FRotinas.Hide;

   Application.CreateForm(TFrm_Senha, Frm_Senha);
   Frm_Senha.ShowModal;
   If Frm_Senha.modalresult=mrOK then
   begin
        //FRotinas.nivel_acesso := 'S';//Frm_Senha.Qry_usu.FieldByName('Master').AsString;

        Frm_Senha.Destroy;
        {-------------------------------------------------------------------------------}
        {Verifica se tem atualização no Banco de Dados - Manuel Costa - 8/10/2001}
        {-------------------------------------------------------------------------------}
        Application.createform(TFrm_Versoes, Frm_Versoes);
        if Frm_Versoes.TemAtualizacoes then
        begin
           Frm_Versoes.AtualizarVersao;
           Frm_Versoes.showModal;
        end;
        Frm_Versoes.Destroy;
   end
   Else
      Application.Terminate;

   Frotinas.DropAllTabelaTmp;

      //  if Length(sys008)>0 then
   //      FaltanDias:=(StrToDate(sys001)-date);
   //  if Length(sys002)>0 then
   //      FaltanDias:=(StrToDate(sys001)-date);
   //end;

   //if ((sys002='S') or (sys008='S')) and (FaltanDias<10) then
   //begin

      //pn_diasfaltam.visible:=true;
      //pn_diasfaltam.caption := 'Faltam '+FloatToStr(FaltanDias)+' dias para renovar a licença';

   checaPermissoes;




   //Application.CreateForm(TFrm_SelEmp, Frm_SelEmp);
   //Frm_SelEmp.ShowModal;
   //Frm_SelEmp.Destroy;
end;

procedure TFrm_Principal.Cargadearquivos1Click(Sender: TObject);
begin

  FRotinas.janelas('Cargadearquivos1','Fazer Carga de arquivos','','5');

  if not frotinas.acessoValido('Cargadearquivos1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_Atualizar, Frm_Atualizar);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.registroscobrancaClick(Sender: TObject);
begin

  FRotinas.janelas('registroscobranca','Registro de Cobrança','btn_geraRecibo[Gerar Recibos];btn_cancelarRec[Cancelra Recibos];RetroagirPgt[Permite Retroagir Data de Pgto];btn_receber[Recebe Pagamento na própria Cobrança];btn_gravaBxParcial[Baixas parciais]','2');

  if not frotinas.acessoValido('registroscobranca','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_cons_cobranca, Frm_cons_cobranca);
    Screen.Cursor := CrDefault;
 end;

end;

procedure TFrm_Principal.EmpresasclienteClick(Sender: TObject);
begin

  FRotinas.janelas('Empresascliente','Empresas Clientes','SB_Inserir[Incluir Empresas];SB_Salvar[Salvar Empresas];SB_Alterar[Alterar Empresas];SB_Excluir[Excluir Empresas];REGRAS[Regras de cálculos]','1');

  if not frotinas.acessoValido('Empresascliente','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_CadCliente, Frm_CadCliente);
    Screen.Cursor := CrDefault;
  end;
end;

procedure TFrm_Principal.cadusuariosClick(Sender: TObject);
begin

  FRotinas.janelas('cadusuarios','Cadastros dos Usuários','SB_Inserir[Incluir Empresas];SB_Salvar[Salvar Empresas];SB_Alterar[Alterar Empresas];SB_Excluir[Excluir Empresas]','6');

  if not frotinas.acessoValido('cadusuarios','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_CadUsu, Frm_CadUsu);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.DistribuiodaCarga1Click(Sender: TObject);
begin

  FRotinas.janelas('DistribuiodaCarga1','Distribuir Cobrança entre Cobradores','','5');

  if not frotinas.acessoValido('DistribuiodaCarga1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_Distribuir, Frm_Distribuir);
    Screen.Cursor := CrDefault;
  end;
end;

procedure TFrm_Principal.manutencaodevedoresClick(Sender: TObject);
var palavras:string;
begin

  palavras := 'SB_Inserir[Incluir Devedor];SB_Salvar[Salvar Devedor];SB_Alterar[Alterar Devedor];SB_Excluir[Excluir Devedor];sb_retirar[Retirar da Assessoria];btn_incluir[Incluir Dívida];btn_alterar[Alterar Dívida];btn_excluir[Excluir Dívida];';
  palavras := palavras + 'btn_gravar[Gravar Dívida];btn_retirar[Retirar da Carteira];btn_retornar[Retornar para a assessoria];btn_excluirBXParcial[Excluir Bx Parcial]';

  FRotinas.janelas('manutencaodevedores','Manutenção de Devedores',palavras,'1');


  if not frotinas.acessoValido('manutencaodevedores','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_Devedores, Frm_Devedores);
    Screen.Cursor := CrDefault;
  END;
end;

procedure TFrm_Principal.PagamentodeDvida1Click(Sender: TObject);
begin

  FRotinas.janelas('PagamentodeDvida1','Receber Dívida','','3');

  if not frotinas.acessoValido('PagamentodeDvida1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_Recebimento, Frm_Recebimento);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.DadosdaAssessoria1Click(Sender: TObject);
begin

  FRotinas.janelas('DadosdaAssessoria1','Dados da Assessoria','','1');

  if not frotinas.acessoValido('DadosdaAssessoria1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_assessoria, frm_assessoria);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.PrestaodeContas1Click(Sender: TObject);
begin

  FRotinas.janelas('PrestaodeContas1','Consulta de Prestação de Contas','','2');

  if not frotinas.acessoValido('PrestaodeContas1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_RelPrestContas, frm_RelPrestContas);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.PrestaodeContas2Click(Sender: TObject);
begin

  FRotinas.janelas('PrestaodeContas2','Geração de Prestação de Cobrança','','2');

  if not frotinas.acessoValido('PrestaodeContas2','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_GerarPrestContas, frm_GerarPrestContas);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.transfernciaentreCobradores1Click(Sender: TObject);
begin

  FRotinas.janelas('transfernciaentreCobradores1','Transferência entre cobradores','','5');

  if not frotinas.acessoValido('transfernciaentreCobradores1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_Transferir, Frm_Transferir);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.checaPermissoes;
var conta:integer;
begin
//
  //if FRotinas.usu_nivel=1 then
  //begin
      //showmessage(MainMenu.Items[0].items[0].name);

  //end;

end;

procedure TFrm_Principal.Gruposdeusurios1Click(Sender: TObject);
begin

  FRotinas.janelas('Gruposdeusurios1','Grupos de usuários','SB_Inserir[Incluir Empresas];SB_Salvar[Salvar Empresas];SB_Alterar[Alterar Empresas];SB_Excluir[Excluir Empresas]','6');

  if not frotinas.acessoValido('Gruposdeusurios1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_grupousu, frm_grupousu);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.Permisses1Click(Sender: TObject);
begin
  FRotinas.janelas('Permisses1','Permissoes de usuários','SB_Inserir[Incluir Empresas];SB_Salvar[Salvar Empresas];SB_Alterar[Alterar Empresas];SB_Excluir[Excluir Empresas]','6');
  if not frotinas.acessoValido('Permisses1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_permissoes, frm_permissoes);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.Expurgo1Click(Sender: TObject);
begin
  FRotinas.janelas('Expurgo1','Expurgo de Clientes','','6');

  if not frotinas.acessoValido('Expurgo1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_expurgo, frm_expurgo);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.Ocorrencias1Click(Sender: TObject);
begin
  FRotinas.janelas('Ocorrencias1','Cadastro de Ocorrências','','1');

  if not frotinas.acessoValido('Ocorrencias1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_cadOcorr, Frm_cadOcorr);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.Demonstrativo1Click(Sender: TObject);
begin
  FRotinas.janelas('Demonstrativo1','Demonstrativo de Cobrança','','4');

  if not frotinas.acessoValido('Demonstrativo1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_RelDemonst, frm_RelDemonst);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.AuditagemCobradores1Click(Sender: TObject);
begin
  FRotinas.janelas('AuditagemCobradores1','Auditagem de Cobradores','','4');

  if not frotinas.acessoValido('AuditagemCobradores1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_RelAuditagem, frm_RelAuditagem);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.Defasagem1Click(Sender: TObject);
begin
  FRotinas.janelas('Defasagem1','Defasagem','','4');

  if not frotinas.acessoValido('Defasagem1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_RelDefasagem, frm_RelDefasagem);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// habilita barra windows =

//frotinas.ShowTaskBar(Frm_Principal);  // 22/03/2016
end;

procedure TFrm_Principal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[3].text := FormatDateTime( 'dd/mm/yyyy',date) + ' '+FormatDateTime( 'hh:mm:ss',time)+' - '+urotinas.DiadaSemana(date);

end;

procedure TFrm_Principal.Agendamentosnoacionados1Click(Sender: TObject);
begin
  FRotinas.janelas('Agendamentosnoacionados1','Agendamentosno Acionados','','2');

  if not frotinas.acessoValido('Agendamentosnoacionados1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_RelAgendamento, frm_RelAgendamento);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.BorderodePagamentos1Click(Sender: TObject);
begin
  FRotinas.janelas('BorderodePagamentos1','Borderô de Títulos','','4');

  if not frotinas.acessoValido('BorderodePagamentos1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_RelBordero, frm_RelBordero);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.DesempenhodaCobrana1Click(Sender: TObject);
begin
  FRotinas.janelas('DesempenhodaCobrana1','Desempenho de Cobrança','','4');

  if not frotinas.acessoValido('DesempenhodaCobrana1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_RelDesempenho, frm_RelDesempenho);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.PrevisodePagamento1Click(Sender: TObject);
begin

  FRotinas.janelas('PrevisodePagamento1','Previsão de Retornos','','4');

  if not frotinas.acessoValido('PrevisodePagamento1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_RelAcordos, frm_RelAcordos);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.RateiodoReciboentreosTtulos1Click(
  Sender: TObject);
begin
  FRotinas.janelas('RateiodoReciboentreosTtulos1','Reprocessa Rateio entre titulos','','6');

  if not frotinas.acessoValido('RateiodoReciboentreosTtulos1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_RateiaRecibo, Frm_RateiaRecibo);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.LimpaJobs1Click(Sender: TObject);
begin
  FRotinas.janelas('LimpaJobs1','Limpa Jobs de Relatórios','','6');

  if not frotinas.acessoValido('LimpaJobs1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_limparJobs, frm_limparJobs);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.Parmetros1Click(Sender: TObject);
begin
  //FRotinas.janelas('Parmetros1','Parâmetros','','6');
  FRotinas.janelas('Parmetros1','Parâmetros','SB_Inserir[Incluir Parâmetros];SB_Salvar[Salvar Parâmetros];SB_Alterar[Alterar Parâmetros];SB_Excluir[Excluir Parâmetros]','6');

  if not frotinas.acessoValido('Parmetros1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_CadParam, Frm_CadParam);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.ManutenodeTabelas1Click(Sender: TObject);
begin

  FRotinas.janelas('frm_manTabelas','Manutenção em Tabelas do Banco de Dados','','6');

  if not frotinas.acessoValido('frm_manTabelas','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_manTabelas, frm_manTabelas);
    Screen.Cursor := CrDefault;
  end;


end;

procedure TFrm_Principal.Exportar1Click(Sender: TObject);
begin

  FRotinas.janelas('Frm_Exportar','Exportar arquivos','','6');

  if not frotinas.acessoValido('Frm_Exportar','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_Exportar, Frm_Exportar);
    Screen.Cursor := CrDefault;
  end;


end;

procedure TFrm_Principal.DesfazPrestaodeContas1Click(Sender: TObject);
begin

  FRotinas.janelas('DesfazPrestaodeContas1','Desfaz Prestação de Contas','','2');

  if not frotinas.acessoValido('DesfazPrestaodeContas1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_DesfazPrestContas, frm_DesfazPrestContas);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.RecarregaChaves1Click(Sender: TObject);
begin
  FRotinas.janelas('RecarregaChaves1','Recarrega chaves','','6');

  if not frotinas.acessoValido('RecarregaChaves1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_recarregachaves, frm_recarregachaves);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.Senhasderenovao1Click(Sender: TObject);
begin

  FRotinas.janelas('Senhasderenovao1','Senhas de renovação','','6');

  if frotinas.Usu_Nome<> 'root' then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_RenovaSenha, Frm_RenovaSenha);
    Screen.Cursor := CrDefault;
  end;



end;

procedure TFrm_Principal.rocarUsurio1Click(Sender: TObject);
begin

  FRotinas.janelas('trocarUsuario1','Trocar de usuário','','6');

  if not frotinas.acessoValido('trocarUsuario1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Application.CreateForm(TFrm_Senha, Frm_Senha);
    Frm_Senha.ShowModal;
    Frm_Senha.destroy;
  end;

end;

procedure TFrm_Principal.Configuraes1Click(Sender: TObject);
begin
  FRotinas.janelas('Configuraes1','Configurações','SB_Inserir[Incluir Configuração];SB_Salvar[Salvar Configuração];SB_Alterar[Alterar Configuração];SB_Excluir[Excluir Configuração]','6');

  if not frotinas.acessoValido('Configuraes1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_config, frm_config);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.Backup1Click(Sender: TObject);
begin
  FRotinas.janelas('Backup1','Faz backup do banco de dados','','5');

  if not frotinas.acessoValido('Backup1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_Backup, Frm_Backup);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.CargaHigienizao1Click(Sender: TObject);
begin
  FRotinas.janelas('CargaHigienizao1','Carga de Higienização','','2');

  if not frotinas.acessoValido('CargaHigienizao1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_CargaHigienizacao, Frm_CargaHigienizacao);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.ManutencaoCorrigirCpfCrolimClick(Sender: TObject);
begin
  FRotinas.janelas('ManutCorrigirCpfCrolim','Manutenção - corrigir cpf c rolim','','5');

  if not frotinas.acessoValido('ManutCorrigirCpfCrolim','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_ManutCPFCRolim, Frm_ManutCPFCRolim);
    Screen.Cursor := CrDefault;
  end;

end;

procedure TFrm_Principal.BatimentoentreCarteiras1Click(Sender: TObject);
begin

  FRotinas.janelas('BatimentoentreCarteiras1','Batimento entre Carteiras de Cobrança','','5');

  if not frotinas.acessoValido('BatimentoentreCarteiras1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_BatimentoCarteira, Frm_BatimentoCarteira);
    Screen.Cursor := CrDefault;
  end;



end;

procedure TFrm_Principal.MotivosdoSPC1Click(Sender: TObject);
begin

  FRotinas.janelas('MotivosdoSPC1','Motivos do SPC','','1');

  if not frotinas.acessoValido('MotivosdoSPC1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(TFrm_cadMotivosSPC, Frm_cadMotivosSPC);
    Screen.Cursor := CrDefault;
  end;




end;

procedure TFrm_Principal.GerarremessaSPC1Click(Sender: TObject);
begin
  FRotinas.janelas('GerarremessaSPC1','Gerar remessa para o SPC','','5');

  if not frotinas.acessoValido('MotivosdoSPC1','') then
    showmessage('Acesso não permitido')
  else
  begin
    Screen.Cursor := CrHourGlass;
    Application.CreateForm(Tfrm_gerarRemessaSPC, frm_gerarRemessaSPC);
    Screen.Cursor := CrDefault;
  end;


end;

end.
