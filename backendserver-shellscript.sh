#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "need sudo access to execute this script"
    exit 1
else
    dnf list installed nodejs
    if [ $? -ne 0 ]
    then
        dnf module disable nodejs -y
        dnf module enable nodejs:20 -y
        dnf install nodejs -y
        if [ $? -ne 0 ]
        then
            echo "nodejs not installed"
            exit 1
        else
            echo "nodejs installed"
        fi
    else
        echo "nodejs already installed"
    fi
fi
useradd expense
rm -rf /app
mkdir /app
curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip
cd /app
unzip /tmp/backend.zip
npm install
cp /home/ec2-user/shell-scipts/backend.service /etc/systemd/system/backend.service
systemctl daemon-reload
systemctl start backend
systemctl enable backend
dnf install mysql -y
mysql -h 172.31.95.140 -uroot -pExpenseApp@1 < /app/schema/backend.sql
systemctl restart backend