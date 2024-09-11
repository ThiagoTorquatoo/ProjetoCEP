unit DataModulo.Conexao;

interface

uses
  Winapi.Windows, Vcl.Forms, System.SysUtils, System.Classes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, Data.DB,
  FireDAC.Comp.Client, System.IniFiles, Funcoes.Log, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  IPPeerClient, FireDAC.Comp.DataSet, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, IdTCPConnection,
  IdTCPClient, IdHTTP, IdBaseComponent, IdComponent, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, REST.Types;

type
  TDBConfINI = class(TComponent)
	private
    fLocalLIB: string;
    fDriverID: string;
		fHostName: string;
		fDataBase: string;
		fPorta: string;
    fPaswd: string;
    fUserName: string;
	public
		constructor Create(AOwner: TComponent); override;
		procedure LeArquivo;

    property LocalLIB: String read fLocalLIB;
    property DriverID: String read fDriverID;
	  property HostNameWhats: String read fHostName;
		property DataBaseWhats: String read fDataBase;
		property PortaWhatsApp: String read fPorta;
		property UserNameWhats: String read fUserName;
    property PaswdWhats: String read fPaswd;
	end;

  TDataModuloConexao = class(TDataModule)
    fdConexao: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    idSSL: TIdSSLIOHandlerSocketOpenSSL;
    IdHTTP: TIdHTTP;
    RESTClient: TRESTClient;
    RESTResponse: TRESTResponse;
    RESTRequest: TRESTRequest;
    dsConsulta: TDataSource;
    fdConsulta: TFDQuery;
    fdConsultaCEP: TStringField;
    fdConsultaLOGRADOURO: TStringField;
    fdConsultaCOMPLEMENTO: TStringField;
    fdConsultaBAIRRO: TStringField;
    fdConsultaUF: TStringField;
    fdConsultaLOCALIDADE: TStringField;
    dsConsultaCEPs: TDataSource;
    fdConsultaCEPs: TFDQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    fDBConfINI: TDBConfINI;

    procedure CriarConexao;
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDBConfINI }

constructor TDBConfINI.Create(AOwner: TComponent);
begin
  inherited;
  LeArquivo;
end;

procedure TDBConfINI.LeArquivo;
var
	lExiste: Boolean;
	lCaminhoIni: String;
	lIni: TInifile;
	lValor: String;
  lPathRaiz: String;
begin
	lCaminhoIni := ExtractFilePath(Application.ExeName) + 'conexao.ini';
	lExiste := FileExists(lCaminhoIni);
  lPathRaiz := Copy(lCaminhoIni, 1, Pos('ProjetoCEP', lCaminhoIni) - 1);

	if not lExiste then
	begin
    raise Exception.Create('Não foi possível localizar o arquivo de ' +
                           'informações do banco de dados. ' +
                           'A aplicação será fechada.');
		Application.Terminate;
	end;

	lIni := TInifile.Create(lCaminhoIni);
	try
    lValor := lIni.ReadString('LOCALLIB', 'locallib', '');
    if (lValor <> '') then
			fLocalLIB := lPathRaiz + lValor;
    lValor := lIni.ReadString('DRIVERID', 'driverid', '');
		if (lValor <> '') then
			fDriverID := lValor;
    lValor := lIni.ReadString('HOSTNAME', 'hostname', '');
		if (lValor <> '') then
			fHostName := lValor;
    lValor := lIni.ReadString('DATABASE', 'database', '');
		if (lValor <> '') then
			fDataBase := lPathRaiz + lValor;
    lValor := lIni.ReadString('PORTA', 'porta', '');
		if (lValor <> '') then
			fPorta := lValor;
		lValor := lIni.ReadString('USUARIO', 'username', '');
		if (lValor <> '') then
			fUserName := lValor;
    lValor := lIni.ReadString('SENHA', 'password', '');
		if (lValor <> '') then
			fPaswd := lValor;
	finally
		lIni.Free;
	end;
end;

{ TDatamoduloConexao }
procedure TDataModuloConexao.CriarConexao;
begin
  try
    fDBConfINI := TDBConfINI.Create(Self);
    if (Assigned(fDBConfINI)) then
    begin
      FDPhysFBDriverLink.VendorLib := fDBConfINI.fLocalLIB;

      fdConexao.Connected := False;
      fdConexao.Params.Values['DriverID'] := fDBConfINI.fDriverID;
      fdConexao.Params.Values['Server'] := fDBConfINI.fHostName;
      fdConexao.Params.Values['Port'] := fDBConfINI.fPorta;
      fdConexao.Params.Values['Database'] := fDBConfINI.fDataBase;
      fdConexao.Params.Values['User_name'] := fDBConfINI.fUserName;
      fdConexao.Params.Values['Password'] := fDBConfINI.fPaswd;
      fdConexao.Connected := True;
    end;
  except
    on E: Exception do
    begin
      TLog.New
           .RegistrarLog('DataModuleCreate',
                         'CriarConexao - NÃO CONSEGUIU CONECTAR' +
                         ' NA BASE PELO MOTIVO ABAIXO:',
                         E.Message);
      Application.Terminate;
    end;
  end;
end;

procedure TDataModuloConexao.DataModuleCreate(Sender: TObject);
begin
  CriarConexao;
end;

end.
