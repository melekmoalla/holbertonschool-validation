# Variables
BINARY_NAME := awesome-api
LOG_FILE := $(BINARY_NAME).log
PORT := 9999

help: ## Print a list of all the goals with descriptions
	@awk 'BEGIN {FS = ":.*##"; } /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

build: ##test
	hugo
	check ## Build the binary
	@echo "Building $(BINARY_NAME)..."
	@go build -o $(BINARY_NAME)
	@echo "Build successful!"

run: build ## Run the application
	@echo "Running $(BINARY_NAME)..."
	@./$(BINARY_NAME) > $(LOG_FILE) 2>&1 &

stop: ## Stop the application
	@echo "Stopping $(BINARY_NAME)..."
	@kill "$(shell pgrep $(BINARY_NAME))"

clean: ## Stop the application, delete binary and log files
	@-kill "$(shell pgrep $(BINARY_NAME))"
	@echo "Cleaning up..."
	@rm -f $(BINARY_NAME)
	@rm -f $(LOG_FILE)
	@echo "Cleanup complete!"

test: ## Test the application
	@echo "Testing / endpoint:"
	@curl -s http://localhost:$(PORT)
	@echo
	@echo "Testing /health endpoint:"
	@curl -s http://localhost:$(PORT)/health
	@echo

lint: ## Perform static analysis on the source code
	@echo "Performing static analysis..."
	@golangci-lint run

unit-tests: ## Run unit tests
	@echo "Running unit tests..."
	@go test -v -short -coverprofile=coverage-units.out

check: lint check-markdown check-links ## Perform all checks (lint, markdown, links)

check-markdown: ## Check markdown files
	@echo "Checking markdown files..."
	@markdownlint-cli ./content/posts/*.md

check-links: ## Check links in markdown files
	@echo "Checking links in markdown files..."
	@markdown-link-check -p ./content/posts

validate: ## Validate generated HTML
	hugo
	@echo "Validating HTML..."
	@echo "Validation complete!"

.PHONY: help build run stop clean test lint unit-tests check check-markdown check-links validate
