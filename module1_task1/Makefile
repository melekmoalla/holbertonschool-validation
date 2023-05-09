POST_FILE := $(POST_NAME).md
POST_PATH := content/posts/$(POST_FILE)

build:
	hugo --source=./ --destination=./dist

clean:
	rm -rf ./dist/*

post:
	hugo new $(POST_PATH)
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' $(POST_PATH)

.PHONY: build clean post

