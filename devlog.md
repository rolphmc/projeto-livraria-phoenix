03/07 - Preenchendo categorias

- 
________________________________________________________
02/07 - Criando formulários - Contexto Books - categorias

- começar testando sistema das structs, passando pelos changesets até as views.
- Congrats - problema da passagem de dados entre páginas resolvido. Seguir montando todos os formulários!
- commit - d45302d
________________________________________________________
01/07 - Criando formulários - Contexto Books - categorias

- Categorias...
 - Inserção do `plug :load_categories` carregando as categorias em todas as actions necessárias.
- criando seletor de categorias:
- passar dados entre paginas (problemasso!!!!) 

-- > dia hoje só deu ruim =/ | focar em melhores resultados amanhã
________________________________________________________
30/06 -testing MVC parte 1

- Todos os conceitos para testar TUDO!
- Focos:
> - Imutabilidade;
> - Simultaneidade;
> - Velocidade.
- Macros;
> - setup macro - especificação de códigos pré-teste
> - teste macro - definição de um teste isolado;
> - assert macro - especifica algo que acreditamos ser verdade

### testes de contexto
- todos os testes que envolvem a verificação de duplicidade estão tendo um problema `(Ecto.ConstraintError) constraint error when attempting to insert struct:` já testei diversas formas de resolução e até o momento nada funcionou, Apesar disso o código se mantém integro e funcional, bora seguir.

- Começar a estruturar as páginas, começando pelas categorias (pg 129 pp)

________________________________________________________
30/06 - resolver problema Unique key constraint do changeset

- resolver problema e commitar....
- ainda não foi possivel resolver a questão da validação de registros duplicados, seguir com o projeto e esperar que logo apareça a solução `error -> constraints não estão funcionando bem para registros duplicados`
- commit - 88da953
- Iniciar aplicação de todos os testes unitários para o contexto Customers > Cadastro;
- Vale lembrar que não usei os geradores apenas para criar os schemas e uma única aplicação hello word para entender as camadas do MVC. 

________________________________________________________
29/06 - login e registro de usuário na sessão

- Encerrada todas as questões que envolvem o a autenticação de usuários.
- Commit - 39ff6b4
- https://hexdocs.pm/bamboo/Bamboo.Mailer.html desenvolvendo o mailer;
- https://hexdocs.pm/bamboo/readme.html#viewing-sent-emails Teste de email;
- https://www.skcript.com/svr/using-bamboo-to-send-emails-in-phoenix/ modelo seguido

________________________________________________________
28/06 - 3 horas - login e registro de usuário na sessão

- CONGRATSSSS - login e registro de sessão realizados com sucesso. tudo funcionando
commit - 

- next - Deslogar da sessão.

________________________________________________________
28/06 - 3 horas - login e registro de usuário na sessão

- fazendo login e se protegendo de ataques de fixação de sessão. O Plug envia um cookie de sessão ao usuário caso algum invasor conheça os dados do anterior.
- Sign in atualizado para fazer auth assim que um cliente ser criado.
- autenticação por username.
- Rota `/sessions` REST.
- ignora-se `:unauthorized` e `:not_found` em create session por questões de privacidade, exibir um dos dois pode identificar se uma pessoa é ou não cadastrada em um dado site. - pg 96
- formulário e sistema de login pronto, ficou faltando apenas corrigir um erro após o input dos dados no form.

________________________________________________________
28/06 - 3 horas - escrevendo um plug de autenticação pg 88 - Sessões

- 1 > armazena o id do usuário na sessão sempre que se registrar ou fizer login;
- 2 >verificar se há um novo usuário na sessão e armazena-o em `conn.assigns` 

- 3 > Configurando os Pipeline de plug dos controladores;

- 4 > mecanismo de auth pronto, porém será interessante joga-lo para um controlador que possa ser acessado por todos os controladores;

________________________________________________________
28/06 - 30" - Iniciando desenvolvimento simultâneo - Sessões

- começando a desenvolver a sessão do usuário p.phoenix pg 85.
- Estudando Plugues - exitem dois [pluges de módulos e de funções] (plugs tb são funções)
 - Plugs tem duas funções  `def init do` e `def call(conn, _opts) do` e sempre recebem um `conn` e retornam um `conn`.

