# Build the website from markdown and configuration files
build:
    hugo -s ./

# Clean up the content of the dist/ directory
clean:
    rm -rf ./dist/*

# Create a new blog post with a title and name from environment variables
post:
    hugo new posts/$(POST_NAME).md
    sed -i.bak -e "s/title = \"\"/title = \"$(POST_TITLE)\"/" content/posts/$(POST_NAME).md
    sed -i.bak -e "s/draft = true/draft = false/" content/posts/$(POST_NAME).md
    rm -f content/posts/$(POST_NAME).md.bak

# Show usage information for all targets
help:
    @echo "Usage: make [target]"
    @echo ""
    @echo "Targets:"
    @echo "  build   Build the website"
    @echo "  clean   Clean up the dist/ directory"
    @echo "  post    Create a new blog post with title and name from environment variables"
    @echo "  help    Show this help message"
