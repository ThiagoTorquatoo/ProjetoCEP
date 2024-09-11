object FormularioConsultaPadrao: TFormularioConsultaPadrao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta CEP'
  ClientHeight = 611
  ClientWidth = 896
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBotoes: TPanel
    Left = 0
    Top = 570
    Width = 896
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnFechar: TButton
      Left = 417
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
    object btnOk: TButton
      Left = 336
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 1
      OnClick = btnOkClick
    end
  end
  object pnlCorpo: TPanel
    Left = 0
    Top = 0
    Width = 896
    Height = 570
    Align = alClient
    TabOrder = 1
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 894
      Height = 175
      Align = alClient
      TabOrder = 0
      object lblCEP: TLabel
        Left = 16
        Top = 24
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object lblUF: TLabel
        Left = 16
        Top = 72
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object lblCidade: TLabel
        Left = 80
        Top = 72
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object lblLogradouro: TLabel
        Left = 335
        Top = 72
        Width = 55
        Height = 13
        Caption = 'Logradouro'
      end
      object edtBuscaCEP: TEdit
        Left = 16
        Top = 45
        Width = 121
        Height = 21
        MaxLength = 8
        TabOrder = 0
        OnChange = edtBuscaCEPChange
        OnExit = edtBuscaCEPExit
      end
      object cbxUF: TComboBox
        Left = 16
        Top = 91
        Width = 49
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        TabOrder = 1
        Items.Strings = (
          'AC'
          'AL'
          'AP'
          'AM'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MT'
          'MS'
          'MG'
          'PA'
          'PB'
          'PR'
          'PE'
          'PI'
          'RJ'
          'RN'
          'RS'
          'RO'
          'RR'
          'SC'
          'SP'
          'SE'
          'TO')
      end
      object edtCidade: TEdit
        Left = 80
        Top = 91
        Width = 249
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
        OnExit = edtCidadeExit
        OnKeyPress = edtCidadeKeyPress
      end
      object edtLogradouro: TEdit
        Left = 335
        Top = 91
        Width = 522
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 3
        OnExit = edtLogradouroExit
        OnKeyPress = edtLogradouroKeyPress
      end
      object btnBuscar: TButton
        Left = 238
        Top = 144
        Width = 75
        Height = 25
        Caption = 'Buscar'
        TabOrder = 5
        OnClick = btnBuscarClick
      end
      object rdbMetodo: TRadioGroup
        Left = 16
        Top = 126
        Width = 193
        Height = 43
        Caption = '  M'#233'todo de Busca  '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'JSON'
          'XML')
        TabOrder = 4
      end
    end
    object grdDados: TDBGrid
      Left = 1
      Top = 176
      Width = 894
      Height = 393
      Align = alBottom
      DataSource = DataModuloConexao.dsConsulta
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CEP'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOGRADOURO'
          Title.Caption = 'Logradouro'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPLEMENTO'
          Title.Caption = 'Complemento'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BAIRRO'
          Title.Caption = 'Bairro'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOCALIDADE'
          Title.Caption = 'Localidade'
          Width = 200
          Visible = True
        end>
    end
  end
end
