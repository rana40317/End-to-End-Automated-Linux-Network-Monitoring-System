#!/bin/bash

TARGET_FILE="network_monitor.csv"

LOG_FILE="network_monitor.log"

echo "***** Network Check : $(date) *****" > "$LOG_FILE"

while read -r  website port
do
	#Get 5 ping packets and save the  output
	ping_output=$(ping -c 5 "$website" 2>/dev/null)
	ping_status=$?
	
	packet_loss=$(echo "$ping_output" | grep "packet loss" | awk -F',' '{print $3}' | awk '{print $1}')
        
	#Check whether the ping command received any response
	if [ "$ping_status" -eq 0 ]
	then 
		#Extract average response time
		latency=$(echo "$ping_output" | grep "rtt" | awk -F'/' '{print $5}' )
                #Extract packet loss percentage
		#packet_loss=$(echo "$ping_output" | grep "packet loss" | awk -F ',' '{print $3}' | awk '{print $1}')
		
                #Check whether the configured TCP port is open

	        if nc -zv  "$website" "$port"  > /dev/null 2>&1
	        then
			echo "$website:$port   is OPEN | Response Time: ${latency} ms | Packet Loss: ${packet_loss}"  >> "$LOG_FILE"
	         else
			 echo "$website:$port  is not CLOSED | Response Time: ${latency} ms | Packet Loss: ${packet_loss}"  >> "$LOG_FILE"
	         fi
else
	echo "$website is Down" >> "$LOG_FILE"
	
fi

done < "$TARGET_FILE"


echo "" >> "$LOG_FILE"

cat "$LOG_FILE"



