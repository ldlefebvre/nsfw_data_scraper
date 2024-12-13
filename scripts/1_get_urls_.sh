#!/bin/bash

#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#source_urls_dirname="source_urls"
#
#if [[ "$1" == "test" ]]
#then
#	echo "Running in test mode" 
#	source_urls_dirname="source_urls_test"
#fi
#
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
#declare -a class_names=(
##	"neutral"
#	"drawings"
#	"sexy"
##	"porn"
#	"hentai"
#	)
#
##download ripme.jar
#wget https://github.com/RipMeApp/ripme/releases/download/1.7.95/ripme.jar -O $scripts_dir/ripme.jar
#
#for cname in "${class_names[@]}"
#do
#	echo "--- Getting images for class: $cname"
#	
#	while read url
#	do
#		echo "------ url: $url"
#		if [[ ! "$url" =~ ^"#" ]]
#		then
#			echo "$url"
#			java -jar "$scripts_dir/ripme.jar" --skip404 --no-prop-file --ripsdirectory "$raw_data_dir/$cname" --url "$url"
#		fi
#	done < "$scripts_dir/$source_urls_dirname/$cname.txt"
#done
#
#for cname in "${class_names[@]}"
#do
#	urls_file="$raw_data_dir/$cname/urls_$cname.txt"
#	tmpfile=$(mktemp)
#	find "$raw_data_dir/$cname" -type f -name "urls.txt" -exec cat {} + >> "$tmpfile"
#	grep -e ".jpeg" -e ".jpg" "$tmpfile" > "$urls_file"
#	sort -u -o "$urls_file" "$urls_file"
#	rm "$tmpfile"
#done

#!/bin/bash
#set -e  # Exit immediately if a command exits with a non-zero status
#
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#source_urls_dirname="source_urls"
#
#if [[ "$1" == "test" ]]; then
#    echo "Running in test mode"
#    source_urls_dirname="source_urls_test"
#fi
#
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
#declare -a class_names=(
##    "neutral"
#    "porn"
##    "drawings"
##    "sexy"
##    "hentai"
#)
#
#for cname in "${class_names[@]}"; do
#    echo "--- Getting images for class: $cname"
#    urls_file="$scripts_dir/$source_urls_dirname/$cname.txt"
#    images_dir="$raw_data_dir/$cname/IMAGES"
#    mkdir -p "$images_dir"
#
#    total_urls=$(grep -v '^#' "$urls_file" | grep -v '^\s*$' | wc -l)
#    echo "Class: $cname. Total # of URLs: $total_urls"
#
#    if [ "$total_urls" -eq 0 ]; then
#        echo "No URLs to process for $cname."
#        continue
#    fi
#
#    while IFS= read -r url || [ -n "$url" ]; do
#        if [[ -z "$url" || "$url" =~ ^# ]]; then
#            echo "Skipping empty or comment line."
#            continue
#        fi
#        echo "Processing URL: '$url'"
##        gallery-dl --config "$base_dir/.config/gallery-dl/config.json" --verbose --no-mtime --dest "$images_dir" "$url" || {
##            echo "Failed to download from $url. Skipping."
##            continue
##        }
#        gallery-dl --config "$base_dir/.config/gallery-dl/config.json" --verbose --no-mtime --dest "$images_dir" --filename "{category}_{id}.{extension}" "$url" || {
#            echo "Failed to download from $url. Skipping."
#            continue
#        }
#
#        sleep $((RANDOM % 5 + 1))
#    done < "$urls_file"
#done


##!/bin/bash
#set -e  # Exit immediately if a command exits with a non-zero status
#
## Define directories
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#source_urls_dirname="source_urls"
#
#if [[ "$1" == "test" ]]; then
#    echo "Running in test mode"
#    source_urls_dirname="source_urls_test"
#fi
#
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
## Define class names
#declare -a class_names=(
#    "neutral"
#    "porn"
#    "drawings"
#    "sexy"
#    "hentai"
#)
#
## Download ripme.jar if not already present
#ripme_jar="$scripts_dir/ripme.jar"
#if [[ ! -f "$ripme_jar" ]]; then
#    echo "Downloading ripme.jar..."
#    wget https://github.com/RipMeApp/ripme/releases/download/1.7.95/ripme.jar -O "$ripme_jar"
#fi
#
#for cname in "${class_names[@]}"; do
#    echo "--- Getting images for class: $cname"
#    urls_file="$scripts_dir/$source_urls_dirname/$cname.txt"
#    images_dir="$raw_data_dir/$cname/IMAGES"
#    mkdir -p "$images_dir"
#
#    total_urls=$(grep -v '^#' "$urls_file" | grep -v '^\s*$' | wc -l)
#    echo "Class: $cname. Total # of URLs: $total_urls"
#
#    if [ "$total_urls" -eq 0 ]; then
#        echo "No URLs to process for $cname."
#        continue
#    fi
#
#    while IFS= read -r url || [ -n "$url" ]; do
#        if [[ -z "$url" || "$url" =~ ^# ]]; then
#            echo "Skipping empty or comment line."
#            continue
#        fi
#        echo "Processing URL: '$url'"
#
#        # Try using gallery-dl first
#        gallery-dl --config "$base_dir/.config/gallery-dl/config.json" \
#                   --verbose --no-mtime --dest "$images_dir" \
#                   --filename "{category}_{id}.{extension}" "$url" || {
#
#            echo "gallery-dl failed for $url. Attempting with ripme..."
#
#            # Use ripme as a fallback
#            java -jar "$ripme_jar" \
#                 --skip404 \
#                 --no-prop-file \
#                 --ripsdirectory "$images_dir" \
#                 --url "$url" || {
#                echo "ripme also failed for $url. Skipping."
#                continue
#            }
#
#            # Optional: Move images from ripme's default directory to $images_dir
#            # Adjust as needed based on ripme's output structure
#        }
#
#        sleep $((RANDOM % 5 + 1))
#    done < "$urls_file"
#done



##!/bin/bash
#set -e  # Exit immediately if a command exits with a non-zero status
#
## Define directories
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#source_urls_dirname="source_urls"
#
#if [[ "$1" == "test" ]]; then
#    echo "Running in test mode"
#    source_urls_dirname="source_urls_test"
#fi
#
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
## Define class names
#declare -a class_names=(
#    "neutral"
#    "porn"
#    "drawings"
#    "sexy"
#    "hentai"
#)
#
## Download ripme.jar if not already present
#ripme_jar="$scripts_dir/ripme.jar"
#if [[ ! -f "$ripme_jar" ]]; then
#    echo "Downloading ripme.jar..."
#    wget https://github.com/RipMeApp/ripme/releases/download/1.7.95/ripme.jar -O "$ripme_jar"
#fi
#
#for cname in "${class_names[@]}"; do
#    echo "--- Getting images for class: $cname"
#    urls_file="$scripts_dir/$source_urls_dirname/$cname.txt"
#    images_dir="$raw_data_dir/$cname/IMAGES"
#    mkdir -p "$images_dir"
#
#    total_urls=$(grep -v '^#' "$urls_file" | grep -v '^\s*$' | wc -l)
#    echo "Class: $cname. Total # of URLs: $total_urls"
#
#    if [ "$total_urls" -eq 0 ]; then
#        echo "No URLs to process for $cname."
#        continue
#    fi
#
#    while IFS= read -r url || [ -n "$url" ]; do
#        if [[ -z "$url" || "$url" =~ ^# ]]; then
#            echo "Skipping empty or comment line."
#            continue
#        fi
#        echo "Processing URL: '$url'"
#
#        # **Added: Check if URL is a v.redd.it URL**
#        if [[ "$url" =~ v\.redd\.it ]]; then
#            echo "Using yt-dlp for video URL: '$url'"
#
#            yt-dlp --verbose --no-mtime --output "$images_dir/%(title)s.%(ext)s" "$url" || {
#                echo "yt-dlp failed for $url. Skipping."
#                continue
#            }
#        else
#            # Try using gallery-dl first
#            gallery-dl --config "$base_dir/.config/gallery-dl/config.json" \
#                       --verbose --no-mtime --dest "$images_dir" \
#                       --filename "{category}_{id}.{extension}" "$url" || {
#
#                echo "gallery-dl failed for $url. Attempting with ripme..."
#
#                # Use ripme as a fallback
#                java -jar "$ripme_jar" \
#                     --skip404 \
#                     --no-prop-file \
#                     --ripsdirectory "$images_dir" \
#                     --url "$url" || {
#                    echo "ripme also failed for $url. Skipping."
#                    continue
#                }
#            }
#        fi
#
#        sleep $((RANDOM % 5 + 1))
#    done < "$urls_file"
#done
#



