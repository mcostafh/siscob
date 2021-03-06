unit UFrm_Backup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls,  Gauges,  FileCtrl, Mask, DBCtrls,
  DB, ADODB, RxLookup, ToolEdit;

type
  TFrm_Backup = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    lb_mens: TLabel;
    sb_backup: TSpeedButton;
    lb_status: TLabel;
    edt_pastaArq: TEdit;
    SpeedButton1: TSpeedButton;
    ADOCommand1: TADOCommand;
    lb_backup: TLabel;
    lb_realizado: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sb_backupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    F : TextFile;
  end;

var
  Frm_Backup: TFrm_Backup;

implementation

uses UPrincipal, UDM, URotinas;

{$R *.dfm}

procedure TFrm_Backup.SpeedButton1Click(Sender: TObject);
begin
close;
end;



procedure TFrm_Backup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure TFrm_Backup.sb_backupClick(Sender: TObject);
var arquivo, path:string;
begin
  if edt_pastaArq.Text = '' then
  begin
     showmessage('Informe a pasta e arquivo, exemplo: E:\cobranca10082013')
  end
  else
  begin

    //arquivo := 'siscob_'+FormatDateTime( 'DDMMYYYY',date)+'.bkp';
    //path := ExtractFilePath(ParamStr(0));

    fRotinas.SetParam_String('PASTA_BACK', edt_pastaArq.text );

    lb_backup.Visible := true;
    refresh;
    try
      FRotinas.backupAutomatico(edt_pastaArq.text, true);
    except
    end;


   {
   ADOCommand1.CommandText := ' BACKUP DATABASE cobranca TO DISK = ''' + arquivo+''' WITH FORMAT, MEDIANAME = ''Z_SQLServerBackups'', NAME = ''Full Backup of AdventureWorks2012''';
    ADOCommand1.Prepared;
    ADOCommand1.Execute;
    lb_backup.Visible := false;
    lb_realizado.Visible := true;

    moveFile(Pchar(path),Pchar(edt_pastaArq.text));
    }
    
    showmessage('Backup realizado - Agora voc� pode verifique o arquivo na pasta destino.')


  end;


end;

procedure TFrm_Backup.FormShow(Sender: TObject);
begin

edt_pastaArq.text := fRotinas.Param_String('PASTA_BACK');

end;

end.