________________________________________________________
28/06 - 2 horas - Iniciando desenvolvimento simultâneo - Auth and email

- finalizar antes do meio dia o assunto do e-mails e auth;
- e-mail enviado, basta adaptar ao projeto.
________________________________________________________
27/06 - Iniciando desenvolvimento simultâneo - Auth and email

- autenticação
- página 82, código para fazer alterações em massa no DB usando `for`;
- atualizando sistema de registro;
- criar, ler registro e fazer hash de senha, funcionando. - 

commitando ff41634

________________________________________________________
27/06 - 1:30 hora  - Iniciando desenvolvimento simultâneo - Auth and email

- usando o tutorial https://www.tuliocalil.com.br/post/criando-servico-de-envio-de-e-mail-com-elixir:
- Entendendo o Básico sobre supervisores;
- Servidor Criado, próximo passo: envio de e-mail.

________________________________________________________
27/06 - 2 hora  - Iniciando desenvolvimento simultâneo.

- 1 hora - forms - revisei código que havia apagado. estou montando pg 70, mais uma hora para finalizar esta section do livro.
- next Autenticação by P.Phoenix.

_________________________
26/06 - hora  - criando formulário e páginas de cadastro de novos customers.

- aprendendo a usar os resources do router através do livro.
- verificando como executar o envio de e-mails.

_________________________
25/06 - 1 hora  - Testando relações

- Aprendi a criar o arquivo iex.exs que revolucionou a vida.
- estou aprendendo sobre consultas ao db através do Ecto.query.

_________________________
24/06 - 3 horas  - Testando relações

- CONGRATSSSS - consegui fazer a relação:
 Books >> subcategorias_books << subcategorias << categoria
- parei iniciando a programação dos contextos.

_________________________
24/06 - 4 horas  - populando dados iniciais do db para testes

- resolvendo problemas ao inputar categorias, o data type não esta compativel com as strings `** (UnicodeConversionError) invalid encoding starting at `
- esse problema foi muito maior que eu imaginava e resolvi que será necessário deixar os texto em inglês para evitar acentuação. Infelizmente não consegui chegar a um consenso na transferência de caracteres com acentuação para o DB. o elixir não trabalha bem com acentos e percebi isso agora que comecei a mexer com textos em pt-br =/.
- com a finalidade de computar os testes feitos:
 >> 1º percebi que não estava inserindo palavras acentuadas e retornava o erro acima.
 >> 2º tentei resolver por diversas conversões de string, percebi alguns padrões e no geral todos os testes - independente da conversão - me retornava um bitstring <<0>> nos caracteres acentuados;
 >> 3º usei as conversões indicadas nesse post do forum https://elixirforum.com/t/converting-a-list-of-bytes-from-utf-8-or-iso-8859-1-to-elixir-string/20032/3 me pareceu muito interessante e ao meu ver deveria ter resolvido o problema, sqn. 
 >> 4º decidi que perdi tempo de mais (de novo) então vou continuar os trabalhos populando o DB em inglês.
 - ###populando db em inglês.

_________________________
23/06 - 1 horas  - Inputando dados no DB - testando relações

> - prompt teste - input book - ok
> - prompt teste - input author - ok
> - prompt teste - Update author in book
- por questão de tempo, verifiquei que seria difícil executar as modificações via terminal, então ou iniciar os testes unitários em nível de chagesets.
- Por coincidência vi o livro Phoenix programing em seu capitulo 7 que existe uma forma mais simples de popular e atualizar os dados no DB.
- Parei o livro página 124.
- tive um problema com o repo.preload para verificar as associações da planilha e meu erro estava na escrita do Has_many, o primeiro argdeve ser o nome da tabela e o segundo o nome 
_________________________
23/06 - 8 horas  - Ecto, schemas, changesets and migrate- DB modelado e migrado

- modelei todo o banco de dado corrigindo também o modelo inicial que foi planejado no whimsical. 

_________________________
22/06 - 3 horas  - Modelos de aninhamento - Restaurado commit

