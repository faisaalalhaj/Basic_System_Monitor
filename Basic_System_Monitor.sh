#!/bin/bash

# CPU Calculator "function to calcolate CPU Usage"

get_cpu_usage()  {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4} ' )
    echo "CPU Usage: $cpu_usage%"
}

# Memory Calculator "function to calcolate memory Usage"

get_memory_usage() {
    memory_usage=$(free -m | awk  'NR==2{printf "Memory Usage: %.2f%%", $3*100/$2}' )
    echo $memory_usage
}

# Disk Calculator "function to calcolate disk Usage"

get_disk_usage()  {
    disk_usage=$(df -h | awk 'NF=="/"{printf "Disk Usage: %s", $5}')
    echo $disk_usage
}

# Loop to continuously display resource usage 
while true 
do 
  clear  # Clear the terminal for fresh output 


  echo  " --------- VPS Resource Usage ---------- " 

   # Display CPU usage 
   get_cpu_usage

   # Display memory usage 
   get_memory_usage

   # Display disk usage 
   get_disk_usage

   echo  " -------------------------------------- "

   # Sleep for 3 sec before refreshing 
     Sleep 3 
   done 