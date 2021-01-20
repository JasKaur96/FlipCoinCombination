#!/bin/bash -x

flips=0

while [[ $flips -lt 10 ]]
do
   coin=$((RANDOM%2))
   if [[ $coin -eq 1 ]]
        then
        echo "Heads"
	h=$(($h+1))
        else
        echo "Tails"
	t=$(($t+1))
	
   fi

   flips=$(($flips+1))
	
done     
echo "$flips flips $h h $t h"
  pHead=`awk "BEGIN { print ($h/$flips)*100 }"`
  
  percTail=`awk "BEGIN { print ($t/$flips)*100 }"`

	echo "$pHead% head"
	echo "$percTail% Tail"

