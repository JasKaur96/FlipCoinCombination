#!/bin/bash -x

flips=0

function singlet(){
while [[ $flips -lt 10 ]]
do
   coin=$((RANDOM%2))
   if [[ $coin -eq 1 ]]
        then
        echo "Heads"
	h=$(($h+1))
	h1="H"
        arr[flips]=$h1

   else
        echo "Tails"
	t=$(($t+1))
        t1="T"
	arr[flips]=$t1

   fi
   flips=$(($flips+1))
	
done     
echo "$flips flips $h heads $t tails "
headPercentage=`awk "BEGIN { print ($h/$flips)*100 }"`
tailPercentage=`awk "BEGIN { print ($t/$flips)*100 }"`
echo "$headPercentage% head"
echo "$tailPercentage% Tail"

for KEY in "${arr[@]}";
do
   echo $KEY
done
echo "Singlet Array: ${arr[@]}"
}

function doublet(){
flips=0
while [[ $flips -lt 10 ]]
do
   coin1=$((RANDOM%2))
   coin2=$((RANDOM%2))

   if [[ $coin1 -eq 1 && $coin2 -eq 1 ]]
        then
        echo "HH"
        hh=$(($hh+1))
        hh1="HH"
        arr[flips]=$hh1

   elif [[ $coin1 -eq 0 && $coin2 -eq 0 ]]
	then
        echo "TT"
        tt=$(($tt+1))
        tt1="TT"
        arr[flips]=$tt1
    elif [[ $coin1 -eq 1 && $coin2 -eq 0 ]]
        then
	echo "HT"
        ht=$(($ht+1))
        ht1="HT"
        arr[flips]=$ht1

    else
        echo "TH"
        th=$(($th+1))
        th1="TH"
        arr[flips]=$th1

   fi
   flips=$(($flips+1))
done
echo "$flips flips $hh-HH $tt-TT $ht-HT $th-TH "
hhPercentage=`awk "BEGIN { print ($hh/$flips)*100 }"`
ttPercentage=`awk "BEGIN { print ($tt/$flips)*100 }"`
htPercentage=`awk "BEGIN { print ($ht/$flips)*100 }"`
thPercentage=`awk "BEGIN { print ($th/$flips)*100 }"`
echo "$hhPercentage% HH"
echo "$ttPercentage% TT"
echo "$hhPercentage% HT"
echo "$ttPercentage% TH"

for KEY in "${arr[@]}";
do
   echo $KEY
done
echo "Doublet Array: ${arr[@]}"

}

singlet
doublet
