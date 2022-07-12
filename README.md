# Quem sou eu
 Olá,
 meu nome é Rodolfo e apresento neste documento a execução do desafio de aprendizado da linguagem elixir com o framework phoenix.
 
 Abaixo deixo um video gravado exatamente no trigésimo e ultimo dia do desafio:
 [![Desenvolvimento | Desafio de aprendizado - Livraria Phoenix - Vídeo](https://raw.githubusercontent.com/rolphmc/livraria-phoenix/main/thumbnail-play.png)](https://youtu.be/IUFRuNq7ja8){:target="_blank"}

  Foram muitos assuntos estudados e um bocado de trabalho nesses 30 dias, segue o Readme do projeto:

# LivrariaPhoenix

 Projeto elaborado como um desafio prático de aprendizado da linguagem elixir com o uso do web framework Phoenix. A ideia do projeto foi dimensionar e implantar um sistema de uma livraria com base nos seguintes requisitos:
 * BD Estruturado e Normatizado;
 * Usar Testes unitários Mockar serviços;
 * Codificar em camadas;
 * Endpoints com MVC;
 * Auth nas rotas privadas;
 * Simular o Envio de e-mail;
 * Adicionar o README
 * Se possível, usar o docker-compose

## O desafio
 O projeto foi elaborado em um prazo de 30 dias partindo do contexto de não ter nenhum conhecimento sobre a linguagem elixir e do paradigma funcional, com isso tracei a seguinte estratégia:  
 - Aprender a sintaxe básica do elixir, o paradigma funcional e seus principais recursos;
 - Criar alguns pequenos projetos com o objetivo de entender o web framework phoenix e sua interação com o padrão MVC;
 - Desenvolver o projeto o mais próximo possível das melhores práticas de desenvolvimento.

## O projeto:

 Inicialmente cheguei nas seguintes premissas:
 - Trata-se de um problema complexo:
 - O tempo é limitado;
 - Grande volume de quesitos;
 - Campo desconhecido;
 
 Com base nisso, criei um esboço de projeto contando com a capacidade de construir literalmente toda a web page de uma livraria, plano esse que não durou muito tempo para cair por terra, demonstrando que em 30 dias seria mais plausível construir apenas um dos contextos essenciais para a funcionalidade de uma livraria, do que construir a livraria completa. Através dessa ideia fui capaz de aplicar todas as ferramentas	 úteis para o desenvolvimento do restante do projeto, possibilitando o aprendizado simultâneo sobre a aplicação.

Veja o esboço do projeto e sua evolução no whimsical:
  - [Projeto Livraria Eixir](https://whimsical.com/projeto-livraria-eixir-BkMV1bxxifBFeSZFxnzQXA)
  - [Projeto Livraria Eixir - Deploy1](https://whimsical.com/projeto-livraria-eixir-deploy1-Fsfmy56tmmt64tvZiSi51G)
  - [Projeto Livraria Eixir - Deploy1.1](https://whimsical.com/projeto-livraria-eixir-deploy1-1-QFhfaTEVutSU67AcKuS7a9)
  - [Projeto Livraria Eixir - Deploy1.2](https://whimsical.com/projeto-livraria-eixir-deploy1-2-PPx6EQLNjW4KUKZQz4thXp)
  - [Projeto Livraria Eixir - Deploy1.3](https://whimsical.com/projeto-livraria-eixir-deploy1-3-MURKvbCVxLYArNUAsn5Sxr)

## Os Passos: 
 Conforme o decorrer do desenvolvimento, o projeto foi tomando os sentidos que eram necessários e não mais os que previamente havia especulado. portanto, minha jornada para a criação do projeto seguiu as etapas:
  - Aprendizado da Sintaxe -> Curso Elixir na prática | canal Elly Academy - [acesse play aqui](https://www.youtube.com/playlist?list=PLydk1OOOmzo8VBeU334j4R4WvSByRNpXR)
  - Aprendendo sobre Phoenix | Messengyr - Curso completo e gratuíto sugerido pela Hex - [acesse o curso aqui](https://hexdocs.pm/phoenix/community.html#screencasts-courses)[página HEX com outros links úteis da comunidade](https://hexdocs.pm/phoenix/community.html#screencasts-courses)
  - Aprendizado sobre testes unitários | Coffe -> ELIXIR | Testes unitários - Code/drops #100 - Rocketseat - [acesse vídeo aqui]([https://www.youtube.com/playlist?](https://www.youtube.com/watch?v=c6tSDjj7VNM&t=13s&ab_channel=Rocketseat)
  - Aprendendo sobre Relacionamentos entre tabelas | DB com Ecto | Petex - Elixir - Banco de dados com o Ecto! - Code/drops #94 - Rocketseat - [acesse aqui](https://www.youtube.com/watch?v=tjvwsxjvBwY&ab_channel=Rocketseat)
  - Aprendendo sobre estrutura MVC | Hello -> Generators Hex Docs - [acesse aqui](https://hexdocs.pm/phoenix/views.html)
  - Padronização do projeto | Programming Phoenix - Livro José Valin
 
 
## Execução:
 - Primeiramente criei todos os schemas, changesets e migrates atraves do generator `phx.gen.schema`;
 - Com base nos arquivos automáticos fornecidos pelo sistema, desenvolvi as relações do banco de dados ainda com a ideia de construir toda a livraria, ou seja, criei todas as tabelas e relações que juguei necessárias para a aplicação. Entretanto, nesse descritivo vou me focar no contexto dos books, onde obtive as seguintes relações
 
 * Books
   - Belongs to Author
   - Many to many subcategories
 * Subcategories
   - Bolongs to Categories
   - Many to many books
 * Categories
   - Has many Subcategories
 * Customers

    -- Como regra de negócio, defini que um livro poderia estar em mais de uma única categoria ao mesmo tempo.
    
    -- Com a finalidade de colocar o projeto em execução sem ter que desenvolver os outros contextos da livraria, para interagir com os books desviei o contexto customers para que os usuários atuassem como se fossem administradores, assim, estando logados no sistema dispunham das permissões para cadastrar livros. (Um fluxo incomum criado apenas para demonstrar a capacidade de execução ao final dos 30 dias do projeto) 

 - Após o desenvolvimento do DB e suas relações. Iniciei o processo de criação de contas para os clientes;
 - Não queria dar início ao projeto com a sensação de que sua organização estava fora dos padrões, pensando nisso iniciei a leitura do livro Programming Phoenix o que me deu muito mais confiança para seguir com o projeto;
 - Desenvolvi todos os fluxos de trabalho entre os endpoints e as respectivas renderizações dos templates aos usuários seguindo os padrões sugeridos pela literatura.
 - Ao construir o sistema de cadastro e autenticação dos customers, usei a biblioteca Cameonin com a dependência `pbkdf2`, porém no projeto messengyr o desenvolvi com a dependência `argon2`;
 -  Por mais que tentei, não conseguir resolver um problema no Encode do projeto, ao usar as acentuações típicas do PT-BR, recebemos o erro `** (UnicodeConversionError) invalid encoding starting at`;
 - Testei as relações entre tabelas através do terminal, com isso aprendi a usar o arquivo `iex.exs` para salvar aliases e outros recursos importantes.
 - Criei o serviço de mala direta usando a biblioteca Bamboo.
 - O Plug de autenticação para restrição e liberação da sessão de usuários foi escrito conforme preceitos indicados no livro Programming Phoenix, entretanto também fiz o consumo da Biblioteca (guardians) no projeto messengyr.
 - O foco dos testes foi visando garantir a imutabilidade, simultaneidade e velocidade da aplicação. Fiz os testes apenas no contexto Customers, porém tenho plena ciência da importância dos testes em todas as etapas do desenvolvimento, deixando-os relativamente de lado nesse projeto apenas para garantir a apresentação de algo mensurável dentro do prazo estabelecido.
 - Para o seletor de categorias usei o plug `plug :load_categories` que alimenta os campos com os dados advindos do banco de dados.
 - Muitas das configurações feitas nos templates se basearam em inferências que fiz através do meu conhecimento em HTML5.

 Além desses pontos existem várias questões não listadas e que podem ser checadas no arquivo `devlog` que pode ser encontrado a seguir.


## Registro diário do projeto
 Para documentar o projeto, fiz um log de desenvolvimento diário no trello e que disponibilizei dentro do projeto no arquivo `devlog.md`
 [Acesse esse arquivo aqui](https://github.com/rolphmc/livraria-phoenix/blob/main/devlog.md)

 Todos os projetos acessórios que usei para compor o meu aprendizado estão salvos em meus repositórios aqui no github.


To start your Phoenix server:

  * Using UTF-8 Encoding(CHCP 65001) in Command Prompt (Windows)
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
