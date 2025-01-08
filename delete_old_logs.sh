#!/bin/bash
source_logs="/home/ec2-user"
mkdir -p /home/ec2-user/logs
log_path="/home/ec2-user/logs"
timestamp=$(date +%Y-%m-%d-%H-%M-%S)
file=$(echo $0|cut -d "." -f1)
file_name="$log_path/$file-$timestamp.log"

deletefiles=$(find $source_logs -name "*.log" -mtime +14)

while read -r file
do
    echo "deleting $file"
    rm -rf $file
done <<<$deletefiles

