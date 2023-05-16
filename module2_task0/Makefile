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


.PHONY: clean
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
.PHONY: help
help: 
	@echo ""
	@echo  "\033[34mhelp\033[0m    : Print a list of all the goals with descriptions."
	@echo  "\033[34mbuild\033[0m  : Compile the source code of the application to a binary."
	@echo  "\033[34mrun\033[0m   : Run the application in the background and write logs to a file."
	@echo  "\033[34mstop\033[0m    : Stop the running application."
	@echo  "\033[34mclean\033[0m   : Stop the application, delete binary and log files."
	@echo  "\033[34mtest\033[0m   : Test the application by sending HTTP requests."
	@echo ""

