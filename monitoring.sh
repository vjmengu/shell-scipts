#!/bin/bash

disk=$(df -hT | grep xfs)
limit=5




msg=""

while read -r line
do
    Diskusage=$(echo $line | awk -F " " '{print $6F}'|cut -d "%" -f1)
    Partion=$(echo $line | awk -F " " '{print $NF}')
    if [ "$Diskusage" -ge "$limit" ]
    then
        msg+= "the partion :: $Partion has memory $Diskusage \n"
    fi
done <<< $disk

echo -e "$msg"