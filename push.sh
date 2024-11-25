# Check if version parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

# Load environment variables
if [ -z "$IMG_GROUPID" ]; then
  source ./env.sh
fi

VERSION=$1

docker push $IMG_GROUPID/$IMG_ARTIFACTID:$VERSION
docker push $IMG_GROUPID/$IMG_ARTIFACTID:latest
