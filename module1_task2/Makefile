# Build the website
build:     
    hugo

# Remove the dist directory
clean:     
    rm -rf dist

# Deploy the website
post:     
    rsync -avz --delete dist/ user@host:/var/www/site

# Print out the list of targets and their usage
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  build: Build the website"
	@echo "  clean: Remove the dist directory"
	@echo "  post: Deploy the website"