##!/bin/bash
#set -e  # Exit immediately if a command exits with a non-zero status
#
## Define directories
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#source_urls_dirname="source_urls"
#
#if [[ "$1" == "test" ]]; then
#    echo "Running in test mode"
#    source_urls_dirname="source_urls_test"
#fi
#
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
## Define class names
#declare -a class_names=(
#    "neutral"
#    "porn"
#    "drawings"
#    "sexy"
#    "hentai"
#)
#
## Download ripme.jar if not already present
#ripme_jar="$scripts_dir/ripme.jar"
#if [[ ! -f "$ripme_jar" ]]; then
#    echo "Downloading ripme.jar..."
#    wget https://github.com/RipMeApp/ripme/releases/latest/download/ripme.jar -O "$ripme_jar"
#fi
#
#for cname in "${class_names[@]}"; do
#    echo "--- Getting images for class: $cname"
#    urls_file="$scripts_dir/$source_urls_dirname/$cname.txt"
#    images_dir="$raw_data_dir/$cname/IMAGES"
#    mkdir -p "$images_dir"
#
#    if [[ ! -f "$urls_file" ]]; then
#        echo "URLs file not found for class $cname: $urls_file"
#        continue
#    fi
#
#    total_urls=$(grep -v '^#' "$urls_file" | grep -v '^\s*$' | wc -l)
#    echo "Class: $cname. Total # of URLs: $total_urls"
#
#    if [ "$total_urls" -eq 0 ]; then
#        echo "No URLs to process for $cname."
#        continue
#    fi
#
#    while IFS= read -r url || [ -n "$url" ]; do
#        if [[ -z "$url" || "$url" =~ ^# ]]; then
#            echo "Skipping empty or comment line."
#            continue
#        fi
#        echo "Processing URL: '$url'"
#
#        # Resolve redirects for pornpics.com URLs without numeric ID
#        if [[ "$url" =~ pornpics\.com && ! "$url" =~ -[0-9]+\/?$ ]]; then
#            echo "URL lacks numeric ID. Resolving redirect..."
#            resolved_url=$(curl -Ls -o /dev/null -w '%{url_effective}' "$url")
#            if [[ "$resolved_url" =~ pornpics\.com ]]; then
#                echo "Resolved URL: '$resolved_url'"
#                url="$resolved_url"
#            else
#                echo "Failed to resolve URL for $url. Skipping."
#                continue
#            fi
#        fi
#
#        # Use yt-dlp for v.redd.it URLs
#        if [[ "$url" =~ v\.redd\.it ]]; then
#            echo "Using yt-dlp for video URL: '$url'"
#
#            yt-dlp --verbose --no-mtime --output "$images_dir/%(title)s.%(ext)s" "$url" || {
#                echo "yt-dlp failed for $url. Skipping."
#                continue
#            }
#        else
#            # Try using gallery-dl first
#            gallery-dl --verbose --no-mtime --dest "$images_dir" \
#                       --filename "{category}_{id}.{extension}" "$url" || {
#                echo "gallery-dl failed for $url. Attempting with ripme..."
#
#                java -jar "$ripme_jar" \
#                     --skip404 \
#                     --no-prop-file \
#                     --ripsdirectory "$images_dir" \
#                     --url "$url" || {
#                    echo "ripme also failed for $url. Skipping."
#                    continue
#                }
#            }
#        fi
#
#        # Random sleep to avoid overwhelming servers
#        sleep $((RANDOM % 5 + 1))
#    done < "$urls_file"
#done

##!/bin/bash
#set -e  # Exit immediately if a command exits with a non-zero status
#
## Define directories
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#source_urls_dirname="source_urls"
#
#if [[ "$1" == "test" ]]; then
#    echo "Running in test mode"
#    source_urls_dirname="source_urls_test"
#fi
#
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
## Define class names
#declare -a class_names=(
#    "neutral"
#    "porn"
#    "drawings"
#    "sexy"
#    "hentai"
#)
#
## Download ripme.jar if not already present
#ripme_jar="$scripts_dir/ripme.jar"
#if [[ ! -f "$ripme_jar" ]]; then
#    echo "Downloading ripme.jar..."
#    wget https://github.com/RipMeApp/ripme/releases/latest/download/ripme.jar -O "$ripme_jar"
#fi
#
## Function to process URLs from a given file
#process_urls() {
#    local urls_file="$1"
#    local images_dir="$2"
#
#    if [[ ! -f "$urls_file" ]]; then
#        echo "URLs file not found: $urls_file"
#        return
#    fi
#
#    total_urls=$(grep -v '^#' "$urls_file" | grep -v '^\s*$' | wc -l)
#    echo "Processing URLs from $urls_file. Total # of URLs: $total_urls"
#
#    if [ "$total_urls" -eq 0 ]; then
#        echo "No URLs to process in $urls_file."
#        return
#    fi
#
#    while IFS= read -r url || [ -n "$url" ]; do
#        if [[ -z "$url" || "$url" =~ ^# ]]; then
#            echo "Skipping empty or comment line."
#            continue
#        fi
#        echo "Processing URL: '$url'"
#
#        # Resolve redirects for pornpics.com URLs without numeric ID
#        if [[ "$url" =~ pornpics\.com && ! "$url" =~ -[0-9]+\/?$ ]]; then
#            echo "URL lacks numeric ID. Resolving redirect..."
#            resolved_url=$(curl -Ls -o /dev/null -w '%{url_effective}' "$url")
#            if [[ "$resolved_url" =~ pornpics\.com ]]; then
#                echo "Resolved URL: '$resolved_url'"
#                url="$resolved_url"
#            else
#                echo "Failed to resolve URL for $url. Skipping."
#                continue
#            fi
#        fi
#
#        # Use yt-dlp for v.redd.it URLs
#        if [[ "$url" =~ v\.redd\.it ]]; then
#            echo "Using yt-dlp for video URL: '$url'"
#
#            yt-dlp --verbose --no-mtime --output "$images_dir/%(title)s.%(ext)s" "$url" || {
#                echo "yt-dlp failed for $url. Skipping."
#                continue
#            }
#        else
#            # Try using gallery-dl first
#            gallery-dl --verbose --no-mtime --dest "$images_dir" \
#                       --filename "{category}_{id}.{extension}" "$url" || {
#            # --config "$base_dir/.config/gallery-dl/config.json"
#                echo "gallery-dl failed for $url. Attempting with ripme..."
#
#                java -jar "$ripme_jar" \
#                     --skip404 \
#                     --no-prop-file \
#                     --ripsdirectory "$images_dir" \
#                     --url "$url" || {
#                    echo "ripme also failed for $url. Skipping."
#                    continue
#                }
#            }
#        fi
#
#        # Random sleep to avoid overwhelming servers
#        sleep $((RANDOM % 5 + 1))
#    done < "$urls_file"
#}
#
## Main loop for both source_urls and raw_data URLs
#for cname in "${class_names[@]}"; do
#    echo "--- Processing images for class: $cname"
#
#    # Source URLs
#    source_urls_file="$scripts_dir/$source_urls_dirname/$cname.txt"
#    images_dir="$raw_data_dir/$cname/IMAGES"
#    mkdir -p "$images_dir"
#    process_urls "$source_urls_file" "$images_dir"
#
#    # Raw data URLs
#    raw_data_urls_file="$raw_data_dir/$cname/urls_${cname}.txt"
#    process_urls "$raw_data_urls_file" "$images_dir"
#done



