#! /bin/bash

#Open a terminal
#su   //to change to superuser
#service ip
#	vi /magichome/xruser/config/IDC/Application/ConnectionPoint.cfg
#Scroll to the bottom,
#Update IP of detector, like below:
#iDR:
#{
#    eth0:
#    {
#        DetectorPanelId = "UNKNOWN";
#        DetectorType = "UNKNOWN";
#        Detector_HostPort  = 5550;
#        Detector_ImagePort = 6660;
#        DetectorIP = "3.136.143.17";                   #change to real eth1 ip and bcast
#        Detector_SysIP = "3.136.143.17";
#        BroadcastAddress = "3.136.143.255";
#        BroadcastPort = 8100;
#        BroadcastInterval = 2;
#        BroadcastTimeout = 20;
#        SystemPort  = 4500;
#        EthernetInterface = "eth0";
#    };
#}; 
#	vi /magichome/xruser/config/XRImDet.dyn
#Update CP_WIFI_1, like below:
#[CP_WIFI_1]
 
#DetcommMedium.Type = String
#DetcommMedium.Val = eth0
#PowerSupplyInfo.Type = String
#PowerSupplyInfo.Val = DCRegulated
#DetectorConnectionStrategy.Type = Number
#DetectorConnectionStrategy.Val = 0                     #change from 1 to 0
#DetectorConnectionType.Type = String
#DetectorConnectionType.Val = CONNECT_WIFI
#SupportedDetectorTypes.Type = StringList
#SupportedDetectorTypes.Val = { iDR }
#	vi /magichome/xruser/bin/start.magic
#Add these to the end:
 
#to start detsim
#sudo /magichome/xruser/detsim/bin/tablesim_iDR.sh
 
#	vi /magichome/xruser/bin/kilall
#Add these to the end:
 
#to kill detsim
#sudo /magichome/xruser/detsim/bin/kildetsim.sh
#	vi /magichome/xruser/install/detector_fw/iDR/VersionInfo.txt

#Change the content to 256f0612
#	Restart App
#Kilall;start.magic
#	when you see detector boots up successfully, execute this command:
#/magichome/xruser/bin/copyiDRCalFiles.sh


path1="ConnectionPoint.cfg"
path2="XRImDet.dyn"
path3="start.applications"
path4="kilall"
path5="VersionInfo.txt"

#path1="/magichome/xruser/config/IDC/Application/ConnectionPoint.cfg"
#path2="/magichome/xruser/config/XRImDet.dyn"
#path3="/magichome/xruser/bin/start.magic"
#path4="/magichome/xruser/bin/kilall"
#path5="/magichome/xruser/install/detector_fw/iDR/VersionInfo.txt"

existStr=`grep -c 'iDR:' $path1`
if [ $existStr == 1 ]
	then
		numberIDR=`grep 'iDR:' $path1 -n | awk -F: '{print $1}'`
		let num=numberIDR+8
		echo $path1 : $num
		
		#Just print the changed line
		#sed -n "${num}s/DetectorIP.*/DetectorIP = \"$1\";/pg" $path1
		sed -i "${num}s/DetectorIP.*/DetectorIP = \"$1\";/g" $path1

		let num=num+1
		echo $path1 : $num
		#sed -n "${num}s/Detector_SysIP.*/Detector_SysIP = \"$1\";/pg" $path1
		sed -i "${num}s/Detector_SysIP.*/Detector_SysIP = \"$1\";/g" $path1


		let num=num+1
		echo $path1 : $num
		#sed -n "${num}s/BroadcastAddress.*/BroadcastAddress = \"$2\";/pg" $path1
		sed -i "${num}s/BroadcastAddress.*/BroadcastAddress = \"$2\";/g" $path1
		
fi



existStr=`grep -c '\[CP_WIFI_1\]' $path2`
if [ $existStr == 1 ]
	then
		numberIDR=`grep '\[CP_WIFI_1\]' $path2 -n | awk -F: '{print $1}'`
		let num=numberIDR+7
		echo $path2 : $num
		#sed -n "${num}s/DetectorConnectionStrategy.Val = 1/DetectorConnectionStrategy.Val = 0/pg" $path2
		sed -i "${num}s/DetectorConnectionStrategy.Val = 1/DetectorConnectionStrategy.Val = 0/g" $path2
fi


existStr=`grep -c 'sudo /magichome/xruser/detsim/bin/tablesim_iDR.sh' $path3`
if [ $existStr == 0 ]
	then
		echo "$path3 : "
		#sed -n "$ a sudo /magichome/xruser/detsim/bin/tablesim_iDR.sh" $path3
		sed -i "$ a sudo /magichome/xruser/detsim/bin/tablesim_iDR.sh" $path3
fi


existStr=`grep -c 'sudo /magichome/xruser/detsim/bin/kildetsim.sh' $path4`
if [ $existStr == 0 ]
	then
		echo "$path4 : "
		#sed -n "$ a sudo /magichome/xruser/detsim/bin/kildetsim.sh" $path4
		sed -i "$ a sudo /magichome/xruser/detsim/bin/kildetsim.sh" $path4
fi

#256f0612
existStr=`grep -c '256f0612' $path5`
if [ $existStr == 0 ]
	then
		echo "$path5 : "
		sed -i "1 c 256f0612" $path5
fi



#Restart App
#Kilall;start.magic
#when you see detector boots up successfully, execute this command:
#/magichome/xruser/bin/copyiDRCalFiles.sh

