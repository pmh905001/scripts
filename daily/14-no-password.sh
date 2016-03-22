#!/usr/bin/expect  -f
#!/c/daily-tasks/software/cygwin/bin/expect

#Using expect script to upload file without inputing password .
#Usage: $0 <fileToUpload> <dirPathOfNoPasswordSh>

#set uploadFile [lindex $argv 0]
#set dirPath [lindex $argv 1]

spawn ssh root@3.136.143.14
expect "root@3.136.143.14's password:"
send "#superxr\r"
send "/database/pmh/daily/daily.sh\r"
send "exit\r"
expect eof
#exit
#sleep 10
#interact
