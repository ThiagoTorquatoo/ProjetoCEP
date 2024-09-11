unit Funcoes.Gerais;

interface

uses
  Windows, Vcl.Forms, System.Classes, SysUtils, Vcl.StdCtrls, System.RegularExpressions;

type
  IUtilidades = Interface(IInterface)
    ['{F3FD0D26-7B4B-4351-9C96-F293C30A3DA7}']
    function Formulario(const AValue: string): IUtilidades; overload;
    function Formulario: string; overload;
    function AbrirTela: IUtilidades;
    procedure Mensagem(AMensagem: PWideChar);
    function VerificarCaracteres(AEdit: TEdit):Integer;
    function SubstituirAcentuacao(const Texto: string): string;
    function ApenasNumeros(AValor: String): string;
  End;

  TUtilidades = class(TInterfacedObject, IUtilidades)
  strict private
  var
    FClasseFormulario: string;
    FFormulario: TForm;
  private
    procedure InstaciarFormulario;
  public
    class function New: IUtilidades;
    function Formulario(const AValue: string): IUtilidades; overload;
    function Formulario: string; overload;
    function AbrirTela: IUtilidades;
    procedure Mensagem(AMensagem: PWideChar);
    function VerificarCaracteres(AEdit: TEdit):Integer;
    function SubstituirAcentuacao(const Texto: string): string;
    function ApenasNumeros(AValor: string): string;
  end;

implementation

function TUtilidades.AbrirTela: IUtilidades;
begin
  if Assigned(FFormulario) then
  begin
    try
      FFormulario.ShowModal;
    finally
      FFormulario.Free;
    end;
  end;
end;

class function TUtilidades.New: IUtilidades;
begin
  Result := Self.Create;
end;

function TUtilidades.SubstituirAcentuacao(const Texto: string): string;
const
  lPossuiAcentuacao = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
  lNaoPossuiAcentucao = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
  lContador, lPosicao: Integer;
  lResultado: string;
begin
  lResultado := Texto;
  for lContador := 1 to Length(Texto) do
  begin
    lPosicao := Pos(Texto[lContador], lPossuiAcentuacao);
    if lPosicao <> 0 then
    begin
      lResultado[lContador] := lNaoPossuiAcentucao[lPosicao];
    end;
  end;
  Result := lResultado;
end;

function TUtilidades.VerificarCaracteres(AEdit: TEdit): Integer;
begin
  Result := Length(AEdit.Text);
end;

function TUtilidades.Formulario(const AValue: string): IUtilidades;
begin
  Result := Self;
  FClasseFormulario := AValue;
  InstaciarFormulario;
end;

function TUtilidades.ApenasNumeros(AValor: string): string;
var
	lContador: Integer;
begin
	Result := '';
	for lContador := 1 to Length(AValor) do
	begin
		if CharInSet(AValor[lContador] , ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', ',']) then
    begin
			Result := Result + AValor[lContador];
    end;
	end;
end;

function TUtilidades.Formulario: string;
begin
  Result := FClasseFormulario;
end;

procedure TUtilidades.InstaciarFormulario;
var
  lPersistentClass: TPersistentClass;
begin
  lPersistentClass := GetClass(FClasseFormulario);
  if Assigned(lPersistentClass) then
  begin
    FFormulario := TForm(TComponentClass(lPersistentClass).Create(nil));
  end;
end;

procedure TUtilidades.Mensagem(AMensagem: PWideChar);
begin
  Application.MessageBox(AMensagem,
    'Projeto CEP',
    MB_OK+MB_ICONINFORMATION);
end;

end.
