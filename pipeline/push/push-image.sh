#!/bin/bash

echo "**************************************"
echo "* Pushing Docker image to Docker Hub *"
echo "**************************************"

echo "Logging in to Docker Hub..."
docker login -u daifukusensei -p $PASS

echo "Pushing image..."
docker push $IMAGE:$BUILD_NUMBER

echo "Removing image(s) from build server..."
docker-compose -f srcdocker-R