- me perdi em vários assuntos referente ao que estava fazendo e em união com o problema da manhã resolvi resetar o ultimo commit.
- após muito tempo resolvendo o problema e revisando os conceitos, finalmente chegamos ao ECTO e os conceitos de DB em acordo com phoenix programming.

_________________________
22/06 - 5 horas  - configurando a view de detalhes

- tive um problema bem chato com a view de detalhes de livros, depois de pesquisar muito, descobri que o atom :id quando passado da URL, vem com binary type, o que estava impedindo do enum.find encontrar o book id selecionado. porém no Repo.get, esse comportamento não se repete justamente por aceitar todos os data types disponíveis.
-vamos seguir e tentar chegar nas implementações do ECTO o mais rápido possivel.

- Modelos de aninhamento - entendido como funciona o render de um arquivo HTML dentro de outro.

_________________________
21/06 - 3 horas  - Entendendo melhor a estrutura do Phoenix Views and Templates

- Views são módulos responsáveis por renderização.
- Templates são módulos responsáveis pelas páginas web e linguagens de marcação.
- Consegui montar o fluxo até a exibição da "books_list" no servidor rodando. 
executando commit no GITHUB

- A raiz das importações dos templates são exibidas em my_app_web.ex em "def view do". Nesse arquivo é recomendado manter-se apenas funções de importação!

_________________________
21/06 - 1 hora  - Entendendo melhor a estrutura do Phoenix CONTROLLERS

- Building a Controller

_________________________
21/06 -  4 horas - Entendendo melhor a estrutura do Phoenix enquanto contruimos o projeto da livraria.

- lendo um pouco do "Programming Phoenix" para entender melhor as estruturas para a livraria.
   > - Todo bom programador de aplicativos deve ser capaz de dividir ideias complexas em etapas discretas.
   > - Assim como também deve ser capaz de construir uma Bela API unir etapas discretas em ideias.

 - lógica de negócios do aplicativo vão para lib/My_app.
 - Controladores, views e models vão para lib/My_app_web.
 - O suporte para iniciar, parar e supervisionar cada aplicativo está em lib/hello/application.ex
 - Na pasta config está toda o arquivo mestre e um arquivo adicional para cada ambiente que serão executados.
 - Endpoints são os limites onde o servidor web entrega conexões ao nosso código.
 - um endpoint é um plug composto por outros plugs. O aplicativo phoenix é uma série de plugues começando com um endpoint e terminando com um controlador.

 - Models, views, controller = templates, views e controllers - diretórios do projeto
 - falando sobre o controlador, sua função é basicamente trabalhar com funções de contexto. que por sua vez, tais funções são armazenadas em lib/my_app
 - Todos aplicativos são divididos em Contextos, partes gerenciáveis e independentes.
 - Os contextos se comunicam com os Schemas/Structs para manipulação dos dados;

_________________________
20/06 -  2" - estruturando o DB

- criados os schemas e migrates.
_________________________
20/06 -  30" - Multipla seleção controles

- verificando como fazer uma tag seleção (html) de categorias para cadastrar os livros.
- usar tag de seleção me pareceu muito complexo, logo usarei radios - peguei o modelo desse tópico https://stackoverflow.com/questions/42334123/how-do-i-persist-phoenix-html-radio-button-states-to-a-postgresql-database-while.
- entender sobre recursividade na view do phoenix.

_________________________
19/06 -  30" - Persistência de dados em Sessão de usuário

- verificando como fazer para persistir as informações do usuário em uma sessão.
- LIVRO ELIXIR IN ACTION CAP 10 - using session data in your application. - Leitura - https://www.manning.com/books/phoenix-in-action#toc

_________________________
19/06 -  30" - Documentação - 3 principais testes

- Ultimas verificações de testes, os outros 2 testes tem relação com API e Web Sockets.

_________________________
19/06 -  3 horas - Documentação - 3 principais testes

- criando o projeto - https://hexdocs.pm/phoenix/1.4.2/testing.html
- https://hexdocs.pm/phoenix/1.4.2/testing.html
- https://hexdocs.pm/phoenix/1.4.2/testing_schemas.html
  - não entendi o tópico "Número de animais de estimação"
  - aprendendo a lidar com os tipos de teste para validação do changeset

_________________________

18/06 - 2 horas - Creating ECTO DB com Relacionamentos - PETEX PROJECT

