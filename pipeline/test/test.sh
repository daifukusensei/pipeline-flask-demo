#!/bin/bash

echo "**************************************"
echo "********** Testing new code **********"
echo "**************************************"

docker-compose -f src/docker-compose.yml up -d
docker exec -i web python < pipeline/test/test.py
RCODE=$?
docker-compose -f src/docker-compose.yml down
exit $RCODE
