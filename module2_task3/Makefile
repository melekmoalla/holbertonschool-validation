.PHONY: build run stop clean help lint unit-tests integration-tests test

# Default target
build:
	go build -o awesome-api

run: build
	./awesome-api

stop:
	pkill awesome-api

clean:
	rm -f awesome-api
	rm -f coverage-units.out
	rm -f coverage-integrations.out

help:
	@echo "Available targets:"
	@echo "  build             Build the project"
	@echo "  run               Run the project"
	@echo "  stop              Stop the running server"
	@echo "  clean             Clean up project files"
	@echo "  help              Display this help message"
	@echo "  lint              Run linter"
	@echo "  unit-tests        Run unit tests"
	@echo "  integration-tests Run integration tests"
	@echo "  test              Run all tests"

lint:	##test
	gofmt -l -s -w .
	golangci-lint run

unit-tests:	##test
	go test -v -coverprofile=coverage-units.out ./...

integration-tests:	##test
	go test -v -coverprofile=coverage-integrations.out ./...

test:	 unit-tests integration-tests	##test
	@echo "Running all tests"

README.md: ##test
	@echo "Update the README.md file with the necessary information."

