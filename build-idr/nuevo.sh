#! /bin/csh

#ct setview cse_cots_integ

/vobs/nuevo/cots/config/cleanView.sh

cd $1

#wget -c http://thesource.gso.med.ge.com/release/suites/CSERelease_4_4/RFV1_V7/PCRS_CSERelease_4_4_RFV1_V7/dashboard/cserelease.tar.gz
#wget -c http://thesource.gso.med.ge.com/release/suites/CSERelease_4_4/RFV1_V7/PCRS_CSERelease_4_4_RFV1_V7/dashboard/cserelease-src.tar.gz

tar -xzvf cserelease.tar.gz -C /vobs/nuevo/Integration/CSERelease/
#rm -f cserelease.tar.gz
/vobs/nuevo/cots/config/removeUnusedComponent.sh


rm -f  /vobs/nuevo/Integration/CSERelease/200.nuevo/automation/*.rpm


#7. Edit /vobs/nuevo/Integration/CSERelease/200.nuevo/install.sh to comment the line where password adw2.0 was added. (Temporary workaround untill CSE delivers fix.)
#sed -i 's/echo adw2\.0 \| passwd \-\-stdin \$CRS_USER/\#/g' /vobs/nuevo/Integration/CSERelease/200.nuevo/install.sh
sed -i 's/echo adw2\.0 . passwd \-\-stdin \$CRS_USER/\#echo adw2\.0 \| passwd \-\-stdin \$CRS_USER/g' /vobs/nuevo/Integration/CSERelease/200.nuevo/install.sh

#Edit /vobs/nuevo/Integration/CSERelease/install_all.sh , add XR.xml to CONFIG variable, as below.
sed -i 's/CONFIG\=\" \"/CONFIG\=\"XR\.xml\"/g' /vobs/nuevo/Integration/CSERelease/install_all.sh

#11. Go to the src-dist/ under the CSE release link.
#  -Download DMF.bld.tar.gz and TERRAUTIL.bld.tar.gz to your local machine (Each of these contains lib, lib64 and include 
#       folders <files> required as compile-time dependency)
rm -fr ./workspace
mkdir ./workspace
tar -xzvf cserelease-src.tar.gz -C ./workspace/
#rm -f cserelease-src.tar.gz

rm -fr ./lib-lib64-include
mkdir ./lib-lib64-include


tar -xzvf ./workspace/DMF.bld.tar.gz -C ./lib-lib64-include/
tar -xzvf ./workspace/TERRAUTIL.bld.tar.gz -C ./lib-lib64-include/



rm -f ./lib-lib64-include/lib/libJdmf.so
rm -f ./lib-lib64-include/lib/libJterrautil.so
rm -f ./lib-lib64-include/lib/libdmfvalidate.so
rm -f ./lib-lib64-include/lib/libvalidator.so


rm -f ./lib-lib64-include/lib64/libJdmf.so
rm -f ./lib-lib64-include/lib64/libJterrautil.so
rm -f ./lib-lib64-include/lib64/libdmfvalidate.so
rm -f ./lib-lib64-include/lib64/libvalidator.so

mkdir ./lib-lib64-include/jars
tar -xzvf ./workspace/apd.tar.gz jar/apd.jar -O > ./lib-lib64-include/jars/apd.jar
tar -xzvf ./workspace/apd.tar.gz jar/translator.jar -O > ./lib-lib64-include/jars/translator.jar
tar -xzvf ./workspace/PTK.bld.tar.gz jar/ptk2.jar -O > ./lib-lib64-include/jars/ptk2.jar
tar -xzvf ./workspace/XJT.bld.tar.gz jar/gljami.jar -O > ./lib-lib64-include/jars/gljami.jar
tar -xzvf ./workspace/XJT.bld.tar.gz jar/idc.jar -O > ./lib-lib64-include/jars/idc.jar
tar -xzvf ./workspace/XJT.bld.tar.gz jar/jami.jar -O > ./lib-lib64-include/jars/jami.jar
tar -xzvf ./workspace/XJT.bld.tar.gz jar/tap.jar -O > ./lib-lib64-include/jars/tap.jar
tar -xzvf ./workspace/XJT.bld.tar.gz jar/xpv.jar -O > ./lib-lib64-include/jars/xpv.jar
tar -xzvf ./workspace/XJT.bld.tar.gz jar/jip.jar -O > ./lib-lib64-include/jars/jip.jar
tar -xzvf ./workspace/XJT.bld.tar.gz jar/jnu.jar -O > ./lib-lib64-include/jars/jnu.jar
tar -xzvf ./workspace/csys.tar.gz csys.jar -O > ./lib-lib64-include/jars/csys.jar
tar -xzvf ./workspace/csys.tar.gz csysIF.jar -O > ./lib-lib64-include/jars/csysIF.jar
tar -xzvf ./workspace/WF.bld.tar.gz wf/jars/diwf.jar -O > ./lib-lib64-include/jars/diwf.jar
tar -xzvf ./workspace/mwl.bld.tar.gz jar/diwfmodwl.jar -O > ./lib-lib64-include/jars/diwfmodwl.jar
tar -xzvf ./workspace/JAVA3P.bld.tar.gz 3pjar/jdt.jar -O > ./lib-lib64-include/jars/jdt.jar
tar -xzvf ./workspace/NUEVO.bld.tar.gz jar/nvo-sessions.jar -O > ./lib-lib64-include/jars/nvo-sessions.jar
tar -xzvf ./workspace/NUEVO.bld.tar.gz jar/nvo-config.jar -O > ./lib-lib64-include/jars/nvo-config.jar
tar -xzvf ./workspace/NUEVO.bld.tar.gz jar/nvo-er.jar -O > ./lib-lib64-include/jars/nvo-er.jar
tar -xzvf ./workspace/NUEVO.bld.tar.gz jar/nvo-framework.jar -O > ./lib-lib64-include/jars/nvo-framework.jar
tar -xzvf ./workspace/NUEVO.bld.tar.gz jar/nvo-util.jar -O > ./lib-lib64-include/jars/nvo-util.jar
tar -xzvf ./workspace/diiface.tar.gz diiface.jar -O > ./lib-lib64-include/jars/diiface.jar
tar -xzvf ./workspace/NUEVO.bld.tar.gz jar/nvo-extensions.jar -O > ./lib-lib64-include/jars/nvo-extensions.jar
tar -xzvf ./workspace/XJT.bld.tar.gz jar/xjt.jar -O > ./lib-lib64-include/jars/xjt.jar
tar -xzvf ./workspace/ea3_linux-java7_dev.tar.gz ea3/jar/ea3.jar -O > ./lib-lib64-include/jars/ea3.jar
tar -xzvf ./workspace/eat_linux-java7_dev.tar.gz eat/jar/eat.jar -O > ./lib-lib64-include/jars/eat.jar

chmod  774 ./lib-lib64-include/jars/*.jar

cp -r ./lib-lib64-include/* /vobs/nuevo/Integration/


#/vobs/nuevo/cots/config/integrateCSE.sh

#exit

