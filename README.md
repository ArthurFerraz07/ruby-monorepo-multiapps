# Monorepo rails - multiapps

Funcionalidades:
- Cadastro (Identity app)
- Login (Identity app)
- Saque crypto (Withdraw app)
- Cotação (Price app)

o que queremos:
- Padronização de comunicação API (erros, formato);
- Boa observabilidade - debug (apenas uma implementação pra todo mundo);
- Reunitilização de código - dry;
- Código isolado - apenas os apps que precisam de uma funcionalidade tem acesso a ela;
- CI/CD independente; (pending)
- Testes independentes; (pending)

Cada app:
- é um app ruby idenpendente;
- é uma gema - portanto incluído quando necessário;
- tem seu próprio entrypoint;
- pode ter seu próprio banco de dados - price_app, por exemplo, não possui;
- tem seus próprios testes; (pending)
- tem suas próprias rotina de CI/CD; (pending)
- consegue reaproveitar código de outros apps - withdraw_app, por exemplo, reaproveita o código do identity_app;

Para criar novo app:
- Se for um app rails, utilizar o `rails new ...`. com/sem frontend, com/sem banco de dados, etc;
- Se não for, basta criar uma pasta e colocar o código;
- Sempre declarar `gemspec` e `lib`, para que seja possível incluir como dependência em outros apps;

Para rodar os testes:
- Entrar na pasta do app e rodar `bundle exec rspec`; (pending)
