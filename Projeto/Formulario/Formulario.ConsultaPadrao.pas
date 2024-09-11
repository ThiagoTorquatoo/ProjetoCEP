unit Formulario.ConsultaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, DataModulo.Conexao, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, REST.Types,
  System.JSON, Funcoes.Log, Funcoes.Gerais, Xml.XMLDoc, Xml.XMLIntf, REST.Client, System.Generics.Collections,
  Funcoes.Enumerados, Funcoes.MontaURL;

type
  TFormularioConsultaPadrao = class(TForm)
    pnlBotoes: TPanel;
    btnFechar: TButton;
    btnOk: TButton;
    pnlCorpo: TPanel;
    pnlTopo: TPanel;
    edtBuscaCEP: TEdit;
    lblCEP: TLabel;
    lblUF: TLabel;
    cbxUF: TComboBox;
    lblCidade: TLabel;
    edtCidade: TEdit;
    lblLogradouro: TLabel;
    edtLogradouro: TEdit;
    btnBuscar: TButton;
    rdbMetodo: TRadioGroup;
    grdDados: TDBGrid;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtBuscaCEPExit(Sender: TObject);
    procedure edtCidadeExit(Sender: TObject);
    procedure edtLogradouroExit(Sender: TObject);
    procedure edtBuscaCEPChange(Sender: TObject);
    procedure edtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtLogradouroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FDatamoduloConexao: TDataModuloConexao;
    function GetDataModuloConexao: TDataModuloConexao;
    procedure BuscarCEP(AMetodoBusca: TMetodoBusca);
    function VerificarCEP(AValor: string): Boolean;
    function VerificarModoBusca: TMetodoBusca;
    function ControlarTipoPesquisa: TTipoPesquisa;
    function ExecutarBuscaWS(AMetodoBusca: TMetodoBusca; ATipoPesquisa: TTipoPesquisa):Boolean;
    procedure TratarRetornoJSON(ARetorno: TRESTResponse; ATipoPesquisa: TTipoPesquisa);
    procedure TratarRetornoXML(ARetorno: string; ATipoPesquisa: TTipoPesquisa);
    procedure PopularDataSet(const AQuery: TFDQuery; const AJson: TJsonobject); overload;
    procedure PopularDataSet(const AQuery: TFDQuery; const AXML: IXMLNode); overload;
  protected
    property DataModuloConexao: TDataModuloConexao read GetDataModuloConexao;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFormularioConsultaPadrao.btnBuscarClick(Sender: TObject);
begin
  BuscarCEP(VerificarModoBusca);
end;

procedure TFormularioConsultaPadrao.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormularioConsultaPadrao.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormularioConsultaPadrao.BuscarCEP(AMetodoBusca: TMetodoBusca);
var
  lMensagem: TForm;
  lBotaoAtualizar, lBotaoVisualizar: TButton;
begin
  if ControlarTipoPesquisa = Endereco then
  begin
    if (edtCidade.Text = '') or (edtLogradouro.Text = '') or (cbxUF.ItemIndex = -1) then
    begin
      TUtilidades.New
                  .Mensagem('Para efetuar a busca por ENDEREÇO COMPLETO deverá ser preenchido "Estado/Cidade/Endereço"');
      Exit;
    end else
    if (TUtilidades.New
                    .VerificarCaracteres(edtCidade) < 3) or
       (TUtilidades.New
                    .VerificarCaracteres(edtLogradouro) < 3)  then
    begin
      TUtilidades.New
                  .Mensagem('O campo informado está incorreto. Por favor, ' +
                            'verifique e corrija os dados antes de continuar.');
      Exit;
    end;
  end else
  begin
    if TUtilidades.New
                    .VerificarCaracteres(edtBuscaCEP) < 8 then
    begin
      TUtilidades.New
                  .Mensagem('É necessário informar o CEP corretamente para realizar a consulta.');
      Exit;
    end;
    if edtBuscaCEP.Text = EmptyStr then
    begin
      TUtilidades.New
                  .Mensagem('É necessário informar o CEP para realizar a consulta.');
      edtBuscaCEP.SetFocus;
      Exit;
    end;
  end;
  if VerificarCEP(edtBuscaCEP.Text) then
  begin
    lMensagem := CreateMessageDialog('CEP encontrado na base!' + Char(13) +
      'Deseja visualizar o endereço encontrado na base de dados ' + Char(13) +
      'ou realizar uma nova consulta para atualizar as informações do endereço existente?',
    mtConfirmation, [mbYes, mbNo]);
    try
      lBotaoAtualizar := lMensagem.FindComponent('Yes') as TButton;
      lBotaoAtualizar.Caption := 'Visualizar';
      lBotaoVisualizar := lMensagem.FindComponent('No') as TButton;
      lBotaoVisualizar.Caption := 'Atualizar';
      if lMensagem.ShowModal = mrNo then
      begin
        ExecutarBuscaWS(AMetodoBusca, ControlarTipoPesquisa);
      end;
    finally
      lMensagem.Free;
    end;
  end else
  begin
    ExecutarBuscaWS(AMetodoBusca, ControlarTipoPesquisa);
  end;
