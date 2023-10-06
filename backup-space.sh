#!/bin/bash

DB_CONTAINER_ID="$2"
DB_USERNAME="$3"
DB_NAME="$4"

function show_usage() {
  echo "Usage:"
  echo "$0 backup [DB_CONTAINER_ID] [DB_USERNAME] [DB_NAME] : Back up Space DB as spacedb_dump.sql to PWD"
  echo "$0 restore [DB_CONTAINER_ID] [DB_USERNAME] [DB_NAME] : Take spacedb_dump.sql from PWD and restore Space DB"
}

if [ $# -ne 4 ]; then
    # incorrect number of arguments
    echo "Error: Not all arguments are specified"
    show_usage
    exit 1
fi

case "$1" in
    backup)
    echo "Backing up..."
    docker exec -t $DB_CONTAINER_ID pg_dump -U $DB_USERNAME -d $DB_NAME > spacedb_dump.sql
    echo "Backup created"
    ;;

    restore)
    echo "Restoring..."
    docker exec -i $DB_CONTAINER_ID psql -U $DB_USERNAME -d $DB_NAME < spacedb_dump.sql
    echo "Restore completed"
    ;;

    *)
    # invalid argument
    echo "Invalid command"
    show_usage
    exit 1
    ;;
esac