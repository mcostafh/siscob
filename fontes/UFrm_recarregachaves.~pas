unit UFrm_recarregachaves;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls,  Gauges,  FileCtrl, Mask, DBCtrls,
  DB, ADODB, RxLookup;

type
  Tfrm_recarregachaves = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Gauge_atualizando: TGauge;
    lb_mens: TLabel;
    sb_gravarConf: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sb_gravarConfClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    F : TextFile;
  end;

var
  frm_recarregachaves: Tfrm_recarregachaves;

implementation

uses UPrincipal, UDM, URotinas;

{$R *.dfm}

procedure Tfrm_recarregachaves.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure Tfrm_recarregachaves.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure Tfrm_recarregachaves.sb_gravarConfClick(Sender: TObject);
var seq:integer;
begin

frotinas.Qry_Livre.close;
frotinas.Qry_Livre.CommandText := 'select max(pk_titulo) as pk_titulo from titulos';
frotinas.Qry_Livre.Open;

seq := frotinas.Qry_Livre.fieldByName('pk_titulo').asinteger + 2;
frotinas.ADOCommand1.CommandText := 'update tabela set seq='+intToStr(seq)+' where tabela=''titulos''';
frotinas.ADOCommand1.Prepared;
frotinas.ADOCommand1.Execute;

frotinas.Qry_Livre.close;
frotinas.Qry_Livre.CommandText := 'select max(pk_devedor) as pk_titulo from devedores';
frotinas.Qry_Livre.Open;

seq := frotinas.Qry_Livre.fieldByName('pk_titulo').asinteger + 2;
frotinas.ADOCommand1.CommandText := 'update tabela set seq='+intToStr(seq)+' where tabela=''devedores''';
frotinas.ADOCommand1.Prepared;
frotinas.ADOCommand1.Execute;

frotinas.Qry_Livre.close;
frotinas.Qry_Livre.CommandText := 'select max(id) as pk_fone from telefones';
frotinas.Qry_Livre.Open;

seq := frotinas.Qry_Livre.fieldByName('pk_fone').asinteger + 2;
frotinas.ADOCommand1.CommandText := 'update tabela set seq='+intToStr(seq)+' where tabela=''telefones''';
frotinas.ADOCommand1.Prepared;
frotinas.ADOCommand1.Execute;


showmessage('Recarga concluída.');


end;

end.
