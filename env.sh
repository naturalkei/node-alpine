#!/bin/bash
if [ -f .env ]; then
  source ./.env
fi

IMG_GROUPID="${IMG_GROUPID-naturalk}"
IMG_ARTIFACTID="${IMG_ARTIFACTID-node-alpine}"
