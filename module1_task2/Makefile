
build:	## Build the website
	hugo

clean:	## Remove the dist directory
	rm -rf dist


post:	## Deploy the website    
	rsync -avz --delete dist/ user@host:/var/www/site


help:	## Print out the list of targets and their usage
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  build: Build the website"
	@echo "  clean: Remove the dist directory"
	@echo "  post: Deploy the website"


