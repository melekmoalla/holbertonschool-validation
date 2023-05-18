.PHONY: build run stop clean help lint unit-tests integration-tests test


build:	##test
	go build -o awesome-api

run: build	##test
	./awesome-api

stop:	##test
	pkill awesome-api

help: ## Print a list of all the goals with descriptions
	@awk 'BEGIN {FS = ":.*##"; } /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: clean


lint:	##test
	gofmt -l -s -w .
	golangci-lint run

unit-tests:	##test
	go test -v -coverprofile=coverage-units.out ./...

integration-tests:	##test
	go test -coverprofile=coverage-integrations.out -tags=integration ./...

test: unit-tests integration-tests	##test

clean:	##test
	rm -f coverage-units.out coverage-integrations.out

README.md: ##test
	@echo "Update the README.md file with the necessary information."

