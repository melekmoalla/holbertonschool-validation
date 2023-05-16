# Variables
BINARY_NAME := awesome-api
LOG_FILE := $(BINARY_NAME).log
PORT := 9999

# Default target
.DEFAULT_GOAL := help


build: ## Build the binary
	go build -o $(BINARY_NAME)


run: build ## Run the application
	./$(BINARY_NAME) > $(LOG_FILE) 2>&1 &


stop: ## Stop the application
	kill "$(shell pgrep $(BINARY_NAME))"



clean:	## Stop the application, delete binary and log files.
	-kill "$(shell pgrep awesome-api)"
	-rm -f awesome-api
	-rm -f awesome-api.log


test: ## Test the application
	@echo "Testing / endpoint:"
	curl -s http://localhost:$(PORT)
	@echo
	@echo "Testing /health endpoint:"
	curl -s http://localhost:$(PORT)/health
	@echo


		
## Print a list of all the goals with descriptions.
help:
	@echo "Available targets:"
	@echo ""
	@echo "help    : Print a list of all the goals with descriptions."
	@echo "build   : Compile the source code of the application to a binary."
	@echo "run     : Run the application in the background and write logs to a file."
	@echo "stop    : Stop the running application."
	@echo "clean   : Stop the application, delete binary and log files."
	@echo "test    : Test the application by sending HTTP requests."
	@echo ""
