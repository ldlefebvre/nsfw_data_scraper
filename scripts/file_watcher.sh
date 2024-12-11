##!/bin/bash
## File watcher script for macOS to monitor and rename files with 'None' in the name
#
## Directory to monitor (relative to where the script is run)
#watch_dir="./raw_data"
#
## Function to rename files containing 'None'
#rename_file() {
#    local filepath="$1"
#    local filename=$(basename "$filepath")
#    local dirpath=$(dirname "$filepath")
#
#    # Check if the filename contains 'None'
#    if [[ "$filename" =~ None ]]; then
#        # Remove all occurrences of 'None' and add a timestamp
#        new_name=$(echo "$filename" | sed 's/None//g' | sed 's/__/_/g')  # Remove 'None' and fix double underscores
#        new_name="${new_name%.*}_$(date +%s%N).${filename##*.}"  # Add timestamp
#        mv "$filepath" "$dirpath/$new_name"
#        echo "Renamed: $filename -> $new_name"
#    fi
#}
#
## Monitor the directory for new files
#echo "Watching directory: $watch_dir"
#fswatch -0 -r --event Created "$watch_dir" | while read -d "" new_file; do
#    rename_file "$new_file"
#done

##!/bin/bash
## File watcher script for macOS to monitor and rename files with 'None' in the name
#
## Directory to monitor (relative to where the script is run)
#watch_dir="./raw_data"
#
## Function to rename files containing 'None'
#rename_file() {
#    local filepath="$1"
#    local filename=$(basename "$filepath")
#    local dirpath=$(dirname "$filepath")
#
#    # Skip files with .part extension
#    if [[ "$filename" == *.part ]]; then
#        echo "Skipping temporary file: $filename"
#        return
#    fi
#
#    # Check if the filename contains 'None'
#    if [[ "$filename" =~ None ]]; then
#        # Remove all occurrences of 'None' and add a timestamp
#        new_name=$(echo "$filename" | sed 's/None//g' | sed 's/__/_/g')  # Remove 'None' and fix double underscores
#        new_name="${new_name%.*}_$(date +%s%N).${filename##*.}"  # Add timestamp
#        mv "$filepath" "$dirpath/$new_name"
#        echo "Renamed: $filename -> $new_name"
#    fi
#}
#
## Monitor the directory for new files
#echo "Watching directory: $watch_dir"
#fswatch -0 -r --event Created "$watch_dir" | while read -d "" new_file; do
#    rename_file "$new_file"
#done


##!/bin/bash
## File watcher script for macOS to monitor and rename files with 'None' in the name
#
## Directory to monitor (relative to where the script is run)
#watch_dir="./raw_data"
#
## Function to check if a file is actively being written
#is_file_active() {
#    local filepath="$1"
#    lsof "$filepath" &>/dev/null
#}
#
## Function to rename files containing 'None'
#rename_file() {
#    local filepath="$1"
#    local filename=$(basename "$filepath")
#    local dirpath=$(dirname "$filepath")
#
#    # Skip temporary `.part` files
#    if [[ "$filename" == *.part ]]; then
#        echo "Skipping temporary file: $filename"
#        return
#    fi
#
#    # Check if the filename contains 'None'
#    if [[ "$filename" =~ None ]]; then
#        # Remove all occurrences of 'None' and add a timestamp
#        new_name=$(echo "$filename" | sed 's/None//g' | sed 's/__/_/g')  # Remove 'None' and fix double underscores
#        new_name="${new_name%.*}_$(date +%s%N).${filename##*.}"  # Add timestamp
#        mv "$filepath" "$dirpath/$new_name"
#        echo "Renamed: $filename -> $new_name"
#    fi
#}
#
## Monitor the directory for new files
#echo "Watching directory: $watch_dir"
#fswatch -0 -r --event Created "$watch_dir" | while read -d "" new_file; do
#    # Wait for the file to become inactive (download complete)
#    while is_file_active "$new_file"; do
#        echo "Waiting for file to finish downloading: $new_file"
#        sleep 1
#    done
#
#    # Process the finalized file
#    rename_file "$new_file"
#done



