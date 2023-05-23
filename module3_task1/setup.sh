#!/bin/bash

if [ ! -f "/tmp/installed.txt" ]; then
  # Update the system
  apt-get update -y
  apt-get upgrade -y

  # Install Hugo
  apt-get install -y hugo

  # Install Make
  apt-get install -y make

  # Create a flag file to indicate that hugo and make are installed
  touch /tmp/installed.txt
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
