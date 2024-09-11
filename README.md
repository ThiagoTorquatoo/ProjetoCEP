Projeto CEP - Thiago Torquato

URL GitHub: https://github.com/ThiagoTorquatoo/ProjetoCEP

1. Arquitetura Utilizada: Foi utilizado uma aplica��o cliente/servidor que consulta e armazena CEPs da api https://viacep.com.br/;
    ==> CONEX�O
    1.1. Datamodulo.Conexao.pas - datamodulo para cone��es e componentes.
    ==> FORMUL�RIO
    1.2. Formulario.Menu.pas - formul�rio de menu para a chamada das telas da aplica��o.
    1.3. Formulario.ConsultaPadrao.pas - formul�rio da pesquisa de cep, foi utilizado CLEAN CODE, DESIGN PATTERNS.
    1.4 - Formulario.Consulta.pas - formul�rio para a consulta de CEPs cadastrados.
    ==>FUN��ES
    1.5. Funcoes.Gerais.pas - unit que � utilizada para varias funciolidades na aplica��o, foi utilizado INTERFACE.
    1.6. Funcoes.Log.pas - unit utilizada para a gera��o e capturas de logs.
    1.7. Funcoes.MontaURL.pas - unit utilizada para a montagem da url da busca de CEP, foi utilizado INTERFACE.
    1.8. Funcoes.Enumerados.pas - unit utilizada para guardar os enumerados.

3. Banco utilizado: FIREBIRD 3.0.10 Win32 (possui auto-incremento)

UTILIZA��O DA APLICA��O

4. PASTA - ProjetoCEP\Projeto\Executavel - possui um arquivo conexao.ini para a cria��o da conex�o
===> VALORES INFORMADOS PARA EXEMPLO:
[LOCALLIB]
locallib=ProjetoCEP\Projeto\lib\fbclient.dll
[DRIVERID]
driverid=FB
[HOSTNAME]
hostname=localhost
[DATABASE]
database=ProjetoCEP\Banco\PROJETOCEP.FDB
[PORTA]
porta=3050
[USUARIO]
username=SYSDBA
[SENHA]
password=masterkey

5. PASTA - ProjetoCEP\Banco - possui o banco com a tabela j� criada.

1. CONSULTA:
    Ao digitar o CEP, os demais campos (UF, CIDADE, LOGRADOURO) s�o bloqueados, permitindo apenas a consulta por CEP.
    O usu�rio escolhe o m�todo de busca, que ser� usado na consulta (JSON, XML).
    Ao apagar o CEP, os campos UF, CIDADE e LOGRADOURO s�o habilitados novamente, permitindo que o usu�rio fa�a uma consulta de endere�o completo.
    Se o usu�rio tentar fazer a consulta de endere�o completo sem preencher os campos obrigat�rios ou informalos com menos de 3 caractres, o sistema deve validar e exibir mensagens de erro, solicitando que todos os campos necess�rios sejam preenchidos corretamente.
    caso o cep seja digitado incompleto ou n�o infomado o sistema deve validar e apresentar as mensagens ao usuario.
    O m�todo de consulta sempre deve ser informado, tanto para consulta por CEP quanto por endere�o completo.
2. CEP CADASTRADOS:
    Nessa tela, todos os CEPs que j� est�o cadastrados no banco de dados ser�o exibidos para consulta.
    Ao digitar um CEP, o sistema localiza o CEP digitado na base, facilitando a visualiza��o e localiza��o r�pida dos dados.
3. LOG DE ERROS:
    Se ocorrer qualquer problema durante a execu��o das rotinas, um arquivo de log ser� criado na pasta: ProjetoCEP\Projeto\Executavel\Logs\LogProjetoCEP.txt, onde todos os erros na execu��o da aplica��o ser�o registrados.

OBS: qualquer problema ao executar as rotinas foi criado um arquivo de LOG na pasta (ProjetoCEP\Projeto\Executavel\Logs\LogProjetoCEP.txt) onde � informado qualquer erro na execu��o da aplica��o.