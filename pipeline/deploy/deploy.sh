#!/bin/bash

echo "**************************************"
echo "** Deploying Docker image to target **"
echo "**************************************"

cd pipeline/build/ && docker-compose up -d

#echo flask-demo > /tmp/.auth
#echo $BUILD_TAG >> /tmp/.auth
#echo $PASS >> /tmp/.auth

#scp /tmp/.auth vagrant@192.168.100.101:/tmp/.auth
#scp ./pipeline/deploy/publish.sh vagrant@192.168.100.101:/tmp/publish.sh
#ssh vagrant@192.168.100.101 "/tmp/publish.sh"