##!/bin/bash
## File watcher script for macOS/Linux to monitor and rename files with 'None' in the name
#
## Directory to monitor (relative to where the script is run)
#watch_dir="./raw_data"
#
## Function to check if a file is actively being written
#is_file_active() {
#    local filepath="$1"
#    lsof "$filepath" &>/dev/null
#}
#
## Function to wait until a file is finalized
#wait_for_file_finalization() {
#    local filepath="$1"
#    local basepath="${filepath%.part}"  # Remove .part suffix
#    local basepath_ytdl="${filepath%.ytdl}"  # Remove .ytdl suffix
#    while is_file_active "$filepath" || is_file_active "$basepath" || is_file_active "$basepath_ytdl"; do
#        echo "Waiting for file to finish downloading: $filepath"
#        sleep 1
#    done
#}
#
## Function to rename files containing 'None'
#rename_file() {
#    local filepath="$1"
#    local filename=$(basename "$filepath")
#    local dirpath=$(dirname "$filepath")
#
#    # Skip files still marked as temporary
#    if [[ "$filename" == *.part || "$filename" == *.ytdl ]]; then
#        echo "Skipping temporary file: $filename"
#        return
#    fi
#
#    # Check if the filename contains 'None'
#    if [[ "$filename" =~ None ]]; then
#        # Remove all occurrences of 'None' and add a timestamp
#        new_name=$(echo "$filename" | sed 's/None//g' | sed 's/__/_/g')  # Remove 'None' and fix double underscores
#        new_name="${new_name%.*}_$(date +%s%N).${filename##*.}"  # Add timestamp
#        mv "$filepath" "$dirpath/$new_name"
#        echo "Renamed: $filename -> $new_name"
#    fi
#}
#
## Monitor the directory for new files
#echo "Watching directory: $watch_dir"
#fswatch -0 -r --event Created "$watch_dir" | while read -d "" new_file; do
#    # Wait until the file is no longer actively written and finalize its name
#    wait_for_file_finalization "$new_file"
#    rename_file "$new_file"
#done
#
#



##!/bin/bash
## File watcher script for macOS/Linux to monitor and rename files with 'None' in the name
#
## Directory to monitor (relative to where the script is run)
#watch_dir="./raw_data"
#
## Function to check if a path is a file
#is_file() {
#    local filepath="$1"
#    [ -f "$filepath" ]
#}
#
## Function to check if a file is actively being written
#is_file_active() {
#    local filepath="$1"
#    lsof "$filepath" &>/dev/null
#}
#
## Function to wait until a file is finalized
#wait_for_file_finalization() {
#    local filepath="$1"
#    local basepath="${filepath%.part}"  # Remove .part suffix
#    local basepath_ytdl="${filepath%.ytdl}"  # Remove .ytdl suffix
#
#    while is_file_active "$filepath" || is_file_active "$basepath" || is_file_active "$basepath_ytdl"; do
#        echo "Waiting for file to finish downloading: $filepath"
#        sleep 1
#    done
#}
#
## Function to rename files containing 'None'
#rename_file() {
#    local filepath="$1"
#    local filename=$(basename "$filepath")
#    local dirpath=$(dirname "$filepath")
#
#    # Skip files still marked as temporary
#    if [[ "$filename" == *.part || "$filename" == *.ytdl ]]; then
#        echo "Skipping temporary file: $filename"
#        return
#    fi
#
#    # Check if the filename contains 'None'
#    if [[ "$filename" =~ None ]]; then
#        # Remove all occurrences of 'None' and add a timestamp
#        new_name=$(echo "$filename" | sed 's/None//g' | sed 's/__/_/g')  # Remove 'None' and fix double underscores
#        new_name="${new_name%.*}_$(date +%s%N).${filename##*.}"  # Add timestamp
#        mv "$filepath" "$dirpath/$new_name"
#        echo "Renamed: $filename -> $new_name"
#    fi
#}
#
## Monitor the directory for new files
#echo "Watching directory: $watch_dir"
#fswatch -0 -r --event Created "$watch_dir" | while read -d "" new_path; do
#    # Ensure the path is a file before proceeding
#    if is_file "$new_path"; then
#        # Wait until the file is no longer actively written and finalize its name
#        wait_for_file_finalization "$new_path"
#        rename_file "$new_path"
#    else
#        echo "Skipping directory or non-file: $new_path"
#    fi
#done




