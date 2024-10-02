.PHONY: init check clean start stop test

init:
	@[ -d pgtap ] || git clone 'git@github.com:theory/pgtap.git'

build:
	@{ cd pgtap/test; docker compose build test; }

start: init build
	@{ cd pgtap/test; docker compose up -d test; }

check: start
	@{ cd pgtap/test; docker compose exec test make install installcheck; }

add_tests: start
	@{ cd pgtap/test; for f in $$(find ../../../tests -name '*.sql'); do echo $$f; docker compose cp $$f test:pgtap/test/sql/.; done; }

stop:
	@{ cd pgtap/test; docker compose down; }

test: add_tests
	@{ cd pgtap/test; docker compose exec test run; }

clean:
	rm -rf pgtap
	docker system prune -a -f
