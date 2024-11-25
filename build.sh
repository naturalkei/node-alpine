#!/bin/bash

# Check if version parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

VERSION=$1

echo "Building version $VERSION"

# Add your build commands here
docker build --tag node-alpine:$VERSION .
