# Green Farm Aid

## Dependencies

- yarn
- Docker

## Set project

```make
make setup
```

## Build the project

```make
make build
```

## Install dependencies

```make
make install
```

## Set database

```make
make init-db
```

## Run migrations

```make
make db-migrate
```

## Revert last migration

```make
make db-migrate-revert
```

## Create migration file

```make
make db-create-migration name= --> migration name using 'snake_case'
```

## Run develop mode

```make
make dev
```

## Run debug mode

```make
make debug
```

## Clean docker images

```make
make down
```
