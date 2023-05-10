#!/bin/bash

set -e

if ! command -v hugo >/dev/null 2>&1; then
  echo "Installing Hugo..."
  sudo apt-get update
  sudo apt-get install hugo -y
fi

if ! command -v make >/dev/null 2>&1; then
  echo "Installing Make..."
  sudo apt-get update
  sudo apt-get install make -y
fi

echo "Building website..."
make build
