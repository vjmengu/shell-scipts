#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "You are not a sudo user, you can not execute the script"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "installing mysql...FAILURE"
        exit 1
    else
        echo "installing mysql...SUCCESS"
    fi
else
    echo "mysql is already....INSTALLED"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "installing git....FAILURE"
        exit 1
    else
        echo "installing git...SUCESS"
    fi
else
    echo "git is already...INSTALLED"
fi