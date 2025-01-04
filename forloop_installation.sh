#!/bin/bash
USERID=$(id -u)

LOGS_FOLDER="/var/log/shell-script-logs"
LOG_File=$(echo $0 | cut -d "." -f1)
Timestamp=$(date +%Y-%m-%d-%H-%M-%S)
LOG_File_Name="$LOGS_FOLDER/$LOG_File-$Timestamp.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
Validate(){
if [ $1 -ne 0 ]
then
    dnf install $2 -y &>>$LOG_File_Name
    if [ $? -ne 0 ]
    then
        echo -e "$2...$R failure!"
        exit 1
    else
        echo -e "$2...$G Sucess!"
    fi
else
    echo -e "$2 already $Y installed"
fi
}
if [ $USERID -ne 0 ]
then
    echo "you need sudo access to install a package"
    exit 1
fi

echo "script started executing:: $Timestamp" &>>$LOG_File_Name

for package in $@
do

dnf list installed $package &>>$LOG_File_Name
Validate $? "$package"
done