##!/bin/bash
## Enhanced file watcher script to monitor and rename files with exclusions for dataset-related files
#
## Directory to monitor (relative to where the script is run)
#watch_dir="./raw_data"
#
## Function to check if a path is a file
#is_file() {
#    local filepath="$1"
#    [ -f "$filepath" ]
#}
#
## Function to check if a file is actively being written
#is_file_active() {
#    local filepath="$1"
#    lsof "$filepath" &>/dev/null
#}
#
## Function to wait until a file is finalized
#wait_for_file_finalization() {
#    local filepath="$1"
#    while is_file_active "$filepath"; do
#        echo "Waiting for file to finish downloading: $filepath"
#        sleep 1
#    done
#}
#
## Function to rename files containing 'None'
#rename_file() {
#    local filepath="$1"
#    local filename=$(basename "$filepath")
#    local dirpath=$(dirname "$filepath")
#
#    # Skip temporary files
#    if [[ "$filename" == *.part || "$filename" == *.ytdl || "$filename" == *.tmp ]]; then
#        echo "Skipping temporary file: $filename"
#        return
#    fi
#
#    # Rename files containing 'None'
#    if [[ "$filename" =~ None ]]; then
#        new_name=$(echo "$filename" | sed 's/None//g' | sed 's/__/_/g')
#        new_name="${new_name%.*}_$(date +%s%N).${filename##*.}"
#        mv "$filepath" "$dirpath/$new_name"
#        echo "Renamed: $filename -> $new_name"
#    fi
#}
#
## Function to exclude specific files and directories
#should_exclude_file_or_dir() {
#    local filepath="$1"
#    local filename=$(basename "$filepath")
#
#    # List of files and directories to exclude
#    local exclude_patterns=(
#        "*.part"                           # Temporary download files
#        "*.ytdl"                           # yt-dlp intermediate files
#        "*.tmp"                            # General temporary files
#        "*.log"                            # Log files
#        "*.json"                           # Metadata files
#        "_INCOMPLETE"                      # Incomplete files
#        "unique_urls.txt"                  # Temporary deduplicated URLs file
#        ".DS_Store"                        # Hidden macOS files
#        "256_ObjectCategories.tar"         # Specific tar file to exclude
#        "256_ObjectCategories"             # Extracted dataset directory
#        "anime_dataset"                    # Specific excluded dataset directory
#    )
#
#    for pattern in "${exclude_patterns[@]}"; do
#        if [[ "$filename" == $pattern ]]; then
#            return 0  # Match found, exclude
#        fi
#    done
#
#    return 1  # No match, do not exclude
#}
#
## Monitor the directory for new files
#echo "Watching directory: $watch_dir"
#fswatch -0 -r --event Created "$watch_dir" | while read -d "" new_path; do
#    # Check if the path is a file and not excluded
#    if is_file "$new_path" && ! should_exclude_file_or_dir "$new_path"; then
#        wait_for_file_finalization "$new_path"
#        rename_file "$new_path"
#    elif should_exclude_file_or_dir "$new_path"; then
#        echo "Skipping excluded file or directory: $new_path"
#    else
#        echo "Skipping directory or non-file: $new_path"
#    fi
#done



