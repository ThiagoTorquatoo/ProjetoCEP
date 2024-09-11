object DataModuloConexao: TDataModuloConexao
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 470
  Width = 546
  object fdConexao: TFDConnection
    Params.Strings = (
      'Database=D:\ProjetoIBPT\Banco\PROJETOIBPT.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=192.168.25.17'
      'Port=3050'
      'DriverID=FB')
    LoginPrompt = False
    Left = 16
    Top = 16
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 104
    Top = 16
  end
  object idSSL: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 224
    Top = 350
  end
  object IdHTTP: TIdHTTP
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = True
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = True
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 160
    Top = 350
  end
  object RESTClient: TRESTClient
    Params = <>
    HandleRedirects = True
    SynchronizedEvents = False
    Left = 426
    Top = 350
  end
  object RESTResponse: TRESTResponse
    Left = 362
    Top = 350
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 282
    Top = 350
  end
  object dsConsulta: TDataSource
    DataSet = fdConsulta
    Left = 40
    Top = 96
  end
  object fdConsulta: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'select * from cep where cep = :cep ')
    Left = 112
    Top = 96
    ParamData = <
      item
        Name = 'CEP'
        ParamType = ptInput
      end>
    object fdConsultaCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object fdConsultaLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 200
    end
    object fdConsultaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 200
    end
    object fdConsultaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object fdConsultaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object fdConsultaLOCALIDADE: TStringField
      FieldName = 'LOCALIDADE'
      Size = 200
    end
  end
  object dsConsultaCEPs: TDataSource
    DataSet = fdConsultaCEPs
    Left = 40
    Top = 168
  end
  object fdConsultaCEPs: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'select * from cep ')
    Left = 112
    Top = 168
    object StringField1: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object StringField2: TStringField
      FieldName = 'LOGRADOURO'
      Size = 200
    end
    object StringField3: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 200
    end
    object StringField4: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object StringField5: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object StringField6: TStringField
      FieldName = 'LOCALIDADE'
      Size = 200
    end
  end
end
