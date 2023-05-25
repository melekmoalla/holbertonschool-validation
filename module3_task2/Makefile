# Variables
BINARY = awesome-api
DIST_DIR = dist
PACKAGE_NAME = awesome-website.zip

# Targets
lint:
	markdownlint README.md DEPLOY.md

build:
	# Add your build commands here

package: build
	zip -r $(PACKAGE_NAME) $(BINARY) $(DIST_DIR)

clean:
	rm -f $(PACKAGE_NAME)

.PHONY: lint build package clean
package:
    zip -r awesome-website.zip awesome-api dist/
