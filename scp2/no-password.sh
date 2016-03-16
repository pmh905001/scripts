#!/usr/bin/expect  -f
#!/c/daily-tasks/software/cygwin/bin/expect


set uploadFile [lindex $argv 0]

spawn ./scp2.sh $uploadFile
expect "root@3.136.143.14's password:"

send "#superxr\r"

#expect eof
#exit
#sleep 10
interact
