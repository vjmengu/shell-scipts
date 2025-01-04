#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "you need sudo access to install a package"
    exit 1
fi

dnf list installed mysql-server
if [ $? -ne 0 ]
then
    dnf install mysql-server -y
    if [ $? -ne 0 ]
    then
        echo "installing mysql-serveree...failure!"
        exit 1
    else
        echo "installing mysql-server...Sucess!"
    fi
else
    echo "mysql-server already installed"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    dnf install nginx -y
    if [ $? -ne 0 ]
    then
        echo "installing nginx...failure!"
        exit 1
    else
        echo "installing nginx...Sucess!"
    fi
else
    echo "nginx already installed"
fi


