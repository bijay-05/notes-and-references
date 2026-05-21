#!/bin/bash
# Smart health monitoring with graduated alertscheck_service_health() {
    local service=$1
    local warning_threshold=80
    local critical_threshold=95
    
    cpu_usage=$(ps -C $service -o %cpu --no-headers | awk '{sum+=$1} END {print sum}')
    memory_usage=$(ps -C $service -o %mem --no-headers | awk '{sum+=$1} END {print sum}')
    
    if (( $(echo "$cpu_usage > $critical_threshold" | bc -l) )); then
        echo "CRITICAL: $service CPU at ${cpu_usage}%" | logger -t health-check
        # Trigger immediate alert
    elif (( $(echo "$cpu_usage > $warning_threshold" | bc -l) )); then
        echo "WARNING: $service CPU at ${cpu_usage}%" | logger -t health-check
        # Log for trending analysis
    fi
}