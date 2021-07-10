#!/bin/bash

# copy the new src files to the build location
cp -r src/* pipeline/build/

# build a new Docker image
echo "**************************************"
echo "******** Building Docker image *******"
echo "**************************************"

cd pipeline/build/ && docker-compose build --no-cache
