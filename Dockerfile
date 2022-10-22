FROM ruby:3.1.2
# ベースにするイメージを指定

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim
# RailsのインストールやMySQLへの接続に必要なパッケージをインストール

RUN mkdir /learn-rails-graphql-api-mode
# コンテナ内にlearn-rails-graphql-api-modeディレクトリを作成

WORKDIR /learn-rails-graphql-api-mode
# 作成したlearn-rails-graphql-api-modeディレクトリを作業用ディレクトリとして設定

COPY Gemfile /learn-rails-graphql-api-mode/Gemfile
COPY Gemfile.lock /learn-rails-graphql-api-mode/Gemfile.lock
# ローカルの Gemfile と Gemfile.lock をコンテナ内のlearn-rails-graphql-api-mode配下にコピー

RUN bundle install
# コンテナ内にコピーした Gemfile の bundle install

COPY . /learn-rails-graphql-api-mode
# ローカルのlearn-rails-graphql-api-mode配下のファイルをコンテナ内のlearn-rails-graphql-api-mode配下にコピー
