Projeto CEP - Thiago Torquato

URL GitHub: https://github.com/ThiagoTorquatoo/ProjetoCEP

1. Arquitetura Utilizada: Foi utilizado uma aplicação cliente/servidor que consulta e armazena CEPs da api https://viacep.com.br/;
    ==> CONEXÃO
    1.1. Datamodulo.Conexao.pas - datamodulo para coneções e componentes.
    ==> FORMULÁRIO
    1.2. Formulario.Menu.pas - formulário de menu para a chamada das telas da aplicação.
    1.3. Formulario.ConsultaPadrao.pas - formulário da pesquisa de cep, foi utilizado CLEAN CODE, DESIGN PATTERNS.
    1.4 - Formulario.Consulta.pas - formulário para a consulta de CEPs cadastrados.
    ==>FUNÇÕES
    1.5. Funcoes.Gerais.pas - unit que é utilizada para varias funciolidades na aplicação, foi utilizado INTERFACE.
    1.6. Funcoes.Log.pas - unit utilizada para a geração e capturas de logs.
    1.7. Funcoes.MontaURL.pas - unit utilizada para a montagem da url da busca de CEP, foi utilizado INTERFACE.
    1.8. Funcoes.Enumerados.pas - unit utilizada para guardar os enumerados.

3. Banco utilizado: FIREBIRD 3.0.10 Win32 (possui auto-incremento)

UTILIZAÇÃO DA APLICAÇÃO

4. PASTA - ProjetoCEP\Projeto\Executavel - possui um arquivo conexao.ini para a criação da conexão
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

5. PASTA - ProjetoCEP\Banco - possui o banco com a tabela já criada.

1. CONSULTA:
    Ao digitar o CEP, os demais campos (UF, CIDADE, LOGRADOURO) são bloqueados, permitindo apenas a consulta por CEP.
    O usuário escolhe o método de busca, que será usado na consulta (JSON, XML).
    Ao apagar o CEP, os campos UF, CIDADE e LOGRADOURO são habilitados novamente, permitindo que o usuário faça uma consulta de endereço completo.
    Se o usuário tentar fazer a consulta de endereço completo sem preencher os campos obrigatórios ou informalos com menos de 3 caractres, o sistema deve validar e exibir mensagens de erro, solicitando que todos os campos necessários sejam preenchidos corretamente.
    caso o cep seja digitado incompleto ou não infomado o sistema deve validar e apresentar as mensagens ao usuario.
    O método de consulta sempre deve ser informado, tanto para consulta por CEP quanto por endereço completo.
2. CEP CADASTRADOS:
    Nessa tela, todos os CEPs que já estão cadastrados no banco de dados serão exibidos para consulta.
    Ao digitar um CEP, o sistema localiza o CEP digitado na base, facilitando a visualização e localização rápida dos dados.
3. LOG DE ERROS:
    Se ocorrer qualquer problema durante a execução das rotinas, um arquivo de log será criado na pasta: ProjetoCEP\Projeto\Executavel\Logs\LogProjetoCEP.txt, onde todos os erros na execução da aplicação serão registrados.

OBS: qualquer problema ao executar as rotinas foi criado um arquivo de LOG na pasta (ProjetoCEP\Projeto\Executavel\Logs\LogProjetoCEP.txt) onde é informado qualquer erro na execução da aplicação.