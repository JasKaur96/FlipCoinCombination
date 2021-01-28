#!/bin/bash 

flips=0

function singlet(){
while [[ $flips -lt 10 ]]
do
   coin=$((RANDOM%2))
   if [[ $coin -eq 1 ]]
        then
	echo "H"
       	h=$(($h+1))
	h1="H"
        arr[flips]=$h1

   else
	echo "T"
       	t=$(($t+1))
        t1="T"
	arr[flips]=$t1

   fi
   flips=$(($flips+1))
	
done     
echo "$flips flips $h heads $t tails "
headPercentage=`awk "BEGIN { print ($h/$flips)*100 }"`
tailPercentage=`awk "BEGIN { print ($t/$flips)*100 }"`
echo "Singlet Array: ${arr[@]}"
declare -A arr1=( ["H"]=$headPercentage ["T"]=$tailPercentage )
echo ${!arr1[*]} 
echo ${arr1[*]}
winner ${arr1[*]}

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
echo "Doublet Array: ${arr[@]}"
declare -A arr2=( ["HH"]=$hhPercentage ["TT"]=$ttPercentage ["HT"]=$htPercentage ["TH"]=$thPercentage )
echo ${!arr2[*]}
echo ${arr2[*]}
winner ${arr2[@]}

}
function triplet(){
flips=0
while [[ $flips -lt 10 ]]
do
   coin1=$((RANDOM%2))
   coin2=$((RANDOM%2))
   coin3=$((RANDOM%2))

   
   if [[ $coin1 -eq 1 && $coin2 -eq 1  && $coin3 -eq 1 ]]
        then
        echo "HHH"
        hhh=$(($hhh+1))
        hhh1="HHH"
        arr[flips]=$hhh1
   elif [[ $coin1 -eq 1 && $coin2 -eq 1  && $coin3 -eq 0 ]]
   then
	echo "HHT"
        hht=$(($hht+1))
        hht1="HHT"
        arr[flips]=$hht1
    elif [[ $coin1 -eq 1 && $coin2 -eq 0  && $coin3 -eq 0 ]]
        then
	echo "HTT"
        htt=$(($htt+1))
        htt1="HTT"
        arr[flips]=$htt1
   elif [[ $coin1 -eq 0 && $coin2 -eq 0  && $coin3 -eq 0 ]]
        then
	echo "TTT"
        ttt=$(($ttt+1))
        ttt1="TTT"
        arr[flips]=$ttt1
    elif [[ $coin1 -eq 0 && $coin2 -eq 0  && $coin3 -eq 1 ]]
        then
	echo "TTH"
        tth=$(($tth+1))
        tth1="TTH"
        arr[flips]=$tth1
   elif [[ $coin1 -eq 0 && $coin2 -eq 1  && $coin3 -eq 1 ]]
        then
	echo "THH"
        thh=$(($thh+1))
        thh1="THH"
        arr[flips]=$thh1
   elif [[ $coin1 -eq 1 && $coin2 -eq 0  && $coin3 -eq 1 ]]
        then
	echo "HTH"
        hth=$(($hth+1))
        hth1="HTH"
        arr[flips]=$hth1

   else
	echo "THT"
        tht=$(($tht+1))
        tht1="THT"
        arr[flips]=$tht1
   fi
   flips=$(($flips+1))

done
echo "$flips flips $hhh-HHH $ttt-TTT $hht-HHT $tth-TTH $htt-HTT $tht-THT $hth-HTH $thh-THH  "
hhhPercentage=`awk "BEGIN { print ($hhh/$flips)*100 }"`
tttPercentage=`awk "BEGIN { print ($ttt/$flips)*100 }"`
hhtPercentage=`awk "BEGIN { print ($hht/$flips)*100 }"`
tthPercentage=`awk "BEGIN { print ($tth/$flips)*100 }"`
thhPercentage=`awk "BEGIN { print ($thh/$flips)*100 }"`
httPercentage=`awk "BEGIN { print ($htt/$flips)*100 }"`
hthPercentage=`awk "BEGIN { print ($hth/$flips)*100 }"`
thtPercentage=`awk "BEGIN { print ($tht/$flips)*100 }"`
echo "Doublet Array: ${arr[@]}"
declare -A arr3=( ["HHH"]=$hhhPercentage ["TTT"]=$tttPercentage ["HHT"]=$hhtPercentage ["HTT"]=$httPercentage ["THH"]=$thhPercentage ["TTH"]=$tthPercentage ["THT"]=$thtPercentage ["HTH"]=$hthPercentage )
echo ${!arr3[*]}
echo ${arr3[*]}

winner ${arr3[@]}
}

function winner(){
  local arr1=$1
  local arr2=$2
  local arr3=$3
  echo ${arr1[*]}
  echo ${arr2[*]}
  echo ${arr3[*]}
  for (( i=0; i<10; i++ ))
  do
    for (( j=i; j<10; j++ ))
    do
	if [[ arr1[i] -lt arr1[j] ]]
	then
	temp=${arr[i]}
	${arr1[i]}=${arr[j]}
	${arr1[j]}=$temp
	fi
    done
  done 
  echo "Sorted Singlet Array: ${arr1[*]}"
}


singlet
doublet
triplet
