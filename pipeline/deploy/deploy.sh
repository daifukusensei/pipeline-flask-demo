#!/bin/bash

echo "**************************************"
echo "** Deploying Docker image to target **"
echo "**************************************"

echo daifukusensei/flask-demo > /tmp/.auth
echo $BUILD_NUMBER >> /tmp/.auth

scp -i /var/jenkins_home/.ssh/jenkins /tmp/.auth ec2-user@ec2-3-238-70-144.compute-1.amazonaws.com:/tmp/.auth
scp -i /var/jenkins_home/.ssh/jenkins ./pipeline/build/docker-compose.yml ec2-user@ec2-3-238-70-144.compute-1.amazonaws.com:~
scp -i /var/jenkins_home/.ssh/jenkins ./pipeline/deploy/publish.sh ec2-user@ec2-3-238-70-144.compute-1.amazonaws.com:/tmp/publish.sh
ssh -i /var/jenkins_home/.ssh/jenkins ec2-user@ec2-3-238-70-144.compute-1.amazonaws.com "/tmp/publish.sh"
