# Simple Reporting Schema

This is a small rails application which contains models for a basic job accounting system. It also
has a db seed script for generating example data.

## Requirements

Please ensure you are using Docker Compose V2. This project relies on the `docker compose` command, not the previous `docker-compose` standalone program.

https://docs.docker.com/compose/#compose-v2-and-the-new-docker-compose-command

Check your docker compose version with:
```
% docker compose version
Docker Compose version v2.10.2
```

## Initial setup
```
cp .env.example .env
docker compose build
docker compose run --rm web bin/rails db:setup
```

## Running the Rails app
```
docker compose up
```

## Running the Rails console
When the app is already running with `docker compose` up, attach to the container:
```
docker compose exec web bin/rails c
```

When no container running yet, start up a new one:
```
docker compose run --rm web bin/rails c
```

## Running tests
```
docker compose run --rm web bundle exec rspec
```

## Updating gems
```
docker compose run --rm web bundle update
docker compose up --build
```

## Updating Yarn packages
```
docker compose run --rm web yarn upgrade
docker compose up --build
```