##!/bin/bash
#set -e  # Exit immediately if a command exits with a non-zero status
#
## Define directories
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#source_urls_dirname="source_urls"
#
#if [[ "$1" == "test" ]]; then
#    echo "Running in test mode"
#    source_urls_dirname="source_urls_test"
#fi
#
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
## Define class names
#declare -a class_names=(
#    "neutral"
#    "porn"
#    "drawings"
#    "sexy"
#    "hentai"
#)
#
## Ensure necessary tools are installed
#if ! command -v yt-dlp &>/dev/null; then
#    echo "yt-dlp is not installed. Installing yt-dlp..."
#    python3 -m pip install -U yt-dlp || {
#        echo "Failed to install yt-dlp. Exiting."
#        exit 1
#    }
#fi
#
#if ! command -v gallery-dl &>/dev/null; then
#    echo "gallery-dl is not installed. Installing gallery-dl..."
#    python3 -m pip install -U gallery-dl || {
#        echo "Failed to install gallery-dl. Exiting."
#        exit 1
#    }
#fi
#
## Download ripme.jar if not already present
#ripme_jar="$scripts_dir/ripme.jar"
#if [[ ! -f "$ripme_jar" ]]; then
#    echo "Downloading ripme.jar..."
#    wget https://github.com/RipMeApp/ripme/releases/latest/download/ripme.jar -O "$ripme_jar" || {
#        echo "Failed to download ripme.jar. Exiting."
#        exit 1
#    }
#fi
#
## Function to handle 429 (Too Many Requests) errors
#handle_429_error() {
#    echo "HTTP 429: Too Many Requests detected. Pausing for a cooldown..."
#    sleep 60  # Cooldown for 1 minute to prevent further rate-limiting
#}
#
## Function to ensure URLs are unique
#deduplicate_urls() {
#    local input_file="$1"
#    local output_file="$2"
#    grep -v '^#' "$input_file" | grep -v '^\s*$' | sort -u > "$output_file"
#}
#
## Function to rename RipMe files uniquely
#rename_ripme_files() {
#    local dir="$1"
#    for file in "$dir"/*; do
#        if [[ -f "$file" ]]; then
#            local extension="${file##*.}"
#            local timestamp=$(date +%s%N)
#            local unique_name="${dir}/$(basename "$file" ."$extension")_${timestamp}.${extension}"
#            mv "$file" "$unique_name"
#        fi
#    done
#}
#
## Function to process URLs from a given file
#process_urls() {
#    local urls_file="$1"
#    local images_dir="$2"
#    local temp_urls_file="$images_dir/unique_urls.txt"
#
#    if [[ ! -f "$urls_file" ]]; then
#        echo "URLs file not found: $urls_file"
#        return
#    fi
#
#    mkdir -p "$images_dir"
#
#    # Deduplicate URLs to a temporary file
#    deduplicate_urls "$urls_file" "$temp_urls_file"
#
#    total_urls=$(wc -l < "$temp_urls_file")
#    echo "Processing $total_urls URLs from $urls_file..."
#
#    while IFS= read -r url || [ -n "$url" ]; do
#        if [[ -z "$url" || "$url" =~ ^# ]]; then
#            echo "Skipping empty or comment line."
#            continue
#        fi
#        echo "Processing URL: '$url'"
#
#        # Resolve redirects for pornpics.com URLs without numeric ID
#        if [[ "$url" =~ pornpics\.com && ! "$url" =~ -[0-9]+\/?$ ]]; then
#            echo "URL lacks numeric ID. Resolving redirect..."
#            resolved_url=$(curl -Ls -o /dev/null -w '%{url_effective}' "$url")
#            if [[ "$resolved_url" =~ pornpics\.com ]]; then
#                echo "Resolved URL: '$resolved_url'"
#                url="$resolved_url"
#            else
#                echo "Failed to resolve URL for $url. Skipping."
#                continue
#            fi
#        fi
#
#        # Add unique timestamp to filenames for yt-dlp and gallery-dl
#        timestamp=$(date +%s%N)
#
#        # Use yt-dlp for v.redd.it URLs
#        if [[ "$url" =~ v\.redd\.it ]]; then
#            echo "Using yt-dlp for video URL: '$url'"
#            # Could add --force-ipv4 --cookies "$cookies_file" with a cookies file
#            yt-dlp --verbose --no-mtime --output "$images_dir/%(title)s_${timestamp}.%(ext)s" "$url" || {
#                handle_429_error
#                echo "yt-dlp failed for $url. Skipping."
#                continue
#            }
#        else
#            # Try using gallery-dl first
#            # Could add --force-ipv4
#            gallery-dl --verbose --no-mtime --dest "$images_dir" \
#                       --filename "{category}_{id}_${timestamp}.{extension}" "$url" || {
#                echo "gallery-dl failed for $url. Attempting with ripme..."
#
#                # Use ripme as a fallback
#                java -jar "$ripme_jar" \
#                     --skip404 \
#                     --no-prop-file \
#                     --ripsdirectory "$images_dir" \
#                     --url "$url" || {
#                    handle_429_error
#                    echo "ripme also failed for $url. Skipping."
#                    continue
#                }
#
#                # Rename RipMe files to ensure uniqueness
#                rename_ripme_files "$images_dir"
#            }
#        fi
#
#        # Sleep to avoid overwhelming servers
#        sleep $((RANDOM % 5 + 1))
#    done < "$temp_urls_file"
#
#    # Cleanup temporary file
#    rm "$temp_urls_file"
#}
#
## Main loop for both source_urls and raw_data URLs
#for cname in "${class_names[@]}"; do
#    echo "--- Processing images for class: $cname"
#
#    # Source URLs
#    source_urls_file="$scripts_dir/$source_urls_dirname/$cname.txt"
#    images_dir="$raw_data_dir/$cname/IMAGES"
#    process_urls "$source_urls_file" "$images_dir"
#
#    # Raw data URLs
#    raw_data_urls_file="$raw_data_dir/$cname/urls_${cname}.txt"
#    process_urls "$raw_data_urls_file" "$images_dir"
#done



