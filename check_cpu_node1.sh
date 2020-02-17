##2020-02-14  - Script for restarting  OAKD if CPU usage is high on Node0
########################################################################
#!/bin/bash
## Check CPU Usage via CPU Idleness
 #CPU=`top -b -n 1 |  grep "Cpu" |  awk  '{print $5}' | cut -f 1 -d %`
 top -b -n 1 |  grep "Cpu" |  awk  '{print $8}' | cut -f 1 -d % | xargs printf '%.0f\n'
