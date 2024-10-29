unit ClienteRetenciones;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, XMLDoc, XMLIntf, MSXML, Xml.xmldom,
  OpenSSLUtils, Facturacion.OpenSSL,Soap.InvokeRegistry, Soap.SOAPHTTPClient, SOAPHTTPTrans, IOUtils,
  wsreciberetencionservice, wscancelaretenciones, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    timbrarBtn: TButton;
    responseMemo: TMemo;
    actionSelect: TComboBox;
    actionLbl: TLabel;
    sellarChkBox: TCheckBox;
    xmlLbl: TLabel;
    xmlTxt: TEdit;
    xmlBtn: TButton;
    cerLbl: TLabel;
    cerTxt: TEdit;
    cerBtn: TButton;
    main_header: TLabel;
    keyLbl: TLabel;
    keyTxt: TEdit;
    keyBtn: TButton;
    pwdLbl: TLabel;
    pwdTxt: TEdit;
    showPwdBtn: TButton;
    validatePwdBtn: TButton;
    motivoLbl: TLabel;
    motivoSelect: TComboBox;
    folioSustLbl: TLabel;
    folioSustitucionTxt: TEdit;
    procedure timbrarBtnClick(Sender: TObject);
    procedure actionSelectChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure showPwdBtnClick(Sender: TObject);
    procedure motivoSelectChange(Sender: TObject);
    procedure xmlBtnClick(Sender: TObject);
    procedure cerBtnClick(Sender: TObject);
    procedure keyBtnClick(Sender: TObject);
    procedure validatePwdBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  timbrar : boolean;
  openDialog : topendialog;
