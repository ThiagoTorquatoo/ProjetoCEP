unit Funcoes.Log;

interface

type
  ILog = interface(IInterface)
    ['{3C19BC94-F359-4BE7-99A2-759F214E821C}']
    procedure RegistrarLog(const ATexto: string; const AMetodo: string; const AExcecao: string);
  end;

  TLog = class(TInterfacedObject, ILog)
  strict private
  var
    FArquivoLog: TextFile;
  public
    class function New: ILog;
    constructor Create;
    procedure RegistrarLog(const ATexto: string; const AMetodo: string; const AExcecao: string);
  end;

implementation

uses
  Forms, SysUtils;

{ TLog }

constructor TLog.Create;
var
  lDiretorioAplicacao: string;
begin
  lDiretorioAplicacao := ExtractFilePath(Application.ExeName) + 'Logs\' ;

  if not DirectoryExists(lDiretorioAplicacao) then
  begin
    ForceDirectories(lDiretorioAplicacao);
  end;

  AssignFile(FArquivoLog, lDiretorioAplicacao + 'LogProjetoCEP.txt');
  if not FileExists(lDiretorioAplicacao + 'LogProjetoCEP.txt') then
  begin
    Rewrite(FArquivoLog);
    CloseFile(FArquivoLog);
  end;
end;

class function TLog.New: ILog;
begin
  Result := Self.Create;
end;

procedure TLog.RegistrarLog(const ATexto: string; const AMetodo: string; const AExcecao: string);
var
  lDataHora: string;
begin
  Append(FArquivoLog);
  lDataHora := FormatDateTime('[dd/mm/yyyy hh:nn:ss] ', Now);
  WriteLn(FArquivoLog, 'Data/Hora...........: ' + lDataHora);
  WriteLn(FArquivoLog, 'Formulário..........: ' + ATexto);
  WriteLn(FArquivoLog, 'Metodo..............: ' + AMetodo);
  WriteLn(FArquivoLog, 'Erro................: ' + AExcecao);
  WriteLn(FArquivoLog, StringOfChar('-', 70));

  CloseFile(FArquivoLog);
end;

end.
