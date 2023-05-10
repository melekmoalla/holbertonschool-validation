#!/bin/bash

# Check if Hugo is installed
if ! command -v hugo >/dev/null 2>&1; then
  # Install Hugo
  echo "Installing Hugo..."
  wget -qO- https://github.com/gohugoio/hugo/releases/download/v0.82.0/hugo_0.82.0_Linux-64bit.tar.gz | tar xvz -C /tmp
  sudo mv /tmp/hugo /usr/local/bin/
fi

# Check if Make is installed
if ! command -v make >/dev/null 2>&1; then
  # Install Make
  echo "Installing Make..."
  sudo apt-get update && sudo apt-get install -y make
fi

# Build the website
echo "Building the website..."
make build

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "Build successful!"
  exit 0
else
  echo "Build failed."
  exit 1
fi
