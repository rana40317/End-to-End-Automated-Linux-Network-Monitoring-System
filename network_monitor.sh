#!/bin/bash

TARGET_FILE="network_monitor.csv"

LOG_FILE="network_monitor.log"

echo "***** Network Check : $(date) *****" > "$LOG_FILE"

while read website port
do
	#Get ping Output
	ping_output=$(ping -c 2 "$website" 2>/dev/null)

	if [ $? -eq 0 ]
	then
		latency=$(echo "$ping_output" | grep "rtt" | awk -F'/' '{print $5}' )

	        if nc -zv  "$website" "$port"  > /dev/null 2>&1
	        then
		    echo "$website:$port   is OPEN | Response Time: ${latency} ms"  >> "$LOG_FILE"
	         else
		     echo "$website:$port  is not CLOSED | Response Time: ${latency} ms"  >> "$LOG_FILE"
	         fi
else
	echo "$website is Down" >> "$LOG_FILE"
	
fi

done < "$TARGET_FILE"


echo "" >> "$LOG_FILE"

cat "$LOG_FILE"



