##!/bin/bash
## Enhanced file watcher with refined exclusion logic and better debugging
#
#watch_dir="./raw_data"
#
## Check if the path is a file
#is_file() {
#    [ -f "$1" ]
#}
#
## Check if a file is actively being written
#is_file_active() {
#    lsof "$1" &>/dev/null
#}
#
## Wait until a file is finalized
#wait_for_file_finalization() {
#    local filepath="$1"
#    while is_file_active "$filepath"; do
#        echo "Waiting for file to finish downloading: $filepath"
#        sleep 1
#    done
#}
#
## Rename files containing 'None'
#rename_file() {
#    local filepath="$1"
#    local filename=$(basename "$filepath")
#    local dirpath=$(dirname "$filepath")
#
#    # Skip temporary files
#    if [[ "$filename" == *.part || "$filename" == *.ytdl || "$filename" == *.tmp ]]; then
#        echo "Skipping temporary file: $filename"
#        return
#    fi
#
#    # Rename files with 'None' in the name
#    if [[ "$filename" =~ None ]]; then
#        new_name=$(echo "$filename" | sed 's/None//g' | sed 's/__/_/g')
#        new_name="${new_name%.*}_$(date +%s%N).${filename##*.}"
#        mv "$filepath" "$dirpath/$new_name"
#        echo "Renamed: $filename -> $new_name"
#    fi
#}
#
## Exclude specific files and directories
#should_exclude_file_or_dir() {
#    local filepath="$1"
#    local filename=$(basename "$filepath")
#
#    # Patterns to exclude
#    local exclude_patterns=(
#        "*.part"           # Temporary files
#        "*.ytdl"           # yt-dlp intermediate files
#        "*.tmp"            # Temp files
#        ".DS_Store"        # macOS system file
#        "unique_urls.txt"  # Deduplication file
#        "256_ObjectCategories.tar"  # Dataset archive
#        "256_ObjectCategories"      # Extracted dataset
#        "anime_dataset"             # Specific dataset directory
#    )
#
#    for pattern in "${exclude_patterns[@]}"; do
#        if [[ "$filename" == $pattern ]]; then
#            return 0  # Exclude
#        fi
#    done
#
#    return 1  # Do not exclude
#}
#
## Monitor the directory for new files
#echo "Watching directory: $watch_dir"
#fswatch -0 -r --event Created "$watch_dir" | while read -d "" new_path; do
#    echo "Detected path: $new_path"
#    
#    # Handle valid files
#    if is_file "$new_path" && ! should_exclude_file_or_dir "$new_path"; then
#        echo "Processing file: $new_path"
#        wait_for_file_finalization "$new_path"
#        rename_file "$new_path"
#    elif should_exclude_file_or_dir "$new_path"; then
#        echo "Skipping excluded file or directory: $new_path"
#    else
#        echo "Skipping non-file or directory: $new_path"
#    fi
#done


##!/bin/bash
#
## Directory to monitor
#watch_dir="./raw_data"
#
## Check if the path is a file
#is_file() {
#    [ -f "$1" ]
#}
#
## Check if a file is actively being written
#is_file_active() {
#    lsof "$1" &>/dev/null
#}
#
## Wait until a file is finalized
#wait_for_file_finalization() {
#    local filepath="$1"
#    while is_file_active "$filepath"; do
#        echo "Waiting for file to finish downloading: $filepath"
#        sleep 1
#    done
#}
#
## Rename files containing 'None'
#rename_file() {
#    local filepath="$1"
#    local filename=$(basename "$filepath")
#    local dirpath=$(dirname "$filepath")
#
#    # Skip temporary files
#    if [[ "$filename" == *.part || "$filename" == *.ytdl || "$filename" == *.tmp ]]; then
#        echo "Skipping temporary file: $filename"
#        return
#    fi
#
#    # Rename files with 'None' in the name
#    if [[ "$filename" =~ None ]]; then
#        local new_name=$(echo "$filename" | sed 's/None//g' | sed 's/__/_/g')
#        new_name="${new_name%.*}_$(date +%s%N).${filename##*.}"
#        mv "$filepath" "$dirpath/$new_name"
#        echo "Renamed: $filename -> $new_name"
#    else
#        echo "No 'None' found in file: $filename"
#    fi
#}
#
## Exclude specific files and directories
#should_exclude_file_or_dir() {
#    local filepath="$1"
#    local filename=$(basename "$filepath")
#
#    # Patterns to exclude
#    local exclude_patterns=(
#        "*.DS_Store"          # macOS system file
#        "unique_urls.txt"     # Deduplication file
#        "256_ObjectCategories.tar"  # Dataset archive
#        "256_ObjectCategories"      # Extracted dataset
#    )
#
#    for pattern in "${exclude_patterns[@]}"; do
#        if [[ "$filename" == $pattern ]]; then
#            return 0  # Exclude
#        fi
#    done
#
#    return 1  # Do not exclude
#}
#
## Monitor the directory for new files
#echo "Watching directory: $watch_dir"
#fswatch -0 -r --event Created "$watch_dir" | while read -d "" new_path; do
#    echo "Detected path: $new_path"
#
#    # Handle valid files
#    if is_file "$new_path" && ! should_exclude_file_or_dir "$new_path"; then
#        echo "Processing file: $new_path"
#        wait_for_file_finalization "$new_path"
#        rename_file "$new_path"
#    elif should_exclude_file_or_dir "$new_path"; then
#        echo "Skipping excluded file or directory: $new_path"
#    else
#        echo "Skipping non-file or directory: $new_path"
#    fi
#done


