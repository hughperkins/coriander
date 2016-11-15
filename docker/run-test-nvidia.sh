#!/bin/bash

# this will be run from outside the ocntainer.  It will
# - build the container (in this case, for nvidia)
# - run the unit test script, inside the container)

# assumptions:
# - nvidia-docker in PATH, and the nvidia-docker-plugin started
# - run this script from this directory, ie fro mth e`docker` directoyr of the cuda-on-cl cloned repo
#
# note that it will build/run the current git branch you are sitting in

GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
docker build -t coclnvidia --no-cache ./ --file Dockerfile-nvidia --build-arg GIT_BRANCH=${GIT_BRANCH}
nvidia-docker run -t coclnvidia bash /cuda-on-cl/docker/docker-unittest.sh
