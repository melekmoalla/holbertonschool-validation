HUGO=hugo
POST_TITLE ?= $(shell openssl rand -hex 16)
POST_NAME ?= $(shell echo $(POST_TITLE) | tr '[:upper:]' '[:lower:]' | sed 's/ /-/' | sed 's/[^a-z0-9-]*//g')

build:
	$(HUGO) --minify --cleanDestinationDir

clean:
	rm -rf dist/*

post:
    hugo new --kind post content/posts/$(POST_NAME).md
    sed -i '/title:/c\title: "$(POST_TITLE)"' content/posts/$(POST_NAME).md


