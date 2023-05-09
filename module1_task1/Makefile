HUGO = hugo
POST_TITLE ?= "New Post"
POST_NAME ?= "new-post"

.PHONY: all build clean post

all: build

build:
	$(HUGO) --source=. --destination=./dist/

clean:
	rm -rf ./dist/*

post:
	$(HUGO) new --kind=post posts/$(POST_NAME).md
	sed -i 's/title = ""/title = $(POST_TITLE)/' ./content/posts/$(POST_NAME).md
