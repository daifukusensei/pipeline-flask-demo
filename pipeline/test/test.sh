#!/bin/bash

echo "**************************************"
echo "********** Testing new code **********"
echo "**************************************"

# launch containers
docker-compose -f src/docker-compose.yml up -d

# run tests and get return code
docker exec -i web python < pipeline/test/test.py
RCODE=$?

# copy test results from container to build server
docker cp web:/code/test-reports pipeline/test/

# bring down containers and remove associated image(s) from build server
docker-compose -f src/docker-compose.yml down --rmi all

# exit with return code from completed tests
exit $RCODE
