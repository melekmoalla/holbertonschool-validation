build:	## Build:
	golangci-lint run
	go build

run:	## Run:
	./awesome-api >./awesome-api.log 2>&1 &

stop:  ## Stop:
	pkill awesome-api || true

clean: ## Clean:
	pkill awesome-api || true
	rm -rf awesome-api awesome-api.log coverage-units.out coverage-integrations.out

test:	## Test:
	go test -v -short -coverprofile=coverage-units.out
	go test -v -tags=integration -coverprofile=coverage-integrations.out

unit-tests:	## Unit-tests:
	go test -v -short -coverprofile=coverage-units.out

integration-tests:	## Integration-tests:
	go test -v -tags=integration -coverprofile=coverage-integrations.out

lint:	## Lint:
	golangci-lint run

help:	## Display this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'