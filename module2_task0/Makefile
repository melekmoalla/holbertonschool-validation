# Variables
BINARY_NAME := awesome-api
LOG_FILE := $(BINARY_NAME).log
PORT := 9999

.PHONY: help

help: ## Print a list of all the goals with descriptions
	@echo "help: Print a list of all the goals with descriptions"
	@echo "build: Compile the source code of the application to a binary"
	@echo "clean: Stop the application, delete binary and log files"
	@echo "run: Run the application in the background and write logs to a file"
	@echo "stop: Stop the running application"
	@echo "test: Test the application by sending HTTP requests"
build: ## Build the binary
	go build -o $(BINARY_NAME)


run: build ## Run the application
	./$(BINARY_NAME) > $(LOG_FILE) 2>&1 &

stop: ## Stop the application
	kill "$(shell pgrep $(BINARY_NAME))"


clean: ## Stop the application, delete binary and log files
	-kill "$(shell pgrep $(BINARY_NAME))"
	rm -f $(BINARY_NAME)
	rm -f $(LOG_FILE)


test: ## Test the application
	@echo "Testing / endpoint:"
	curl -s http://localhost:$(PORT)
	@echo
	@echo "Testing /health endpoint:"
	curl -s http://localhost:$(PORT)/health
	@echo

