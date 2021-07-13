#!/bin/bash

echo "**************************************"
echo "** Publishing Docker image on target *"
echo "**************************************"

# export variables
export IMAGE=$(sed -n '1p' /tmp/.auth)
export BUILD_NUMBER=$(sed -n '2p' /tmp/.auth)

echo "Building and starting Docker containers on target host..."
docker pull $IMAGE:$BUILD_NUMBER && docker-compose up -d
if [ #? -eq 0 ]; then
  echo "Deleting older $IMAGE images..."
  docker rmi $(docker images | grep 'daifukusensei/flask-demo')
fi