##!/bin/bash
#
## Directory to monitor
#watch_dir="./raw_data"
#
## Check if the path is a regular file
#is_file() {
#    [ -f "$1" ]
#}
#
## Check if the path is a directory
#is_directory() {
#    [ -d "$1" ]
#}
#
## Exclude temporary files and specific patterns
#is_excluded() {
#    local filepath="$1"
#    local filename=$(basename "$filepath")
#
#    # Define excluded patterns/extensions
#    local excluded_patterns=(
#        "*.part"                # Temporary download files
#        "*.ytdl"                # yt-dlp intermediate files
#        "*.tmp"                 # General temporary files
#        "*.log"                 # Log files
#        "*.json"                # Metadata files
#        "*_INCOMPLETE"          # Incomplete files
#        "unique_urls.txt"       # Temporary deduplicated URLs file
#        ".DS_Store"             # Hidden macOS files
#        "256_ObjectCategories.tar" # Specific tar file to exclude
#    )
#
#    # Define excluded directories
#    local excluded_directories=(
#        "256_ObjectCategories"  # Extracted dataset directory
#        "anime_dataset"         # Specific excluded dataset directory
#    )
#
#    for pattern in "${excluded_patterns[@]}"; do
#        if [[ "$filename" == $pattern ]]; then
#            return 0  # Excluded file
#        fi
#    done
#
#    for dir in "${excluded_directories[@]}"; do
#        if [[ "$filepath" == *"/$dir"* ]]; then
#            return 0  # Excluded directory
#        fi
#    done
#
#    return 1  # Not excluded
#}
#
## Wait until a file is finalized
#wait_for_file_finalization() {
#    local filepath="$1"
#    while lsof "$filepath" &>/dev/null; do
#        echo "Waiting for file to finish downloading: $filepath"
#        sleep 1
#    done
#}
#
## Rename files containing 'None'
#rename_file() {
#    local filepath="$1"
#    local filename=$(basename "$filepath")
#    local dirpath=$(dirname "$filepath")
#
#    if [[ "$filename" =~ None ]]; then
#        local new_name=$(echo "$filename" | sed 's/None//g' | sed 's/__/_/g')
#        new_name="${new_name%.*}_$(date +%s%N).${filename##*.}"
#        mv "$filepath" "$dirpath/$new_name"
#        echo "Renamed: $filename -> $new_name"
#    else
#        echo "No 'None' found in file: $filename"
#    fi
#}
#
## Main loop to monitor files
#echo "Watching directory: $watch_dir"
#fswatch -0 -r --event Created --event Renamed "$watch_dir" | while read -d "" new_path; do
#    echo "Detected path: $new_path"
#
#    # Skip directories
#    if is_directory "$new_path"; then
#        echo "Skipping directory: $new_path"
#        continue
#    fi
#
#    # Skip excluded files and directories
#    if is_excluded "$new_path"; then
#        echo "Skipping excluded file or directory: $new_path"
#        continue
#    fi
#
#    # Process regular files
#    if is_file "$new_path"; then
#        echo "Processing file: $new_path"
#        wait_for_file_finalization "$new_path"
#        rename_file "$new_path"
#    else
#        echo "Skipping non-file: $new_path"
#    fi
#done



