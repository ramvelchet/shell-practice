#!/bin/bash

NUMBER1=100
NUMBER2=200
NAME=Devops

SUM=$(($NUMBER1+$NUMBER2+$NAME))

echo "SUM is: ${SUM}"

LEADERS=("modi" "putin" "trudo" "trump")

echo "All Leaders: ${LEADERS[@]}"
echo "All Leaders: ${LEADERS[0]}"