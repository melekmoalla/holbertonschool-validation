#!/bin/bash

# Set the version of Hugo to be installed
HUGO_VERSION=0.88.1

# Check if Hugo is installed and is the correct version
if ! command -v hugo &> /dev/null || ! hugo version | grep -qF $HUGO_VERSION; then
  echo "Installing Hugo $HUGO_VERSION"
  # Download and install the correct version of Hugo
  wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -O /tmp/hugo.tar.gz
  tar -zxvf /tmp/hugo.tar.gz -C /usr/local/bin/
  rm /tmp/hugo.tar.gz
fi

# Generate the website using Hugo
hugo -v

# Check if the generated website is present
if [ -d "./dist" ]; then
    echo "Website generated successfully."
else
    echo "Error: Website not generated."
    exit 1
fi

# Exit with status code 0 if everything went well
exit 0
