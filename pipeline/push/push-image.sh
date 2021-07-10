#!/bin/bash

echo "**************************************"
echo "* Pushing Docker image to Docker Hub *"
echo "**************************************"

IMAGE="flask-demo"

echo "Logging in..."
docker login -u daifukusensei -p $PASS

echo "Tagging image..."
docker tag $IMAGE:$BUILD_TAG daifukusensei/$IMAGE:$BUILD_TAG

echo "Pushing image..."
docker push daifukusensei/$IMAGE:$BUILD_TAG
