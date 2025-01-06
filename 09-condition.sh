#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 100] # -gt, -lt, -eq, -ge, -le
then
    echo "Given Number is greater than 100"
else
    echo "Given Number is less than 100"
fi