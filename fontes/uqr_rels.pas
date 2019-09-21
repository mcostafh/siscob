unit uqr_rels;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  Tqr_rels = class(TQuickRep)
    QRBand1: TQRBand;
    QRImage2: TQRImage;
    qrlb_titulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRBand2: TQRBand;
    QRMemo1: TQRMemo;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qr_rels: Tqr_rels;

implementation

{$R *.DFM}

procedure Tqr_rels.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var pathImagens:string;
  var achouLogo : boolean;
begin

pathImagens := ExtractFilePath(ParamStr(0))+'logo.jpg';
achouLogo := true;
if not FileExists(pathImagens) then
begin
  pathImagens := ExtractFilePath(ParamStr(0))+'logo.jpeg';
  if not FileExists(pathImagens) then
  begin
    pathImagens := ExtractFilePath(ParamStr(0))+'logo.bmp';
    if not FileExists(pathImagens) then
      achouLogo := false;
  end;
end;

if achouLogo then
begin
   QRImage2.Picture.LoadFromFile(pathimagens);
   QRImage2.Picture.LoadFromFile(pathimagens);
end;

end;

end.
