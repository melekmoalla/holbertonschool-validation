MARKDOWNLINT := markdownlint-cli@0.26.0
MARKDOWNLINKCHECK := markdown-link-check@3.8.6
W3CVALIDATOR := /opt/W3C-Validator/w3c_validator.py

.PHONY: build check help clean validate	##test

build:	##test
    @hugo --destination dist

check:	##test
    @echo "Running Markdown lint..."
    @$(MARKDOWNLINT) content
    @echo "Running Markdown link check..."
    @$(MARKDOWNLINKCHECK) --quiet --config .markdown-link-check.yml

help:	##test
    @echo "Available targets:"
    @echo "  build     : Generate the website"
    @echo "  check     : Run markdown lint and link check"
    @echo "  help      : Display this help message"
    @echo "  clean     : Delete the dist/ directory"
    @echo "  validate  : Validate the generated HTML"

clean:	##test
    @rm -rf dist/

validate:	##test
    @python3 $(W3CVALIDATOR) --file dist/index.html --extension html || true
