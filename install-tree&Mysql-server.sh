#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "you need sudo access to install a package"
    exit 1
fi

dnf list installed tree
if [ $? -ne 0 ]
then
    dnf install tree -y
    if [ $? -ne 0 ]
    then
        echo "installing tree...failure!"
    else
        echo "installing tree...Sucess!"
else
    echo "tree already installed"
fi

dnf list installed mysql-server
if [ $? -ne 0 ]
then
    dnf install mysql-server -y
    if [ $? -ne 0 ]
    then
        echo "installing mysql-server...failure!"
    else
        echo "installing mysql-server...Sucess!"
else
    echo "mysql-server already installed"


