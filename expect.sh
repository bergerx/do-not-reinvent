#!/usr/bin/expect --
# from http://stackoverflow.com/questions/5174813/use-expect-in-shell-script
# and http://wiki.tcl.tk/11583
# usage ./expect.sh pass command param1 param2
#exp_internal 1
set pass [lrange $argv 0 0]
set timeout -1
eval spawn [lrange $argv 1 end]
expect {
        assword {send $pass; expect "\r" ; exp_continue}
        yes/no {send "yes\r" ; exp_continue}
        eof exit
}
