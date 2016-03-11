#! /bin/bash


currentShellPath=$(cd `dirname $0`; pwd)
parentPath=$(dirname $currentShellPath)
grandfatherPath=$(dirname $parentPath)

echo $parentPath
rm -fr $grandfatherPath/tmp/
mkdir -pv $grandfatherPath/tmp/

cp -r $parentPath $grandfatherPath/tmp/
cd  $parentPath $grandfatherPath/tmp/
rm -frv $grandfatherPath/tmp/scripts/.git

#find -name *.log -exec rm -fv {} / ; This way is error
find \( -name *.log -o -name *.cfg -o -name *.txt -o -name *.properties -o -name *.dyn \) -exec rm -fv {} \;
#find \( -name *.cfg -o -name *.txt \)
#find \(-name *.cfg -o -name *.txt\) This way is error

