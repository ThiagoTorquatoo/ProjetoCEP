unit Funcoes.MontaURL;

interface

uses
  System.SysUtils, Funcoes.Enumerados;

type

  IFormataURL = Interface(IInterface)
    ['{4D1CD99F-0C4A-4DD0-B536-2843FFF956BF}']
    function CEP(const AValue: string): IFormataURL; overload;
    function CEP: string; overload;
    function UF(const AValue: string): IFormataURL; overload;
    function UF: string; overload;
    function Municipio(const AValue: string): IFormataURL; overload;
    function Municipio: string; overload;
    function Logradouro(const AValue: string): IFormataURL; overload;
    function Logradouro: string; overload;
    function MetodoBusca(const AValue: TMetodoBusca): IFormataURL; overload;
    function MetodoBusca: TMetodoBusca; overload;
    function RetornaURL: string;
  End;

  TFormataURL = class(TInterfacedObject, IFormataURL)
  strict private
  var
    FCEP: string;
    FUF: string;
    FMunicipio: string;
    FLogradouro: string;
    FMetodoBusca: TMetodoBusca;
  public
    class function New: IFormataURL;
    function CEP(const AValue: string): IFormataURL; overload;
    function CEP: string; overload;
    function UF(const AValue: string): IFormataURL; overload;
    function UF: string; overload;
    function Municipio(const AValue: string): IFormataURL; overload;
    function Municipio: string; overload;
    function Logradouro(const AValue: string): IFormataURL; overload;
    function Logradouro: string; overload;
    function MetodoBusca(const AValue: TMetodoBusca): IFormataURL; overload;
    function MetodoBusca: TMetodoBusca; overload;
    function RetornaURL: string;
  End;

implementation

{ TFormataURL }

function TFormataURL.CEP(const AValue: string): IFormataURL;
begin
  Result := Self;
  FCEP := AValue;
end;

function TFormataURL.CEP: string;
begin
  Result := FCEP;
end;

function TFormataURL.Logradouro: string;
begin
  Result := FLogradouro;
end;

function TFormataURL.Logradouro(const AValue: string): IFormataURL;
begin
  Result := Self;
  FLogradouro := AValue;
end;

function TFormataURL.MetodoBusca: TMetodoBusca;
begin
  Result := FMetodoBusca;
end;

function TFormataURL.MetodoBusca(const AValue: TMetodoBusca): IFormataURL;
begin
  Result := Self;
  FMetodoBusca := AValue;
end;

function TFormataURL.Municipio(const AValue: string): IFormataURL;
begin
  Result := Self;
  FMunicipio := AValue;
end;

function TFormataURL.Municipio: string;
begin
  Result := FMunicipio;
end;

class function TFormataURL.New: IFormataURL;
begin
  Result := Self.Create;
end;

function TFormataURL.RetornaURL: string;
begin
  Result := 'viacep.com.br/ws/';
  if (CEP <> EmptyStr) then
  begin
    Result := Result + CEP + '/';
  end else
  begin
    Result := Result + UF + '/' + Municipio + '/' + Logradouro + '/';
  end;

  if (MetodoBusca = mbJSON) then
  begin
    Result := Result + 'json/';
  end else
  begin
    Result := Result + 'xml/';
  end;
end;

function TFormataURL.UF(const AValue: string): IFormataURL;
begin
  Result := Self;
  FUF := AValue;
end;

function TFormataURL.UF: string;
begin
  Result := FUF;
end;

end.
