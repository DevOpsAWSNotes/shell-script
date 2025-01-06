#!/bin/bash

USERID=$(id -u) # root user command which displays 0

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to excute the script."
    exit 1
fi

dnf install mysql -y