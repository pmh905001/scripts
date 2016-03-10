#! /bin/bash

if [[ $# == 0 ]]
        then
	        echo "Should input the absolutely path as the first parameter"
		echo "Uage $0 absolutelyPath"
	        exit 1
fi

kilall

# un-intall i18n
installedRpm=`rpm -qa | grep iui_idr_errorinhibit.* -c `
	if [[ $installedRpm == 1 ]]
		then
			cd $1
			existI18n=`ls -l *error* | wc -l`
			if [ $existI18n == 1 ]
				then 
					echo "rpm -e `rpm -qa | grep iui_idr_errorinhibit.*`"
					rpm -e `rpm -qa | grep iui_idr_errorinhibit.*`
				else
					echo "Not exist i18n rpm"
			fi
	fi


# un-install iui
installedRpm=`rpm -qa | grep iui_iDR | grep -vc protocoldb`
	if [[ $installedRpm == 1 ]]
		then
			cd $1
                        existIUI=`ls -l *iui_iDR* | wc -l`
                        if [ $existIUI == 1 ]
                                then
					echo "rpm -e `rpm -qa | grep iui_iDR | grep -v protocoldb`"
                        		rpm -e `rpm -qa | grep iui_iDR | grep -v protocoldb`
                                else
                                        echo "Not exist iui rpm"
                        fi
        fi


# un-intall dm
installedRpm=$(rpm -qa | grep dm_ -c)
        if [[ $installedRpm == 1 ]]
                then
			cd $1
                        existDM=`ls -l *dm* | wc -l`
                        if [ $existDM == 1 ]
                                then
					 echo "rpm -e $(rpm -qa | grep dm_)"
                       			 rpm -e $(rpm -qa | grep dm_)
                                else
                                        echo "Not exist dm rpm"
                        fi
        fi


# un-intall cse
installedRpm=$(rpm -qa | grep cse_ -c)
        if [[ $installedRpm == 1 ]]
                then
			cd $1
                        existCSE=`ls -l *cse* | wc -l`
                        if [ $existCSE == 1 ]
                                then
                                         echo "rpm -e $(rpm -qa | grep cse_)"
                                         rpm -e $(rpm -qa | grep cse_)
                                else
                                        echo "Not exist cse rpm"
                        fi			
        fi




#install cse
cd $1
ls -l *.rpm | while read line
do

        if [[ $line == *cse_* ]]
                then
                        rpmToIntall=`echo $line |  awk  '{print $9}'`
                        echo "rpm -ivh ${rpmToIntall}"
			rpm -ivh ${rpmToIntall}


			echo "cd /CSERelease"
			cd /CSERelease
			echo "./install_all.sh"
			./install_all.sh
			echo "cd ${1}"
			cd ${1}			
        fi

done

#install dm
cd $1
ls -l *.rpm | while read line
do

        if [[ $line == *dm_* ]]
                then
                        rpmToIntall=`echo $line |  awk  '{print $9}'`
                        echo "rpm -ivh ${rpmToIntall}"
			rpm -ivh ${rpmToIntall}
        fi

done



#install iui
cd $1
ls -l *.rpm | while read line
do

        if [[ $line != *error* && $line != *protocoldb* && $line == *iui* ]]
                then
			rpmToIntall=`echo $line |  awk  '{print $9}'`
			echo "rpm -ivh ${rpmToIntall}"
			rpm -ivh ${rpmToIntall}
        fi

done


#install i18n
cd $1
ls -l *.rpm | while read line
do

        if [[ $line == *error* ]]
                then
                        rpmToIntall=`echo $line |  awk  '{print $9}'`
                        echo "rpm -ivh ${rpmToIntall}"
			rpm -ivh ${rpmToIntall}
        fi

done


rpm -qa | grep iui_
rpm -qa | grep dm_
rpm -qa | grep cse_


echo "Don't forgot to clear the cache of chromium browser!"

existCSEFile=`ls -l *cse*.rpm | wc -l`
if [[ $existCSEFile == 1 ]]
	then
        	read -p "do you want to reboot system?(y/n) : " wantToReboot
	        if [[ $wantToReboot == y ]]
		        then
                        	reboot
                        fi
fi
