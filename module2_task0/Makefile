# Variables
BINARY_NAME := awesome-api
LOG_FILE := $(BINARY_NAME).log
PORT := 9999

# Default target
.DEFAULT_GOAL := help

# Build the binary
build:
	go build -o $(BINARY_NAME)

# Run the application
run: build
	./$(BINARY_NAME) > $(LOG_FILE) 2>&1 &

# Stop the application
stop:
	kill "$(shell pgrep $(BINARY_NAME))"

# Clean up generated files
clean:
	rm -f $(BINARY_NAME) $(LOG_FILE)

# Test the application
test:
	@echo "Testing / endpoint:"
	curl -s http://localhost:$(PORT)
	@echo
	@echo "Testing /health endpoint:"
	curl -s http://localhost:$(PORT)/health
	@echo

# Display help message
help:
	@echo "Available targets:"
	@echo "  build   - compile the source code to a binary"
	@echo "  run     - run the application in the background"
	@echo "  stop    - stop the application"
	@echo "  clean   - remove the binary and log file"
	@echo "  test    - test the application"
	@echo "  help    - display this help message"
