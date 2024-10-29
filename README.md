
# Timbrado y cancelación de retencion DELPHI

Proyecto de timbrado y cancelaciones de retenciones en DELPHI


## Requerimientos

* Delphi 12 Community Edition https://www.embarcadero.com/products/delphi/starter
* CSD (.CER y .KEY)
* Contraseña de certificados
* Archivo XML a cancelar

En el archivo ClienteRetenciones.pas se encuentra el código con el cual se procesara el timbrado de los XML y las cancelaciones, mientras que en el archivo ClienteRetenciones.dfm se encuentra parte del diseño de la interfaz del usuario.

```Delphi
function GetMotivoCancelacion(const idx: integer) : string;
```
Es la función que permite obtener el motivo de cancelación que permite el SAT.


```Delphi
function validateInputs : boolean;
```
Valida los campos necesarios (carga de xml,archivo CER,archivo key y contraseña).

```Delphi
function updateFecha(const fileName : string) : IXMLDocument;
```
Es la función que va a actualizar la fecha del documento por la fecha actual del sistema.

```Delphi
function getRfcUUID(const xmlPath : string; const dataAttr : string) : string;
```
Permite obtener el UUID del xml seleccionado 

##Timbrado del documento retenciones
```Delphi
function timbrarRetencion(const xmlPath: string; const cerPath : string;
```
función que donde se envia el xml seleccionado al webservice de timbrado de retenciones de Formas Digitales.

##cancelación del documento de retenciones
```Delphi
function cancelaRetencion(const xmlPath: string; cerPath :string; keyPath : string;
```
función que permite el envio del xml a cancelar al webservice de cancelaciones de rentenciones de Formas Digitales.


