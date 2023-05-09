# Define variables
POST_TITLE ?= $(shell uuidgen)
POST_NAME ?= $(shell uuidgen)
POST_DATE ?= $(shell date +"%Y-%m-%d %T %z")

# Build target
build:
	hugo --destination=./dist/

# Clean target
clean:
	rm -rf ./dist/*

# Post target
post:
	hugo new --kind post ./content/posts/$(POST_NAME).md
	
