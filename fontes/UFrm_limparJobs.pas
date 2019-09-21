unit UFrm_limparJobs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls,  Gauges,  FileCtrl, Mask, DBCtrls,
  DB, ADODB, RxLookup;

type
  Tfrm_limparJobs = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
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
  frm_limparJobs: Tfrm_limparJobs;

implementation

uses UPrincipal, UDM, URotinas;

{$R *.dfm}

procedure Tfrm_limparJobs.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure Tfrm_limparJobs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure Tfrm_limparJobs.sb_gravarConfClick(Sender: TObject);
begin

frotinas.Qry_Livre.close;
frotinas.Qry_Livre.CommandText := 'select * from tabela where tabela=''JOBS''';
frotinas.Qry_Livre.open;
frotinas.Qry_Livre.edit;
frotinas.Qry_Livre.fieldByName('seq').value := 0;

frotinas.ADOCommand1.CommandText := 'delete from jobs';
frotinas.ADOCommand1.Execute;

showmessage('Limeza concluída.');
                                                   

end;

end.
