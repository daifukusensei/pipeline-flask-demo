#!/bin/bash

echo "**************************************"
echo "** Deploying Docker image to target **"
echo "**************************************"

#cd pipeline/build/ && docker-compose up -d

echo daifukusensei/flask-demo > /tmp/.auth
echo $BUILD_NUMBER >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp /tmp/.auth ec2-user@ec2-3-215-179-24.compute-1.amazonaws.com:/tmp/.auth
scp ./pipeline/build/docker-compose.yml ec2-user@ec2-3-215-179-24.compute-1.amazonaws.com:~
scp ./pipeline/deploy/publish.sh ec2-user@ec2-3-215-179-24.compute-1.amazonaws.com:/tmp/publish.sh
ssh ec2-user@ec2-3-215-179-24.compute-1.amazonaws.com "/tmp/publish.sh"
