// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://dev.facturacfdi.mx:8081/retenciones/wscancelaretenciones?wsdl
//  >Import : https://dev.facturacfdi.mx:8081/retenciones/wscancelaretenciones?wsdl>0
//  >Import : https://dev.facturacfdi.mx:8081/retenciones/wscancelaretenciones?xsd=1
// Encoding : UTF-8
// Version  : 1.0
// (22/10/2024 11:30:09 a. m. - - $Rev: 116709 $)
// ************************************************************************ //

unit wscancelaretenciones;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
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
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"[Gbl]

  folios               = class;                 { "http://cancelacion.forcogsa.com/"[GblCplx] }
  requestAcuseCancel   = class;                 { "http://cancelacion.forcogsa.com/"[GblCplx] }
  responseCancel       = class;                 { "http://cancelacion.forcogsa.com/"[GblCplx] }
  responseSeguimiento  = class;                 { "http://cancelacion.forcogsa.com/"[GblCplx] }
  requestCancelMasive  = class;                 { "http://cancelacion.forcogsa.com/"[GblCplx] }
  requestCancelOne     = class;                 { "http://cancelacion.forcogsa.com/"[GblCplx] }

  Array_Of_folios = array of folios;            { "http://cancelacion.forcogsa.com/"[GblUbnd] }


  // ************************************************************************ //
  // XML       : folios, global, <complexType>
  // Namespace : http://cancelacion.forcogsa.com/
  // ************************************************************************ //
  folios = class(TRemotable)
  private
    FfolioSustitucion: string;
    FfolioSustitucion_Specified: boolean;
    Fmotivo: string;
    Fmotivo_Specified: boolean;
    FUUID: string;
    FUUID_Specified: boolean;
    procedure SetfolioSustitucion(Index: Integer; const Astring: string);
    function  folioSustitucion_Specified(Index: Integer): boolean;
    procedure Setmotivo(Index: Integer; const Astring: string);
    function  motivo_Specified(Index: Integer): boolean;
    procedure SetUUID(Index: Integer; const Astring: string);
    function  UUID_Specified(Index: Integer): boolean;
  published
    property folioSustitucion: string  Index (IS_OPTN or IS_UNQL) read FfolioSustitucion write SetfolioSustitucion stored folioSustitucion_Specified;
    property motivo:           string  Index (IS_OPTN or IS_UNQL) read Fmotivo write Setmotivo stored motivo_Specified;
    property UUID:             string  Index (IS_OPTN or IS_UNQL) read FUUID write SetUUID stored UUID_Specified;
  end;



  // ************************************************************************ //
  // XML       : requestAcuseCancel, global, <complexType>
  // Namespace : http://cancelacion.forcogsa.com/
  // ************************************************************************ //
  requestAcuseCancel = class(TRemotable)
  private
    FfolioSeguimiento: string;
    FfolioSeguimiento_Specified: boolean;
    Fpassword_servicio: string;
    Fpassword_servicio_Specified: boolean;
    Fusuario_servicio: string;
    Fusuario_servicio_Specified: boolean;
    procedure SetfolioSeguimiento(Index: Integer; const Astring: string);
    function  folioSeguimiento_Specified(Index: Integer): boolean;
    procedure Setpassword_servicio(Index: Integer; const Astring: string);
    function  password_servicio_Specified(Index: Integer): boolean;
    procedure Setusuario_servicio(Index: Integer; const Astring: string);
    function  usuario_servicio_Specified(Index: Integer): boolean;
  published
    property folioSeguimiento:  string  Index (IS_OPTN or IS_UNQL) read FfolioSeguimiento write SetfolioSeguimiento stored folioSeguimiento_Specified;
    property password_servicio: string  Index (IS_OPTN or IS_UNQL) read Fpassword_servicio write Setpassword_servicio stored password_servicio_Specified;
    property usuario_servicio:  string  Index (IS_OPTN or IS_UNQL) read Fusuario_servicio write Setusuario_servicio stored usuario_servicio_Specified;
  end;



  // ************************************************************************ //
  // XML       : responseCancel, global, <complexType>
  // Namespace : http://cancelacion.forcogsa.com/
  // ************************************************************************ //
  responseCancel = class(TRemotable)
  private
    Fcodigo_estatus: string;
    Fcodigo_estatus_Specified: boolean;
    Fmensaje: string;
    Fmensaje_Specified: boolean;
    procedure Setcodigo_estatus(Index: Integer; const Astring: string);
    function  codigo_estatus_Specified(Index: Integer): boolean;
    procedure Setmensaje(Index: Integer; const Astring: string);
    function  mensaje_Specified(Index: Integer): boolean;
  published
    property codigo_estatus: string  Index (IS_OPTN or IS_UNQL) read Fcodigo_estatus write Setcodigo_estatus stored codigo_estatus_Specified;
    property mensaje:        string  Index (IS_OPTN or IS_UNQL) read Fmensaje write Setmensaje stored mensaje_Specified;
  end;



  // ************************************************************************ //
  // XML       : responseSeguimiento, global, <complexType>
  // Namespace : http://cancelacion.forcogsa.com/
  // ************************************************************************ //
  responseSeguimiento = class(TRemotable)
  private
    Fcodigo_estatus: string;
    Fcodigo_estatus_Specified: boolean;
    Fmensaje: string;
    Fmensaje_Specified: boolean;
    procedure Setcodigo_estatus(Index: Integer; const Astring: string);
    function  codigo_estatus_Specified(Index: Integer): boolean;
    procedure Setmensaje(Index: Integer; const Astring: string);
    function  mensaje_Specified(Index: Integer): boolean;
  published
    property codigo_estatus: string  Index (IS_OPTN or IS_UNQL) read Fcodigo_estatus write Setcodigo_estatus stored codigo_estatus_Specified;
    property mensaje:        string  Index (IS_OPTN or IS_UNQL) read Fmensaje write Setmensaje stored mensaje_Specified;
  end;



  // ************************************************************************ //
  // XML       : requestCancelMasive, global, <complexType>
  // Namespace : http://cancelacion.forcogsa.com/
  // ************************************************************************ //
  requestCancelMasive = class(TRemotable)
  private
    Ffolios: Array_Of_folios;
    Ffolios_Specified: boolean;
    Fpassword_certs: string;
    Fpassword_certs_Specified: boolean;
    Fpassword_servicio: string;
    Fpassword_servicio_Specified: boolean;
    Fprivatekey: TByteSOAPArray;
    Fprivatekey_Specified: boolean;
    Fpublickey: TByteSOAPArray;
    Fpublickey_Specified: boolean;
    Frfc: string;
    Frfc_Specified: boolean;
    Fusuario_servicio: string;
    Fusuario_servicio_Specified: boolean;
    procedure Setfolios(Index: Integer; const AArray_Of_folios: Array_Of_folios);
    function  folios_Specified(Index: Integer): boolean;
    procedure Setpassword_certs(Index: Integer; const Astring: string);
    function  password_certs_Specified(Index: Integer): boolean;
    procedure Setpassword_servicio(Index: Integer; const Astring: string);
    function  password_servicio_Specified(Index: Integer): boolean;
    procedure Setprivatekey(Index: Integer; const ATByteSOAPArray: TByteSOAPArray);
    function  privatekey_Specified(Index: Integer): boolean;
    procedure Setpublickey(Index: Integer; const ATByteSOAPArray: TByteSOAPArray);
    function  publickey_Specified(Index: Integer): boolean;
    procedure Setrfc(Index: Integer; const Astring: string);
    function  rfc_Specified(Index: Integer): boolean;
    procedure Setusuario_servicio(Index: Integer; const Astring: string);
    function  usuario_servicio_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property folios:            Array_Of_folios  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Ffolios write Setfolios stored folios_Specified;
    property password_certs:    string           Index (IS_OPTN or IS_UNQL) read Fpassword_certs write Setpassword_certs stored password_certs_Specified;
    property password_servicio: string           Index (IS_OPTN or IS_UNQL) read Fpassword_servicio write Setpassword_servicio stored password_servicio_Specified;
    property privatekey:        TByteSOAPArray   Index (IS_OPTN or IS_UNQL) read Fprivatekey write Setprivatekey stored privatekey_Specified;
    property publickey:         TByteSOAPArray   Index (IS_OPTN or IS_UNQL) read Fpublickey write Setpublickey stored publickey_Specified;
    property rfc:               string           Index (IS_OPTN or IS_UNQL) read Frfc write Setrfc stored rfc_Specified;
    property usuario_servicio:  string           Index (IS_OPTN or IS_UNQL) read Fusuario_servicio write Setusuario_servicio stored usuario_servicio_Specified;
  end;



  // ************************************************************************ //
  // XML       : requestCancelOne, global, <complexType>
  // Namespace : http://cancelacion.forcogsa.com/
  // ************************************************************************ //
  requestCancelOne = class(TRemotable)
  private
    Ffolios: folios;
    Ffolios_Specified: boolean;
    Fpassword_certs: string;
    Fpassword_certs_Specified: boolean;
    Fpassword_servicio: string;
    Fpassword_servicio_Specified: boolean;
    Fprivatekey: TByteSOAPArray;
    Fprivatekey_Specified: boolean;
    Fpublickey: TByteSOAPArray;
    Fpublickey_Specified: boolean;
    Frfc: string;
    Frfc_Specified: boolean;
    Fusuario_servicio: string;
    Fusuario_servicio_Specified: boolean;
    procedure Setfolios(Index: Integer; const Afolios: folios);
    function  folios_Specified(Index: Integer): boolean;
    procedure Setpassword_certs(Index: Integer; const Astring: string);
    function  password_certs_Specified(Index: Integer): boolean;
    procedure Setpassword_servicio(Index: Integer; const Astring: string);
    function  password_servicio_Specified(Index: Integer): boolean;
    procedure Setprivatekey(Index: Integer; const ATByteSOAPArray: TByteSOAPArray);
    function  privatekey_Specified(Index: Integer): boolean;
    procedure Setpublickey(Index: Integer; const ATByteSOAPArray: TByteSOAPArray);
    function  publickey_Specified(Index: Integer): boolean;
    procedure Setrfc(Index: Integer; const Astring: string);
    function  rfc_Specified(Index: Integer): boolean;
    procedure Setusuario_servicio(Index: Integer; const Astring: string);
    function  usuario_servicio_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property folios:            folios          Index (IS_OPTN or IS_UNQL) read Ffolios write Setfolios stored folios_Specified;
    property password_certs:    string          Index (IS_OPTN or IS_UNQL) read Fpassword_certs write Setpassword_certs stored password_certs_Specified;
    property password_servicio: string          Index (IS_OPTN or IS_UNQL) read Fpassword_servicio write Setpassword_servicio stored password_servicio_Specified;
    property privatekey:        TByteSOAPArray  Index (IS_OPTN or IS_UNQL) read Fprivatekey write Setprivatekey stored privatekey_Specified;
    property publickey:         TByteSOAPArray  Index (IS_OPTN or IS_UNQL) read Fpublickey write Setpublickey stored publickey_Specified;
    property rfc:               string          Index (IS_OPTN or IS_UNQL) read Frfc write Setrfc stored rfc_Specified;
    property usuario_servicio:  string          Index (IS_OPTN or IS_UNQL) read Fusuario_servicio write Setusuario_servicio stored usuario_servicio_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://cancelacion.forcogsa.com/
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : CancelaRetencionesPortBinding
  // service   : wscancelaretenciones
  // port      : CancelaRetencionesPort
  // URL       : https://dev.facturacfdi.mx:8081/retenciones/wscancelaretenciones
  // ************************************************************************ //
  CancelaRetenciones = interface(IInvokable)
  ['{F58724DF-35C1-57EF-808F-1239DCBDD2BF}']
    function  CancelacionMasiva(const request_cancelacion: requestCancelMasive): responseCancel; stdcall;
    function  CancelacionOne(const request_cancelone: requestCancelOne): responseCancel; stdcall;
    function  consultaseguimiento(const request_seguimiento: requestAcuseCancel): responseSeguimiento; stdcall;
  end;

