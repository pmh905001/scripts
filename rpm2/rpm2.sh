#! /bin/bash
        if [[ $1 == *iui* ]]
                then
                        echo "install iui"
			source ./iui.sh $2
        fi


        if [[ $1 == *all* ]]
                then
                        echo "install all"
                        source ./all.sh $2
        fi

