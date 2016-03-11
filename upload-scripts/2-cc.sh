#! /bin/bash

if [[ $# == 0 ]]
        then
	        uploadPath=/vob_store2/pmh/
        else
        	uploadPath=$1
fi

currentShellPath=$(cd `dirname $0`; pwd)
parentPath=$(dirname $currentShellPath)
grandfatherPath=$(dirname $parentPath)

$currentShellPath/prepare-scripts.sh

#scp -r $grandfatherPath/tmp/scripts/ fz027757@3.204.29.140:/homes/fz027757/
scp -r $grandfatherPath/tmp/scripts/ fz027757@3.204.29.140:$uploadPath
rm -frv $grandfatherPath/tmp/
