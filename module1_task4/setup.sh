#!/bin/bash

# This is a basic shell script template

# Update the system
apt-get update -y
apt-get upgrade -y

# Install necessary packages
apt-get install -y package1 package2 package3

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
