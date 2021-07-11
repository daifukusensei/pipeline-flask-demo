#!/bin/bash

echo "**************************************"
echo "* Pushing Docker image to Docker Hub *"
echo "**************************************"

echo "Logging in..."
docker login -u daifukusensei -p $PASS

echo "Pushing image..."
docker push $IMAGE:$BUILD_NUMBER
