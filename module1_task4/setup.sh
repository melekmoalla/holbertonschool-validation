#!/bin/bash

# Check if hugo is installed, and install it if not
if ! command -v hugo &> /dev/null
then
    echo "hugo not found, installing..."
    sudo apt-get update && sudo apt-get install hugo -y
fi

# Check if make is installed, and install it if not
if ! command -v make &> /dev/null
then
    echo "make not found, installing..."
    sudo apt-get update && sudo apt-get install make -y
fi

# Build the website using hugo
echo "Building website..."
if ! hugo -d dist
then
    echo "Error: failed to build website"
    exit 1
fi

# Check if the website was generated successfully
echo "Checking website..."
if ! ls dist/ 2>/dev/null | grep -q 'index.html'
then
    echo "Error: website not generated"
    exit 1
fi

echo "Website built successfully"
exit 0
