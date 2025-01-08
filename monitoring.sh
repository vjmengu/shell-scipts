#!/bin/bash

disk=$(df -hT | grep xfs)




msg=""

while read -r line
do
    Diskusage=$(echo $line | awk -F " " '{print $6F}'|cut -d "%" -f1)
    Partion=$(echo $line | awk -F " " '{print $NF}')
    if [ $line -ge 5 ]
    then
        msg+= "the partion :: $Partion has memory $line \n"
    fi
done <<< $disk

echo -e "$msg"