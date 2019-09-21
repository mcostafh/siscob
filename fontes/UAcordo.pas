unit UAcordo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, SpeedBar, ExtCtrls, StdCtrls, DBCtrls,
  Mask;

type
  Tfrm_acordo = class(TForm)
    ToolBar: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    SB_Salvar: TSpeedItem;
    SB_Fechar: TSpeedItem;
    adiarAgenda: TADODataSet;
    adiarAgendapk_devedor: TIntegerField;
    adiarAgendapk_cliente: TIntegerField;
    adiarAgendaagendado_data: TDateTimeField;
    adiarAgendaagendado_hora: TStringField;
    adiarAgendapk_cobrador: TIntegerField;
    Panel1: TPanel;
    Label3: TLabel;
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
  frm_acordo: Tfrm_acordo;

implementation
uses UDM, URotinas,UCons_cobranca;

{$R *.dfm}

procedure Tfrm_acordo.devedoresAgendadosAfterScroll(DataSet: TDataSet);
begin
      //eventos.Close;
      //eventos.SQL.Text := 'select * from EVENTOS where pk_devedor='+devedoresAgendadospk_devedor.asstring+' order by DATA DESC';
      //eventos.open;

end;

procedure Tfrm_acordo.SB_FecharClick(Sender: TObject);
begin
atender:=2;
close;
end;

procedure Tfrm_acordo.SB_SalvarClick(Sender: TObject);
begin
atender:=1;
close;
end;



end.
