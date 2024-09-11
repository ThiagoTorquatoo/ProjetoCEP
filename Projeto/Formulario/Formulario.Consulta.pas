unit Formulario.Consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Datamodulo.Conexao, Funcoes.Gerais;

type
  TFormularioConsulta = class(TForm)
    pnlBotoes: TPanel;
    btnFechar: TButton;
    pnlTopo: TPanel;
    lblCEP: TLabel;
    edtBuscaCEP: TEdit;
    btnBuscar: TButton;
    grdDados: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtBuscaCEPChange(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    FDatamoduloConexao: TDataModuloConexao;
    function GetDataModuloConexao: TDataModuloConexao;
    procedure AbrirDados;
  protected
    property DataModuloConexao: TDataModuloConexao read GetDataModuloConexao;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFormularioConsulta }

procedure TFormularioConsulta.AbrirDados;
begin
  DataModuloConexao.fdConsultaCEPs.Close;
  DataModuloConexao.fdConsultaCEPs.Open;
end;

procedure TFormularioConsulta.btnBuscarClick(Sender: TObject);
begin
  DataModuloConexao.fdConsultaCEPs.Locate('CEP', edtBuscaCEP.Text, []);
end;

procedure TFormularioConsulta.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormularioConsulta.edtBuscaCEPChange(Sender: TObject);
begin
  TUtilidades.New
              .ApenasNumeros(edtBuscaCEP.Text);
end;

procedure TFormularioConsulta.FormCreate(Sender: TObject);
begin
  FDatamoduloConexao := TDataModuloConexao.Create(Self);
end;

procedure TFormularioConsulta.FormShow(Sender: TObject);
begin
  AbrirDados;
  grdDados.DataSource := DataModuloConexao.dsConsultaCEPs;
end;

function TFormularioConsulta.GetDataModuloConexao: TDataModuloConexao;
begin
  if not(Assigned(FDataModuloConexao)) then
  begin
    FDataModuloConexao := TDataModuloConexao.Create(Self);
  end;
  Result := FDataModuloConexao;
end;

initialization
  System.Classes.RegisterClass(TFormularioConsulta);

finalization
  System.Classes.UnRegisterClass(TFormularioConsulta);

end.
