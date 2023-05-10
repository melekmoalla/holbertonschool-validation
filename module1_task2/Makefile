build:	# Build the website from markdown and configuration files
	hugo -s ./
clean:	## Clean up the content of the dist/ directory
	rm -rf ./dist/*
post:	## Create a new blog post with a title and name from environment variables
	hugo new posts/$(POST_NAME).md
	sed -i.bak -e "s/title = \"\"/title = \"$(POST_TITLE)\"/" content/posts/$(POST_NAME).md
	sed -i.bak -e "s/draft = true/draft = false/" content/posts/$(POST_NAME).md
	rm -f content/posts/$(POST_NAME).md.bak
help:	## Display available targets and their usage/comments
	@echo "Usage: make [target]"
	@echo ""
	@echo "Available targets:"
	@echo "  build   Build the website"
	@echo "  clean   Clean up the dist/ directory"
	@echo "  post    Create a new blog post with title and name from environment variables"
	@echo "  help    Show this help message"
