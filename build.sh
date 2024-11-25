#!/bin/bash

# Check if version parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

VERSION=$1

# Load environment variables
if [ -z "$IMG_GROUPID" ] || [ -z "$IMG_ARTIFACTID" ] ; then
  source ./env.sh
fi

ARTIFACT_ID="$IMG_GROUPID/$IMG_ARTIFACTID"

# Check if the image with the same version exists
if docker images | grep -q "$ARTIFACT_ID\s*$VERSION"; then
  # Check if there are any running containers using the image
  CONTAINER_ID=$(docker ps -q --filter ancestor="$ARTIFACT_ID:$VERSION")
  if [ -n "$CONTAINER_ID" ]; then
    echo "Stopping running container $CONTAINER_ID"
    docker stop "$CONTAINER_ID"
  fi
  
  echo "Removing existing image $ARTIFACT_ID:$VERSION"
  docker rmi "$ARTIFACT_ID:$VERSION"
fi

echo "Building version $VERSION"

# Add your build commands here
docker build --rm -t $ARTIFACT_ID:$VERSION -t $ARTIFACT_ID:latest .

VER_SCRIPT="vertest.sh"
VER_TESTFILE="/var/bin/$VER_SCRIPT"
docker run --rm -v "$(pwd)/$VER_SCRIPT:$VER_TESTFILE" $ARTIFACT_ID:$VERSION $VER_TESTFILE