function GetCancelaRetenciones(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): CancelaRetenciones;


implementation
  uses System.SysUtils;

function GetCancelaRetenciones(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): CancelaRetenciones;
const
  defWSDL = 'https://dev.facturacfdi.mx:8081/retenciones/wscancelaretenciones?wsdl';
  defURL  = 'https://dev.facturacfdi.mx:8081/retenciones/wscancelaretenciones';
  defSvc  = 'wscancelaretenciones';
  defPrt  = 'CancelaRetencionesPort';
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
    Result := (RIO as CancelaRetenciones);
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


procedure folios.SetfolioSustitucion(Index: Integer; const Astring: string);
begin
  FfolioSustitucion := Astring;
  FfolioSustitucion_Specified := True;
end;

function folios.folioSustitucion_Specified(Index: Integer): boolean;
begin
  Result := FfolioSustitucion_Specified;
end;

procedure folios.Setmotivo(Index: Integer; const Astring: string);
begin
  Fmotivo := Astring;
  Fmotivo_Specified := True;
end;

function folios.motivo_Specified(Index: Integer): boolean;
begin
  Result := Fmotivo_Specified;
end;

procedure folios.SetUUID(Index: Integer; const Astring: string);
begin
  FUUID := Astring;
  FUUID_Specified := True;
