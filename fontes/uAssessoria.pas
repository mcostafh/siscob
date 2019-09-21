unit uAssessoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, DB, ADODB, StdCtrls, Mask, DBCtrls;

type
  Tfrm_assessoria = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    sb_gravarConf: TSpeedButton;
    SpeedButton1: TSpeedButton;
    assessoria: TADOTable;
    assessoriacnpj: TStringField;
    assessorianome: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sb_gravarConfClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_assessoria: Tfrm_assessoria;

implementation
uses UDM;

{$R *.dfm}

procedure Tfrm_assessoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=Cafree;

end;

procedure Tfrm_assessoria.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure Tfrm_assessoria.sb_gravarConfClick(Sender: TObject);
begin
assessoria.post;
end;

procedure Tfrm_assessoria.FormShow(Sender: TObject);
begin
assessoria.open;
assessoria.edit;
end;

end.
