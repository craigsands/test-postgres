.PHONY: build start stop exec

build:
	docker compose build

start: build
	docker compose up -d

stop:
	docker compose down

# To run an SQL script, use `make exec ARGS="-f tests/
exec:
	PGPASSWORD=example psql --host=localhost --user=postgres $(ARGS)
