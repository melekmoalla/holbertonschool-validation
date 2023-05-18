# Variables
BINARY_NAME := awesome-api
LOG_FILE := $(BINARY_NAME).log
PORT := 9999
UNIT_COVERAGE_FILE := coverage-units.out
INTEGRATION_COVERAGE_FILE := coverage-integrations.out

help: ## Print a list of all the goals with descriptions
	@awk 'BEGIN {FS = ":.*##"; } /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	
build: lint ## Build the binary
	go build -o $(BINARY_NAME)

run: build ## Run the application
	./$(BINARY_NAME) > $(LOG_FILE) 2>&1 &

stop: ## Stop the application
	kill "$(shell pgrep $(BINARY_NAME))"

clean: ## Clean up generated files
	rm -f $(LOG_FILE) $(UNIT_COVERAGE_FILE) $(INTEGRATION_COVERAGE_FILE)

test: unit-tests integration-tests ## Run unit and integration tests

lint: ## Perform static analysis on the source code
	@golangci-lint run

unit-tests: ## Run unit tests
	@echo "Running Unit Tests"
	@go test -v -short -coverprofile=$(UNIT_COVERAGE_FILE) ./...

integration-tests: ## Run integration tests
	@echo "Running Integration Tests"
	@go test -v -tags=integration -coverprofile=$(INTEGRATION_COVERAGE_FILE) ./...

coverage: unit-coverage integration-coverage ## Generate combined coverage report

unit-coverage: ## Generate unit test coverage report
	@go tool cover -func=$(UNIT_COVERAGE_FILE)

integration-coverage: ## Generate integration test coverage report
	@go tool cover -func=$(INTEGRATION_COVERAGE_FILE)
