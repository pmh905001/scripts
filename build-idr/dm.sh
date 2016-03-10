#! /bin/csh
#ct setview dm_view_pmh_016



/vobs/athenav2/src/config/install/createDelivery.sh -cleanview private
/vobs/athenav2/src/config/install/configureView.sh -pPLATFORM
source /vobs/athenav2/admin/bin/env.csh
cd /vobs/athenav2/src
imboot
make Makefiles
make source
make _release -j4;make _release

#We have the source compiled and ready for packaging. And now we do that
make programs
cd config/install
./createPackages.sh -createall
./createPackages.sh -platform
