#!/bin/bash
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
Validate(){
if [ $1 -ne 0 ]
then
    dnf install $2 -y
    if [ $1 -ne 0 ]
    then
        echo "$2...$R failure!"
        exit 1
    else
        echo "$2...$G Sucess!"
    fi
else
    echo "$2 already $Y installed"
fi
}
if [ $USERID -ne 0 ]
then
    echo "you need sudo access to install a package"
    exit 1
fi

dnf list installed mysql-server
Validate $? "mysql-server"


dnf list installed nginx
Validate $? "nginx"

