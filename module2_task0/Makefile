# Variables
BINARY_NAME := awesome-api
LOG_FILE := $(BINARY_NAME).log
PORT := 9999

"# Default target
.DEFAULT_GOAL := help


build: ## Build the binary
	go build -o $(BINARY_NAME)


run: build ## Run the application
	./$(BINARY_NAME) > $(LOG_FILE) 2>&1 &


stop: ## Stop the application
	kill "$(shell pgrep $(BINARY_NAME))"


clean: ## Clean up generated files
	rm -f $(BINARY_NAME) $(LOG_FILE)


test: ## Test the application
	@echo "Testing / endpoint:"
	curl -s http://localhost:$(PORT)
	@echo
	@echo "Testing /health endpoint:"
	curl -s http://localhost:$(PORT)/health
	@echo


help: ## Display help message
	@echo "Available targets:"
	@echo "  build   - compile the source code to a binary"
	@echo "  run     - run the application in the background"
	@echo "  stop    - stop the application"
	@echo "  clean   - remove the binary and log file"
	@echo "  test    - test the application"
	@echo "  help    - display this help message"