##!/bin/bash
#set -e  # Exit immediately if a command exits with a non-zero status
#
## Define directories
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#source_urls_dirname="$scripts_dir/source_urls"
#
#if [[ "$1" == "test" ]]; then
#    echo "Running in test mode"
#    source_urls_dirname="$scripts_dir/source_urls_test"
#fi
#
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
## Define class names
#declare -a class_names=(
#    "neutral"
#    "porn"
#    "drawings"
#    "sexy"
#    "hentai"
#)
#
## Ensure necessary tools are installed
#if ! command -v yt-dlp &>/dev/null; then
#    echo "yt-dlp is not installed. Installing yt-dlp..."
#    python3 -m pip install -U yt-dlp || {
#        echo "Failed to install yt-dlp. Exiting."
#        exit 1
#    }
#fi
#
#if ! command -v gallery-dl &>/dev/null; then
#    echo "gallery-dl is not installed. Installing gallery-dl..."
#    python3 -m pip install -U gallery-dl || {
#        echo "Failed to install gallery-dl. Exiting."
#        exit 1
#    }
#fi
#
## Download ripme.jar if not already present
#ripme_jar="$scripts_dir/ripme.jar"
#if [[ ! -f "$ripme_jar" ]]; then
#    echo "Downloading ripme.jar..."
#    wget https://github.com/RipMeApp/ripme/releases/latest/download/ripme.jar -O "$ripme_jar" || {
#        echo "Failed to download ripme.jar. Exiting."
#        exit 1
#    }
#fi
#
## Function to handle 429 (Too Many Requests) errors
#handle_429_error() {
#    echo "HTTP 429: Too Many Requests detected. Pausing for a cooldown..."
#    sleep 60  # Cooldown for 1 minute to prevent further rate-limiting
#}
#
## Function to ensure URLs are unique
#deduplicate_urls() {
#    local input_file="$1"
#    local output_file="$2"
#    grep -v '^#' "$input_file" | grep -v '^\s*$' | sort -u > "$output_file"
#}
#
## Function to process URLs from a given file
#process_urls() {
#    local urls_file="$1"
#    local images_dir="$2"
#    local temp_urls_file="$images_dir/unique_urls.txt"
#
#    if [[ ! -f "$urls_file" ]]; then
#        echo "URLs file not found: $urls_file"
#        return
#    fi
#
#    mkdir -p "$images_dir" || {
#        echo "Failed to create directory: $images_dir"
#        exit 1
#    }
#
#    deduplicate_urls "$urls_file" "$temp_urls_file"
#
#    total_urls=$(wc -l < "$temp_urls_file")
#    echo "Processing $total_urls URLs from $urls_file..."
#
#    while IFS= read -r url || [ -n "$url" ]; do
#        if [[ -z "$url" || "$url" =~ ^# ]]; then
#            echo "Skipping empty or comment line."
#            continue
#        fi
#        echo "Processing URL: '$url'"
#
#        # Generate unique filename with timestamp first
##        timestamp=$(date +%s%N)_$RANDOM
##        safe_filename=$(basename "$url" | tr -cd '[:alnum:]-_' | cut -c 1-100)
##        final_filename="${timestamp}_${safe_filename}"
#
#        # Use yt-dlp for v.redd.it URLs
##        if [[ "$url" =~ v\.redd\.it ]]; then
##            echo "Using yt-dlp for video URL: '$url'"
##            yt-dlp --verbose --no-mtime \
##                   --output "$images_dir/%(title)s_%(autonumber)s.%(ext)s" "$url" || {
##                handle_429_error
##                echo "yt-dlp failed for $url. Skipping."
##                continue
##            }
##        else
#            # Try using gallery-dl first
##            gallery-dl --verbose --no-mtime --dest "$images_dir" \
##                       --filename "{category}_{id}_{num}.{extension}" "$url" || {
###                handle_429_error
##                echo "gallery-dl failed for $url. Attempting with ripme..."
##
##                # Use ripme as a fallback
##                java -jar "$ripme_jar" \
##                     --skip404 \
##                     --no-prop-file \
##                     --ripsdirectory "$images_dir" \
##                     --url "$url" || {
###                    handle_429_error
##                    echo "ripme also failed for $url. Attempting with yt-dlp..."
##                    yt-dlp --verbose --no-mtime \
##                       --output "$images_dir/%(title)s_%(autonumber)s.%(ext)s" "$url" || {
##                        handle_429_error
##                        echo "yt-dlp failed for $url. Skipping."
##                        continue
##                    }
##                }
##            }
#            # Try gallery-dl first
#            message1=$(gallery-dl --verbose --no-mtime --dest "$images_dir" \
#                       --filename "{category}_{id}_{num}.{extension}" "$url" 2>&1) || {
#                if [[ "$message1" == *"429"* ]]; then
#                    echo "gallery-dl encountered 429. Retrying after a delay..."
#                    handle_429_error
#                else
#                    echo "gallery-dl failed for $url. Attempting with ripme..."
#                    
#                    # Try ripme as a fallback
#                    message2=$(java -jar "$ripme_jar" \
#                             --skip404 \
#                             --no-prop-file \
#                             --ripsdirectory "$images_dir" \
#                             --url "$url" 2>&1) || {
#                        if [[ "$message2" == *"429"* ]]; then
#                            echo "ripme encountered 429. Retrying after a delay..."
#                            handle_429_error
#                        else
#                            echo "ripme failed for $url. Attempting with yt-dlp..."
#                            
#                            # Try yt-dlp as the final fallback
#                            message3=$(yt-dlp --verbose --no-mtime \
#                                       --output "$images_dir/%(title)s_%(autonumber)s.%(ext)s" "$url" 2>&1) || {
#                                if [[ "$message3" == *"429"* ]]; then
#                                    echo "yt-dlp encountered 429. Retrying after a delay..."
#                                    handle_429_error
#                                else
#                                    echo "All tools failed for $url. Skipping."
#                                    echo "$url" >> "$images_dir/failed_urls.log"
#                                fi
#                            }
#                        fi
#                    }
#                fi
#            }
#
##        fi
#
##        sleep $((RANDOM % 5 + 1))
#    done < "$temp_urls_file"
#
#    rm "$temp_urls_file"
#}
#
## Main loop for both source_urls and raw_data URLs
#for cname in "${class_names[@]}"; do
#    echo "--- Processing images for class: $cname"
#
#    # Source URLs
#    source_urls_file="$source_urls_dirname/$cname.txt"
#    images_dir="$raw_data_dir/$cname/IMAGES"
#
#    mkdir -p "$images_dir" || {
#        echo "Failed to create directory: $images_dir"
#        exit 1
#    }
#
#    process_urls "$source_urls_file" "$images_dir"
#
#    # Raw data URLs
#    raw_data_urls_file="$raw_data_dir/$cname/urls_${cname}.txt"
#    process_urls "$raw_data_urls_file" "$images_dir"
#done



##!/bin/bash
#set -e  # Exit on any command failure
#
## Define directories
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#source_urls_dirname="$scripts_dir/source_urls"
#
#if [[ "$1" == "test" ]]; then
#    echo "Running in test mode"
#    source_urls_dirname="$scripts_dir/source_urls_test"
#fi
#
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
#declare -a class_names=("neutral" "porn" "drawings" "sexy" "hentai")
#
## Ensure necessary tools are installed
#for tool in yt-dlp gallery-dl; do
#    if ! command -v $tool &>/dev/null; then
#        echo "$tool is not installed. Installing..."
#        python3 -m pip install -U $tool || {
#            echo "Failed to install $tool. Exiting."
#            exit 1
#        }
#    fi
#done
#
## Download ripme.jar if not already present
#ripme_jar="$scripts_dir/ripme.jar"
#if [[ ! -f "$ripme_jar" ]]; then
#    echo "Downloading ripme.jar..."
#    wget https://github.com/RipMeApp/ripme/releases/latest/download/ripme.jar -O "$ripme_jar" || {
#        echo "Failed to download ripme.jar. Exiting."
#        exit 1
#    }
#fi
#
## Function to handle 429 errors
#handle_429_error() {
#    echo "429 Too Many Requests detected. Pausing for cooldown..."
#    sleep 60
#}
#
## Function to attempt downloading with a given tool
#attempt_download() {
#    local tool=$1
#    local url=$2
#    local dest_dir=$3
#    local output
#
#    echo "Trying $tool for URL: $url"
#
#    case $tool in
#        gallery-dl)
#            output=$(gallery-dl --verbose --no-mtime --dest "$dest_dir" \
#                                --filename "{category}_{id}_{num}.{extension}" "$url" 2>&1) || return 1
#            ;;
#        ripme)
#            output=$(java -jar "$ripme_jar" --skip404 --no-prop-file --ripsdirectory "$dest_dir" \
#                          --url "$url" 2>&1) || return 1
#            ;;
#        yt-dlp)
#            output=$(yt-dlp --verbose --no-mtime --output "$dest_dir/%(title)s_%(autonumber)s.%(ext)s" \
#                            "$url" 2>&1) || return 1
#            ;;
#    esac
#
#    if [[ "$output" == *"429"* ]]; then
#        handle_429_error
#        return 2  # Special case: Retry for 429
#    fi
#
#    return 0  # Success
#}
#
## Function to process a single URL with retries across tools
#process_url() {
#    local url=$1
#    local dest_dir=$2
#    local tools=("gallery-dl" "ripme" "yt-dlp")
#    local retries=3
#
#    for tool in "${tools[@]}"; do
#        for ((attempt=1; attempt<=retries; attempt++)); do
#            echo "Attempt $attempt with $tool for $url"
#            attempt_download "$tool" "$url" "$dest_dir" && return 0
#
#            # If the error was a 429, retry immediately; otherwise, proceed to the next tool
#            if [[ $? -eq 2 ]]; then
#                echo "Retrying due to 429 error with $tool..."
#                continue
#            else
#                echo "$tool failed for $url. Moving to the next tool."
#                break
#            fi
#        done
#    done
#
#    # If all tools fail, log it
#    echo "All tools failed for $url."
#    return 1
#}
#
## Function to process URLs from a file
#process_urls_file() {
#    local urls_file=$1
#    local images_dir=$2
#
#    if [[ ! -f "$urls_file" ]]; then
#        echo "URLs file not found: $urls_file"
#        return
#    fi
#
#    mkdir -p "$images_dir"
#
#    total_urls=$(grep -v '^#' "$urls_file" | grep -v '^\s*$' | wc -l)
#    echo "Processing $total_urls URLs from $urls_file..."
#
#    while IFS= read -r url || [ -n "$url" ]; do
#        if [[ -z "$url" || "$url" =~ ^# ]]; then
#            echo "Skipping empty or comment line."
#            continue
#        fi
#
#        echo "Processing URL: $url"
#        process_url "$url" "$images_dir"
#    done < "$urls_file"
#
#    echo "Finished processing URLs from $urls_file"
#}
#
## Main loop for all classes
#for cname in "${class_names[@]}"; do
#    echo "--- Processing class: $cname ---"
#
#    # Source URLs
#    source_urls_file="$source_urls_dirname/$cname.txt"
#    images_dir="$raw_data_dir/$cname/IMAGES"
#    process_urls_file "$source_urls_file" "$images_dir"
#
#    # Raw data URLs
#    raw_data_urls_file="$raw_data_dir/$cname/urls_${cname}.txt"
#    process_urls_file "$raw_data_urls_file" "$images_dir"
#done



