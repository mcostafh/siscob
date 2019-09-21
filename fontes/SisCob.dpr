program SisCob;



uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {Frm_Principal},
  UCadPadrao in 'UCadPadrao.pas' {Frm_PadCad},
  UDM in 'UDM.pas' {DM: TDataModule},
  URotinas in 'URotinas.pas' {FRotinas},
  USenha in 'USenha.pas' {Frm_Senha},
  UFrm_Atualizar in 'UFrm_Atualizar.pas' {Frm_Atualizar},
  Ucons_cobranca in 'Ucons_cobranca.pas' {frm_cons_cobranca},
  UCadCliente in 'UCadCliente.pas' {Frm_CadCliente},
  UCadUsuarios in 'UCadUsuarios.pas' {Frm_CadUsu},
  UFrm_Distribuir in 'UFrm_Distribuir.pas' {Frm_Distribuir},
  UAgenda in 'UAgenda.pas' {frm_agenda},
  UCadDevedores in 'UCadDevedores.pas' {Frm_Devedores},
  UQr_Recibo in 'UQr_Recibo.pas' {Qr_Recibo},
  URecebimento in 'URecebimento.pas' {frm_recebimento},
  uAssessoria in 'uAssessoria.pas' {frm_assessoria},
  Ufrm_relPrestContas in 'Ufrm_relPrestContas.pas' {frm_RelPrestContas},
  Ufrm_gerarPrestContas in 'Ufrm_gerarPrestContas.pas' {frm_GerarPrestContas},
  Uqr_pcontas in 'Uqr_pcontas.pas' {qr_pcontas: TQuickRep},
  UVersoes in 'UVersoes.pas' {Frm_Versoes},
  UFrm_Transferir in 'UFrm_Transferir.pas' {Frm_Transferir},
  ufrm_cadgruusu in 'ufrm_cadgruusu.pas' {frm_grupousu},
  ufrm_permissoes in 'ufrm_permissoes.pas' {frm_permissoes},
  UFrm_expurgo in 'UFrm_expurgo.pas' {frm_expurgo},
  ufrm_cadocorr in 'ufrm_cadocorr.pas' {Frm_cadOcorr},
  Ufrm_relDemonst in 'Ufrm_relDemonst.pas' {frm_RelDemonst},
  Uqr_demonst in 'Uqr_demonst.pas' {qr_demonst: TQuickRep},
  Ufrm_relAuditagem in 'Ufrm_relAuditagem.pas' {frm_RelAuditagem},
  Uqr_auditagem in 'Uqr_auditagem.pas' {qr_auditagem: TQuickRep},
  Ufrm_relDefasagem in 'Ufrm_relDefasagem.pas' {frm_RelDefasagem},
  Uqr_defasagem in 'Uqr_defasagem.pas' {qr_defasagem: TQuickRep},
  uqr_rels in 'uqr_rels.pas' {qr_rels: TQuickRep},
  Ufrm_relAgendamento in 'Ufrm_relAgendamento.pas' {frm_RelAgendamento},
  Uqr_agendamentos in 'Uqr_agendamentos.pas' {qr_agendamentos: TQuickRep},
  Ufrm_relBordero in 'Ufrm_relBordero.pas' {frm_RelBordero},
  Ufrm_RelDesempenho in 'Ufrm_relDesempenho.pas' {frm_RelDesempenho},
  Ufrm_relAcordos in 'Ufrm_relAcordos.pas' {frm_RelAcordos},
  Uqr_relAcordos in 'Uqr_relAcordos.pas' {qr_relAcordos: TQuickRep},
  Uqr_bordero in 'Uqr_bordero.pas' {qr_bordero: TQuickRep},
  UFrm_RateiaRecibo in 'UFrm_RateiaRecibo.pas' {Frm_RateiaRecibo},
  UFrm_limparJobs in 'UFrm_limparJobs.pas' {frm_limparJobs},
  Uqr_desempenho in 'Uqr_desempenho.pas' {qr_desempenho: TQuickRep},
  UCadParam in 'UCadParam.pas' {Frm_CadParam},
  UAcordo in 'UAcordo.pas' {frm_acordo},
  UManTabelas in 'UManTabelas.pas' {frm_manTabelas},
  UFrm_Exportar in 'UFrm_Exportar.pas' {Frm_Exportar},
  Ufrm_desfazPrestContas in 'Ufrm_desfazPrestContas.pas' {frm_DesfazPrestContas},
  UFrm_recarregachaves in 'UFrm_recarregachaves.pas' {frm_recarregachaves},
  Uqr_defas_sintetico in 'Uqr_defas_sintetico.pas' {qr_defas_sintetico: TQuickRep},
  URenovaSenha in 'URenovaSenha.pas' {Frm_RenovaSenha},
  UQrSenhas in 'UQrSenhas.pas' {Qr_Senhas},
  UFrm_config in 'UFrm_config.pas' {frm_config},
  UEnviarEmail in 'UEnviarEmail.pas' {frm_envioEmail},
  UEstruturasDeDadosParaImportacao in 'objects\UEstruturasDeDadosParaImportacao.pas',
  UDataSourcesDeImportacao in 'objects\UDataSourcesDeImportacao.pas',
  ULeituraDeArquivosRemessas in 'objects\ULeituraDeArquivosRemessas.pas',
  UFrm_Backup in 'UFrm_Backup.pas' {Frm_Backup},
  Ufrm_CargaHigienizacao in 'UFrm_CargaHigienizacao.pas' {frm_CargaHigienizacao},
  UFrm_ManutCPFCRolim in 'UFrm_ManutCPFCRolim.pas' {Frm_ManutCPFCRolim},
  UFrm_BatimentoCarteira in 'UFrm_BatimentoCarteira.pas' {Frm_BatimentoCarteira},
  UValidarBatimentoCarteira in 'objects\UValidarBatimentoCarteira.pas',
  UCadMotivosSPC in 'UCadMotivosSPC.pas' {Frm_cadMotivosSPC},
  Ufrm_gerarRemessaSPC in 'Ufrm_gerarRemessaSPC.pas' {frm_GerarRemessaSPC},
  UConheceCobrancaNoSPC in 'objects\UConheceCobrancaNoSPC.pas',
  Uqr_borderoAberto in 'Uqr_borderoAberto.pas' {qr_borderoAberto: TQuickRep};

{$R *.res}
 {$IMPLICITBUILD ON}

begin
{$IFDEF WIN32}
  Application.Initialize;
  FRotinas := TFrotinas.Create(Application);
  FRotinas.Show;
  FRotinas.Refresh;
{$ENDIF}
  Application.Title := 'SISCOB';
  //Application.Icon.Loadfromfile('sc.ico');
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_Principal, Frm_Principal);

  Application.Run;
  end.
