#!/bin/bash
output=$(git status | grep modified | awk '{print $2}')
for elem in $output
do 
	echo "Adding "  $elem
	git add $elem
done 