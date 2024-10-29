object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cliente Retenciones 2.0'
  ClientHeight = 735
  ClientWidth = 508
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object actionLbl: TLabel
    Left = 16
    Top = 75
    Width = 37
    Height = 15
    Caption = 'Acci'#243'n'
  end
  object xmlLbl: TLabel
    Left = 16
    Top = 144
    Width = 68
    Height = 15
    Caption = 'Archivo XML'
    WordWrap = True
  end
  object cerLbl: TLabel
    Left = 16
    Top = 208
    Width = 140
    Height = 15
    Caption = 'Archivo llave p'#250'blica (.cer)'
  end
  object main_header: TLabel
    Left = 16
    Top = 16
    Width = 338
    Height = 21
    Alignment = taCenter
    Caption = ':: Timbrado / Cancelaci'#243'n :: Retenciones v2.0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object keyLbl: TLabel
    Left = 16
    Top = 272
    Width = 142
    Height = 15
    Caption = 'Archivo llave privada (.key)'
  end
  object pwdLbl: TLabel
    Left = 16
    Top = 336
    Width = 145
    Height = 15
    Caption = 'Contrase'#241'a de llave privada'
  end
  object motivoLbl: TLabel
    Left = 16
    Top = 400
    Width = 104
    Height = 15
    Caption = 'Motivo cancelaci'#243'n'
  end
  object folioSustLbl: TLabel
    Left = 16
    Top = 464
    Width = 216
    Height = 15
    Caption = 'Folio fiscal que sustituye al comprobante'
  end
  object timbrarBtn: TButton
    Left = 350
    Top = 693
    Width = 139
    Height = 25
    Caption = 'Timbrar retencion'
    TabOrder = 3
    OnClick = timbrarBtnClick
  end
  object responseMemo: TMemo
    Left = 16
    Top = 536
    Width = 473
    Height = 151
    TabOrder = 2
  end
  object actionSelect: TComboBox
    Left = 16
    Top = 96
    Width = 185
    Height = 23
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 0
    Text = 'Timbrado'
    OnChange = actionSelectChange
    Items.Strings = (
      'Timbrado'
      'Cancelaci'#243'n')
  end
  object sellarChkBox: TCheckBox
    Left = 221
    Top = 99
    Width = 113
    Height = 17
    Caption = 'Sellar documento'
    TabOrder = 1
    Visible = False
  end
  object xmlTxt: TEdit
    Left = 16
    Top = 165
    Width = 318
    Height = 23
    ReadOnly = True
    TabOrder = 4
  end
  object xmlBtn: TButton
    Left = 350
    Top = 164
    Width = 139
    Height = 25
    Caption = 'Seleccionar xml'
    TabOrder = 5
    OnClick = xmlBtnClick
  end
  object cerTxt: TEdit
    Left = 16
    Top = 229
    Width = 318
    Height = 23
    ReadOnly = True
    TabOrder = 6
  end
  object cerBtn: TButton
    Left = 350
    Top = 228
    Width = 139
    Height = 25
    Caption = 'Seleccionar cer'
    TabOrder = 7
    WordWrap = True
    OnClick = cerBtnClick
  end
  object keyTxt: TEdit
    Left = 16
    Top = 293
    Width = 318
    Height = 23
    ReadOnly = True
    TabOrder = 8
  end
  object keyBtn: TButton
    Left = 350
    Top = 292
    Width = 139
    Height = 25
    Caption = 'Seleccionar key'
    TabOrder = 9
    OnClick = keyBtnClick
  end
  object pwdTxt: TEdit
    Left = 16
    Top = 357
    Width = 233
    Height = 23
    PasswordChar = '*'
    TabOrder = 10
  end
  object showPwdBtn: TButton
    Left = 259
    Top = 356
    Width = 75
    Height = 25
    Caption = 'Mostrar'
    TabOrder = 11
    OnClick = showPwdBtnClick
  end
  object validatePwdBtn: TButton
    Left = 350
    Top = 356
    Width = 139
    Height = 25
    Caption = 'Validar contrase'#241'a'
    TabOrder = 12
    OnClick = validatePwdBtnClick
  end
  object motivoSelect: TComboBox
    Left = 16
    Top = 421
    Width = 318
    Height = 23
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 13
    Text = '01 - Comprobante emitido con errores con relaci'#243'n'
    OnChange = motivoSelectChange
    Items.Strings = (
      '01 - Comprobante emitido con errores con relaci'#243'n'
      '02 - Comprobante emitido con errores sin relaci'#243'n'
      '03 - No se llev'#243' a cabo la operaci'#243'n'
      '04 - Operaci'#243'n nominativa relacionada en una factura global')
  end
  object folioSustitucionTxt: TEdit
    Left = 16
    Top = 485
    Width = 318
    Height = 23
    MaxLength = 36
    TabOrder = 14
  end
end
