#! /bin/bash

#usage: $0 fileName


#date --date="+15 hour" +%Y%m%d
year=`date --date="+5 hour" +%Y`
month=`date --date="+5 hour" +%m`
today=`date --date="+5 hour" +%d`


scp -r $1 root@3.136.143.14:/database/pmh/daily/$year/$month/$today/
