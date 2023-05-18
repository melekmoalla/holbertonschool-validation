MARKDOWNLINT := markdownlint-cli@0.26.0
MARKDOWNLINKCHECK := markdown-link-check@3.8.6
W3CVALIDATOR := /opt/W3C-Validator/w3c_validator.py

.PHONY: build check help clean validate

build:	##test
    @make check && hugo --destination dist

check:	##test
    @echo "Running Markdown lint..."
    @$(MARKDOWNLINT) content
    @echo "Running Markdown link check..."
    @$(MARKDOWNLINKCHECK) --quiet --config .markdown-link-check.yml

help:	##test
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

clean:	##test
    @rm -rf dist/

validate:	##test
    @python3 $(W3CVALIDATOR) --file dist/index.html --extension html >/dev/null || true
