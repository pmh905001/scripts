#!/usr/bin/expect  -f


if {$argc<1} {
	set path "/vob_store2/pmh/"
} else {
	set path [lindex $argv 0]
}

spawn ./2-cc.sh $path
expect "fz027757@3.204.29.140's password:"

send "ge123\r"

#expect eof
#exit
#sleep 10
interact
