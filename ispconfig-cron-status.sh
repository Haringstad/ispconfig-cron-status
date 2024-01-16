#!/bin/bash

log_file="/var/log/ispconfig/cron.log"
output_file="/var/lib/prometheus/node-exporter/ispconfig_cron_status.prom"

# Use tail to continuously monitor the log file
tail -n 0 -F "$log_file" | while read -r line
do
    # Check for different conditions
    if [[ "$line" == *"finished server.php."* ]]; then
        output="1"
    elif [[ "$line" == *"Database connection failed Database connection failed Database connection failed Database connection failed Database connection failed Zugriff auf Datenbankserver fehlgesc
hlagen! / Database server not accessible!"* ]]; then
        output="2"
    elif [[ "$line" == *"WARNING - There is already a lockfile set, but no process running with this pid"* ]]; then
        output="3"
    elif [[ "$line" == *"WARNING - There is already an instance of server.php running with pid"* ]]; then
        output="4"
    else
        output="0"
    fi

    # Print output in the desired format and write to the output file using sponge
    printf "# HELP ispconfig_cron_status Is ISPConfig cron running\n# TYPE ispconfig_cron_status untyped\nispconfig_cron_status %s\n" "$output" | sponge "$output_file"
done
