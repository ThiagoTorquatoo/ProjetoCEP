program ProjetoCEP;

uses
  Vcl.Forms,
  Formulario.Menu in 'Formulario\Formulario.Menu.pas' {TFormularioMenu},
  Funcoes.Gerais in 'Funcoes\Funcoes.Gerais.pas',
  Funcoes.Log in 'Funcoes\Funcoes.Log.pas',
  Datamodulo.Conexao in 'Conexao\Datamodulo.Conexao.pas' {DataModuloConexao: TDataModule},
  Formulario.ConsultaPadrao in 'Formulario\Formulario.ConsultaPadrao.pas' {FormularioConsultaPadrao},
  Funcoes.MontaURL in 'Funcoes\Funcoes.MontaURL.pas',
  Formulario.Consulta in 'Formulario\Formulario.Consulta.pas' {FormularioConsulta},
  Funcoes.Enumerados in 'Funcoes\Funcoes.Enumerados.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown := True;
  Application.CreateForm(TFormularioMenu, FormularioMenu);
  Application.Run;
end.
