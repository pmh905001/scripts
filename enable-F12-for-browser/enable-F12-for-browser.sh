#! /bin/bash

path1="/magichome/xruser/config/BrowserConstant.properties"
#diableF12Status = true

sed -i "s/diableF12Status = true/diableF12Status = false/g" $path1
