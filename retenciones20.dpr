program retenciones20;

uses
  Vcl.Forms,
  ClienteRetenciones in 'ClienteRetenciones.pas' {Form1},
  wsreciberetencionservice in 'wsreciberetencionservice.pas',
  Facturacion.OpenSSL in 'Facturacion.OpenSSL.pas',
  libeay32 in 'libeay32.pas',
  LibEay32Plus in 'LibEay32Plus.pas',
  OpenSSLUtils in 'OpenSSLUtils.pas',
  wscancelaretenciones in 'wscancelaretenciones.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
