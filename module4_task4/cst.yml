# Dockerfile

# Stage 1: Build the Go binary
FROM golang:1.15.8-alpine AS build

# Install any required dependencies
RUN apk --no-cache add make git

# Set the working directory
WORKDIR /app

# Copy the Go module files
COPY go.mod go.sum ./

# Download the Go module dependencies
RUN go mod download

# Copy the rest of the source code
COPY . .

# Build the Go binary
RUN make build

# Stage 2: Create the final image
FROM alpine:3.13

# Install any required dependencies
RUN apk --no-cache add ca-certificates

# Copy the built Go binary from the previous stage
COPY --from=build /app/app /

# Set the entrypoint command
CMD ["/app"]
    