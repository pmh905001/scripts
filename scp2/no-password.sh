#!/usr/bin/expect  -f
#!/c/daily-tasks/software/cygwin/bin/expect

#Using expect script to upload file without inputing password .
#Usage: $0 <fileToUpload> <dirPathOfNoPasswordSh>

set uploadFile [lindex $argv 0]
set dirPath [lindex $argv 1]

spawn $dirPath/scp2.sh $uploadFile
expect "root@3.136.143.14's password:"

send "#superxr\r"

#expect eof
#exit
#sleep 10
interact
