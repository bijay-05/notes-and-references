#!/bin/bash
# Cloud-agnostic server provisioningprovision_server() {
    local environment=$1
    local server_type=$2
    
    # Configuration based on environment
    case $environment in
        "prod")
            instance_type="m5.large"
            backup_required=true
            ;;
        "staging")
            instance_type="t3.medium"
            backup_required=false
            ;;
    esac
    
    # Create server (AWS example)
    instance_id=$(aws ec2 run-instances \
        --image-id ami-0abcdef1234567890 \
        --instance-type $instance_type \
        --security-group-ids sg-12345678 \
        --subnet-id subnet-12345678 \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Environment,Value=$environment},{Key=Type,Value=$server_type}]" \
        --query 'Instances[0].InstanceId' \
        --output text)
    
    # Wait for server to be ready
    aws ec2 wait instance-running --instance-ids $instance_id
    
    # Get IP address
    ip_address=$(aws ec2 describe-instances \
        --instance-ids $instance_id \
        --query 'Reservations[0].Instances[0].PublicIpAddress' \
        --output text)
    
    echo "Server provisioned: $ip_address (ID: $instance_id)"
    
    # Configure server
    configure_server $ip_address $environment
}