#!/bin/bash

#DATE=$(date)

START_TIME=$(DATE +%S)

sleep 10 

END_TIME=$(date +%s)

TOTAL_TIME=$(($END_TIME-$START_TIME))
echo "timestamp executed: $TOTAL_TIME Seconds"