#!/bin/bash

echo "**************************************"
echo "** Deploying Docker image to target **"
echo "**************************************"

echo "Generating parameters..."
echo $IMAGE > pipeline/deploy/.vars
echo $BUILD_NUMBER >> pipeline/deploy/.vars

echo "Copying deployment files to $USER@$HOST..."
scp pipeline/deploy/.vars $USER@$HOST:~
scp src/docker-compose.yml $USER@$HOST:~
scp pipeline/deploy/publish.sh $USER@$HOST:~
ssh $USER@$HOST "~/publish.sh"
