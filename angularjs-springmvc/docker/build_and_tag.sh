#/bin/env bash
#core provided by Phil Whelan - https://gist.github.com/philwhln/8196116

#build_and_tag <directory of Dockerfile> <resultant docker image name>

DOCKERFILE_DIRECTORY=$1
DOCKER_IMAGE_NAME=$2

# Build docker image
rm -f docker-built-id
docker build --rm=true $DOCKERFILE_DIRECTORY \
  | perl -pe '/Successfully built (\S+)/ && `echo -n $1 > docker-built-id`'
if [ ! -f docker-built-id ]; then
  echo "No docker-built-id file found"
  exit 1
fi
DOCKER_BUILD_ID=`cat docker-built-id`

# Tag the new image
docker tag $DOCKER_BUILD_ID $DOCKER_IMAGE_NAME

# todo: stuff to publish this image in a (remote) repository