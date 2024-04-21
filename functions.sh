#!/bin/bash
USERID=$(id -u)
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "$2 is Success"
    else
        echo "$2 is Failure"
}
if [ $USERID -ne 0 ]
then
    echo "Try with root access"
    exit 1
else
    echo "you are root user"

dnf install git -y
VALIDATE $? "installing git"
