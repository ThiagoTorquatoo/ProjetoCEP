object FormularioConsulta: TFormularioConsulta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta'
  ClientHeight = 610
  ClientWidth = 892
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object pnlBotoes: TPanel
    Left = 0
    Top = 569
    Width = 892
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnFechar: TButton
      Left = 393
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 892
    Height = 65
    Align = alTop
    TabOrder = 1
    object lblCEP: TLabel
      Left = 24
      Top = 10
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object edtBuscaCEP: TEdit
      Left = 24
      Top = 31
      Width = 121
      Height = 21
      MaxLength = 8
      TabOrder = 0
      OnChange = edtBuscaCEPChange
    end
    object btnBuscar: TButton
      Left = 158
      Top = 31
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 1
      OnClick = btnBuscarClick
    end
  end
  object grdDados: TDBGrid
    Left = 0
    Top = 65
    Width = 892
    Height = 504
    Align = alClient
    ReadOnly = True
    TabOrder = 2
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