##!/bin/bash
#
## Directory to monitor
#watch_dir="./raw_data"
#
## Check if the path is a regular file
#is_file() {
#    [ -f "$1" ]
#}
#
## Check if the path is a directory
#is_directory() {
#    [ -d "$1" ]
#}
#
## Exclude temporary files and specific patterns
#is_excluded() {
#    local filepath="$1"
#    local filename=$(basename "$filepath")
#
#    # Define excluded patterns/extensions
#    local excluded_patterns=(
#        "*.part"                # Temporary download files
#        "*.ytdl"                # yt-dlp intermediate files
#        "*.tmp"                 # General temporary files
#        "*.log"                 # Log files
#        "*.json"                # Metadata files
#        "*_INCOMPLETE"          # Incomplete files
#        "unique_urls.txt"       # Temporary deduplicated URLs file
#        ".DS_Store"             # Hidden macOS files
#        "256_ObjectCategories.tar" # Specific tar file to exclude
#    )
#
#    # Define excluded directories
#    local excluded_directories=(
#        "256_ObjectCategories"  # Extracted dataset directory
#        "anime_dataset"         # Specific excluded dataset directory
#    )
#
#    for pattern in "${excluded_patterns[@]}"; do
#        if [[ "$filename" == $pattern ]]; then
#            return 0  # Excluded file
#        fi
#    done
#
#    for dir in "${excluded_directories[@]}"; do
#        if [[ "$filepath" == *"/$dir"* ]]; then
#            return 0  # Excluded directory
#        fi
#    done
#
#    return 1  # Not excluded
#}
#
## Wait until a file is finalized
#wait_for_file_finalization() {
#    local filepath="$1"
#    local max_wait=30  # Maximum wait time in seconds
#    local interval=2   # Interval to check file size in seconds
#    local waited=0
#    local prev_size=-1
#
#    echo "Waiting for file to finalize: $filepath"
#
#    while true; do
#        # Check if the file is being accessed
#        if ! lsof "$filepath" &>/dev/null; then
#            # Check if file size is stable
#            local current_size=$(stat -c%s "$filepath" 2>/dev/null)
#            if [[ "$current_size" -eq "$prev_size" ]]; then
#                echo "File finalized: $filepath"
#                break
#            fi
#            prev_size="$current_size"
#        fi
#
#        # Wait and increment the counter
#        sleep "$interval"
#        ((waited += interval))
#
#        # Exit if maximum wait time is reached
#        if [[ "$waited" -ge "$max_wait" ]]; then
#            echo "Timeout waiting for file: $filepath"
#            break
#        fi
#    done
#}
#
## Rename files containing 'None'
#rename_file() {
#    local filepath="$1"
#    local filename=$(basename "$filepath")
#    local dirpath=$(dirname "$filepath")
#
#    if [[ "$filename" =~ None ]]; then
#        local new_name=$(echo "$filename" | sed 's/None//g' | sed 's/__/_/g')
#        new_name="${new_name%.*}_$(date +%s%N).${filename##*.}"
#        mv "$filepath" "$dirpath/$new_name"
#        echo "Renamed: $filename -> $new_name"
#    else
#        echo "No 'None' found in file: $filename"
#    fi
#}
#
## Main loop to monitor files
#echo "Watching directory: $watch_dir"
#fswatch -0 -r --event Created --event Renamed "$watch_dir" | while read -d "" new_path; do
#    echo "Detected path: $new_path"
#
#    # Skip directories
#    if is_directory "$new_path"; then
#        echo "Skipping directory: $new_path"
#        continue
#    fi
#
#    # Skip excluded files and directories
#    if is_excluded "$new_path"; then
#        echo "Skipping excluded file or directory: $new_path"
#        continue
#    fi
#
#    # Process regular files
#    if is_file "$new_path"; then
#        echo "Processing file: $new_path"
#        wait_for_file_finalization "$new_path"
#        rename_file "$new_path"
#    else
#        echo "Skipping non-file: $new_path"
#    fi
#done


