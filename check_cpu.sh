## Garikai  Tachiwona -  e-IT ##############################################################
##2020-02-14  - Script for restarting  OAKD if CPU usage is high on Node0 & Node1 is Idle ##
####################################3#######################################################

#!/bin/bash

 Node1="192.168.110.129"
## Check CPU Usage via CPU Idleness
 #CPU=`top -b -n 1 |  grep "Cpu" |  awk  '{print $5}' | cut -f 1 -d %`
 Node0_CPU=`top -b -n 1 |  grep "Cpu" |  awk  '{print $8}' | cut -f 1 -d % | xargs printf '%.0f\n'`
 Node1_CPU=`ssh 192.168.110.129 'bash -s' < cpu_check.sh`

## Convert CPU Idleness number to integer
 echo  "Node0 CPU_Usage is $Node0_CPU"
 echo  "Node1 CPU_Usage is $Node1_CPU"

 Node0_Master_Mode=`oakcli show ismaster |  cut -d " " -f 4`
 echo  "Node0 in $Node0_Master_Mode mode"
 
 case $Node0_Master_Mode in

   Master)
        if [ $Node0_CPU -lt 2 -a $Node1_CPU -gt 20 ]
           then
              echo -e "oakcli restart oak"
              echo -e "oak restarted on `hostname`"
           else 
	      echo "Doing Nothing Node0"	   
	fi
        ;;

   Slave)
        if [ $Node1_CPU -lt 2 -a $Node0_CPU -gt 20 ]
           then
              echo -e "CPU Usage on Node1 is High. Moving OAKD to Node 0"
	      ssh 192.168.110.129 "oakcli restart oak"
           else
	      echo "Doing Nothing on Node1"	   
	fi      
        ;;
  esac

