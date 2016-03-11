# /bin/bash

if [[ $# == 0 ]]
        then
	        iserverIP=3.136.143.29
        else
        	iserverIP=$1
fi

currentShellPath=$(cd `dirname $0`; pwd)
parentPath=$(dirname $currentShellPath)
grandfatherPath=$(dirname $parentPath)

$currentShellPath/prepare-scripts.sh

scp -r $grandfatherPath/tmp/scripts/ root@$iserverIP:/root/Downloads/
rm -frv $grandfatherPath/tmp/
