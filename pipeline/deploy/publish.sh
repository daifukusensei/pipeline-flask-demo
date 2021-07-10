#!/bin/bash

echo "**************************************"
echo "** Publishing Docker image on target *"
echo "**************************************"

# export variables
export IMAGE=$(sed -n '1p' /tmp/.auth)
export BUILD_TAG=$(sed -n '2p' /tmp/.auth)
export PASS=$(sed -n '3p' /tmp/.auth)

# login to docker hub
docker login -u daifukusensei -p $PASS

# pull docker image and docker-compose start
cd ~/maven && docker-compose up -d
