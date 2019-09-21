unit UAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, SpeedBar, ExtCtrls, StdCtrls, DBCtrls,
  Mask;

type
  Tfrm_agenda = class(TForm)
    devedoresAgendados: TADODataSet;
    dts_devedores: TDataSource;
    DBGrid1: TDBGrid;
    devedoresAgendadospk_devedor: TIntegerField;
    devedoresAgendadospk_cliente: TIntegerField;
    devedoresAgendadosCGC_CPF: TStringField;
    devedoresAgendadosNome: TStringField;
    devedoresAgendadosCidade: TStringField;
    devedoresAgendadosUf: TStringField;
    devedoresAgendadosagendado_data: TDateTimeField;
    devedoresAgendadosagendado_hora: TStringField;
    devedoresAgendadosvalor_divida: TFloatField;
    devedoresAgendadospk_cobrador: TIntegerField;
    ToolBar: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    SB_Salvar: TSpeedItem;
    SB_Fechar: TSpeedItem;
    eventos: TADOQuery;
    dts_eventos: TDataSource;
    DBGrid2: TDBGrid;
    eventoschave: TIntegerField;
    eventospk_devedor: TIntegerField;
    eventosData: TDateTimeField;
    eventosHora: TStringField;
    eventosTexto: TStringField;
    eventosmotivo: TIntegerField;
    eventosAgendado_Data: TDateTimeField;
    eventosAgendado_Tipo: TIntegerField;
    eventosAgendado_Hora: TStringField;
    eventosmarcar_nao_localiz: TStringField;
    eventosseq_arq_inclusao: TIntegerField;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    temp: TADOCommand;
    Label2: TLabel;
    DBEdit6: TDBEdit;
    devedoresAgendadosnomeCliente: TStringField;
    adiarAgenda: TADODataSet;
    adiarAgendapk_devedor: TIntegerField;
    adiarAgendapk_cliente: TIntegerField;
    adiarAgendaagendado_data: TDateTimeField;
    adiarAgendaagendado_hora: TStringField;
    adiarAgendapk_cobrador: TIntegerField;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    devedoresAgendadosusuario: TWideStringField;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    procedure devedoresAgendadosAfterScroll(DataSet: TDataSet);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_SalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    atender:integer;
  end;

var
  frm_agenda: Tfrm_agenda;

implementation
uses UDM, URotinas,UCons_cobranca;

{$R *.dfm}

procedure Tfrm_agenda.devedoresAgendadosAfterScroll(DataSet: TDataSet);
begin
      eventos.Close;
      eventos.SQL.Text := 'select * from EVENTOS where pk_devedor='+devedoresAgendadospk_devedor.asstring+' order by DATA DESC';
      eventos.open;

end;

procedure Tfrm_agenda.SB_FecharClick(Sender: TObject);
begin
atender:=2;
close;
end;

procedure Tfrm_agenda.SB_SalvarClick(Sender: TObject);
begin
atender:=1;
close;
end;



end.