##!/bin/bash
#set -e  # Exit on command failures, but we'll handle failures gracefully within loops
#
## Define directories
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#source_urls_dirname="$scripts_dir/source_urls"
#
#if [[ "$1" == "test" ]]; then
#    echo "Running in test mode"
#    source_urls_dirname="$scripts_dir/source_urls_test"
#fi
#
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
##declare -a class_names=("neutral" "porn" "drawings" "sexy" "hentai")
#declare -a class_names=(
##    "neutral"
##    "porn"
##    "drawings"
#    "sexy"
##    "hentai"
#)
#
## Ensure necessary tools are installed
#for tool in yt-dlp gallery-dl; do
#    if ! command -v $tool &>/dev/null; then
#        echo "$tool is not installed. Installing..."
#        python3 -m pip install -U $tool || {
#            echo "Failed to install $tool. Exiting."
#            exit 1
#        }
#    fi
#done
#
## Download ripme.jar if not already present
#ripme_jar="$scripts_dir/ripme.jar"
#if [[ ! -f "$ripme_jar" ]]; then
#    echo "Downloading ripme.jar..."
#    wget https://github.com/RipMeApp/ripme/releases/latest/download/ripme.jar -O "$ripme_jar" || {
#        echo "Failed to download ripme.jar. Exiting."
#        exit 1
#    }
#fi
#
## Function to handle 429 errors
#handle_429_error() {
#    echo "429 Too Many Requests detected. Pausing for cooldown..."
#    rotate_tor_circuit
#    sleep 15
#}
#
## Function to attempt downloading with a given tool
#attempt_download() {
#    local tool=$1
#    local url=$2
#    local dest_dir=$3
#    local output
#
#    echo "Trying $tool for URL: $url"
#    
#        # Define an array of User-Agent strings
#    user_agents=(
#        "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
#        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)"
#        "Mozilla/5.0 (X11; Linux x86_64)"
#        "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X)"
#        "Mozilla/5.0 (Android 11; Mobile; rv:89.0) Gecko/89.0 Firefox/89.0"
#    )
#
#    # Select a random User-Agent
#    user_agent="${user_agents[$RANDOM % ${#user_agents[@]}]}"
#    
##    gallery-dl --config "$base_dir/.config/gallery-dl/config.json" \
##                   --verbose --no-mtime --dest "$images_dir" \
##                   --filename "{category}_{id}.{extension}" "$url" || {
##
##            echo "gallery-dl failed for $url. Attempting with ripme..."
##
##            # Use ripme as a fallback
##            java -jar "$ripme_jar" \
##                 --skip404 \
##                 --no-prop-file \
##                 --ripsdirectory "$images_dir" \
##                 --url "$url" || {
##                echo "ripme also failed for $url. Skipping."
##                continue
##            }
#
#    case $tool in
#        gallery-dl)
#            output=$(gallery-dl --config "$base_dir/.config/gallery-dl/config.json" \
#                                --verbose --no-mtime --dest "$dest_dir" \
#                                --filename "{category}_{id}_{num}.{extension}" \
#                                --proxy "socks5://127.0.0.1:9050" \
#                                --user-agent "$user_agent" "$url" 2>&1) || return 1
#            ;;
#        
#        ripme)
#            output=$(http_proxy="socks5://127.0.0.1:9050" \
#                     https_proxy="socks5://127.0.0.1:9050" \
#                     java -Dhttp.agent="$user_agent" -jar "$ripme_jar" --skip404 --no-prop-file \
#                     --ripsdirectory "$dest_dir" --url "$url" 2>&1) || return 1
#            ;;
#        
#        yt-dlp)
#            output=$(yt-dlp --verbose --no-mtime --proxy "socks5://127.0.0.1:9050" \
#                            --user-agent "$user_agent" \
#                            --output "$dest_dir/%(title)s_%(autonumber)s.%(ext)s" "$url" 2>&1) || return 1
#            ;;
#            
##        gallery-dl)
##            output=$(gallery-dl --verbose --no-mtime --dest "$dest_dir" \
##                                --filename "{category}_{id}_{num}.{extension}" "$url" 2>&1) || return 1
##            ;;
##        ripme)
##            output=$(java -jar "$ripme_jar" --skip404 --no-prop-file --ripsdirectory "$dest_dir" \
##                          --url "$url" 2>&1) || return 1
##            ;;
##        yt-dlp)
##            output=$(yt-dlp --verbose --no-mtime --output "$dest_dir/%(title)s_%(autonumber)s.%(ext)s" \
##                            "$url" 2>&1) || return 1
##            ;;
#    esac
#
#
#    # Rotate Tor circuit after each download attempt
#    rotate_tor_circuit
#
##    case $tool in
##        gallery-dl)
##            output=$(gallery-dl --verbose --no-mtime --dest "$dest_dir" \
##                                --filename "{category}_{id}_{num}.{extension}" "$url" 2>&1) || return 1
##            ;;
##        
##
##        ripme)
##            output=$(java -jar "$ripme_jar" --skip404 --no-prop-file --ripsdirectory "$dest_dir" \
##                          --url "$url" 2>&1) || return 1
##            ;;
##        yt-dlp)
##            output=$(yt-dlp --verbose --no-mtime --output "$dest_dir/%(title)s_%(autonumber)s.%(ext)s" \
##                            "$url" 2>&1) || return 1
##            ;;
##    esac
#
#    if [[ "$output" == *"429"* ]]; then
#        handle_429_error
##        rotate_tor_circuit
#        return 2  # Special case: Retry for 429
#    fi
#
#    return 0  # Success
#}
#
## Rotate Tor Circuit
#rotate_tor_circuit() {
#    cookie_file="/usr/local/var/lib/tor/control_auth_cookie"
##    if [[ -f "$cookie_file" ]]; then
##        COOKIE=$(cat "$cookie_file" | xxd -p -c 64 | tr -d '\n')
##        echo "Rotating Tor circuit..."
##        echo -e "AUTHENTICATE \"$COOKIE\"\nSIGNAL NEWNYM\nQUIT" | nc 127.0.0.1 9051
##        sleep 5
##    else
##    if [[ -f "$cookie_file" ]]; then
##        COOKIE=$(xxd -ps "$cookie_file" | tr -d '\n')  # Extract hex string
##        if [[ ${#COOKIE} -ne 64 ]]; then
##            echo "Error: Authentication cookie length is invalid (${#COOKIE}). Expected 64."
##            exit 1
##        fi
##
##        echo "Rotating Tor circuit..."
##        echo -e "AUTHENTICATE \"$COOKIE\"\nSIGNAL NEWNYM\nQUIT" | nc 127.0.0.1 9051
##        sleep 5
##    else
#    if [[ -f "$cookie_file" ]]; then
#        # Extract the hex string from the cookie file
#        COOKIE=$(xxd -ps "$cookie_file" | tr -d '\n')
#
#        # Validate the cookie length
#        if [[ ${#COOKIE} -ne 64 ]]; then
#            echo "Error: Authentication cookie length is invalid (${#COOKIE}). Expected 64."
#            exit 1
#        fi
#
##        echo "Rotating Tor circuit..."
#        # Pass the raw cookie without extra quotes
##        echo -e "AUTHENTICATE $COOKIE\nSIGNAL NEWNYM\nQUIT" | nc 127.0.0.1 9051
#
##        sleep 5
#    else
#        echo "Tor authentication cookie not found at $cookie_file"
#        exit 1
#    fi
#}
#
## Function to process a single URL with retries across tools
#process_url() {
#    local url=$1
#    local dest_dir=$2
#    local tools=("gallery-dl" "ripme" "yt-dlp")
#    local retries=3
#
#    for tool in "${tools[@]}"; do
#        for ((attempt=1; attempt<=retries; attempt++)); do
#            echo "Attempt $attempt with $tool for $url"
#            attempt_download "$tool" "$url" "$dest_dir" && return 0
#
#            # If the error was a 429, retry immediately; otherwise, proceed to the next tool
#            if [[ $? -eq 2 ]]; then
#                echo "Retrying due to 429 error with $tool..."
#                continue
#            else
#                echo "$tool failed for $url. Moving to the next tool."
#                break
#            fi
#        done
#    done
#    
#    # Rotate Tor circuit before falling back to Selenium
#    rotate_tor_circuit
#    
#    # Fallback to Selenium with Tor
#    echo "All tools failed. Falling back to Selenium with Tor for URL: $url"
#    python3 "$scripts_dir/fallback_selenium.py" "$url" "$dest_dir"
#    if [[ $? -eq 0 ]]; then
#        echo "Successfully downloaded with Selenium: $url"
#        return 0
#    fi
#    
#    # If all tools fail, log it
#    echo "All tools failed for $url."
#    rotate_tor_circuit
#    return 1
#}
#
## Function to process URLs from a file
#process_urls_file() {
#    local urls_file=$1
#    local images_dir=$2
#
#    if [[ ! -f "$urls_file" ]]; then
#        echo "URLs file not found: $urls_file"
#        return
#    fi
#
#    mkdir -p "$images_dir"
#
#    total_urls=$(grep -v '^#' "$urls_file" | grep -v '^\s*$' | wc -l)
#    echo "Processing $total_urls URLs from $urls_file..."
#
#    while IFS= read -r url || [ -n "$url" ]; do
#        if [[ -z "$url" || "$url" =~ ^# ]]; then
#            echo "Skipping empty or comment line."
#            continue
#        fi
#
#        echo "Processing URL: $url"
#        process_url "$url" "$images_dir" || {
#            echo "Failed to process URL: $url. Continuing to the next."
#        }
#        sleep $((RANDOM % 2 + 1))
#    done < "$urls_file"
#
#    echo "Finished processing URLs from $urls_file"
#}
#
## Main loop for all classes
#for cname in "${class_names[@]}"; do
#    echo "--- Processing class: $cname ---"
#
#    # Source URLs
#    source_urls_file="$source_urls_dirname/$cname.txt"
#    images_dir="$raw_data_dir/$cname/IMAGES"
#    process_urls_file "$source_urls_file" "$images_dir"
#
#    # Raw data URLs
#    raw_data_urls_file="$raw_data_dir/$cname/urls_${cname}.txt"
#    process_urls_file "$raw_data_urls_file" "$images_dir"
#done



