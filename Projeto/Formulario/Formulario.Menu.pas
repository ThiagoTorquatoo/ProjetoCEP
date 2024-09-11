unit Formulario.Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  DataModulo.Conexao, Funcoes.Gerais, Formulario.ConsultaPadrao, Formulario.Consulta;

type
  TFormularioMenu = class(TForm)
    pnlCorpo: TPanel;
    pnlHeader: TPanel;
    lblCepCadastrados: TLabel;
    lblConsulta: TLabel;
    shpBarra: TShape;
    imgImportacao: TImage;
    imgConsulta: TImage;
    procedure lblConsultaClick(Sender: TObject);
    procedure lblCepCadastradosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FDatamoduloConexao: TDataModuloConexao;

    procedure LocalizacaoBarra(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FormularioMenu: TFormularioMenu;

implementation

{$R *.dfm}

{ TFormularioMenu }

procedure TFormularioMenu.lblCepCadastradosClick(Sender: TObject);
begin
  LocalizacaoBarra(Sender);
  TUtilidades.New
              .Formulario('TFormularioConsulta')
              .AbrirTela;
end;

procedure TFormularioMenu.FormCreate(Sender: TObject);
begin
  FDatamoduloConexao := TDataModuloConexao.Create(Self);
end;

procedure TFormularioMenu.lblConsultaClick(Sender: TObject);
begin
  LocalizacaoBarra(Sender);
  TUtilidades.New
              .Formulario('TFormularioConsultaPadrao')
              .AbrirTela;
end;

procedure TFormularioMenu.LocalizacaoBarra(Sender: TObject);
begin
  shpBarra.Visible := True;
  TLabel(Sender).Transparent := True;
  shpBarra.Left := TLabel(Sender).Left + 37;
end;

initialization
  System.Classes.RegisterClass(TFormularioMenu);

finalization
  System.Classes.UnRegisterClass(TFormularioMenu);

end.
