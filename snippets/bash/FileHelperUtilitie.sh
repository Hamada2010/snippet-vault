#!/bin/bash

# Create a backup of a file with a timestamp
backup_file() {
    local file="$1"
    if [[ ! -f "$file" ]]; then
        echo "File not found: $file"
        return 1
    fi
    local timestamp=$(date +"%Y%m%d%H%M%S")
    cp "$file" "${file}.${timestamp}.bak"
    echo "Backup created: ${file}.${timestamp}.bak"
}

# Find files by extension
find_by_extension() {
    local dir="$1"
    local ext="$2"
    find "$dir" -type f -name "*.$ext"
}
