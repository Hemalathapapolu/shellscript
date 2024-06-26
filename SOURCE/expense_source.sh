#!/bin/bash
set -e
error(){
    echo " Error at $1: $2 "
}
    trap ' "failure at:$Lineno" "failure at:$bash_command" ' ERR  
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S) 
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$2 is  ....$R Failure $N"
        exit 1
    else
        echo -e "$2 is .. $G SUCCESS $N"
    fi
}
check_root() {
if [ $USERID -ne 0 ]
    then
        echo " Run with Root access"
        exit 1
    else
        echo "you are root user"
    fi
}