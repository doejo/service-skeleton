# Service Skeleton

Base structure for building API services

## Components

- Sinatra
- ActiveRecord
- Postgresql
- JSON
- Sentry
- Foreman
- Thin
- Dotenv

## Getting Started

Clone repository and install dependencies:

```
git clone https://github.com/doejo/service-skeleton.git myapp
cd myapp
bundle install
```

Copy sample configuration files:

```
cp .env.sample .env
cp config/database.yml.sample config/database.yml
```

Create database:

```
rake db:create db:migrate
```