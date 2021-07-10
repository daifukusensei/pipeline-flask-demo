#!/bin/bash

echo "**************************************"
echo "********** Testing new code **********"
echo "**************************************"

docker exec -i web python < test.py
