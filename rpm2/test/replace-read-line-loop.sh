#! /bin/bash

installedRpm=$(rpm -qa | grep iui_idr_errorinhibit.* -c)
        if [[ $installedRpm == 1 ]]
                then
                        cd $1
                        existI18n=`ls -l *error* | wc -l`
                        if [ $existI18n == 1 ]
                                then
                                        echo "existed i18n rpm"
                                        #rpm -e ${line}
                                else
                                        echo "Not exist i18n rpm"
                        fi
        fi


installedRpm=`rpm -qa | grep iui_iDR | grep -vc protocoldb`
        if [[ $installedRpm == 1 ]]
                then
                        cd $1
                        existIUI=`ls -l *iui_iDR* | wc -l`
                        if [ $existIUI == 1 ]
                                then
                                        echo "rpm -e ${line}"
                                        #rpm -e ${line}
                                else
                                        echo "Not exist iui rpm"
                        fi
        fi

