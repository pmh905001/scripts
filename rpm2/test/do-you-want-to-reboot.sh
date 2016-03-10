#! /bin/bash

cd $1
existCSEFile=`ls -l *cse*.rpm | wc -l`
if [[ $existCSEFile == 1 ]]
        then
                read -p "do you want to reboot system?(y/n) : " wantToReboot
                if [[ $wantToReboot == y ]]
                        then
                                reboot
                        fi
fi

