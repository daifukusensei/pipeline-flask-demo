#!/bin/bash

echo "**************************************"
echo "********** Testing new code **********"
echo "**************************************"

echo "Building and launching containers on build server..."
pwd
docker-compose -f src/docker-compose.yml up -d

echo "Running tests in container..."
docker exec -i web python < pipeline/test/test.py
RCODE=$?

echo "Copy test results from container to build server..."
docker cp web:/code/test-reports pipeline/test/

echo "Stopping containers..."
docker-compose -f src/docker-compose.yml down

# exit with return code from completed tests
exit $RCODE
