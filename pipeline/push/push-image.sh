#!/bin/bash

echo "**************************************"
echo "* Pushing Docker image to Docker Hub *"
echo "**************************************"

echo "Logging in to Docker Hub..."
#docker login -u daifukusensei -p $PASS
docker login -u $DOCKERHUB_USR -p $DOCKERHUB_PSW

echo "Pushing image..."
docker push $IMAGE:Build-$BUILD_NUMBER

echo "Removing image(s) from build server..."
docker-compose -f src/docker-compose.yml down --rmi all
