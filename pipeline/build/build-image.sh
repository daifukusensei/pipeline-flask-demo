#!/bin/bash

# copy the new src file(s) to the build and test locations
cp -r src/* pipeline/build/
cp src/app.py pipeline/test/

# build a new Docker image
echo "**************************************"
echo "******** Building Docker image *******"
echo "**************************************"

cd pipeline/build/ && docker-compose build --no-cache
