#! /bin/csh
#ct setview dm_view_pmh_016

source /vobs/iui/scripts/rmprivateiui
source /vobs/iui/admin/bin/env.csh
source /vobs/iui/admin/bin/antenv.csh
antiui build-setup
source /vobs/iui/admin/bin/antsetup.csh
mkdir -pv /tmp/pmh/
antiuimaster iui-fluoro-full-build > /tmp/pmh/iui-build.log
antrpm build-fluoro-rpm  > /tmp/pmh/build2.log
antrpm build-errorinhibit-rpm

