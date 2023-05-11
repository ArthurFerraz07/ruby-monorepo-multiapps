# Defina a imagem base como a versão mais recente do Ruby
FROM ruby:3.1.3

# Crie o diretório de trabalho para o aplicativo
RUN mkdir -p /withdraw_app
WORKDIR /withdraw_app

# Copie os arquivos do aplicativo para o contêiner
# COPY santa_cruz/* /santa_cruz
COPY ./ /withdraw_app

# Instale as dependências do sistema necessárias para o aplicativo Rails
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Instale as dependências do Ruby necessárias para o aplicativo Rails
RUN gem install bundler
RUN bundle install --jobs 4

# Exponha a porta em que o aplicativo estará em execução
EXPOSE 3002

# Defina o comando de inicialização padrão para o aplicativo
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3002"]