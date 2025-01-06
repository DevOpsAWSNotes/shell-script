#!/bin/bash

USERID=$(id -u) # root user command which displays 0
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/var/logs/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

# functions

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo -e "$2 $R FAILURE"
        exit 1
    else
     echo -e "$2 $G SUCCESS"
    fi
}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to excute the script."
    exit 1 # stops the script if the erro found
fi

dnf list installed mysql>>$LOG_FILE
if [ $? -ne 0 ]
then
    dnf install mysql -y>>$LOG_FILE
    VALIDATE $? "Installing MySql..."
else
    echo -e "Mysql is already... $Y installed"
fi

