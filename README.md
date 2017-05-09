# Phoenix docker dev

A [phoenix](http://www.phoenixframework.org) [docker](http://www.docker.com) development setup

# Development

Install [docker](http://www.docker.com/products/docker) and [docker-compose](https://docs.docker.com/compose/install/)

# Create a new app:
Follow the instructions at the bottom of the `Dockerfile`.

# Run
```
docker-compose up
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Tasks

## Get CLI access

```
docker-compose run --rm dev bash
```

## Generic Task
You can run any command inside the docker container
```
docker-compose run --rm dev <<enter command here>>
```

## Dep get
```
docker-compose run --rm dev mix deps.get
```

## Database creation
```
docker-compose run --rm dev mix ecto.create
```

## Database migration
```
docker-compose run --rm dev mix ecto.migrate
```
