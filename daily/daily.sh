#! /bin/bash

#test001
#test002
#test003
year=`date --date="+6 hour" +%Y`
month=`date --date="+6 hour" +%m`
today=`date --date="+6 hour" +%d`

mkdir -pv /database/pmh/daily/$year/$month/$today
