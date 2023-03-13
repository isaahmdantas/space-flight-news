# Back-end Challenge 2021 🏅 - Space Flight News
> This is a challenge by Coodesh


## Descrição 
Serviço de back-end para o Coodesh "[Back-end Challenge 2021 🏅 - Space Flight News](https://lab.coodesh.com/public-challenges/back-end-challenge)". O serviço consome a [API Space Flight News](https://api.spaceflightnewsapi.net/v3/documentation), salvando artigos sobre notícias espaciais por conta própria banco de dados e expondo-os por meio de sua própria API.

## Apresentação


## Tecnologias usuadas
- [Ruby on Rails](https://rubyonrails.org/)
- [Rspec](https://github.com/rspec/rspec-rails)
- [Whenever](https://github.com/javan/whenever)
- [Kaminari](https://github.com/kaminari/kaminari)
- [PostgreSQL](https://www.postgresql.org/)
- [Docker](https://www.docker.com/)
- [Swagger](https://swagger.io/)
- [Heroku](https://www.heroku.com)

## Instruções 

```bash
$ rvm use 3.1.1@space-flight-news --create
$ bundle install
$ npm install
$ whenever --update-crontab
```

> **_NOTE:_**  [Instalar ruby on rails em sua máquina](https://onebitcode.com/guia-de-instalacao-do-ruby-on-rails/)

## Executando o serviço
```bash
rails db:create 
rails db:migrate 
rails db:seed:migrte 
bin/dev
```

## Executar os testes
```bash
bundle exec rspec
```

## Docker Instruções
1. docker compose build
2. docker compose run --rm app rails db:create 
3. docker compose run --rm app rails db:migrate 
4. docker compose run --rm app rake seed:migrate

## Executar o Docker
1. docker compose run --rm -p 3000:3000 app rails s -b 0.0.0.0

## Documentação

Para ver como interagir com os endpoints, consulte a documentação do Swagger que pode ser encontrada em ```/api-docs```.