#!/bin/bash
# iterating through multiple directories

for file in ./.b* ./badtest
do
	if [ -d "$file" ]
	then
		echo "$file is directory"
	elif [ -f "$file" ]
	then
		echo "$file is a file"
	else
		echo "$file doesn't exist"
	fi
done
