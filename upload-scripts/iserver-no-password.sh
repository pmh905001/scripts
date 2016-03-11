#!/usr/bin/expect  -f
#!/c/daily-tasks/software/cygwin/bin/expect


if {$argc<1} {
	set ip "3.136.143.29"
} else {
	set ip [lindex $argv 0]
}

spawn ./2-iserver.sh $ip
expect "root@$ip's password:"

send "#superxr\r"

expect eof
exit
#sleep 10
#interact
