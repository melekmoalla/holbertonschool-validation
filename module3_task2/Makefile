# Variables
BINARY_NAME := awesome-api
LOG_FILE := $(BINARY_NAME).log
PORT := 9999


help: ## Print a list of all the goals with descriptions
	@awk 'BEGIN {FS = ":.*##"; } /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

build: lint ## Build the binary
	go build -o $(BINARY_NAME)

run: build ## Run the application
	./$(BINARY_NAME) > $(LOG_FILE) 2>&1 &

stop: ## Stop the application
	kill "$(shell pgrep $(BINARY_NAME))"

clean: ## Clean up generated files and artifacts
	-kill "$(shell pgrep $(BINARY_NAME))"
	rm -f $(BINARY_NAME)
	rm -f $(LOG_FILE)
	rm -f coverage-units.out coverage-integrations.out

test:	## Test:
	go test -v -short -coverprofile=coverage-units.out
	go test -v -tags=integration -coverprofile=coverage-integrations.out ## Run both unit tests and integration tests

lint: ## Perform static analysis on the source code
	@golangci-lint run

unit-tests: ## Run unit tests
	@go test -v -short -coverprofile=coverage-units.out
	
integration-tests: ##test
	@go test -v -tags=integration -coverprofile=coverage-integrations.out ./...