##!/bin/bash
#set -e  # Exit on command failures, but we'll handle failures gracefully within loops
#
## Define directories
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#source_urls_dirname="$scripts_dir/source_urls"
#
#if [[ "$1" == "test" ]]; then
#    echo "Running in test mode"
#    source_urls_dirname="$scripts_dir/source_urls_test"
#fi
#
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
##declare -a class_names=("neutral" "porn" "drawings" "sexy" "hentai")
#declare -a class_names=(
##    "neutral"
##    "porn"
##    "drawings"
#    "sexy"
##    "hentai"
#)
#
## Ensure necessary tools are installed
#for tool in yt-dlp gallery-dl; do
#    if ! command -v $tool &>/dev/null; then
#        echo "$tool is not installed. Installing..."
#        python3 -m pip install -U $tool || {
#            echo "Failed to install $tool. Exiting."
#            exit 1
#        }
#    fi
#done
#
## Download ripme.jar if not already present
#ripme_jar="$scripts_dir/ripme.jar"
#if [[ ! -f "$ripme_jar" ]]; then
#    echo "Downloading ripme.jar..."
#    wget https://github.com/RipMeApp/ripme/releases/latest/download/ripme.jar -O "$ripme_jar" || {
#        echo "Failed to download ripme.jar. Exiting."
#        exit 1
#    }
#fi
#
## Function to handle 429 errors
#handle_429_error() {
#    echo "429 Too Many Requests detected. Pausing for cooldown..."
#    rotate_tor_circuit
#    sleep 15
#}
#
#attempt_download() {
#    local tool=$1
#    local url=$2
#    local dest_dir=$3
#    local output
#    local exit_code
#
#    echo "Trying $tool for URL: $url"
#    
#    # Define an array of User-Agent strings
#    user_agents=(
#        "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
#        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)"
#        "Mozilla/5.0 (X11; Linux x86_64)"
#        "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X)"
#        "Mozilla/5.0 (Android 11; Mobile; rv:89.0) Gecko/89.0 Firefox/89.0"
#    )
#
#    # Select a random User-Agent
#    user_agent="${user_agents[$RANDOM % ${#user_agents[@]}]}"
#
#    case $tool in
#        gallery-dl)
#            output=$(gallery-dl --config "$base_dir/.config/gallery-dl/config.json" \
#                        --verbose --no-mtime --dest "$dest_dir" \
#                        --filename "{category}_{id}_{num}.{extension}" \
#                        "$url" 2>&1) || return 1
##            output=$(gallery-dl --config "$base_dir/.config/gallery-dl/config.json" \
##                    --verbose --no-mtime --dest "$dest_dir" \
##                    --filename "{category}_{id}_{num}.{extension}" \
##                    --proxy "socks5://127.0.0.1:9050" \
##                    --user-agent "$user_agent" "$url" 2>&1)
#            exit_code=$?
#            ;;
#        
#        ripme)
#            output=$(java -Dhttp.agent="$user_agent" -jar "$ripme_jar" --skip404 --no-prop-file \
#                         --ripsdirectory "$dest_dir" --url "$url" 2>&1)
#            # Check for common failure patterns in the output
#            if echo "$output" | grep -q -E "Error|Failed|Status Code"; then
#                echo "Ripme encountered an error: $output"
#                return 1
#            fi
#            exit_code=$?
#            ;;
#        
##        ripme)
##            output=$(java -Dhttp.agent="$user_agent" -jar "$ripme_jar" --skip404 --no-prop-file \
##                     --ripsdirectory "$dest_dir" --url "$url" 2>&1)
##            
##            # Check for common failure patterns in the output
##            if echo "$output" | grep -q -E "Error|Failed|Status Code"; then
##                echo "Ripme encountered an error: $output"
##                return 1
##            fi
##
##            # Check the exit status of the command
##            if [[ $? -ne 0 ]]; then
##                echo "Ripme failed with a non-zero exit code."
##                return 1
##            fi
##
##            echo "Ripme succeeded for URL: $url"
##            return 0
##            ;;
#
##        ripme)
##            output=$(java -jar "$ripme_jar" --skip404 --no-prop-file --ripsdirectory "$dest_dir" \
##                  --url "$url" 2>&1) || return 1
##            output=$(http_proxy="socks5://127.0.0.1:9050" \
##                     https_proxy="socks5://127.0.0.1:9050" \
##                     java -Dhttp.agent="$user_agent" -jar "$ripme_jar" --skip404 --no-prop-file \
##                     --ripsdirectory "$dest_dir" --url "$url" 2>&1)
##            exit_code=$?
##            ;;
#        
#        yt-dlp)
##            output=$(yt-dlp --verbose --no-mtime --output "$dest_dir/%(title)s_%(autonumber)s.%(ext)s" \
##                    "$url" 2>&1) || return 1
#            output=$(yt-dlp --verbose --no-mtime --proxy "socks5://127.0.0.1:9050" \
#                            --user-agent "$user_agent" \
#                            --output "$dest_dir/%(title)s_%(autonumber)s.%(ext)s" "$url" 2>&1)
#            exit_code=$?
#            ;;
#        
#        *)
#            echo "Unknown tool: $tool"
#            return 1
#            ;;
#    esac
#
#    echo "$output"  # Log the tool's output
#
#    if [[ $exit_code -eq 0 ]]; then
#        echo "$tool succeeded for URL: $url"
#        return 0
#    elif [[ "$output" == *"429"* ]]; then
#        echo "429 Too Many Requests detected for $tool. Retrying..."
#        return 2
#    else
#        echo "$tool failed for URL: $url"
#        return 1
#    fi
#}
#
#
## Function to attempt downloading with a given tool
##attempt_download() {
##    local tool=$1
##    local url=$2
##    local dest_dir=$3
##    local output
##
##    echo "Trying $tool for URL: $url"
##    
##        # Define an array of User-Agent strings
##    user_agents=(
##        "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
##        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)"
##        "Mozilla/5.0 (X11; Linux x86_64)"
##        "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X)"
##        "Mozilla/5.0 (Android 11; Mobile; rv:89.0) Gecko/89.0 Firefox/89.0"
##    )
##
##    # Select a random User-Agent
##    user_agent="${user_agents[$RANDOM % ${#user_agents[@]}]}"
##
###    case $tool in
###        gallery-dl)
###            output=$(gallery-dl --config "$base_dir/.config/gallery-dl/config.json" \
###                                --verbose --no-mtime --dest "$dest_dir" \
###                                --filename "{category}_{id}_{num}.{extension}" \
###                                --proxy "socks5://127.0.0.1:9050" \
###                                --user-agent "$user_agent" "$url" 2>&1) || return 1
###            ;;
###        
###        ripme)
###            output=$(http_proxy="socks5://127.0.0.1:9050" \
###                     https_proxy="socks5://127.0.0.1:9050" \
###                     java -Dhttp.agent="$user_agent" -jar "$ripme_jar" --skip404 --no-prop-file \
###                     --ripsdirectory "$dest_dir" --url "$url" 2>&1) || return 1
###            ;;
###        
###        yt-dlp)
###            output=$(yt-dlp --verbose --no-mtime --proxy "socks5://127.0.0.1:9050" \
###                            --user-agent "$user_agent" \
###                            --output "$dest_dir/%(title)s_%(autonumber)s.%(ext)s" "$url" 2>&1) || return 1
###            ;;
###    esac
##    
##    case $tool in
##        gallery-dl)
##            output=$(gallery-dl --verbose --no-mtime --dest "$dest_dir" \
##                                --filename "{category}_{id}_{num}.{extension}" "$url" 2>&1) || return 1
##            ;;
##
##
##        ripme)
##            output=$(java -jar "$ripme_jar" --skip404 --no-prop-file --ripsdirectory "$dest_dir" \
##                          --url "$url" 2>&1) || return 1
##            ;;
##        yt-dlp)
##            output=$(yt-dlp --verbose --no-mtime --output "$dest_dir/%(title)s_%(autonumber)s.%(ext)s" \
##                            "$url" 2>&1) || return 1
##            ;;
##    esac
##
##
##    # Rotate Tor circuit after each download attempt
##    rotate_tor_circuit
##
###    case $tool in
###        gallery-dl)
###            output=$(gallery-dl --verbose --no-mtime --dest "$dest_dir" \
###                                --filename "{category}_{id}_{num}.{extension}" "$url" 2>&1) || return 1
###            ;;
###
###
###        ripme)
###            output=$(java -jar "$ripme_jar" --skip404 --no-prop-file --ripsdirectory "$dest_dir" \
###                          --url "$url" 2>&1) || return 1
###            ;;
###        yt-dlp)
###            output=$(yt-dlp --verbose --no-mtime --output "$dest_dir/%(title)s_%(autonumber)s.%(ext)s" \
###                            "$url" 2>&1) || return 1
###            ;;
###    esac
##
##    if [[ "$output" == *"429"* ]]; then
##        handle_429_error
###        rotate_tor_circuit
##        return 2  # Special case: Retry for 429
##    fi
##
##    return 0  # Success
##}
#
## Rotate Tor Circuit
#rotate_tor_circuit() {
#    cookie_file="/usr/local/var/lib/tor/control_auth_cookie"
#    if [[ -f "$cookie_file" ]]; then
#        # Extract the hex string from the cookie file
#        COOKIE=$(xxd -ps "$cookie_file" | tr -d '\n')
#
#        # Validate the cookie length
#        if [[ ${#COOKIE} -ne 64 ]]; then
#            echo "Error: Authentication cookie length is invalid (${#COOKIE}). Expected 64."
#            exit 1
#        fi
#
##        echo "Rotating Tor circuit..."
#        # Pass the raw cookie without extra quotes
##        echo -e "AUTHENTICATE $COOKIE\nSIGNAL NEWNYM\nQUIT" | nc 127.0.0.1 9051
#
##        sleep 5
#    else
#        echo "Tor authentication cookie not found at $cookie_file"
#        exit 1
#    fi
#}
#
## Function to process a single URL with retries across tools
#process_url() {
#    local url=$1
#    local dest_dir=$2
#    local tools=("gallery-dl" "ripme" "yt-dlp")
#    local retries=3
#
#    for tool in "${tools[@]}"; do
#        for ((attempt=1; attempt<=retries; attempt++)); do
#            echo "Attempt $attempt with $tool for URL: $url"
#            
#            # Run the tool and capture the return code
#            if attempt_download "$tool" "$url" "$dest_dir"; then
#                echo "$tool succeeded for URL: $url"
#                return 0
#            fi
#            
#            local exit_code=$?
#            
#            # Handle specific errors
#            if [[ $exit_code -eq 2 ]]; then
#                echo "Retrying due to 429 error with $tool..."
#                continue
#            else
#                echo "$tool failed for $url on attempt $attempt."
#                break
#            fi
#        done
#        echo "Moving to the next tool for URL: $url"
#    done
#    
#    # Rotate Tor circuit before falling back to Selenium
#    echo "All tools failed. Rotating Tor circuit before fallback..."
#    rotate_tor_circuit
#    
#    # Fallback to Selenium with Tor
#    echo "Falling back to Selenium with Tor for URL: $url"
#    if python3 "$base_dir/fallback_selenium.py" "$url" "$dest_dir"; then
#        echo "Successfully downloaded with Selenium: $url"
#        return 0
#    fi
#
#    # If all tools fail, log the failure and return 1
#    echo "All tools, including Selenium, failed for URL: $url."
#    rotate_tor_circuit
#    return 1
#}
#
#
## Function to process URLs from a file
#process_urls_file() {
#    local urls_file=$1
#    local images_dir=$2
#
#    if [[ ! -f "$urls_file" ]]; then
#        echo "URLs file not found: $urls_file"
#        return
#    fi
#
#    mkdir -p "$images_dir"
#
#    total_urls=$(grep -v '^#' "$urls_file" | grep -v '^\s*$' | wc -l)
#    echo "Processing $total_urls URLs from $urls_file..."
#
#    while IFS= read -r url || [ -n "$url" ]; do
#        if [[ -z "$url" || "$url" =~ ^# ]]; then
#            echo "Skipping empty or comment line."
#            continue
#        fi
#
#        echo "Processing URL: $url"
#        process_url "$url" "$images_dir" || {
#            echo "Failed to process URL: $url. Continuing to the next."
#        }
#        sleep $((RANDOM % 2 + 1))
#    done < "$urls_file"
#
#    echo "Finished processing URLs from $urls_file"
#}
#
## Main loop for all classes
#for cname in "${class_names[@]}"; do
#    echo "--- Processing class: $cname ---"
#
#    # Source URLs
#    source_urls_file="$source_urls_dirname/$cname.txt"
#    images_dir="$raw_data_dir/$cname/IMAGES"
#    process_urls_file "$source_urls_file" "$images_dir"
#
#    # Raw data URLs
#    raw_data_urls_file="$raw_data_dir/$cname/urls_${cname}.txt"
#    process_urls_file "$raw_data_urls_file" "$images_dir"
#done


