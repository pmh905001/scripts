#! /bin/bash

kilall

# un-intall i18n
rpm -qa | grep iui_ | while read line
do
	if [[ $line == *error* ]]
		then
			cd $1
			existI18n=`ls -l *error* | wc -l`
			if [ $existI18n == 1 ]
				then 
					echo "rpm -e ${line}"
					#rpm -e ${line}
				else
					echo "Not exist i18n rpm"
			fi
	fi
done


# un-install iui
rpm -qa | grep iui_ | while read line
do
	if [[ $line != *error* && $line != *protocoldb* ]]
		then
			cd $1
                        existIUI=`ls -l *iui_iDR* | wc -l`
                        if [ $existIUI == 1 ]
                                then
					echo "rpm -e ${line}"
                        		rpm -e ${line}
                                else
                                        echo "Not exist iui rpm"
                        fi
        fi
done


# un-intall dm
rpm -qa | grep dm_ | while read line
do
        if [[ $line == *dm* ]]
                then
			cd $1
                        existDM=`ls -l *dm* | wc -l`
                        if [ $existDM == 1 ]
                                then
					 echo "rpm -e ${line}"
                       			 rpm -e ${line}
                                else
                                        echo "Not exist dm rpm"
                        fi
        fi
done


# un-intall cse
rpm -qa | grep cse_ | while read line
do
        if [[ $line == *cse_* ]]
                then
			cd $1
                        existCSE=`ls -l *cse* | wc -l`
                        if [ $existCSE == 1 ]
                                then
                                         echo "rpm -e ${line}"
                                         rpm -e ${line}
                                else
                                        echo "Not exist cse rpm"
                        fi			
        fi
done




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
