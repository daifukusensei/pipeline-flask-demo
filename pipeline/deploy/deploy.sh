#!/bin/bash

echo "**************************************"
echo "** Deploying Docker image to target **"
echo "**************************************"

echo $IMAGE > /tmp/.auth
echo $BUILD_NUMBER >> /tmp/.auth

scp /tmp/.auth $USER@$HOST:/tmp/.auth
scp ./pipeline/build/docker-compose.yml $USER@$HOST:~
scp ./pipeline/deploy/publish.sh $USER@$HOST:/tmp/publish.sh
ssh $USER@$HOST "/tmp/publish.sh"
