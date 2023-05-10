#!/bin/bash

# Update package lists and install required packages
sudo apt-get update
sudo apt-get install -y hugo make

# Change to the website directory
cd module1_task3

# Run the build command
make build


# Check if Docker daemon is running
if ! systemctl status docker >/dev/null 2>&1; then
    echo "Docker daemon is not running. Starting it..."
    sudo systemctl start docker
fi

# Install Hugo
sudo apt-get update
sudo apt-get install -y hugo

# Generate the website
hugo -d dist/
