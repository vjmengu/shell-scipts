#!/bin/bash
mkdir -p /home/ec2-user/logs
Log_Folder="/home/ec2-user/logs"
TimeStamp=$(date +%Y-%m-%d-%H-%M-%S)
Log_File=$(echo $0 | cut -d "." -f1)
FileName="$Log_Folder/$Log_File-$TimeStamp.log"

R="\e[31m"
Y="\e[32m"
G="\e[33m"
N="\e[0m"

echo -e "I am $R RED $N" &>>$FileName
echo -e "I am $G GREEN $N" &>>$FileName
echo -e "I am $Y Yellow $N" &>>$FileName