end;

function folios.UUID_Specified(Index: Integer): boolean;
begin
  Result := FUUID_Specified;
end;

procedure requestAcuseCancel.SetfolioSeguimiento(Index: Integer; const Astring: string);
begin
  FfolioSeguimiento := Astring;
  FfolioSeguimiento_Specified := True;
end;

function requestAcuseCancel.folioSeguimiento_Specified(Index: Integer): boolean;
begin
  Result := FfolioSeguimiento_Specified;
end;

procedure requestAcuseCancel.Setpassword_servicio(Index: Integer; const Astring: string);
begin
  Fpassword_servicio := Astring;
  Fpassword_servicio_Specified := True;
end;

function requestAcuseCancel.password_servicio_Specified(Index: Integer): boolean;
begin
  Result := Fpassword_servicio_Specified;
end;

procedure requestAcuseCancel.Setusuario_servicio(Index: Integer; const Astring: string);
begin
  Fusuario_servicio := Astring;
  Fusuario_servicio_Specified := True;
end;

function requestAcuseCancel.usuario_servicio_Specified(Index: Integer): boolean;
begin
  Result := Fusuario_servicio_Specified;
end;

procedure responseCancel.Setcodigo_estatus(Index: Integer; const Astring: string);
begin
  Fcodigo_estatus := Astring;
  Fcodigo_estatus_Specified := True;
