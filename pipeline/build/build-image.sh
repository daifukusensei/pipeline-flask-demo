#!/bin/bash

# copy the new src file(s) to the build and test locations
#cp -r src/* pipeline/build/
#cp src/app.py pipeline/test/

echo "**************************************"
echo "******** Building Docker image *******"
echo "**************************************"

echo "Building new Docker image..."
docker-compose -f src/docker-compose.yml build --no-cache
