#!/bin/bash

echo "**************************************"
echo "* Pushing Docker image to Docker Hub *"
echo "**************************************"

#IMAGE="flask-demo"

echo "Logging in..."
docker login -u daifukusensei -p $PASS

echo "Tagging image..."
#docker tag $IMAGE:$BUILD_NUMBER daifukusensei/$IMAGE:$BUILD_NUMBER

echo "Pushing image..."
#docker push daifukusensei/$IMAGE:$BUILD_NUMBER
docker push $IMAGE:$BUILD_NUMBER
