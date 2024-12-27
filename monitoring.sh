#!/bin/bash
Dmega=$(df -m --total | grep total | awk '{print $3}')
Dgb=$(df -h --total | grep total | awk '{print $2}')
wall "

    #Architecture: $(uname -a)
    #CPU physical: $(lscpu | grep "Socket(s):" | awk '{print $2}')
    #vCPU: $(nproc)
    #Memory Usage: $(free | grep "Mem" | awk '{printf "%.0f/%.0fMB (%d%%)", $3/1024, $2/1024, ($3/$2)*100}')
    #Disk Usage: $Dmega/$Dgb"b" $(df -h --total | grep total | awk '{print $5}')
    #CPU load: $(mpstat | grep "all" | awk '{printf "%.2f%%", 100 - $13}')
    #Last boot: $(who -b | awk '{print $3" "$4}')
    #LVM use: $(cat /etc/fstab | grep "mapper" | wc -l | awk '{if($1 >= "1") {printf("yes\n")} else {printf("no\n")}}')
    #Connection TCP: $(netstat -ant | grep ESTABLISHED | wc -l) ESTABLISHED 
    #User log: $(who| awk '{print $1}' | sort -u |wc -l)
    #Network: IP $(hostname -I)($(ip link show | grep ether | awk '{print $2}'))
    #Sudo: $(journalctl _COMM=sudo | grep COMMAND | wc -l)
"
