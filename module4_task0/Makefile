build:
    docker run --rm -v $(PWD):/app -w /app golang:1.15.8-buster go build -o myapp

unit-tests:
    docker run --rm -v $(PWD):/app -w /app golang:1.15.8-buster go test -v ./...

integration-tests:
    docker run --rm -v $(PWD):/app -w /app golang:1.15.8-buster go test -v ./...

hugo-build:
    docker run --rm -v $(PWD):/app -w /app klakegg/hugo:0.87.0-ext-alpine

.PHONY: build unit-tests integration-tests hugo-build
