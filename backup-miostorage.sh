#!/bin/bash

# Bash script configuring MinIO host and mirror data

# Display usage instructions
function show_usage() {
  echo "Usage:"
  echo "$0 add-host <minio_alias> <minio_url> <minio_access_key> <minio_secret_key> : Configure MinIO host"
  echo "$0 backup <minio_alias> <backup_dir> : Mirror data from MinIO to backup directory"
  echo "$0 restore <backup_dir> <minio_alias> : Restore data from backup directory to MinIO"
}

# Check the number of arguments
if [ $# -lt 2 ]; then
  echo "Error: Invalid number of arguments"
  show_usage
  exit 1
fi

# Execute add-host, backup, and restore commands
case "$1" in
  add-host)
    if [ $# -ne 5 ]; then
      echo "Error: Invalid number of arguments for 'configure-host' command"
      show_usage
      exit 1
    fi
    alias="$2"
    url="$3"
    access_key="$4"
    secret_key="$5"
    mc alias set $alias $url $access_key $secret_key
    ;;
  backup)
    if [ $# -ne 3 ]; then
      echo "Error: Invalid number of arguments for 'backup' command"
      show_usage
      exit 1
    fi
    backup_dir="$3"
    echo "Mirroring data from MinIO to backup directory..."
    mc mirror $alias $backup_dir
    ;;
  restore)
    if [ $# -ne 3 ]; then
      echo "Error: Invalid number of arguments for 'restore' command"
      show_usage
      exit 1
    fi
    backup_dir="$2"
    alias="$3"
    echo "Restoring data from backup directory to MinIO..."
    mc mb --ignore-existing $alias/automation-dsl-local $alias/automation-fileshare-local $alias/automation-logs-local $alias/packages-local $alias/space-local $alias/vcs-local
    mc mirror $backup_dir $alias
    ;;
  *)
    echo "Error: Unknown command '$command'"
    show_usage
    exit 1
    ;;
esac