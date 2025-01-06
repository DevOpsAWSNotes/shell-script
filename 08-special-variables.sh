#!/bin/bash

echo "All Variables passed: $@"

echo "Number of Variables: $#"

echo "script name is: $0"

echo "Present working directory: $PWD"

echo "Home Dirctory of Current User: $HOME"

echo "Which user is running the script: $USER"

echo "Process id of current script: $$"

sleep 60 & # running foreground if & gives bacground

echo "Process id of last command in background: $!"