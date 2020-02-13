#!/bin/bash
echo -e "Checking is we should run this script\n====\n"
if [ -f count_week.txt ]; then week_number=`cat count_week.txt`; else week_number=1; fi
echo -e "This is week number  $week_number"
if [ $week_number -le 3 ]
   then 
       week_number=`expr $week_number + 1`
       echo "New Week Number is $week_number"
       echo -e "Run /root/scripts/vmbackup_to_risingsun.sh for week_1_to_3 Backup \n====\n"
       echo  $week_number > count_week.txt  
    else
       echo -e "Running /root/scripts/vmbackup_to_risingsun4.sh Week_4 Script \n====\n"
       echo 1 > count_week.txt 
fi

