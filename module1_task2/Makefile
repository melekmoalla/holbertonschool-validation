HUGO=hugo
POST_TITLE ?= $(shell openssl rand -hex 16)
POST_NAME ?= $(shell echo $(POST_TITLE) | tr '[:upper:]' '[:lower:]' | sed 's/ /-/' | sed 's/[^a-z0-9-]*//g')


build:	# Build the website from markdown and configuration files
	(HUGO) --minify --cleanDestinationDir
clean:	## Clean up the content of the dist/ directory
	rm -rf dist/*
post:	## Create a new blog post with a title and name from environment variables

	touch content/posts/$(POST_NAME).md
	echo "---\ntitle: \"$(POST_TITLE)\"\ndate: $$(date +'%Y-%m-%dT%H:%M:%S')\ndraft: true\n---\n" > content/posts/$(POST_NAME).md
help:	## Display available targets and their usage/comments
	@echo "Usage: make [target]"
	@echo ""
	@echo "Available targets:"
	@awk -F ':.*?##' '/^[a-zA-Z_-]+:.*?##/ { printf "\033[36m%-20s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
