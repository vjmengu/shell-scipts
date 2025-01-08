#!/bin/bash


Diskusage=$(df -hT | grep xfs | awk -F " " '{print $6F}'|cut -d "%" -f1)

Partion=$(df -hT | grep xfs | awk -F " " '{print $NF}')

msg=""

while read -r line
do
    if [ $line -ge 5 ]
    then
        msg+= "the partion :: $Partion has memory $line"
    fi
done <<< $Diskusage

echo "$msg"