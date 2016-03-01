#! /bin/bash

# Start the progress if the progress not exist. If already existed,do nothing.
# usage : start_progress_if_not_exist.sh key start_command

count=`ps -ef | grep $1 | grep -v "grep" | grep -v $0 | wc -l`
#ps -ef | grep "$1" | grep -v "grep"
#echo  $1
#ps -ef | grep "/magichome/xruser/engg/engg_ui" | grep -v "grep"
if [ $count == 0 ]
	then
		echo "will start progress"
		$2 &
	else
		echo "$count, already exist progress"
fi

