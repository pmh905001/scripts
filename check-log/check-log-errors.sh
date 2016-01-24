#! /bin/bash

#ILD FAILED
#BUILD FAILURE
#COMPILATION ERROR

#grep 'BUILD FAILED' iui-003-fail.log --color=auto -n
#grep 'BUILD FAILURE' iui-003-fail.log --color=auto -n
#grep 'COMPILATION ERROR' iui-003-fail.log --color=auto -n

function checkOneKeyWord(){
#parameter 1: key word
#parameter 1: source file to search
	#echo kk,$1,$2
	grep "$1" $2 --color=auto -n
	let count=`grep -c "$1" $2`
	#echo $count
	return $count
}

if [ "$1" = "" ]
	then
		echo "Must input filePath"
		echo "usage: $0 filePath,e.g $0 iui-003-fail.log build"
		exit
fi

if [ "$2" = "" ]
then
	keyArr=("BUILD FAILED" "BUILD FAILURE" "COMPILATION ERROR")
else
	keyArr=($2)
fi


#filePath=iui-003-fail.log
filePath=$1
echo $1
for ((i=0;i<${#keyArr[@]};i++))
do
	#echo ${keyArr[$i]},$filePath
	key=${keyArr[$i]}
	#containsKeyWord=`checkOneKeyWord "${key}" $filePath`
	checkOneKeyWord "${key}" $filePath
	containsKeyWord=$?
	#echo hello,${containsKeyWord}
	if [ $containsKeyWord -ne 0  ]
		then			
			echo -e "\e[1;31m exist error \e[0m"
			exit					
	fi
done
