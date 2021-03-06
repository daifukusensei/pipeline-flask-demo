#!/bin/bash

echo "**************************************"
echo "********** Testing new code **********"
echo "**************************************"

echo "Launching containers on build server..."
docker-compose -f src/docker-compose.yml up -d

echo "Running tests in container..."
docker exec -i web python < pipeline/test/test.py
RCODE=$?

echo "Copying test results from container to build server..."
docker cp web:/code/test-reports pipeline/test/

echo "Stopping containers..."
docker-compose -f src/docker-compose.yml down

# exit with return code from completed tests
exit $RCODE