end;

function responseCancel.codigo_estatus_Specified(Index: Integer): boolean;
begin
  Result := Fcodigo_estatus_Specified;
end;

procedure responseCancel.Setmensaje(Index: Integer; const Astring: string);
begin
  Fmensaje := Astring;
  Fmensaje_Specified := True;
end;

function responseCancel.mensaje_Specified(Index: Integer): boolean;
begin
  Result := Fmensaje_Specified;
end;

procedure responseSeguimiento.Setcodigo_estatus(Index: Integer; const Astring: string);
begin
  Fcodigo_estatus := Astring;
  Fcodigo_estatus_Specified := True;
end;

function responseSeguimiento.codigo_estatus_Specified(Index: Integer): boolean;
begin
  Result := Fcodigo_estatus_Specified;
end;

procedure responseSeguimiento.Setmensaje(Index: Integer; const Astring: string);
begin
  Fmensaje := Astring;
  Fmensaje_Specified := True;
end;

function responseSeguimiento.mensaje_Specified(Index: Integer): boolean;
begin
  Result := Fmensaje_Specified;
end;

destructor requestCancelMasive.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ffolios)-1 do
    System.SysUtils.FreeAndNil(Ffolios[I]);
  System.SetLength(Ffolios, 0);
  inherited Destroy;
