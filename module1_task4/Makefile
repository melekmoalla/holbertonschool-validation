HUGO=hugo
POST_TITLE ?= $(shell openssl rand -hex 16)
POST_NAME ?= $(shell echo $(POST_TITLE) | tr '[:upper:]' '[:lower:]' | sed 's/ /-/' | sed 's/[^a-z0-9-]*//g')

build:
	$(HUGO) --minify --cleanDestinationDir

clean:
	rm -rf dist/*

post:
	touch content/posts/$(POST_NAME).md
	echo "---\ntitle: \"$(POST_TITLE)\"\ndate: $$(date +'%Y-%m-%dT%H:%M:%S')\ndraft: true\n---\n" > content/posts/$(POST_NAME).md