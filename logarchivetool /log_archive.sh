#!/bin/bash

log_folder="${LOGS:-$1}"
store_folder="${STORE_FOLDER:-$2}"

if [ -z "$log_folder" ]; then
  echo "Error: No log folder specified"
  exit 1
fi

if [ -z "$store_folder" ]; then
  echo "No folder selected to copy archived file. File will be saved to $log_folder"
  store_folder="$log_folder"
fi

log_files=$(ls $log_folder/*.log 2>/dev/null)

if [ -z "$log_files" ]; then
  echo "No .log files found in $log_folder"
  exit 1
fi

tar -czvf "$store_folder/log-archive_$(date +%Y-%m-%d).tar.gz" -C "$log_folder" $(ls $log_folder/*.log)
