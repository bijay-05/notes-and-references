#!/bin/bash
# Backup with automatic verificationbackup_and_verify() {
    local database=$1
    local backup_location=$2
    
    timestamp=$(date +%Y%m%d_%H%M%S)
    backup_file="${backup_location}/${database}_${timestamp}.sql.gz"
    
    echo "Starting backup of $database"
    
    # Create backup
    mysqldump --single-transaction --routines --triggers $database | 
    gzip > $backup_file
    
    # Verify backup integrity
    if gunzip -t $backup_file; then
        echo "Backup integrity verified"
        
        # Test restore to temporary database
        temp_db="${database}_restore_test"
        mysql -e "CREATE DATABASE $temp_db"
        
        gunzip -c $backup_file | mysql $temp_db
        
        # Verify row counts match
        original_rows=$(mysql -sN -e "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='$database'")
        restored_rows=$(mysql -sN -e "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='$temp_db'")
        
        if [ "$original_rows" -eq "$restored_rows" ]; then
            echo "Backup verification successful"
            # Upload to cloud storage
            aws s3 cp $backup_file s3://backups/$database/
        else
            echo "ALERT: Backup verification failed!"
            exit 1
        fi
        
        # Cleanup
        mysql -e "DROP DATABASE $temp_db"
    else
        echo "ALERT: Backup file corrupted!"
        exit 1
    fi
}