const
  USUARIO_WS : string = 'pruebasWS';   // USUARIO  DE SERVICIO FD
  PASSWORD_WS : string = 'pruebasWS';  // PASSWORD DE SERVICIO FD
  sLineBreak = {$IFDEF LINUX} AnsiChar(#10) {$ENDIF}
               {$IFDEF MSWINDOWS} AnsiString(#13#10) {$ENDIF}; // SALTO DE LINEA

implementation

{$R *.dfm}
// onInit values
procedure TForm1.FormCreate(Sender: TObject);
begin
    timbrar := True;
    // hide motivo cancelacion y folio sustitucion
    motivoLbl.Visible := False;
    motivoSelect.Visible := False;
    folioSustLbl.Visible := False;
    folioSustitucionTxt.Visible := False;
end;

// Funcion para obtener el motivo de cancelacion
function GetMotivoCancelacion(const idx: integer) : string;
begin
  case idx of
   0 : begin
          Result := '01';
       end;
   1 : begin
          Result := '02';
       end;
   2 : begin
          Result := '03';
       end;
   3 : begin
          Result := '04';
       end;
   end
end;

// Funcion para validar inputs del Form (cer, key y password)
function validateInputs : boolean;
var
  continue : boolean;
begin
  continue := False;
  if Trim(Form1.cerTxt.Text) <> '' then
    begin
      if Trim(Form1.keyTxt.Text) <> '' then
        begin
          if Trim(Form1.pwdTxt.Text) <> '' then
            continue := True
          else
            ShowMessage('No ha capturado la contraseña del CSD');
        end
      else
        ShowMessage('No ha seleccionado el archivo "key"');
    end // end key file
  else
    ShowMessage('No ha seleccionado el archivo "cer"');
  // result validation
  Result := continue;
end;

//  Funcion que se encarga de actualizar la fecha del documento a la fecha actual.
function updateFecha(const fileName : string) : IXMLDocument;
var
  document : IXMLDocument;
  retencionNode : IDOMNode;
  fecha : TDateTime;
  fechaStr : string;
begin
  fecha := Now;
  document := LoadXMLDocument(fileName);
  retencionNode := document.DOMDocument.getElementsByTagName('retenciones:Retenciones').item[0];
  fechaStr := FormatDateTime('yyyy-mm-dd hh:nn:ss', fecha);
  fechaStr := fechaStr.Replace(' ', 'T');
  retencionNode.attributes.getNamedItem('FechaExp').nodeValue := fechaStr;
  // retorna documento con fecha actualizada
  Result := document;
end;

// Funcion para encontrar nodo hijo por nombre
function FindChildByName(ANode: IDOMNode; const AChildName: string): IDOMNode;
var
  I: Integer;
  ChildNode: IDOMNode;
begin
  Result := nil; // Valor default del result
  if ANode <> nil then
  begin
    for I := 0 to ANode.ChildNodes.length - 1 do
    begin
      ChildNode := ANode.ChildNodes[I];
      if ChildNode.NodeName = AChildName then
      begin
        Result := ChildNode; // Se encuentra y retorna el nodo hijo
        Exit; // Termina el ciclo
      end;
    end;
  end;
end;

// obtiene uuid del comprobante
function getRfcUUID(const xmlPath : string; const dataAttr : string) : string;
  var
  document : IXMLDocument;
  retencionesNode : IDOMNode;
  emisorNode : IDOMNode;
  complementoNode : IDOMNode;
  timbrefiscalNode : IDOMNode;
  version : string;
begin
  try
  document := LoadXMLDocument(xmlPath); // Se carga el documento seleccionado desde el form
  retencionesNode := document.DOMDocument.getElementsByTagName('retenciones:Retenciones').item[0];
  // Se valida si existe el nodo Retenciones
  if retencionesNode <> nil then
    begin
      version := retencionesNode.attributes.getNamedItem('Version').nodeValue;
      if version = '2.0' then
        if dataAttr = 'RfcE' then
          begin
              emisorNode := FindChildByName(retencionesNode, 'retenciones:Emisor');
              // Se valida si existe el nodo  Emisor
              if emisorNode <> nil then
                begin
                     Result := emisorNode.attributes.getNamedItem('RfcE').nodeValue;
                     Exit;
                end
              else
                ShowMessage('Nodo "Emisor" no encontrado');
          end;
        if dataAttr = 'UUID' then
          begin
              complementoNode := FindChildByName(retencionesNode, 'retenciones:Complemento');
              // Se valida si existe el nodo Complemento
              if complementoNode <> nil then
              begin
                timbrefiscalNode := FindChildByName(complementoNode, 'tfd:TimbreFiscalDigital');
                // Se valida si existe el nodo TimbreFiscalDigital
                if timbrefiscalNode <> nil then
                  begin
                    Result := timbrefiscalNode.attributes.getNamedItem('UUID').nodeValue; // Se obtiene el UUID del nodo TimbreFiscalDigital
                    Exit;
                  end
                else
                  // Si no existe el nodo se notifica al usuario
                  ShowMessage('Nodo "TimbreFiscalDigital" no encontrado');
              end
              else
                // Si no existe el nodo se notifica al usuario
                ShowMessage('Nodo "Complemento" no encontrado');
          end
      else
        // Si no existe el nodo se notifica al usuario
        ShowMessage('El documento no es una Retencion version 2.0');
    end
  else
      // Si no existe el nodo Retenciones se notifica al usuario
      ShowMessage('El documento no es de tipo Retencion');
  finally
    document := nil; // Se libera el documento
  end;
end;


{$REGION 'Timbrado de documento'}
// Funcion Timbrar Retencion 2.0
// User Acceptance Testing (UAT)
// https://dev.facturacfdi.mx:8081/retenciones/wsreciberetencionservice?wsdl
// Prod
// https://www.facturacfdi.mx/retenciones/wsreciberetencionservice?wsdl
function timbrarRetencion(const xmlPath: string; const cerPath : string;
const keyPath : string; const password : string; const sellado : boolean) : string;
var
  //cadenaOriginal : RawByteString;
  //certificadoString, noCertificado, sello, fechaStr, xmlString : string;
  xmlString : string;
  retencionWS : WSRecibeRetencion;
  document : IXMLDocument;
  retencionNode : IDOMNode;
  acc : accesos;
  response : acuseRetencion;
  res : string;
  begin
    document := LoadXMLDocument(xmlPath);
    if sellado then
      begin
        document := updateFecha(xmlPath);
        retencionNode := document.DOMDocument.getElementsByTagName('retenciones:Retenciones').item[0];
      end
    else
      begin
         document.SaveToXML(xmlString);
         retencionWS := GetWSRecibeRetencion(False, '', nil);
         // accecsos al WS
         acc := accesos.Create;
         acc.password := USUARIO_WS;
         acc.usuario := PASSWORD_WS;
         // se timbra el documento con los accesos y xml proporcionados
         response := retencionWS.RecibeRetencion2_0(acc, xmlString);
         if response.xmlRetencion_ <> '' then
          res := response.xmlRetencion_
         else
          res := response.codigoError + ' - ' + response.error;
      end;
    Result := res;
  end;
{$ENDREGION}

{$REGION 'cancelacionWS'}
// cancelacion documento
function cancelaRetencion(const xmlPath: string; cerPath :string; keyPath : string;
 const password : string; const motivo : string; const folio : string) : string;
var
  fecha : TDateTime;
  fechaStr, res : string;
  cancelacionWS : wscancelaretenciones.CancelaRetenciones;
  request : requestCancelOne;
  response : responseCancel;
  _folios : folios;
  cerBytes : TBytes;
  keyBytes : TBytes;
begin
  try
    // instantiate ws cancelacion retenciones
    cancelacionWS := GetCancelaRetenciones(False, '', nil);
    // set request data
    request := requestCancelOne.Create;
    request.rfc := GetRfcUUID(xmlPath,'RfcE');
    request.usuario_servicio := USUARIO_WS;
    request.password_servicio := PASSWORD_WS;
    // Obtener valor de los archivos de CSD
    cerBytes := TFile.ReadAllBytes(cerPath);  // read cer file as byte[]
    keyBytes := TFile.ReadAllBytes(keyPath);  // read key file as byte[]
    request.publickey := TByteSOAPArray(cerBytes);
    request.privatekey := TByteSOAPArray(keyBytes);
    request.password_certs := password;
    // folios
    _folios := folios.Create;
    _folios.UUID := GetRfcUUID(xmlPath, 'UUID');
    _folios.motivo := motivo;
    if motivo = '01' then
    begin
      if Trim(folio) = '' then
        begin
          ShowMessage('Capture el folio de sustitucion.');
          Exit;
        end
    end;
    request.folios := _folios;
    // cancelar retencion
    response := cancelacionWS.CancelacionOne(request);
    if response.mensaje <> '' then
      // retorna acuse
      res := response.mensaje
    else
      res := 'Ocurrio un problema al cancelar el documento';
  finally
    // free all
  end;
  Result := res;
end;
{$ENDREGION}

{$REGION 'form events'}
// main action selector
procedure TForm1.actionSelectChange(Sender: TObject);
var
  idx: integer;
begin
  idx := actionSelect.ItemIndex;
  if idx = 0 then
    // en caso de elegir timbrado
    begin
      timbrar := True;
      //sellarChkBox.Visible := True;
      // hide motivo cancelacion y folio sustitucion
      motivoLbl.Visible := False;
      motivoSelect.Visible := False;
      folioSustLbl.Visible := False;
      folioSustitucionTxt.Visible := False;
      timbrarBtn.Caption := 'Timbrar retencion';
    end
  else
    // en caso de elegir cancelacion
    begin
      timbrar := False;
      //sellarChkBox.Visible := False;
      // show motivo cancelacion y folio sustitucion
      motivoLbl.Visible := True;
      motivoSelect.Visible := True;
      folioSustLbl.Visible := True;
      folioSustitucionTxt.Visible := True;
      timbrarBtn.Caption := 'Cancelar retencion';
    end
end;

// validate private key
procedure TForm1.validatePwdBtnClick(Sender: TObject);
var
  fInstanciaOpenSSL: IOpenSSL;
begin
  if validateInputs then
    begin
        fInstanciaOpenSSL := TOpenSSL.Create; // instantiate
      if (fInstanciaOpenSSL.SonPareja(Form1.cerTxt.Text, Form1.keyTxt.Text, Form1.pwdTxt.Text)) then
        ShowMessage('Son correctos')
      else
        ShowMessage(fInstanciaOpenSSL.SonPareja(Form1.cerTxt.Text, Form1.keyTxt.Text, Form1.pwdTxt.Text).ToString())
     end
end;

// procedure timbrar button (onclick)
procedure TForm1.timbrarBtnClick(Sender: TObject);
var
  xmlPath, cerPath, keyPath, password, motivo, folio : string;
  sellado : boolean;
begin
    if xmlTxt.Text <> '' then
      begin
        if validateInputs then
          begin
            // valores temporales para probar el WS Retenciones 2.0
            xmlPath := xmlTxt.Text;
            cerPath := cerTxt.Text;
            keyPath := keyTxt.Text;
            password := pwdTxt.Text;
            // sellar / timbrar xml retencion 2.0
            if timbrar then
              begin
                // retorna xml timbrado o response del WS
                sellado := sellarChkBox.Checked;
                responseMemo.Lines.Text := timbrarRetencion(xmlPath, cerPath, keyPath, password, sellado);
              end
            else
              begin
                motivo := GetMotivoCancelacion(motivoSelect.ItemIndex);
                folio := folioSustitucionTxt.Text;
                // retorna el acuse de cancelacion o response del WS
                responseMemo.Lines.Text := cancelaRetencion(xmlPath, cerPath, keyPath, password, motivo, folio);
              end
          end;
      end
    else
      ShowMessage('No ha seleccionado el archivo "xml"')
end;

// load xml file
procedure TForm1.xmlBtnClick(Sender: TObject);
begin
  openDialog := TOpenDialog.Create(self);
   openDialog.InitialDir:= GetCurrentDir;
   openDialog.Options:= [ofFileMustExist];
   openDialog.Filter:= 'XML files|*.xml';
   openDialog.FilterIndex:=1;
   if openDialog.Execute then
      begin
       xmlTxt.Text := openDialog.FileName;
      end
   else
   openDialog.Free;
end;

// load cer file
procedure TForm1.cerBtnClick(Sender: TObject);
begin
   openDialog := TOpenDialog.Create(self);
   openDialog.InitialDir:= GetCurrentDir;
   openDialog.Options:= [ofFileMustExist];
   openDialog.Filter:= 'Certificate files|*.cer| Pem files| *.pem';
   openDialog.FilterIndex:=1;
   if openDialog.Execute then
      begin
       cerTxt.Text := openDialog.FileName;
      end
   else
   openDialog.Free;
end;

// load key file
procedure TForm1.keyBtnClick(Sender: TObject);
begin
   openDialog := TOpenDialog.Create(self);
   openDialog.InitialDir := GetCurrentDir;
   openDialog.Options := [ofFileMustExist];
   openDialog.Filter := 'Key files|*.key';
   openDialog.FilterIndex := 1;
   if openDialog.Execute then
      begin
       keyTxt.Text := openDialog.FileName;
      end
   else
   openDialog.Free;
end;

// procedure mostrar / ocultar password
procedure TForm1.showPwdBtnClick(Sender: TObject);
begin
if (pwdTxt.PasswordChar <> #0) then
    begin
      pwdTxt.PasswordChar := #0;
      showPwdBtn.Caption := 'Ocultar';
    end
  else
    begin
      pwdTxt.PasswordChar := '*';
      showPwdBtn.Caption := 'Mostrar';
    end
end;

// Folio sustitucion show / hide
procedure TForm1.motivoSelectChange(Sender: TObject);
var
  idx : integer;
begin
  idx := motivoSelect.ItemIndex;
  if idx <> 0 then
    begin
      folioSustLbl.Visible := False;
      folioSustitucionTxt.Visible := False;
      folioSustitucionTxt.Clear;
    end
  else
    begin
      folioSustLbl.Visible := True;
      folioSustitucionTxt.Visible := True;
    end
end;
{$ENDREGION}

end.
