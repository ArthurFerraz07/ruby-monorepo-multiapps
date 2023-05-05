# Monorepo rails - multiapps

Funcionalidades:
- Cadastro (Identity app)
- Login (Identity app)
- Saque crypto (Withdraw app)
- Cotação (Price app)

Desejável:
- Padronização de comunicação API (erros, formato);
  - santa_cruz
- Boa observabilidade - debug (apenas uma implementação pra todo mundo, rollbar, prometheus, grafana, etc);
  - santa_cruz
- Reuitilização de código;
  - apps as gems
- Código isolado - apenas os apps que precisam de uma funcionalidade tem acesso a ela;
  - apps as gems
- CI/CD independente;
  - multiapps
- Testes independentes;
  - multiapps

Cada app:
- é um app ruby independente;
- pode ser um app rails ou não;
- é uma gema - portanto incluído quando necessário;
- tem seu próprio entrypoint - menos santa cruz;
- pode ter seu próprio banco de dados - price_app, por exemplo, não possui;
- tem seus próprios testes;
- tem suas próprias rotina de CI/CD;
- consegue reaproveitar código de outros apps - withdraw_app, por exemplo, reaproveita o código do identity_app;

Para criar novo app:
- Se for um app rails, utilizar o `rails new ...`. com/sem frontend, com/sem banco de dados, etc;
- Se não for, basta criar uma pasta e colocar o código;
- Sempre declarar `gemspec` e `lib`, para que seja possível incluir como dependência em outros apps;

Para rodar os testes:
- Entrar na pasta do app e rodar `bundle exec rspec`; (pending)

## Criando apps
### App rails ou ruby puro?
1. Para apps Rails utilizar o `rails new new_app [OPTIONS]`
   1. Se for apenas api, sem frontend utilizar `--api`
   2. se não precisar da orm (sem banco), utilizar `--skip-active-record`
2. Se não, criar uma pasta e colocar o código
3. criar new_app.gemspec
4. criar lib/new_app.rb
   1. criar, tambem, lib/new_app/engine.rb se for um app rails
5. criar dockerfile

## Configurando os apps
## multiapps
1. Rodar `docker compose up`
2. consultar o container do identity_app `docker ps | grep identity_app`
3. entrar no container `docker exec -it <container_id> bash`
4. rodar `rails db:create db:migrate`
5. consultar o container do withdraw_app `docker ps | grep withdraw_app`
3. entrar no container `docker exec -it <container_id> bash`
4. rodar `rails db:create:withdraw_app db:migrate:withdraw_app`

### price_app
Só rodar `docker compose up price_app`

### identity_app
1. Rodar `docker compose up identity_app`
2. consultar o container do identity_app `docker ps | grep identity_app`
3. entrar no container `docker exec -it <container_id> bash`
4. rodar `rails db:create db:migrate`

### withdraw_app
1. Rodar `docker compose up withdraw_app`
2. consultar o container do withdraw_app `docker ps | grep withdraw_app`
3. entrar no container `docker exec -it <container_id> bash`
4. rodar `rails db:create:withdraw_app db:migrate:withdraw_app`
