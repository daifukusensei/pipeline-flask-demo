#!/bin/bash

echo "**************************************"
echo "** Publishing Docker image on target *"
echo "**************************************"

# export variables
export IMAGE=$(sed -n '1p' .vars)
export BUILD_NUMBER=$(sed -n '2p' .vars)

echo "Building and starting Docker containers on target host..."
docker pull $IMAGE:Build-$BUILD_NUMBER && docker-compose up -d

if [ $? -eq 0 ]; then
   echo "Deleting older $IMAGE images from target host..."
   docker rmi $(docker images | grep $IMAGE | grep -E -v $IMAGE.*Build-$BUILD_NUMBER | awk '{ print $3 }')
fi