#!/bin/bash
set -e  # Exit on command failures, but we'll handle failures gracefully within loops

# Define directories
scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source_urls_dirname="$scripts_dir/source_urls"

if [[ "$1" == "test" ]]; then
    echo "Running in test mode"
    source_urls_dirname="$scripts_dir/source_urls_test"
fi

base_dir="$(dirname "$scripts_dir")"
raw_data_dir="$base_dir/raw_data"

#declare -a class_names=("neutral" "porn" "drawings" "sexy" "hentai")
declare -a class_names=(
#    "neutral"
#    "porn"
#    "drawings"
    "sexy"
#    "hentai"
)

# Ensure necessary tools are installed
for tool in yt-dlp gallery-dl; do
    if ! command -v $tool &>/dev/null; then
        echo "$tool is not installed. Installing..."
        python3 -m pip install -U $tool || {
            echo "Failed to install $tool. Exiting."
            exit 1
        }
    fi
done

# Download ripme.jar if not already present
ripme_jar="$scripts_dir/ripme.jar"
if [[ ! -f "$ripme_jar" ]]; then
    echo "Downloading ripme.jar..."
    wget https://github.com/RipMeApp/ripme/releases/latest/download/ripme.jar -O "$ripme_jar" || {
        echo "Failed to download ripme.jar. Exiting."
        exit 1
    }