- https://www.youtube.com/watch?v=tjvwsxjvBwY&list=PL85ITvJ7FLojnPX7wohMjPXvpwlpR7yIP&index=15&ab_channel=Rocketseat
- Ao final ele cita diversas dicas de operações que podem ser feitas no ECTO

_________________________
17/06 - 1 hora - Unit test

- Como criar CRUD muito rapidamente - mas não recomendado para o desafio - pelo phx.
- reconstruir o CRUD manualmente com teste
_________________________
18/06 - 1:50 horas - Unit test

- Todo teste por convenção tem um "_test.exs" como sufixo.
- informações em comum entre os testes podem ser agrupadas em setups.

_________________________
17/06 - 20" - Creating new rooms

- Aplicação de Recursão.
- parar para ver algo mais tranquilo!
- https://www.youtube.com/watch?v=np_vyd7QlXk&ab_channel=MatheusBattisti-HoradeCodar
-https://www.linkedin.com/pulse/crud-elixir-phoenix-e-docker-axel-alexander-martins-benites/?originalSubdomain=pt

_________________________
17/06 - 5" - Managing state with Redux

- Api usada para atualizar instataneamente dados em uma página web, caso seja útil em alguma parte de nossa livraria, basta voltar aqui.

_________________________
17/06 - 25" - Fetching JSON data

- **Consultas Ecto** - parte que trata de consultas ao DB, ensina a como filtrar os dados buscados com base em condicionais.
- **One last thing – Moment.js** - apenas caso precise manipular timestaps.

_________________________
17/06 - 1:20 hora - Building a JSON API

- revisando os requisitos
 - oban | ir verificando uma aplicação extremamente simples para esse recurso(além do envio de e-mails).
 - Payload - basicamente é o conceito das structs com o DB

- verificando a necessidade de aprender esta aula...
 - **Fallback controllers** - tratativa de erros para diversas páginas.
 - **Tables for our rooms and messages** - criando novas tabelas e relacionando-as.
 - **Seeding your database with data** - configurações das relações e popular informações no DB.

acho que esses pontos são interessantes para o projeto.

_________________________
17/06 - 20" - Crafting components with React

- verificando a necessidade de aprender esta aula...
- não, por hora ela é completamente sobre front-end e acredito que podemos pular essa parte. os recursor do elixir adiante, acredito que poderemos usa-los em uma interface estática HTML.

_________________________
17/06 - 3 horas - From website to web app - Auth nas rotas

- mais um dos requisitos, fazer a Auth nas rotas:
- Uma rota apenas para usuários logados;
- verifiquei que o erro `MessengyrWeb.ChatController.init/1 is undefined` acontece quando não há nada além da route definida.
- já temos as rotas privadas protegidas, só tivemos um problema, ao acessar uma rota que deve-se estar logado para acessa-la, o ErrorHandle não está acionando o comportamento para evitar erros. [VERIFICAR] - talvez esse site possa dar algumas dicas para resolução https://github.com/ueberauth/guardian/blob/master/upgrade_guides/0.14.to.1.0.md

_________________________
17/06 - 3 horas - From website to web app

- Informando o usuário de que ele está logado.
- além de conseguir fazer o usuário persistir, agora também consegui resolver a questão do css. a página tomou forma e ficou mais agradável.
- foi conectado os furmulários de index, porém acredito que exista uma forma de reaproveitar as páginas que já existiam.
- salvando uma cópia do projeto que agora está plenamente estável messengyr_4.

_________________________
16/06 - 8 horas - Authentication - [PROBLEMA]

- Pelo material notei diversas diferenças no fluxo de criação dos projetos, vou estar mapeando as principais diferênças.
- Após inserir um `IO.puts` uma linha antes do `sign_in` consegui pegar um erro de digitação no nome do arquivo ebin, fazendo o caminho reverso verifiquei que no arquivo guardian.ex a `defmodule` estava escrita com "ME" e não "Me" de messengyr. todo esse role se deu por conta desse problema.
- Finalmenteeee, problema resolvido. a comunicação entre as funções se da pelos arquivos ebin do guardian dentro de build. Sabe-se que se a comunicação não estiver sendo efetiva, significa que o arquivo não está sendo chamado corretamente.

