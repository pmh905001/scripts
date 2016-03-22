#! /bin/bash

#Main script, upload file to bench (3,136.143.14), would call no-password.sh as expect script.
#usage: $0 <fileToUpload> [IP]

if [[ $# == 0 ]]
	then
		echo "$0 \<fileToUpload\> \[IP\]"
		exit
fi

if [[ $# == 1 ]]
	then
		ip=3.136.143.29
fi

if [[ $# == 2 ]]
        then
	        if [[ $2 == *.*.*.* ]]
			then
				ip=$2
			else
				ip="3.136.143.$2"
		fi
fi

currentShellPath=$(cd `dirname $0`; pwd)
$currentShellPath/scp-iserver.excpect $1 $ip
