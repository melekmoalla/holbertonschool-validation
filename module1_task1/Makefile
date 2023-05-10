.PHONY: build clean post

build:
	hugo --minify -s . -d dist

clean:
	rm -rf dist/*

post:
ifndef POST_NAME
	$(error POST_NAME is undefined)
endif
ifndef POST_TITLE
	$(error POST_TITLE is undefined)
endif
	hugo new --kind post content/posts/$(POST_NAME).md
	sed -i 's/title: ""/title: "$(POST_TITLE)"/g' content/posts/$(POST_NAME).md
