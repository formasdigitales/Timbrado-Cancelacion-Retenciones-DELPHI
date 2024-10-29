// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://dev.facturacfdi.mx:8081/retenciones/wsreciberetencionservice?wsdl
//  >Import : https://dev.facturacfdi.mx:8081/retenciones/wsreciberetencionservice?wsdl>0
//  >Import : https://dev.facturacfdi.mx:8081/retenciones/wsreciberetencionservice?xsd=1
// Encoding : UTF-8
// Version  : 1.0
// (21/10/2024 05:39:01 p. m. - - $Rev: 116709 $)
// ************************************************************************ //

unit wsreciberetencionservice;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNQL = $0008;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  accesos              = class;                 { "http://wservicios/"[GblCplx] }
  acuseRetencion       = class;                 { "http://wservicios/"[GblCplx] }



  // ************************************************************************ //
  // XML       : accesos, global, <complexType>
  // Namespace : http://wservicios/
  // ************************************************************************ //
  accesos = class(TRemotable)
  private
    Fpassword: string;
    Fpassword_Specified: boolean;
    Fusuario: string;
    Fusuario_Specified: boolean;
    procedure Setpassword(Index: Integer; const Astring: string);
    function  password_Specified(Index: Integer): boolean;
    procedure Setusuario(Index: Integer; const Astring: string);
    function  usuario_Specified(Index: Integer): boolean;
  published
    property password: string  Index (IS_OPTN or IS_UNQL) read Fpassword write Setpassword stored password_Specified;
    property usuario:  string  Index (IS_OPTN or IS_UNQL) read Fusuario write Setusuario stored usuario_Specified;
  end;



  // ************************************************************************ //
  // XML       : acuseRetencion, global, <complexType>
  // Namespace : http://wservicios/
  // ************************************************************************ //
  acuseRetencion = class(TRemotable)
  private
    FcodigoError: string;
    FcodigoError_Specified: boolean;
    Ferror: string;
    Ferror_Specified: boolean;
    FxmlRetencion_: string;
    FxmlRetencion__Specified: boolean;
    procedure SetcodigoError(Index: Integer; const Astring: string);
    function  codigoError_Specified(Index: Integer): boolean;
    procedure Seterror(Index: Integer; const Astring: string);
    function  error_Specified(Index: Integer): boolean;
    procedure SetxmlRetencion_(Index: Integer; const Astring: string);
    function  xmlRetencion__Specified(Index: Integer): boolean;
  published
    property codigoError:   string  Index (IS_OPTN or IS_UNQL) read FcodigoError write SetcodigoError stored codigoError_Specified;
    property error:         string  Index (IS_OPTN or IS_UNQL) read Ferror write Seterror stored error_Specified;
    property xmlRetencion_: string  Index (IS_OPTN or IS_UNQL) read FxmlRetencion_ write SetxmlRetencion_ stored xmlRetencion__Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://wservicios/
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : WSRecibeRetencionPortBinding
  // service   : wsreciberetencionservice
  // port      : WSRecibeRetencionPort
  // URL       : https://dev.facturacfdi.mx:8081/retenciones/wsreciberetencionservice
  // ************************************************************************ //
  WSRecibeRetencion = interface(IInvokable)
  ['{3F141B2A-AE63-EDD2-6EC9-C072D1FD4704}']
    function  RecibeRetencion(const accesos: accesos; const xmlRetencion: string): acuseRetencion; stdcall;
    function  RecibeRetencion2_0(const accesos: accesos; const xmlRetencion: string): acuseRetencion; stdcall;
  end;

function GetWSRecibeRetencion(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): WSRecibeRetencion;


implementation
  uses System.SysUtils;

function GetWSRecibeRetencion(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): WSRecibeRetencion;
const
  defWSDL = 'https://dev.facturacfdi.mx:8081/retenciones/wsreciberetencionservice?wsdl';
  defURL  = 'https://dev.facturacfdi.mx:8081/retenciones/wsreciberetencionservice';
  defSvc  = 'wsreciberetencionservice';
  defPrt  = 'WSRecibeRetencionPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as WSRecibeRetencion);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


procedure accesos.Setpassword(Index: Integer; const Astring: string);
begin
  Fpassword := Astring;
  Fpassword_Specified := True;
end;

function accesos.password_Specified(Index: Integer): boolean;
begin
  Result := Fpassword_Specified;
end;

procedure accesos.Setusuario(Index: Integer; const Astring: string);
begin
  Fusuario := Astring;
  Fusuario_Specified := True;
end;

function accesos.usuario_Specified(Index: Integer): boolean;
begin
  Result := Fusuario_Specified;
end;

procedure acuseRetencion.SetcodigoError(Index: Integer; const Astring: string);
begin
  FcodigoError := Astring;
  FcodigoError_Specified := True;
end;

function acuseRetencion.codigoError_Specified(Index: Integer): boolean;
begin
  Result := FcodigoError_Specified;
end;

procedure acuseRetencion.Seterror(Index: Integer; const Astring: string);
begin
  Ferror := Astring;
  Ferror_Specified := True;
end;

function acuseRetencion.error_Specified(Index: Integer): boolean;
begin
  Result := Ferror_Specified;
end;

procedure acuseRetencion.SetxmlRetencion_(Index: Integer; const Astring: string);
begin
  FxmlRetencion_ := Astring;
  FxmlRetencion__Specified := True;
end;

function acuseRetencion.xmlRetencion__Specified(Index: Integer): boolean;
begin
  Result := FxmlRetencion__Specified;
end;

initialization
  { WSRecibeRetencion }
  InvRegistry.RegisterInterface(TypeInfo(WSRecibeRetencion), 'http://wservicios/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(WSRecibeRetencion), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(WSRecibeRetencion), ioDocument);
  { WSRecibeRetencion.RecibeRetencion }
  InvRegistry.RegisterMethodInfo(TypeInfo(WSRecibeRetencion), 'RecibeRetencion', '',
                                 '[ReturnName="acuseRetencion"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(WSRecibeRetencion), 'RecibeRetencion', 'accesos', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(WSRecibeRetencion), 'RecibeRetencion', 'xmlRetencion', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(WSRecibeRetencion), 'RecibeRetencion', 'acuseRetencion', '',
                                '', IS_UNQL);
  { WSRecibeRetencion.RecibeRetencion2_0 }
  InvRegistry.RegisterMethodInfo(TypeInfo(WSRecibeRetencion), 'RecibeRetencion2_0', '',
                                 '[ReturnName="acuseRetencion"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(WSRecibeRetencion), 'RecibeRetencion2_0', 'accesos', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(WSRecibeRetencion), 'RecibeRetencion2_0', 'xmlRetencion', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(WSRecibeRetencion), 'RecibeRetencion2_0', 'acuseRetencion', '',
                                '', IS_UNQL);
  RemClassRegistry.RegisterXSClass(accesos, 'http://wservicios/', 'accesos');
  RemClassRegistry.RegisterXSClass(acuseRetencion, 'http://wservicios/', 'acuseRetencion');

end.