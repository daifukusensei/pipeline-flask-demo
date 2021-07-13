#!/bin/bash

echo "**************************************"
echo "******** Building Docker image *******"
echo "**************************************"

echo "Building new Docker image..."
docker-compose -f src/docker-compose.yml build --no-cache
