[![Build Status](https://travis-ci.org/paulinhamp/bookstore.svg?branch=master)](https://travis-ci.org/paulinhamp/bookstore) [![Maintainability](https://api.codeclimate.com/v1/badges/c6f4d1f4f6e2ed0a73e2/maintainability)](https://codeclimate.com/github/paulinhamp/bookstore/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/c6f4d1f4f6e2ed0a73e2/test_coverage)](https://codeclimate.com/github/paulinhamp/bookstore/test_coverage)

# Bookstore

Bookstore is a simple API using the DDD (Domain Driven Development), using tecnologies like Sidekiq and ElasticSearch.

## Requirements
- Ruby 2.3.4
- Bundler 1.15.4
- Rails 5.1.0
- Redis 3.2.1
- ElasticSearch 5.6.5
- Sidekiq 5.0.5
- Postgres 9.6.6

## Fetching source code
```bash
git clone git@github.com:paulinhamp/bookstore.git
cd bookstore
git submodule update --recursive --remote
```
## Settings

After have cloned this repository, you need to do some basic configurations

Change this section in `database.yml` with your current database settings
```yml
development:
  <<: *default
  database: bookstore_development
  username: postgres
  password: root
```
Change those sections in `config/settings/development.yml` with your current Redis and ElasticSearch settings
```yml
redis:
  url: redis://localhost:6379/0/cache

elasticsearch:
  url: http://localhost:9200
```

## Setup

```bash
> bundle install
> bundle exec rake db:create db:migrate db:seed
```

## Running RSpec

```bash
> bundle exec rake spec
```

## Running Bookstore
```bash
bundle exec sidekiq > sidekiq.logs &
bundle exec rails s
```

## API Routes

### Books
|   Action                            | Method    | URL                                               
| ------------------------------------|-----------|------------------------ 
|   Show Swagger Docs                 |  `GET`    | /apidocs
|   List books                        |  `GET`    | /api/v1/books
|   List books by keyword             |  `GET`    | /api/v1/books?q=<query>
|   Create book                       |  `POST`   | /api/v1/books
|   Show Book                         |  `GET`    | /api/v1/books/:id
|   Update book                       |  `PUT`    | /api/v1/books/:id
|   Delete book                       |  `DELETE` | /api/v1/books/:id

Made with :heart: by Ana Paula Melo