_________________________
16/06 - 8 horas - Authentication - Buscando informações da Session [PROBLEMA]

- tudo que faço finaliza no problema `function Messengyr.Auth.Guardian.Plug.sign_in/2 is undefined (module Messengyr.Auth.Guardian.Plug is not available)`
- devido ao grande tempo já empacado nesse problema, iniciarei um tutorial rapido, porém completo de guardian para que faça o fluxo completo de validação de sessão e assim replicar os procedimentos no material do curso.

_________________________
15/06 - 4 horas - Authentication - Buscando informações da Session [PROBLEMA]

- Vamos informar ao phoenix que desejamos uma checagem das informações da sessão para cada requisição HTML;
- Para executar essa tarefa, é necessário criar um pipeline chamado `browser_session ` com dois plugs guardian:
  - `VerifySession` - Verifica se estamos logados.
  - `LoadResource` - Verifica exatamente quem está logado.
- após passar por esse processo travei na manutenção da sessão pelo guardian.

_________________________
15/06 - 1 horas - Authentication - Guardians

- Instalação do guadians, dependências e suas configurações.
- Parece estranho, porém a inserção da lib Guardians é muito simples e para que ela faça a persistência do login do usuário no sistema, basta apenas uma linha em nosso controller. Muito bom!

_________________________
15/06 - 6 horas - Authentication - [PROBLEMA - RESOLVIDO]

- Autenticação e sistema de Seção do usário, parte fundamental dos requisitos do projeto;
- Criada estrutura de login com o uso do argon2 para atenticação. agora usaremos a lib guardians para persistir os dados no sistema.

_________________________
15/06 - 4 horas - Authentication - [PROBLEMA - RESOLVIDO]

- ainda na resolução do problema, após tentar vários tipos de solução, parti para uma que foi citada no forum, deletar completamente o packge build. Caso não resolva, reiniciarei o phoenix.
- para testar efetivamente, terei que reiniciar o pc para derrubar o localhost que ficou online em algum prompt
 - Pelo que tudo indica o problema foi resolvido com `encrypted_password = Argon2.hash_pwd_salt(password)`. agora restou verificar todo o fluxo de auth par entender perfeitamente o funcionamento.
- Signin funcionando, prosseguindo com o curso!

_________________________
14/06 - 5 horas - Authentication - [PROBLEMA]

- Usando lib Comeonin de Hash de senhas. Comecei usando a ferramenta Bcrypt porém está desatualizada e parece não ser a melhor opção da lib, me forçando a trocar por uma mais recomendada, a Argon2.
- Agora estou apenas com um problema de atualização da lib argon, ela não deixa startar o server pois acusa de que ela esteja precisando de atualização.
- após esse problema acima, o argon tb começou a dar problema e tive que fazer algumas alterações na função privada `deps` o problema e que acredito que provoquei o erro ` could not remove files and directories recursively from [path]: permission denied` após tentar remover algun dos plugins que foram instalados.
- indo para mais de 5 horas com esse problema

_________________________
14/06 - 2 horas - form - Repo.insert

- Construindo a tratativa de erros ao inputar dados inválidos no `create_user`;
- Aprendi a usar o `put_flash` que é um controlador para comunicar problemas no display  do usuário, no caso o não preenchimento dos campos do formulário.
- para demonstrar exatamente qual o campo está com preenchimento incorreto, usar a tag `<%= error_tag f, :nome_do_campo %>` logo abaixo da tag `text_input`
_________________________
13/06 - tempo: 3 horas - Forms

