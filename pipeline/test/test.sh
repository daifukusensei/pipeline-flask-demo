#!/bin/bash

echo "**************************************"
echo "********** Testing new code **********"
echo "**************************************"

docker-compose -f src/docker-compose.yml up -d
docker exec -i web python < pipeline/test/test.py
docker-compose -f src/docker-compose.yml stop
