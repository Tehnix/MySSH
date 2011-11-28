#!/usr/bin/expect

# Get arguments
set arg1 [lindex $argv 0]

# Our pretty ascii vars :D
set conf_loggedin "
,-------------------------------------------------------,
|                You are now logged in !                |
`-------------------------------------------------------´
"

# Set server vars: {name username server password}
set conlist {
             "callName1" "username1" "serverIP1" "password1" 
             "callName2" "username2" "serverIP2" "password2" 
            }

foreach {n u s p} $conlist {
    if {"$arg1" == $n} {
        spawn ssh $u\@$s
        expect "password:"
        send -- "$p\r"
        send_user -- "$conf_loggedin"
        interact
    }
}

if {"$arg1" == "names" | "$arg1" == "help"} {
    send_user -- "
,-------------------------------------------------------,
| Names        Servers                                  |
`-------------------------------------------------------´
"
    foreach {n u s p} $conlist {
        send_user -- "| $n        $u\@$s                                  
`-------------------------------------------------------´
"
    }
}
if {"$arg1" == "edit"} {
    send_user -- "
,-------------------------------------------------------,
|               Editing mssh file                       |
`-------------------------------------------------------´
"
    spawn bash 
    send "vi /usr/local/mssh/mssh.tcl\r"
    interact
}