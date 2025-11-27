#!/bin/sh

cleanup() {
    rm -rf TEMP_DIR
}

if [ $# -lt 2 ]; then
  echo 1>&2 "Error – try: $0 <github-repo> <docker-hub-repo>"
  echo 1>&2 "e.g.: ./builder.sh mluukkai/express_app mluukkai/testing"
  exit 2
fi

GITHUB_REPO=$1
DOCKER_HUB_REPO=$2
TEMP_DIR=$(mktemp -d)

trap cleanup EXIT

echo "GitHub: cloning $GITHUB_REPO ..."
git clone https://github.com/$GITHUB_REPO.git $TEMP_DIR
cd $TEMP_DIR

if [ ! -f "$TEMP_DIR/Dockerfile" ]; then
  echo "Error – no Dockerfile"
  exit 1
fi

echo "Docker: building image ..."
docker build -t $DOCKER_HUB_REPO $TEMP_DIR

echo "Docker Hub: logging in ..."
docker login -u $DOCKER_USER -p $DOCKER_PWD

echo "Docker Hub: pushing image ..."
docker push $DOCKER_HUB_REPO

exit 0