end;

procedure requestCancelMasive.Setfolios(Index: Integer; const AArray_Of_folios: Array_Of_folios);
begin
  Ffolios := AArray_Of_folios;
  Ffolios_Specified := True;
end;

function requestCancelMasive.folios_Specified(Index: Integer): boolean;
begin
  Result := Ffolios_Specified;
end;

procedure requestCancelMasive.Setpassword_certs(Index: Integer; const Astring: string);
begin
  Fpassword_certs := Astring;
  Fpassword_certs_Specified := True;
end;

function requestCancelMasive.password_certs_Specified(Index: Integer): boolean;
begin
  Result := Fpassword_certs_Specified;
end;

procedure requestCancelMasive.Setpassword_servicio(Index: Integer; const Astring: string);
begin
  Fpassword_servicio := Astring;
  Fpassword_servicio_Specified := True;
end;

function requestCancelMasive.password_servicio_Specified(Index: Integer): boolean;
begin
  Result := Fpassword_servicio_Specified;
end;

procedure requestCancelMasive.Setprivatekey(Index: Integer; const ATByteSOAPArray: TByteSOAPArray);
begin
  Fprivatekey := ATByteSOAPArray;
  Fprivatekey_Specified := True;
end;

function requestCancelMasive.privatekey_Specified(Index: Integer): boolean;
begin
  Result := Fprivatekey_Specified;
end;

procedure requestCancelMasive.Setpublickey(Index: Integer; const ATByteSOAPArray: TByteSOAPArray);
begin
  Fpublickey := ATByteSOAPArray;
  Fpublickey_Specified := True;
end;

function requestCancelMasive.publickey_Specified(Index: Integer): boolean;
begin
  Result := Fpublickey_Specified;
end;

procedure requestCancelMasive.Setrfc(Index: Integer; const Astring: string);
begin
  Frfc := Astring;
  Frfc_Specified := True;
end;

function requestCancelMasive.rfc_Specified(Index: Integer): boolean;
begin
  Result := Frfc_Specified;
end;

procedure requestCancelMasive.Setusuario_servicio(Index: Integer; const Astring: string);
begin
  Fusuario_servicio := Astring;
  Fusuario_servicio_Specified := True;
end;

function requestCancelMasive.usuario_servicio_Specified(Index: Integer): boolean;
begin
  Result := Fusuario_servicio_Specified;
end;

destructor requestCancelOne.Destroy;
begin
  System.SysUtils.FreeAndNil(Ffolios);
  inherited Destroy;
end;

procedure requestCancelOne.Setfolios(Index: Integer; const Afolios: folios);
begin
  Ffolios := Afolios;
  Ffolios_Specified := True;
end;

function requestCancelOne.folios_Specified(Index: Integer): boolean;
begin
  Result := Ffolios_Specified;
end;

procedure requestCancelOne.Setpassword_certs(Index: Integer; const Astring: string);
begin
  Fpassword_certs := Astring;
  Fpassword_certs_Specified := True;
end;

function requestCancelOne.password_certs_Specified(Index: Integer): boolean;
begin
  Result := Fpassword_certs_Specified;
end;

