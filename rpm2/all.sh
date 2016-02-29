#! /bin/bash

#kilall

# un-intall i18n
rpm -qa | grep iui_ | while read line
do
	if [[ $line == *error* ]]
		then
			echo "rpm -e ${line}"
			rpm -e ${line}
	fi
done


# un-install iui
rpm -qa | grep iui_ | while read line
do
	if [[ $line != *error* && $line != *protocoldb* ]]
		then
                        echo "rpm -e ${line}"
			rpm -e ${line}
        fi
done


# un-intall dm
rpm -qa | grep dm_ | while read line
do
        if [[ $line == *dm* ]]
                then
                        echo "rpm -e ${line}"
			rpm -e ${line}
        fi
done


# un-intall cse
rpm -qa | grep cse_ | while read line
do
        if [[ $line == *cse_* ]]
                then
                        echo "rpm -e ${line}"
			rpm -e ${line}
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
        fi

done

echo "cd /CSERelease"
cd /CSERelease

echo "./install_all.sh"
./install_all.sh

echo "cd ${1}"
cd ${1}



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
