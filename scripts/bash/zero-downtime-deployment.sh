#!/bin/bash
# Zero-downtime deployment with automatic rollbackdeploy_with_rollback() {
    local app_name=$1
    local new_version=$2
    
    # Health check function
    health_check() {
        curl -sf http://localhost:8080/health > /dev/null
        return $?
    }
    
    echo "Starting deployment of $app_name:$new_version"
    
    # Deploy to staging slot
    docker run -d --name ${app_name}_staging $app_name:$new_version
    
    # Wait for startup
    sleep 30
    
    # Verify health
    if health_check; then
        # Switch traffic
        docker stop ${app_name}_prod
        docker rename ${app_name}_staging ${app_name}_prod
        echo "Deployment successful"
    else
        # Automatic rollback
        docker stop ${app_name}_staging
        echo "Deployment failed - rolled back automatically"
        exit 1
    fi
}