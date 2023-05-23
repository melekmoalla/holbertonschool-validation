build: ## execute a command that create a new blog
	markdownlint README.md content/posts/
	markdown-link-check README.md content/posts/
	hugo

check: ## check
	markdownlint README.md content/posts/
	markdown-link-check README.md content/posts/

clean: ## execute a command that clean the dist directory
	rm -rf dist

validate: ## validation
	python3 /opt/W3C-Validator/w3c_validator.py ./dist/index.html || true


post:  ## execute a command that create a new post
	hugo new posts/$(POST_NAME).md
	sed -i 's/title: .*/title:"$(POST_TITLE)"/' content/posts/$(POST_NAME).md

help:  ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'