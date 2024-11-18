setup:
	docker volume create --name=green-farm-aid-db
	cp -n .env.example .env

build:
	docker build .

install:
	docker-compose -f docker-compose.yaml -f docker/docker-compose.install.yaml up green-farm-aid

init-db:
	docker-compose run --rm green-farm-aid run init:db

db-create-migration:
	npx knex migrate:make $(name)

db-migrate:
	docker-compose run --rm green-farm-aid run db:migrate

db-migrate-revert:
	docker-compose run --rm green-farm-aid run db:migrate:revert

dev:
	docker-compose -f docker-compose.yaml -f docker/docker-compose.dev.yaml up green-farm-aid

debug:
	docker-compose -f docker-compose.yaml -f docker/docker-compose.debug.yaml up green-farm-aid

down:
	docker-compose down --remove-orphans
