#! /bin/bash

#Main script, upload file to bench (3,136.143.14), would call no-password.sh as expect script.
#usage: $0 <fileToUpload>


currentShellPath=$(cd `dirname $0`; pwd)
parentDir=$(dirname $currentShellPath)

$parentDir/daily/14-no-password.sh

$currentShellPath/no-password.sh $1 $currentShellPath
