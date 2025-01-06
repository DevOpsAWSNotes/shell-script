#!/bin/bash

USERID=$(id -u) # root user command which displays 0

# functions

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo "$2 FAILURE"
        exit 1
    else
     echo "$2 SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to excute the script."
    exit 1 # stops the script if the erro found
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing MySql..."
else
    echo "Mysql is already... installed"
fi

