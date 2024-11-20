.PHONY: test-unit

# setup de proyect
setup:
	docker volume create --name=green-farm-aid-db
	cp -n .env.example .env

build:
	docker build .

install:
	docker-compose -f docker-compose.yaml -f docker/docker-compose.install.yaml up green-farm-aid

# database tasks
init-db:
	docker-compose run --rm green-farm-aid run init:db

db-create-migration:
	docker-compose run --rm green-farm-aid knex migrate:make $(name)

db-migrate:
	docker-compose run --rm green-farm-aid run db:migrate

db-migrate-revert:
	docker-compose run --rm green-farm-aid run db:migrate:revert

# runs the app
dev:
	docker-compose -f docker-compose.yaml -f docker/docker-compose.dev.yaml up green-farm-aid

debug:
	docker-compose -f docker-compose.yaml -f docker/docker-compose.debug.yaml up green-farm-aid

down:
	docker-compose down --remove-orphans

# runs the tests
# first run migrations, then functional and unit test
test:
	docker-compose -f docker-compose.yaml -f docker/docker-compose.test.yaml run --rm igreen-farm-aid

test-coverage:
	docker-compose -f docker-compose.yaml -f docker/docker-compose.test.coverage.yaml run --rm igreen-farm-aid

test-debug:
	docker-compose -f docker-compose.yaml -f docker/docker-compose.test.debug.yaml up igreen-farm-aid

test-unit:
	docker-compose -f docker-compose.yaml -f docker/docker-compose.test.yaml run --rm igreen-farm-aid test:unit
