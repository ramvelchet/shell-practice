#!/bin/bash

USERID=$(id -u)

if [$USERID -NE 0]; then
    echo "ERROR:: Please run this script with root privelage"
    exit 1
fi

dnf install mysql -y

if [$? -ne 0]; then
    echo "ERROR:: Installing MySQl is FAILURE"
    exit 1
else 
    echo "installing MySQl is SUCCESS"
fi