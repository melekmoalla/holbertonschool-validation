POST_NAME ?= $(shell cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 8 | head -n 1)
POST_TITLE ?= $(shell cat /dev/urandom | tr -dc 'A-Za-z0-9' | fold -w 16 | head -n 1)

build:
	hugo --source=. --destination=./dist

clean:
	rm -rf ./dist/*

post:
	hugo new posts/$(POST_NAME).md
	sed -i 's/title = ""/title = "$(POST_TITLE)"/' ./content/posts/$(POST_NAME).md

