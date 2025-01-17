#!/bin/bash

destindir=$2
sourcedir=$1
tim=${3:-14}
timestamp=$(date +%Y-%m-%d-%H-%M-%S)

usage(){
    echo " backup.sh sourcedir destinationdir no.of day(optional) "
}

if [ $# -lt 2 ]
then
    usage
fi

if [ ! -d "$destindir" ]
then
    echo "invalid $destindir"
    usage
    exit 1
fi

if [ ! -d "$sourcedir" ]
then
    echo "invalid $sourcedir"
    usage
    exit 1
fi



files=$(find $sourcedir -name "*.log" -mtime +$tim)

if [ -n "$files" ]
then
    mkdir -p $destindir/backup
    x="$destindir/backup-$timestamp.log"
    echo "zipping $files"   
    find $sourcedir -name "*.log" -mtime +$tim  |zip -@ "$x"
    if [ -f "$x" ]
    then
        echo "sucessfully created zip file check on $destindir"
        while read -r ff
        do
            echo "deleting $ff"
            rm -rf $ff
        done <<<$files
    else
        echo "zipping failed vj!"
        exit 1
    fi
else
    echo "no older files than $tim"
fi


