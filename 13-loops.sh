#!/bin/bash

USERID=$(id -u) # root user command which displays 0
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/logs/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

# functions

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo -e "$2 $R FAILURE $N"
        exit 1
    else
     echo -e "$2 $G SUCCESS $N"
    fi
}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to excute the script."
    exit 1 # stops the script if the erro found
fi

for package in $@
do
    dnf list installed $package &>>LOG_FILE_NAME
    if[ $? -ne 0 ]
    then
        dnf install $package &>>LOG_FILE_NAME
        VALIDATE $? "Install $package..."
    else
        echo -e "$package alredy...$Y installed $N" &>>LOG_FILE_NAME
    fi
done