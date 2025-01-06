#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "need sudo access to execute this script"
    exit 1
else
    dnf list installed mysql-server
    if [ $? -ne 0 ]
    then
        dnf install mysql-server -y
        if [ $? -ne 0 ]
        then
            echo "mysql-server not installed"
            exit 1
        else
            echo "mysql-server installed"
        fi
    else
        echo "mysql-sever already installed"
    fi
fi

systemctl start mysqld
systemctl enable mysqld
mysql_secure_installation --set-root-pass ExpenseApp@1
