.PHONY: build run stop clean help lint unit-tests integration-tests test

build: ## Build the awesome-api binary
	go build -o awesome-api

run: build ## Run the awesome-api binary
	./awesome-api

stop: ## Stop the running awesome-api process
	pkill awesome-api

help: ## Print a list of all the goals with descriptions
	@awk 'BEGIN {FS = ":.*##"; } /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

lint: ## Run code formatting and linter checks
	gofmt -l -s -w .
	golangci-lint run

unit-tests: ## Run unit tests
	go test -v -coverprofile=coverage-units.out ./...

integration-tests: ## Run integration tests
	go test -coverprofile=coverage-integrations.out -tags=integration ./...

test: unit-tests integration-tests ## Run both unit tests and integration tests

clean: ## Clean up generated files and artifacts
	rm -f coverage-units.out coverage-integrations.out

README.md: ## Update the README.md file with the necessary information.
	@echo "Update the README.md file with the necessary information."