fi

# Function to handle 429 errors
handle_429_error() {
    echo "429 Too Many Requests detected. Pausing for cooldown..."
    rotate_tor_circuit
    sleep 15
}

attempt_download() {
    local tool=$1
    local url=$2
    local dest_dir=$3
    local output
    local exit_code

    echo "Trying $tool for URL: $url"
    
    # Define an array of User-Agent strings
    user_agents=(
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)"
        "Mozilla/5.0 (X11; Linux x86_64)"
        "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X)"
        "Mozilla/5.0 (Android 11; Mobile; rv:89.0) Gecko/89.0 Firefox/89.0"
    )
    user_agent="${user_agents[$RANDOM % ${#user_agents[@]}]}"

    case $tool in
        gallery-dl)
            output=$(gallery-dl --config "$base_dir/.config/gallery-dl/config.json" \
                        --verbose --no-mtime --dest "$dest_dir" \
                        --filename "{category}_{id}_{num}.{extension}" \
                        "$url" 2>&1)
            exit_code=$?

            # Check for successful HTTP responses in gallery-dl output
            if echo "$output" | grep -q 'HTTP/1.1" 200'; then
                echo "Gallery-dl succeeded for URL: $url"
                return 0
            fi
            ;;

        ripme)
            output=$(java -Dhttp.agent="$user_agent" -jar "$ripme_jar" --skip404 --no-prop-file \
                         --ripsdirectory "$dest_dir" --url "$url" 2>&1)
            exit_code=$?

            # Check for specific errors in RipMe output
            if echo "$output" | grep -q -E "Error|Failed|Status Code"; then
                echo "RipMe encountered an error: $output"
                return 1
            elif echo "$output" | grep -q "Rip complete"; then
                echo "RipMe succeeded for URL: $url"
                return 0
            fi
            ;;

        yt-dlp)
            output=$(yt-dlp --verbose --no-mtime --proxy "socks5://127.0.0.1:9050" \
                            --user-agent "$user_agent" \
                            --output "$dest_dir/%(title)s_%(autonumber)s.%(ext)s" "$url" 2>&1)
            exit_code=$?

            # Check for yt-dlp success
            if echo "$output" | grep -q "has already been downloaded" || \
               echo "$output" | grep -q "100%"; then
                echo "yt-dlp succeeded for URL: $url"
                return 0
            fi
            ;;
        
        *)
            echo "Unknown tool: $tool"
            return 1
            ;;
    esac

    echo "$output"  # Log the tool's output

    if [[ $exit_code -eq 0 ]]; then
        echo "$tool succeeded for URL: $url"
        return 0
    elif [[ "$output" == *"429"* ]]; then
        echo "429 Too Many Requests detected for $tool. Retrying..."
        return 2
    else
        echo "$tool failed for URL: $url"
        return 1
    fi
}


# Rotate Tor Circuit
rotate_tor_circuit() {
    cookie_file="/usr/local/var/lib/tor/control_auth_cookie"
    if [[ -f "$cookie_file" ]]; then
        # Extract the hex string from the cookie file
        COOKIE=$(xxd -ps "$cookie_file" | tr -d '\n')

        # Validate the cookie length
        if [[ ${#COOKIE} -ne 64 ]]; then
            echo "Error: Authentication cookie length is invalid (${#COOKIE}). Expected 64."
            exit 1
        fi
    else
        echo "Tor authentication cookie not found at $cookie_file"
        exit 1
    fi
}

# Function to process a single URL with retries across tools
process_url() {
    local url=$1
    local dest_dir=$2
    local tools=("gallery-dl" "ripme" "yt-dlp")
    local retries=3

    for tool in "${tools[@]}"; do
        for ((attempt=1; attempt<=retries; attempt++)); do
            echo "Attempt $attempt with $tool for URL: $url"
            
            # Run the tool and capture the return code
            if attempt_download "$tool" "$url" "$dest_dir"; then
                echo "$tool succeeded for URL: $url"
                return 0
            fi
            
            local exit_code=$?
            
            # Handle specific errors
            if [[ $exit_code -eq 2 ]]; then
                echo "Retrying due to 429 error with $tool..."
                continue
            else
                echo "$tool failed for $url on attempt $attempt."
                break
            fi
        done
        echo "Moving to the next tool for URL: $url"
    done
    
    # Rotate Tor circuit before falling back to Selenium
    echo "All tools failed. Rotating Tor circuit before fallback..."
    rotate_tor_circuit
    
    # Fallback to Selenium with Tor
    echo "Falling back to Selenium with Tor for URL: $url"
    if python3 "$base_dir/fallback_selenium.py" "$url" "$dest_dir"; then
        echo "Successfully downloaded with Selenium: $url"
        return 0
    fi

    # If all tools fail, log the failure and return 1
    echo "All tools, including Selenium, failed for URL: $url."
    rotate_tor_circuit
    return 1
}


# Function to process URLs from a file
process_urls_file() {
    local urls_file=$1
    local images_dir=$2

    if [[ ! -f "$urls_file" ]]; then
        echo "URLs file not found: $urls_file"
        return
    fi

    mkdir -p "$images_dir"

    total_urls=$(grep -v '^#' "$urls_file" | grep -v '^\s*$' | wc -l)
    echo "Processing $total_urls URLs from $urls_file..."

    while IFS= read -r url || [ -n "$url" ]; do
        if [[ -z "$url" || "$url" =~ ^# ]]; then
            echo "Skipping empty or comment line."
            continue
        fi

        echo "Processing URL: $url"
        process_url "$url" "$images_dir" || {
            echo "Failed to process URL: $url. Continuing to the next."
        }
        sleep $((RANDOM % 2 + 1))
    done < "$urls_file"

    echo "Finished processing URLs from $urls_file"
}

# Main loop for all classes
for cname in "${class_names[@]}"; do
    echo "--- Processing class: $cname ---"

    # Source URLs
    source_urls_file="$source_urls_dirname/$cname.txt"
    images_dir="$raw_data_dir/$cname/IMAGES"
    process_urls_file "$source_urls_file" "$images_dir"

    # Raw data URLs
    raw_data_urls_file="$raw_data_dir/$cname/urls_${cname}.txt"
    process_urls_file "$raw_data_urls_file" "$images_dir"
done
