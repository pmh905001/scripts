#! /bin/bash

if [[ $# == 0 ]]
	then
		path=`pwd`
	else
		path=$1
fi

currentShellPath=$(cd `dirname $0`; pwd)
$currentShellPath/rpm2.sh $path