- usando os auxiliares para a comunicação do form  no modelo com nosso banco de dados.
 - `form_for` substitui as tags de formulário e específicamos o changese que será usado e então é informado ao elixir qual a função do controlador que deverá ser usada, no caso ``PageController.create_user` ainda não criada;
 - text_input substitui as tags de entrada com um plus de também específicar quais as chaves do maps que serão populadas quando o form for inputado.
 - submit gera a tag com `type='button'`que ao ser clicado aciona a ação.

### criação de uma route para ação
- tratamento de solicitações de formulários com o ENDPOINT post/signup:
 - Logo após esse trajeto do tutorial, houve mais um problema com o eex incorporado no HTML do signup, a função page_path não tem o seu import e não sei de qual módulo ela faz parte.
 - https://hexdocs.pm/phoenix/routing.html fala sobre o page_path.
 - Problema resolvido: `page_path` é uma função auxiliar que permite recuperar o caminho de um determinado par controlador/ação, no nosso caso: `post "/signup", PageController, :create_user`
_________________________

11/06 - tempo: 2 horas - Changesets - Repo.insert

- Ao criar a linha `Repo.insert` inicialmente estava tendo problemas justamente pelo fato de não ter criado o "aliás" `Messengyr.Repo`.
- Em seguida estava com problemas relacionados a erro de digitação do comando no iex.
- Uma das principais diferenças entre o map e a struct é poder identificar e também validar os dados.

_________________________
10/06 - tempo: 1 hora minutos - STRUCTS e CHANGESET

- A essência é a seguinte:
  - Cria-se uma struct;
  - Cria-se uma Changeset;
  - Por fim aplica-se toda e qualquer validação necessária antes de insertar a informação no DB;

_________________________
10/06 - tempo: 45 minutos - REVISÃO

- tudo reestruturado, de volta a STRUCS.

_________________________
10/06 - tempo: 45 minutos - REVISÃO

- deletei todo o projeto e iniciei um novo. Após instalar o novo phx e suas dependências achei interessante deletar tb o DB o que me deu um pouco de trabalho, visto que tive que aprender a desconectar o DB para assim poder Dropar.
 - verificando outras possíveis pasta onde colocar as imagens do projeto
_________________________
10/06 - tempo:  1 hora - Changesets

- nesse ponto estamos lidando com STRUCTS que é um dos quesitos do projeto.
- O inicio do servidor está com muitos erros, visto esse problema e o tanto de pastas que movimentei, vou reiniciar o projeto, até mesmo como forma de revisar o material (anexo em messenfgyr_try_1.rar)
_________________________
10/06 - tempo: 1:10 hora - Ecto - PROBLEMA com migrate/rollback do ECTO

- tive que refazer os procedimentos relacionados a criação do schema. foi possivel cria-lo e migra-lo para o postgre, porém ao aplicar o rollback comando, o mesmo encontrou problemas na line 6 do schema. estou verificando o motivo.
- ajustada hora do DB.
- não está sendo possivel migrar o schema com o `unique: true` comando. Aponta-se um problema na line 6 do arquivo `lib\messengyr\user.ex`
_________________________
10/06 - tempo: 30' - Ecto - instalar GUI

- Instalado GUI postgresql com uma interface amigável para o próprio vscode!
- se algo de ruim acontecer, através dos arquivos schema que foram migrados e do comando `ecto.rollback` é possivel desfazer a ultima alteração e reenviar o arquivo gravado `mix ecto.migrate`
_________________________
10/06 - tempo: 40' - Ecto 

- foi feita a migração do schema ao db e executei as consultas para verificar os detalhes através da CLI. Porém caso continue o processo através de camandos o trabalho se tornará muito oneroso, instalar GUI!
_________________________
10/06 - tempo: 30' - Ecto 

- Entendendo a criação do arquivo `mix phx.gen.schema` que informa a intenção de gerar um novo schema que é composto por dois arquivos: um sendo o esquema para ajudar na criação e alterações das tabelas no DB e outro de migração que serve para iniciar a table desejada no DB.
- É possivel fazer alterações nesses arquivos antes de migralos para o DB
 - Um detalhe importante é a forma com que se garante a esclusividade do dados no arquivo de migração.
_________________________
09/06 - tempo: 20' - Construindo nossas primeiras páginas 

- ignorei o front, segue o curso!
_________________________

09/06 - tempo: 30' - Construindo nossas primeiras páginas 

- Como  o foco não é front-end, ignorei o problema relacionado a interface e passei para as próximas questões, porém como há a necessidade de instalar as dependências do node.js, npm e sass. a instalação demora um pouco e resolvi estudar um pouco de inglês nesse meio tempo. 

_________________________ 

09/06 - tempo: 60' - Construindo nossas primeiras páginas 

###PARCIALMENTE RESOLVIDO
- Ao modificar o arquivo app.HTML.heex para que o layout do sistema tenha um padrão predefinido em todas as telas, estou tendo um erro na sintaxe do código.
- A primeira evidência é que o código foi atualizado e provavelmente usa uma nova sintaxe. Será necessário descobrir como redigir esse novo código.
- +30 - ainda sem nenhuma ideia da resolução - mantive os parâmetros originais criados pelo `phx.create`. vamos seguir com o curso e ver no que dá.

_________________________ 

09/06 - tempo: 30' - Construindo nossas primeiras páginas 

###PROBLEMA
- Ao modificar o arquivo app.HTML.heex para que o layout do sistema tenha um padrão predefinido em todas as telas, estou tendo um erro na sintaxe do código.
- A primeira evidência é que o código foi atualizado e provavelmente usa uma nova sintaxe. Será necessário descobrir como redigir esse novo código.

_________________________ 

09/06 - tempo: 35' - Construindo nossas primeiras páginas 

- Criando rotas e modelos HTML, isso consiste nos seguintes passos:
> - Criar uma line em indicando a rota no scope;
> - Criar a função do controller que recebe a rota;
> - Criar a interface web HTML.heex

_________________________ 

09/06 - tempo: 20 - Modelos, visualizações e controladores 

### Revisando
- O Roteador conecta um [host - endpoint] com uma função do controller por meio de uma rota.
- O Controller coleta dados, define funções e transmite tudo para uma visão.
- A View processa os dados antes de renderizar o modelo.
- O Model é basicamente o HTML e eventualmente algum código elixir embutido.

_________________________ 
09/06 - tempo: 1 hora - Modelos, visualizações e controladores 

- Foi feito o primeiro teste de mudança em um layout reenderizado pelo phoenix, nota-se que suas alterações no código surtem efeito instantaneamente no layout.
- Documentações do Elixir são anexadas aos módulos com o atributo @moduledoc;
- O o router é o mecanismo que conecta uma URL a uma determinada página, o fluxo dessa requisição cria uma rota que basicamente é a conexão da URL com uma determinada ação.

_________________________ 
08/06 - 40 minutos - Modelos, visualizações e controladores 

- entendendo um pouco mais sobre a estrutura dos arquivos phoenix:
 `lib > messengyr > messengyr_web > templates > layout`

_________________________ 

08/06 - 1 hora - problemas com ecto.create RESOLVIDO

- resolução foi dada através da inserção da senha do servidor postgresql no arquivo:
 `messengyr > config > dev.exs`
- criado servidor phx e funcionando!

_________________________ 

08/06 - 1:50 minutos - problemas com ecto.create.

- não está conseguindo acessar o DB;
>`(Postgrex.Error) FATAL 28P01 (invalid_password) password authentication failed for user "postgres"`
_________________________ 
08/06 - 1:50 minutos - iniciando plataforma de mensagens - desafio curso:

- criado o projeto;
- instalado banco de dados - PROBLEMA.

_________________________
08/06 - 40 minutos - Entendendo melhor o framework
 - através da página principal do framework descobri algumas comunidades e cursos interessantes, inclusive o curso que considero nesse momento o mais importante de se executar - "Descubra Elixir e Phoenix" - com a proposta de montar um messenger web igual o FB messenger.
 - Criar os CRUD's provavelmente será mais fácil após essa aula, afinal já verifiue que ela dará uma visão completa e pratica sobre o funcionamento do framework.
_________________________
08/06 - 1 hora | veirificada a configuração do CRUD tanto na linguagem nativa quanto no framework. ideal é executar os dois para entender as diferenças entre eles.
_________________________
08/06 - 2 horas | Instalação Phoenix completa. assistindo alguns materiais no youtube:
- Aprenda a forma correta de estudar PROGRAMAÇÃO FUNCIONAL com Elixir;
- Ferramentas ESSENCIAIS para Desenvolvedor Elixir;
_________________________
08/06 - +30 Iniciado a instalação do Phoenix framework e suas dependências. instalando PostgreeSQL.
_________________________
08/06 - primeiros 30 minutos - verificando ferramentas para trabalhar melhor com o elixir no canal elx pro BR
