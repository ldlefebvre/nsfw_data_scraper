#!/bin/bash

scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
base_dir="$(dirname "$scripts_dir")"
raw_data_dir="$base_dir/raw_data"
drawings_dir="$raw_data_dir/drawings"
download_dir="$drawings_dir/anime_dataset"
mkdir -p "$download_dir"


n_batches=4
# since the numbering starts at 0, actual number of batches will be `n_batches + 1`
# each batch contains roughly 2200 images
for batch_num in $(seq -f "%04g" 0 "$n_batches")
do
    rsync --recursive --times "rsync://78.46.86.149:873/danbooru2018/512px/$batch_num" "$download_dir"
done

# for whatever reason, most images contain black borders
# need to remove them
for subdir_name in $(ls "$download_dir")
do
    find "$download_dir/$subdir_name" -name "*.jpg" -print0 |
    while IFS= read -r -d '' img
    do
        convert "$img" -bordercolor black -border 1x1 -fuzz 20% -trim "$img"
    done
done


##!/bin/bash
#
## Enable error handling
#set -e
#
## Define directories
#scripts_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
## Define categories
#declare -a class_names=(
#    "neutral"
#    "porn"
#    "drawings"
#    "sexy"
#    "hentai"
#)
#
## Ensure RipMe jar exists
#ripme_jar="$scripts_dir/ripme.jar"
#if [[ ! -f "$ripme_jar" ]]; then
#    echo "Downloading RipMe..."
#    wget -q "https://github.com/RipMeApp/ripme/releases/latest/download/ripme.jar" -O "$ripme_jar"
#fi
#
## Loop through each category
#for cname in "${class_names[@]}"; do
#    urls_file="$raw_data_dir/$cname/urls_${cname}.txt"
#    images_dir="$raw_data_dir/$cname/IMAGES"
#    mkdir -p "$images_dir"
#
#    # Check if the URL file exists
#    if [[ -f "$urls_file" ]]; then
#        echo "Processing URLs for $cname..."
#
#        # Read each URL from the text file and process it
#        while IFS= read -r url || [[ -n "$url" ]]; do
#            # Skip empty lines or comments
#            if [[ -z "$url" || "$url" =~ ^# ]]; then
#                echo "Skipping empty/commented line."
#                continue
#            fi
#
#            # Ensure the URL uses HTTPS
#            url="https://$(echo "$url" | sed 's|http://||')"
#
#            # Try gallery-dl first
#            echo "Trying gallery-dl for: $url"
#            gallery-dl --verbose --no-mtime --dest "$images_dir" "$url" && continue
#
#            # If gallery-dl fails, try RipMe
#            echo "Gallery-dl failed for $url. Attempting with RipMe..."
#            java -jar "$ripme_jar" \
#                --skip404 \
#                --no-prop-file \
#                --ripsdirectory "$images_dir" \
#                --url "$url" && continue
#
#            # If RipMe fails, fallback to wget
#            echo "RipMe failed for $url. Attempting direct download with wget..."
#            max_attempts=5
#            attempt=1
#            success=false
#            while [[ $attempt -le $max_attempts ]]; do
#                echo "Attempting wget: $url (Attempt $attempt)..."
#                wget --user-agent="Mozilla/5.0" -q -P "$images_dir" "$url" && success=true && break
#                echo "Failed to download: $url (Attempt $attempt)"
#                ((attempt++))
#                sleep $((RANDOM % 5 + 1))
#            done
#
#            if [[ $success == false ]]; then
#                echo "Failed to download after $max_attempts attempts: $url"
#            fi
#        done <"$urls_file"
#    else
#        echo "URLs file not found for $cname: $urls_file"
#    fi
#done