end;

procedure TFormularioConsultaPadrao.edtBuscaCEPChange(Sender: TObject);
begin
  edtBuscaCEP.Text := TUtilidades.New
                                   .ApenasNumeros(edtBuscaCEP.Text);
end;

procedure TFormularioConsultaPadrao.edtBuscaCEPExit(Sender: TObject);
begin
  ControlarTipoPesquisa;
end;

procedure TFormularioConsultaPadrao.edtCidadeExit(Sender: TObject);
begin
  ControlarTipoPesquisa;
end;

procedure TFormularioConsultaPadrao.edtCidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['a'..'z', 'A'..'Z', ' ', #8]) then
  begin
    Key := #0;
  end;
end;

procedure TFormularioConsultaPadrao.edtLogradouroExit(Sender: TObject);
begin
  ControlarTipoPesquisa;
end;

procedure TFormularioConsultaPadrao.edtLogradouroKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['a'..'z', 'A'..'Z', ' ', #8]) then
  begin
    Key := #0;
  end;
end;

function TFormularioConsultaPadrao.ExecutarBuscaWS(AMetodoBusca: TMetodoBusca; ATipoPesquisa: TTipoPesquisa): Boolean;
var
  lUrl: string;
begin
  Result := False;

  lUrl := TFormataURL.New
                      .CEP(edtBuscaCEP.Text)
                      .UF(cbxUF.Text)
                      .Municipio(edtCidade.Text)
                      .Logradouro(edtLogradouro.Text)
                      .MetodoBusca(AMetodoBusca)
                       .RetornaURL;

  try
    DataModuloConexao.RESTClient.BaseURL := lUrl;
    DataModuloConexao.RESTRequest.ClearBody;
    DataModuloConexao.RESTRequest.Params.Clear;
    DataModuloConexao.RESTRequest.Method := TRESTRequestMethod.rmGet;
    DataModuloConexao.RESTRequest.Execute;

    if (DataModuloConexao.RESTResponse.StatusCode = 200) then
    begin
      if AMetodoBusca = mbJSON then
      begin
         TratarRetornoJSON(DataModuloConexao.RESTResponse, ATipoPesquisa);
      end else
      begin
        TratarRetornoXML(DataModuloConexao.RESTResponse.Content, ATipoPesquisa);
      end;
    end;
  except
    on E: Exception do
    begin
      TLog.New
           .RegistrarLog('TFormularioConsultaPadrao',
                         'ExecutarBuscaWS - ERRO AO CONSULTAR O CEP',
                         E.Message);
    end;
  end;
end;

procedure TFormularioConsultaPadrao.FormCreate(Sender: TObject);
begin
  FDatamoduloConexao := TDataModuloConexao.Create(Self);
end;

procedure TFormularioConsultaPadrao.FormShow(Sender: TObject);
begin
  grdDados.DataSource := DataModuloConexao.dsConsulta;
end;

function TFormularioConsultaPadrao.GetDataModuloConexao: TDataModuloConexao;
begin
  if not(Assigned(FDataModuloConexao)) then
  begin
    FDataModuloConexao := TDataModuloConexao.Create(Self);
  end;
  Result := FDataModuloConexao;
end;

procedure TFormularioConsultaPadrao.PopularDataSet(const AQuery: TFDQuery;
  const AXML: IXMLNode);
var
  lCEP: String;
begin
  lCEP := StringReplace(AXML.ChildNodes['cep'].Text, '-', '', [rfReplaceAll]);
  if AQuery.Locate('CEP', lCEP, []) then
  begin
    AQuery.Edit;
  end else
  begin
    AQuery.Insert;
  end;

  AQuery.FieldByName('CEP').AsString := lCEP;
  AQuery.FieldByName('LOGRADOURO').AsString :=
    UpperCase(TUtilidades.New
                          .SubstituirAcentuacao(AXML.ChildNodes['logradouro'].Text));
  AQuery.FieldByName('COMPLEMENTO').AsString :=
    UpperCase(TUtilidades.New
                          .SubstituirAcentuacao(AXML.ChildNodes['complemento'].Text));
  AQuery.FieldByName('BAIRRO').AsString :=
    UpperCase(TUtilidades.New
                           .SubstituirAcentuacao(AXML.ChildNodes['bairro'].Text));
  AQuery.FieldByName('LOCALIDADE').AsString :=
    UpperCase(TUtilidades.New
                          .SubstituirAcentuacao(AXML.ChildNodes['localidade'].Text));
  AQuery.FieldByName('UF').AsString := UpperCase(AXML.ChildNodes['uf'].Text);
  AQuery.Post;
end;

procedure TFormularioConsultaPadrao.PopularDataSet(const AQuery: TFDQuery; const AJson: TJsonobject);
var
  lCEP: String;
begin
  lCEP := StringReplace(AJson.GetValue('cep').Value, '-', '', [rfReplaceAll]);
  if AQuery.Locate('CEP', lCEP, []) then
  begin
    AQuery.Edit;
  end else
  begin
    AQuery.Insert;
  end;

  AQuery.FieldByName('CEP').AsString := lCEP;
  AQuery.FieldByName('LOGRADOURO').AsString :=
    UpperCase(TUtilidades.New
                          .SubstituirAcentuacao(AJson.GetValue('logradouro').Value));
  AQuery.FieldByName('COMPLEMENTO').AsString :=
    UpperCase(TUtilidades.New
                          .SubstituirAcentuacao(AJson.GetValue('complemento').Value));
  AQuery.FieldByName('BAIRRO').AsString :=
    UpperCase(TUtilidades.New
                          .SubstituirAcentuacao(AJson.GetValue('bairro').Value));
  AQuery.FieldByName('LOCALIDADE').AsString :=
    UpperCase(TUtilidades.New
                          .SubstituirAcentuacao(AJson.GetValue('localidade').Value));
  AQuery.FieldByName('UF').AsString := UpperCase(AJson.GetValue('uf').Value);
  AQuery.Post;
end;

procedure TFormularioConsultaPadrao.TratarRetornoJSON(ARetorno: TRESTResponse; ATipoPesquisa: TTipoPesquisa);
var
  lJson: TJsonobject;
  lListaJson: TJsonArray;
  lContador: integer;
  lTamanhoListaJson: integer;
begin
  try
    if ATipoPesquisa = CEP then
    begin
      if Assigned(ARetorno.JSONValue) then
      begin
        lJson := ARetorno.JSONValue as TJSONObject;
        if Assigned(lJson.GetValue('erro')) then
        begin
          TUtilidades.New
                      .Mensagem('O CEP informado não foi encontrado.');
        end else
        begin
          PopularDataSet(DataModuloConexao.fdConsulta, lJson);
        end;
      end;
    end else
    begin
      if Assigned(DataModuloConexao.RESTResponse.JSONValue) then
      begin
        lListaJson := TJSONObject.ParseJSONValue(DataModuloConexao.RESTResponse.JSONValue.ToJSON) as TJSONArray;
        try
          lTamanhoListaJson := lListaJson.Count;
          if lTamanhoListaJson > 0 then
          begin
            for lContador := 0 to lTamanhoListaJson - 1 do
            begin
              lJson := lListaJson.Items[lContador] as TJSONObject;
              if Assigned(lJson.GetValue('erro')) then
              begin
                TUtilidades.New
                            .Mensagem('O Endereço completo não foi encontrado.');
              end else
              begin
                PopularDataSet(DataModuloConexao.fdConsulta, lJson);
              end;
            end;
          end else
          begin
            TUtilidades.New
                        .Mensagem('O Endereço completo informado não foi encontrado.');
          end;
        finally
          lListaJson.Free;
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      TLog.New
           .RegistrarLog('TFormularioConsultaPadrao',
                         'TratarRetornoJSON - ERRO NO RETORNO JSON',
                         E.Message);
    end;
  end;
end;

procedure TFormularioConsultaPadrao.TratarRetornoXML(ARetorno: string; ATipoPesquisa: TTipoPesquisa);
var
  lXml: IXMLDocument;
  lRootNode, lEnderecosNode, lEnderecoNode: IXMLNode;
  lContentStream: TStringStream;
begin
  try
    if ARetorno <> '' then
    begin
      lContentStream := TStringStream.Create(ARetorno, TEncoding.UTF8);
      try
        lXml := TXMLDocument.Create(nil);
        lXml.LoadFromStream(lContentStream);
        lXml.Active := True;
        lRootNode := lXml.DocumentElement;
        if ATipoPesquisa = CEP then
        begin
          if lRootNode.ChildNodes.FindNode('erro') <> nil then
          begin
            TUtilidades.New
                        .Mensagem('O CEP informado não foi encontrado.');
          end else
          begin
            PopularDataSet(DataModuloConexao.fdConsulta, lRootNode);
          end;
        end else
        begin
          lEnderecosNode := lRootNode.ChildNodes.FindNode('enderecos');
          if Assigned(lEnderecosNode) then
          begin
            lEnderecoNode := lEnderecosNode.ChildNodes.FindNode('endereco');
            if Assigned(lEnderecoNode) then
            begin
              PopularDataSet(DataModuloConexao.fdConsulta, lEnderecoNode);
            end else
            begin
              TUtilidades.New
                           .Mensagem('O Endereço completo informado não foi encontrado.');
            end;
          end;
        end;
      finally
        lContentStream.Free;
      end;
    end;
  except
    on E: Exception do
    begin
      TLog.New
           .RegistrarLog('TFormularioConsultaPadrao',
                         'TratarRetornoXML - ERRO NO RETORNO XML',
                         E.Message);
    end;
  end;
end;

function TFormularioConsultaPadrao.VerificarCEP(AValor: string): Boolean;
var
  lSQLConsulta: string;
begin
  Result := False;
  try
    if ControlarTipoPesquisa = CEP then
    begin
      DataModuloConexao.fdConsulta.Close;
      DataModuloConexao.fdConsulta.SQL.Text := 'SELECT * FROM CEP WHERE CEP = ' + QuotedStr(AValor);
      DataModuloConexao.fdConsulta.Open;
    end else
    begin
      lSQLConsulta := 'SELECT * FROM CEP WHERE UF = ' + QuotedStr(cbxUF.Text) +
        ' AND LOCALIDADE LIKE ' + QuotedStr(TUtilidades.New
                                                        .SubstituirAcentuacao(edtCidade.Text)) +
        ' AND LOGRADOURO LIKE ' + QuotedStr(TUtilidades.New
                                                        .SubstituirAcentuacao(edtLogradouro.Text) + '%');
      DataModuloConexao.fdConsulta.Close;
      DataModuloConexao.fdConsulta.SQL.Text := lSQLConsulta;
      DataModuloConexao.fdConsulta.Open;
    end;
    Result := (DataModuloConexao.fdConsulta.RecordCount > 0);
  except
    on E: Exception do
    begin
      TLog.New
           .RegistrarLog('TFormularioConsultaPadrao',
                         'VerificarCEP - ERRO AO BUSCAR O CEP NA BASE',
                         E.Message);
    end;
  end;
end;

function TFormularioConsultaPadrao.VerificarModoBusca: TMetodoBusca;
begin
  if rdbMetodo.ItemIndex = 0 then
  begin
    Result := mbJSON;
  end else
  begin
    Result := mbXML;
  end;
end;

function TFormularioConsultaPadrao.ControlarTipoPesquisa: TTipoPesquisa;
begin
  edtBuscaCEP.ReadOnly := False;
  if edtBuscaCEP.Text <> '' then
  begin
    Result := CEP;
    cbxUF.Enabled := False;
    cbxUF.ItemIndex := -1;
    edtCidade.ReadOnly := True;
    edtLogradouro.ReadOnly := True;
    edtCidade.Text := EmptyStr;
    edtLogradouro.Text := EmptyStr;
  end else
  if (edtCidade.Text <> '') or (edtLogradouro.Text <> '') then
  begin
    Result := Endereco;
    edtBuscaCEP.ReadOnly := True;
    edtBuscaCEP.Text := EmptyStr;
    edtCidade.ReadOnly := False;
    edtLogradouro.ReadOnly := False;
    cbxUF.Enabled := True;
  end else
  begin
    Result := Nenhum;
    edtBuscaCEP.ReadOnly := False;
    edtCidade.ReadOnly := False;
    edtLogradouro.ReadOnly := False;
    cbxUF.Enabled := True;
  end;
end;

initialization
  System.Classes.RegisterClass(TFormularioConsultaPadrao);

finalization
  System.Classes.UnRegisterClass(TFormularioConsultaPadrao);

end.
