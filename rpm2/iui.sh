#! /bin/bash

#kilall

# un-intall i18n
rpm -qa | grep iui_ | while read line
do
	if [[ $line == *error* ]]
		then
			echo "rpm -e ${line}"
	fi
done


# un-install iui
rpm -qa | grep iui_ | while read line
do
	if [[ $line != *error* && $line != *protocoldb* ]]
		then
                        echo "rpm -e ${line}"
        fi
done

#install iui
ll /root/Downloads/new-step35-from-youlu | while read line
do

        if [[ $line != *error* && $line != *protocoldb* && $line == *iui* ]]
                then
			rpmToIntall=`echo $line |  awk  '{print $9}'`
			echo "rpm -ivh ${rpmToIntall}"
        fi

done


#install i18n
ll /root/Downloads/new-step35-from-youlu | while read line
do

        if [[ $line == *error* ]]
                then
                        rpmToIntall=`echo $line |  awk  '{print $9}'`
                        echo "rpm -ivh ${rpmToIntall}"
        fi

done
