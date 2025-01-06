#!/bin/bash

USERID=$(id -u) # root user command which displays 0

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to excute the script."
    exit 1 # stops the script if the erro found
fi

dnf install mysqll -y

if [ $? -ne 0] # $? check the prevous command status 0 or 1 if 0 "success" 1 "not success"
then
    echo "Instaliing MySql... FAILURE"
    exit 1
else
    exit 1
    echo "Installing MySql... SUCCESS"
fi