#!/bin/bash
# Intelligent log analysis with pattern detectionanalyze_logs() {
    local log_file=$1
    local time_window=${2:-"1 hour ago"}
    
    echo "=== Error Summary (Last Hour) ==="
    grep -i "error\|exception\|failed" $log_file | 
    awk -v since="$(date -d "$time_window" +%s)" '
    {
        # Extract timestamp and convert to epoch
        if (match($0, /[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}/)) {
            ts = mktime(gensub(/[-:]/, " ", "g", substr($0, RSTART, RLENGTH)))
            if (ts > since) {
                errors[gensub(/.*([Ee]rror[^:]*):.*/, "\\1", "g")]++
            }
        }
    }
    END {
        for (error in errors) {
            printf "%-50s: %d occurrences\n", error, errors[error]
        }
    }'
    
    echo -e "\n=== Performance Trends ==="
    grep "response_time" $log_file | tail -100 | 
    awk '{print $NF}' | sort -n | 
    awk '{
        sum+=$1; 
        arr[NR]=$1
    } 
    END {
        printf "Average: %.2fms\n", sum/NR
        printf "Median: %.2fms\n", arr[int(NR/2)]
        printf "95th percentile: %.2fms\n", arr[int(NR*0.95)]
    }'
}