# Check if version parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

# Load environment variables
source ./env.sh

VERSION=$1

source ./build.sh $VERSION
source ./push.sh $VERSION
