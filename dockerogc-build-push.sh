#!/bin/bash
set -e

SHA=$(git rev-parse --short HEAD)
IMAGE=dockerogc/prez

docker build \
  --label org.opencontainers.image.revision=$(git rev-parse HEAD) \
  -t ${IMAGE}:${SHA} \
  -t ${IMAGE}:latest \
  .

docker push ${IMAGE}:${SHA}
docker push ${IMAGE}:latest