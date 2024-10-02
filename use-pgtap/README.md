# use-pgtap

This was an attempt to use the docker compose file provided by the official pgtap repo to run custom tests.

However, I couldn't figure out how to _not_ run the tests that are included by default in that repo. Running something like `docker compose exec ALL_TESTS=... test run` was failing since `make test` in the `run` script always called both serial and parallel tests (and thus failed if either weren't present).
