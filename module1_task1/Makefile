HUGO=hugo
POST_TITLE ?= $(shell openssl rand -hex 16)
POST_NAME ?= $(shell echo $(POST_TITLE) | tr '[:upper:]' '[:lower:]' | sed 's/ /-/' | sed 's/[^a-z0-9-]*//g')

build:
	$(HUGO) --minify --cleanDestinationDir

clean:
	rm -rf dist/*


post:
	hugo new --kind post posts/$(shell echo $$RANDOM | md5sum | cut -c1-8)$(POST_NAME).md
	sed -i "s/title: .*$$/title: $(POST_TITLE)/" content/posts/$(shell ls -t content/posts/ | head -1)