procedure requestCancelOne.Setpassword_servicio(Index: Integer; const Astring: string);
begin
  Fpassword_servicio := Astring;
  Fpassword_servicio_Specified := True;
end;

function requestCancelOne.password_servicio_Specified(Index: Integer): boolean;
begin
  Result := Fpassword_servicio_Specified;
end;

procedure requestCancelOne.Setprivatekey(Index: Integer; const ATByteSOAPArray: TByteSOAPArray);
begin
  Fprivatekey := ATByteSOAPArray;
  Fprivatekey_Specified := True;
end;

function requestCancelOne.privatekey_Specified(Index: Integer): boolean;
begin
  Result := Fprivatekey_Specified;
end;

procedure requestCancelOne.Setpublickey(Index: Integer; const ATByteSOAPArray: TByteSOAPArray);
begin
  Fpublickey := ATByteSOAPArray;
  Fpublickey_Specified := True;
end;

function requestCancelOne.publickey_Specified(Index: Integer): boolean;
begin
  Result := Fpublickey_Specified;
end;

procedure requestCancelOne.Setrfc(Index: Integer; const Astring: string);
begin
  Frfc := Astring;
  Frfc_Specified := True;
end;

function requestCancelOne.rfc_Specified(Index: Integer): boolean;
begin
  Result := Frfc_Specified;
end;

procedure requestCancelOne.Setusuario_servicio(Index: Integer; const Astring: string);
begin
  Fusuario_servicio := Astring;
  Fusuario_servicio_Specified := True;
end;

function requestCancelOne.usuario_servicio_Specified(Index: Integer): boolean;
begin
  Result := Fusuario_servicio_Specified;
end;

initialization
  { CancelaRetenciones }
  InvRegistry.RegisterInterface(TypeInfo(CancelaRetenciones), 'http://cancelacion.forcogsa.com/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(CancelaRetenciones), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(CancelaRetenciones), ioDocument);
  { CancelaRetenciones.CancelacionMasiva }
  InvRegistry.RegisterMethodInfo(TypeInfo(CancelaRetenciones), 'CancelacionMasiva', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(CancelaRetenciones), 'CancelacionMasiva', 'request_cancelacion', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(CancelaRetenciones), 'CancelacionMasiva', 'return', '',
                                '', IS_UNQL);
  { CancelaRetenciones.CancelacionOne }
  InvRegistry.RegisterMethodInfo(TypeInfo(CancelaRetenciones), 'CancelacionOne', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(CancelaRetenciones), 'CancelacionOne', 'request_cancelone', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(CancelaRetenciones), 'CancelacionOne', 'return', '',
                                '', IS_UNQL);
  { CancelaRetenciones.consultaseguimiento }
  InvRegistry.RegisterMethodInfo(TypeInfo(CancelaRetenciones), 'consultaseguimiento', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(CancelaRetenciones), 'consultaseguimiento', 'request_seguimiento', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(CancelaRetenciones), 'consultaseguimiento', 'return', '',
                                '', IS_UNQL);
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_folios), 'http://cancelacion.forcogsa.com/', 'Array_Of_folios');
  RemClassRegistry.RegisterXSClass(folios, 'http://cancelacion.forcogsa.com/', 'folios');
  RemClassRegistry.RegisterXSClass(requestAcuseCancel, 'http://cancelacion.forcogsa.com/', 'requestAcuseCancel');
  RemClassRegistry.RegisterXSClass(responseCancel, 'http://cancelacion.forcogsa.com/', 'responseCancel');
  RemClassRegistry.RegisterXSClass(responseSeguimiento, 'http://cancelacion.forcogsa.com/', 'responseSeguimiento');
  RemClassRegistry.RegisterXSClass(requestCancelMasive, 'http://cancelacion.forcogsa.com/', 'requestCancelMasive');
  RemClassRegistry.RegisterXSClass(requestCancelOne, 'http://cancelacion.forcogsa.com/', 'requestCancelOne');

end.