#!/bin/bash
Num1=$1
Num2=$2
Timestamp=$(date)
echo "execution started at:: $Timestamp"
Sum=$($Num1+$Num2)
echo "addition of $Num1 and $Num2 is :: $Sum"