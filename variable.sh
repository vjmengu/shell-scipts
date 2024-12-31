#!/bin/bash
Num1=$1
Num2=$2
timestamp=$(date)
echo"execution started at:$timestamp"
SUM=$(($Num1+$Num2))
echo"the value of $Num1 and $Num2 is: $SUM"