#!/bin/bash

# Directory to monitor
watch_dir="./raw_data"

# Check if the path is a regular file
is_file() {
    [ -f "$1" ]
}

# Check if the path is a directory
is_directory() {
    [ -d "$1" ]
}

# Exclude temporary files and specific patterns
is_excluded() {
    local filepath="$1"
    local filename=$(basename "$filepath")

    # Define excluded patterns/extensions
    local excluded_patterns=(
        "*.part"                # Temporary download files
        "*.ytdl"                # yt-dlp intermediate files
        "*.tmp"                 # General temporary files
        "*.log"                 # Log files
        "*.json"                # Metadata files
        "*_INCOMPLETE"          # Incomplete files
        "unique_urls.txt"       # Temporary deduplicated URLs file
        ".DS_Store"             # Hidden macOS files
        "256_ObjectCategories.tar" # Specific tar file to exclude
    )

    # Define excluded directories
    local excluded_directories=(
        "256_ObjectCategories"  # Extracted dataset directory
        "anime_dataset"         # Specific excluded dataset directory
    )

    for pattern in "${excluded_patterns[@]}"; do
        if [[ "$filename" == $pattern ]]; then
            return 0  # Excluded file
        fi
    done

    for dir in "${excluded_directories[@]}"; do
        if [[ "$filepath" == *"/$dir"* ]]; then
            return 0  # Excluded directory
        fi
    done

    return 1  # Not excluded
}

# Wait until a file is finalized
wait_for_file_finalization() {
    local filepath="$1"
    local max_wait=600  # Maximum wait time in seconds
    local interval=1   # Interval to check file size in seconds
    local waited=0
    local prev_size=-1

#    echo "Waiting for file to finalize: $filepath"

    while true; do
        # Check if file size is stable
        local current_size=$(stat -c%s "$filepath" 2>/dev/null || echo "-1")
        if [[ "$current_size" -eq "$prev_size" ]]; then
#            echo "File finalized: $filepath"
            break
        fi
        prev_size="$current_size"

        # Wait and increment the counter
        sleep "$interval"
        ((waited += interval))

        # Exit if maximum wait time is reached
        if [[ "$waited" -ge "$max_wait" ]]; then
            echo "Timeout waiting for file: $filepath"
            break
        fi
    done
}

# Rename files containing 'None'
rename_file() {
    local filepath="$1"
    local filename=$(basename "$filepath")
    local dirpath=$(dirname "$filepath")

    if [[ "$filename" =~ None ]]; then
        # Replace 'None' and remove redundant underscores
        local new_name=$(echo "$filename" | sed 's/None//g' | sed 's/__/_/g' | sed 's/_\././g')
        new_name="${new_name%.*}_$(date +%s%N)_$RANDOM.${filename##*.}"
        mv "$filepath" "$dirpath/$new_name"
        echo "Renamed: $filename -> $new_name"
#    else
#        echo "No 'None' found in file: $filename"
    fi
}


# Main loop to monitor files
echo "Watching directory: $watch_dir"
fswatch -0 -r --event Created --event Renamed "$watch_dir" | while read -d "" new_path; do
#    echo "Detected path: $new_path"

    # Skip directories
    if is_directory "$new_path"; then
#        echo "Skipping directory: $new_path"
        continue
    fi

    # Skip excluded files and directories
    if is_excluded "$new_path"; then
#        echo "Skipping excluded file or directory: $new_path"
        continue
    fi

    # Process regular files
    if is_file "$new_path"; then
#        echo "Processing file: $new_path"
        wait_for_file_finalization "$new_path"
        rename_file "$new_path"
#    else
#        echo "Skipping non-file: $new_path"
    fi
done
