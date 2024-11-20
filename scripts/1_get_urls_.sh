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



#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

# Define directories
scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source_urls_dirname="source_urls"

if [[ "$1" == "test" ]]; then
    echo "Running in test mode"
    source_urls_dirname="source_urls_test"
fi

base_dir="$(dirname "$scripts_dir")"
raw_data_dir="$base_dir/raw_data"

# Define class names
declare -a class_names=(
    "neutral"
    "porn"
    "drawings"
    "sexy"
    "hentai"
)

# Download ripme.jar if not already present
ripme_jar="$scripts_dir/ripme.jar"
if [[ ! -f "$ripme_jar" ]]; then
    echo "Downloading ripme.jar..."
    wget https://github.com/RipMeApp/ripme/releases/latest/download/ripme.jar -O "$ripme_jar"
fi

for cname in "${class_names[@]}"; do
    echo "--- Getting images for class: $cname"
    urls_file="$scripts_dir/$source_urls_dirname/$cname.txt"
    images_dir="$raw_data_dir/$cname/IMAGES"
    mkdir -p "$images_dir"

    if [[ ! -f "$urls_file" ]]; then
        echo "URLs file not found for class $cname: $urls_file"
        continue
    fi

    total_urls=$(grep -v '^#' "$urls_file" | grep -v '^\s*$' | wc -l)
    echo "Class: $cname. Total # of URLs: $total_urls"

    if [ "$total_urls" -eq 0 ]; then
        echo "No URLs to process for $cname."
        continue
    fi

    while IFS= read -r url || [ -n "$url" ]; do
        if [[ -z "$url" || "$url" =~ ^# ]]; then
            echo "Skipping empty or comment line."
            continue
        fi
        echo "Processing URL: '$url'"

        # Resolve redirects for pornpics.com URLs without numeric ID
        if [[ "$url" =~ pornpics\.com && ! "$url" =~ -[0-9]+\/?$ ]]; then
            echo "URL lacks numeric ID. Resolving redirect..."
            resolved_url=$(curl -Ls -o /dev/null -w '%{url_effective}' "$url")
            if [[ "$resolved_url" =~ pornpics\.com ]]; then
                echo "Resolved URL: '$resolved_url'"
                url="$resolved_url"
            else
                echo "Failed to resolve URL for $url. Skipping."
                continue
            fi
        fi

        # Use yt-dlp for v.redd.it URLs
        if [[ "$url" =~ v\.redd\.it ]]; then
            echo "Using yt-dlp for video URL: '$url'"

            yt-dlp --verbose --no-mtime --output "$images_dir/%(title)s.%(ext)s" "$url" || {
                echo "yt-dlp failed for $url. Skipping."
                continue
            }
        else
            # Try using gallery-dl first
            gallery-dl --verbose --no-mtime --dest "$images_dir" \
                       --filename "{category}_{id}.{extension}" "$url" || {
                echo "gallery-dl failed for $url. Attempting with ripme..."

                java -jar "$ripme_jar" \
                     --skip404 \
                     --no-prop-file \
                     --ripsdirectory "$images_dir" \
                     --url "$url" || {
                    echo "ripme also failed for $url. Skipping."
                    continue
                }
            }
        fi

        # Random sleep to avoid overwhelming servers
        sleep $((RANDOM % 5 + 1))
    done < "$urls_file"
done
