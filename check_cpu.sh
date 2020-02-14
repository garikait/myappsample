#!/bin/bash

CPU=`top -b -n 1 |  grep "Cpu" |  awk  '{print $8}'`
High_CPU=`printf '%.0f\n' $CPU`
echo  "CPU_Usage is $High_CPU"
host=$(hostname)
if [ "$High_CPU" -gt  60 ]
then
#	master=$(oakcli show ismaster)
	master=$1
	if echo "$master" | grep 'Master'; then
		echo  -e “ Restarting Oak: oakcli restart oak” 
		   else if "$master" | grep 'Slave'; then 
			     echo "OAKD running in risingsun1"
			        fi
				   fi
				    fi
