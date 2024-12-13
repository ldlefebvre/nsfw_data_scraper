#!/bin/bash

#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
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
#for cname in "${class_names[@]}"
#do
#	urls_file="$raw_data_dir/$cname/urls_$cname.txt"
#	images_dir="$raw_data_dir/$cname/IMAGES"
#	mkdir -p "$images_dir"
#	echo "Class: $cname. Total # of urls: $(cat $urls_file | wc -l)"
#	echo "Downloading images..."
#	xargs -n 20 -P 8 wget -nc -q --timeout=5 --tries=2 -P "$images_dir" < "$urls_file"
#done

##!/bin/bash
#
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
#declare -a class_names=(
#    "neutral"
#    "porn"
#    "drawings"
#    "sexy"
#    "hentai"
#)
#
#for cname in "${class_names[@]}"; do
#    images_dir="$raw_data_dir/$cname/IMAGES"
#    echo "Class: $cname. Number of images: $(find "$images_dir" -type f | wc -l)"
#    # Add any additional processing if needed
#done


##For sub folders urls.txt for when also running script 1
##!/bin/bash
#
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
#declare -a class_names=(
#    "neutral"
#    "porn"
#    "drawings"
#    "sexy"
#    "hentai"
#)
#
#for cname in "${class_names[@]}"; do
#    class_dir="$raw_data_dir/$cname"
#    images_dir="$class_dir/IMAGES"
#
#    # Ensure the images directory exists
#    mkdir -p "$images_dir"
#
#    echo "Class: $cname"
#    echo "Number of images: $(find "$images_dir" -type f | wc -l)"
#
#    # Find all `urls.txt` files in the class directory and its subdirectories
#    find "$class_dir" -type f -name "urls*.txt" | while read -r urls_file; do
#        echo "Processing URLs from: $urls_file"
#        xargs -n 1 -P 8 wget -nc --timeout=5 --tries=2 -P "$images_dir" < "$urls_file"
#    done
#
#    echo "Updated number of images: $(find "$images_dir" -type f | wc -l)"
#    echo "-----------------------------------------"
#done


#When only running from script2 with all urls_category.txt already prepopulated in raw_data categories
#!/bin/bash

#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
#declare -a class_names=(
#    "neutral"
#    "porn"
#    "drawings"
#    "sexy"
#    "hentai"
#)
#
#for cname in "${class_names[@]}"; do
#    images_dir="$raw_data_dir/$cname/IMAGES"
#    urls_file="$raw_data_dir/$cname/urls_$cname.txt"
#
#    # Ensure the images directory exists
#    mkdir -p "$images_dir"
#
#    echo "Class: $cname"
#    echo "Number of images: $(find "$images_dir" -type f | wc -l)"
#
#    # Check if `urls.txt` exists and process it
#    if [[ -f "$urls_file" ]]; then
#        echo "Processing URLs from: $urls_file"
#        xargs -n 1 -P 8 wget -nc --timeout=5 --tries=2 -P "$images_dir" < "$urls_file"
#    else
#        echo "No URLs file found for class: $cname"
#    fi
#
#    echo "Updated number of images: $(find "$images_dir" -type f | wc -l)"
#    echo "-----------------------------------------"
#done

##!/bin/bash
#
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
#declare -a class_names=(
#    "neutral"
#    "porn"
#    "drawings"
#    "sexy"
#    "hentai"
#)
#
#for cname in "${class_names[@]}"; do
#    images_dir="$raw_data_dir/$cname/IMAGES"
#    urls_file="$raw_data_dir/$cname/urls_$cname.txt"
#
#    # Ensure the images directory exists
#    mkdir -p "$images_dir"
#
#    echo "Class: $cname"
#    echo "Number of images: $(find "$images_dir" -type f | wc -l)"
#
#    # Check if `urls.txt` exists and process it
#    if [[ -f "$urls_file" ]]; then
#        echo "Processing URLs from: $urls_file"
#
#        # Process URLs with a delay and retry mechanism
#        while IFS= read -r url; do
#            wget -nc --timeout=5 --tries=2 -P "$images_dir" "$url" || {
#                echo "429 Too Many Requests. Retrying after a delay..."
#                sleep 10
#                wget -nc --timeout=5 --tries=2 -P "$images_dir" "$url"
#            }
#            sleep 1  # Add a small delay between requests
#        done < "$urls_file"
#
#    else
#        echo "No URLs file found for class: $cname"
#    fi
#
#    echo "Updated number of images: $(find "$images_dir" -type f | wc -l)"
#    echo "-----------------------------------------"
#done


##!/bin/bash
#
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
#declare -a class_names=(
#    "neutral"
#    "porn"
#    "drawings"
#    "sexy"
#    "hentai"
#)
#
#parallel_downloads=5
#retry_delay=10  # Delay in seconds for retries
#max_retries=3   # Maximum retries for each URL
#global_backoff=60  # Global cooldown period on 429 errors
#
#for cname in "${class_names[@]}"; do
#    images_dir="$raw_data_dir/$cname/IMAGES"
#    urls_file="$raw_data_dir/$cname/urls_$cname.txt"
#
#    mkdir -p "$images_dir"
#
#    echo "Class: $cname"
#    echo "Number of images: $(find "$images_dir" -type f | wc -l)"
#
#    if [[ -f "$urls_file" ]]; then
#        echo "Processing URLs from: $urls_file"
#
#        export images_dir retry_delay max_retries global_backoff
#        cat "$urls_file" | xargs -n 1 -P "$parallel_downloads" -I {} bash -c '
#            url="{}"
#            retries=0
#            while [[ $retries -lt $max_retries ]]; do
#                response=$(wget -nc --timeout=5 --tries=2 -P "$images_dir" "$url" 2>&1)
#                if [[ $? -eq 0 ]]; then
#                    break  # Successful download
#                elif echo "$response" | grep -q "429 Too Many Requests"; then
#                    echo "429 Too Many Requests detected. Global backoff for $global_backoff seconds..."
#                    sleep "$global_backoff"
#                else
#                    echo "Error downloading $url. Retrying in $retry_delay seconds..."
#                    sleep "$retry_delay"
#                fi
#                retries=$((retries + 1))
#            done
#            if [[ $retries -eq $max_retries ]]; then
#                echo "Failed to download $url after $max_retries retries."
#            fi
#        '
#    else
#        echo "No URLs file found for class: $cname"
#    fi
#
#    echo "Updated number of images: $(find "$images_dir" -type f | wc -l)"
#    echo "-----------------------------------------"
#done


##!/bin/bash
#
## Set directories
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
## Define class names
#declare -a class_names=(
##    "neutral"
##    "porn"
##    "drawings"
##    "sexy"
#    "hentai"
#)
#
#handle_429_error() {
#    echo "429 Too Many Requests detected. Pausing for cooldown..."
#    sleep 10  # Cooldown period
#}
#
#for cname in "${class_names[@]}"; do
#    class_dir="$raw_data_dir/$cname"
#
#    # Find all `urls.txt` files excluding `urls_$cname.txt`
#    find "$class_dir" -type f -name "urls.txt" ! -path "*urls_${cname}.txt" | while read -r urls_file; do
#        urls_dir="$(dirname "$urls_file")"
#
#        echo "Processing URLs from: $urls_file"
#        echo "Images will be saved in: $urls_dir"
#
#        # Read and process each URL
#        while IFS= read -r url || [[ -n "$url" ]]; do
#            if [[ -z "$url" || "$url" =~ ^# ]]; then
#                echo "Skipping empty or comment line."
#                continue
#            fi
#
#            echo "Processing URL: $url"
#
#            # Try gallery-dl first
#            if gallery-dl --verbose --no-mtime --dest "$urls_dir" \
#                          --filename "{category}_{id}_{num}.{extension}" "$url"; then
#                echo "Successfully downloaded with gallery-dl: $url"
#                sed -i "\|^$url\$|d" "$urls_file"  # Remove the URL from `urls.txt` if successful
#            else
#                echo "gallery-dl failed for $url. Attempting with wget..."
#
#                # Fallback to wget
#                if wget -nc --timeout=5 --tries=2 -P "$urls_dir" "$url"; then
#                    echo "Successfully downloaded with wget: $url"
#                    sed -i "\|^$url\$|d" "$urls_file"  # Remove the URL from `urls.txt` if successful
#                else
#                    echo "429 Too Many Requests for $url. Retrying after a delay..."
#                    sleep 10
#                    if wget -nc --timeout=5 --tries=2 -P "$urls_dir" "$url"; then
#                        echo "Successfully downloaded with wget after retry: $url"
#                        sed -i "\|^$url\$|d" "$urls_file"  # Remove the URL from `urls.txt` if successful
#                    else
#                        echo "Failed to download $url after retry. Skipping."
#                    fi
#                fi
#            fi
#            sleep $((RANDOM % 2 + 1))
#        done < "$urls_file"
#
#        # Remove the file if it's empty
#        if [[ ! -s "$urls_file" ]]; then
#            echo "No more URLs left in $urls_file. Deleting the file."
#            rm "$urls_file"
#        fi
#
#        echo "Finished processing: $urls_file"
#        echo "Remaining URLs in: $urls_file"
#        echo "-----------------------------------------"
#    done
#done




##!/bin/bash
#
## Set directories
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
## Define class names
#declare -a class_names=(
##    "neutral"
##    "porn"
##    "drawings"
#    "sexy"
##    "hentai"
#)
#
#handle_429_error() {
#    echo "429 Too Many Requests detected. Pausing for cooldown..."
#    sleep 60  # Cooldown period
#}
#
#for cname in "${class_names[@]}"; do
#    class_dir="$raw_data_dir/$cname"
#
#    # Find all `urls.txt` files excluding `urls_$cname.txt`
#    find "$class_dir" -type f -name "urls.txt" ! -path "*urls_${cname}.txt" | while read -r urls_file; do
#        urls_dir="$(dirname "$urls_file")"
#
#        echo "Processing URLs from: $urls_file"
#        echo "Images will be saved in: $urls_dir"
#
#        # Read and process each URL
#        while IFS= read -r url || [[ -n "$url" ]]; do
#            if [[ -z "$url" || "$url" =~ ^# ]]; then
#                echo "Skipping empty or comment line."
#                continue
#            fi
#
#            echo "Processing URL: $url"
#
#            max_retries=2  # Number of retries for each command
#            success=false
#
#            # Retry logic for gallery-dl
#            for ((retry=1; retry<=max_retries; retry++)); do
#                gallery_output=$(gallery-dl --verbose --no-mtime --dest "$urls_dir" \
#                    --filename "{category}_{id}_{num}.{extension}" "$url" 2>&1)
#                
#                if [[ $? -eq 0 ]]; then
#                    echo "Successfully downloaded with gallery-dl: $url"
#                    sed -i "\|^$url\$|d" "$urls_file"  # Remove the URL from `urls.txt` if successful
#                    success=true
#                    break
#                elif echo "$gallery_output" | grep -q "429"; then
#                    echo "Gallery-dl encountered 429. Retrying... ($retry/$max_retries)"
#                    handle_429_error
#                else
#                    echo "Gallery-dl failed for $url on attempt $retry."
#                    break  # Exit retry loop for other errors
#                fi
#            done
#
#            # Move to wget if gallery-dl fails
#            if [[ "$success" = false ]]; then
#                for ((retry=1; retry<=max_retries; retry++)); do
#                    wget_output=$(wget -nc --timeout=5 --tries=2 -P "$urls_dir" "$url" 2>&1)
#                    
#                    if [[ $? -eq 0 ]]; then
#                        echo "Successfully downloaded with wget: $url"
#                        sed -i "\|^$url\$|d" "$urls_file"  # Remove the URL from `urls.txt` if successful
#                        success=true
#                        break
#                    elif echo "$wget_output" | grep -q "429"; then
#                        echo "Wget encountered 429. Retrying... ($retry/$max_retries)"
#                        handle_429_error
#                    else
#                        echo "Wget failed for $url on attempt $retry."
#                        break  # Exit retry loop for other errors
#                    fi
#                done
#            fi
#
#            if [[ "$success" = false ]]; then
#                echo "Failed to download $url after retries. Skipping."
#            fi
#            sleep $((RANDOM % 2 + 1))
#        done < "$urls_file"
#
#        # Remove the file if it's empty
#        if [[ ! -s "$urls_file" ]]; then
#            echo "No more URLs left in $urls_file. Deleting the file."
#            rm "$urls_file"
#        fi
#
#        echo "Finished processing: $urls_file"
#        echo "Remaining URLs in: $urls_file"
#        echo "-----------------------------------------"
#    done
#done

##!/bin/bash
#
## Directories
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
## Class names
#declare -a class_names=(
##    "neutral"
##    "porn"
##    "drawings"
#    "sexy"
##    "hentai"
#)
#
## Handle 429 Too Many Requests
#handle_429_error() {
#    echo "429 Too Many Requests detected. Pausing for cooldown..."
#    sleep 15
#}
#
## Process URLs
#for cname in "${class_names[@]}"; do
#    class_dir="$raw_data_dir/$cname"
#    find "$class_dir" -type f -name "urls.txt" | while read -r urls_file; do
#        urls_dir="$(dirname "$urls_file")"
#        echo "Processing URLs from: $urls_file"
#
#        while IFS= read -r url || [[ -n "$url" ]]; do
#            if [[ -z "$url" || "$url" =~ ^# ]]; then
#                echo "Skipping empty or comment line."
#                continue
#            fi
#
#            echo "Processing URL: $url"
#
#            max_retries=2
#            success=false
#            
#            # Attempt wget
#            if [[ "$success" = false ]]; then
#                for ((retry=1; retry<=max_retries; retry++)); do
#                    #wget_output=$(wget -nc --timeout=5 --tries=2 -P "$urls_dir" "$url" 2>&1)
#                    #torify wget --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64)" -nc --timeout=5 --tries=2 -P "$dest_dir" "$url" 2>&1
##                    curl --socks5-hostname 127.0.0.1:9050 \
##                         --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
##                         --retry 2 \
##                         --max-time 5 \
##                         --create-dirs \
##                         --output "$dest_dir/$(basename $url)" \
##                         "$url" 2>&1
#                         
#                    xargs -n 1 -P 5 -I {} curl --socks5-hostname 127.0.0.1:9050 \
#                         --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
#                         --retry 3 --max-time 60 --create-dirs --output "$dest_dir/$(basename "{}")" "{}" \
#                        || echo "{}" >> failed_urls.log
#
#
#                    if [[ $? -eq 0 ]]; then
#                        echo "Successfully downloaded with wget: $url"
#                        sed -i '' "\|^$url\$|d" "$urls_file"  # Remove the URL from `urls.txt`
#                        success=true
#                        break
#                    elif echo "$wget_output" | grep -q "429"; then
#                        handle_429_error
#                    else
#                        break
#                    fi
#                done
#            fi
#
#            # Attempt gallery-dl
#            for ((retry=1; retry<=max_retries; retry++)); do
#                gallery_output=$(gallery-dl --verbose --no-mtime --dest "$urls_dir" \
#                    --filename "{category}_{id}_{num}.{extension}" "$url" 2>&1)
#
#                if [[ $? -eq 0 ]]; then
#                    echo "Successfully downloaded with gallery-dl: $url"
#                    sed -i '' "\|^$url\$|d" "$urls_file"  # Remove the URL from `urls.txt`
#                    success=true
#                    break
#                elif echo "$gallery_output" | grep -q "429"; then
#                    handle_429_error
#                else
#                    break
#                fi
#            done
#            
#            # Attempt Selenium with Tor
#            if [[ "$success" = false ]]; then
#                echo "Fallback to Selenium for URL: $url"
#                python3 "$scripts_dir/fallback_selenium.py" "$url" "$urls_dir"
#                if [[ $? -eq 0 ]]; then
#                    echo "Successfully downloaded with Selenium: $url"
#                    sed -i '' "\|^$url\$|d" "$urls_file"
#                else
#                    echo "Failed to process $url after all retries. Skipping."
#                fi
#            fi
#
#            sleep $((RANDOM % 2 + 1))
#        done < "$urls_file"
#
#        # Cleanup
#        if [[ ! -s "$urls_file" ]]; then
#            rm "$urls_file"
#        fi
#    done
#done


##!/bin/bash
#
## Directories
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#
## Class names
#declare -a class_names=(
##    "neutral"
##    "porn"
##    "drawings"
#    "sexy"
##    "hentai"
#)
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
## Download function
#download_with_curl() {
#    local url="$1"
#    local dest_dir="$2"
#    user_agents=("Mozilla/5.0 (Windows NT 10.0; Win64; x64)" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)" "Mozilla/5.0 (X11; Linux x86_64)")
#    user_agent="${user_agents[$RANDOM % ${#user_agents[@]}]}"
#    curl --socks5-hostname 127.0.0.1:9050 \
#         --user-agent "$user_agent" \
#         --retry 3 --max-time 60 \
#         --create-dirs --output "$dest_dir/$(basename "$url")" "$url" 2>&1
#}
#
## Process URLs
#for cname in "${class_names[@]}"; do
#    class_dir="$raw_data_dir/$cname"
#    find "$class_dir" -type f -name "urls.txt" | while read -r urls_file; do
#        urls_dir="$(dirname "$urls_file")"
#        echo "Processing URLs from: $urls_file"
#        
#        cat "$urls_file" | xargs -n 1 -P 20 -I {} bash -c '
#            download_with_curl "{}" "'"$urls_dir"'"
#            if [[ $? -ne 0 ]]; then
#                echo "{}" >> failed_urls.log
#                rotate_tor_circuit
#            fi
#        '
#
#        # Rotate Tor circuit after processing each file
##        rotate_tor_circuit
#
#        # Retry failed downloads with gallery-dl
#        if [[ -f failed_urls.log && -s failed_urls.log ]]; then
#            echo "Retrying failed URLs with gallery-dl..."
#            mv failed_urls.log temp_urls.txt
#            while IFS= read -r url; do
##                gallery_output=$(gallery-dl --verbose --no-mtime --dest "$urls_dir" \
##                    --filename "{category}_{id}_{num}.{extension}" "$url" 2>&1)
##                gallery_output=$(gallery-dl --verbose --no-mtime --dest "$urls_dir" \
##                    --filename "{category}_{id}_{num}.{extension}" \
##                    --proxy "socks5://127.0.0.1:9050" "$url" 2>&1)
#                gallery_output=$(gallery-dl --config "$base_dir/.config/gallery-dl/config.json" \
#                    --verbose --no-mtime --dest "$urls_dir" \
#                    --filename "{category}_{id}_{num}.{extension}" \
#                    "$url" 2>&1)
#
#                if [[ $? -eq 0 ]]; then
#                    echo "Successfully downloaded with gallery-dl: $url"
#                    sed -i '' "\|^$url\$|d" temp_urls.txt  # Remove successful URL
#                elif echo "$gallery_output" | grep -q "429"; then
#                    handle_429_error
#                    rotate_tor_circuit
#                else
#                    echo "$url" >> gallery_failed_urls.log
#                    rotate_tor_circuit
#                fi
#            done < temp_urls.txt
#            rm temp_urls.txt
#        fi
#
#        # Final fallback with Selenium and Tor
#        if [[ -f gallery_failed_urls.log && -s gallery_failed_urls.log ]]; then
#            echo "Retrying failed URLs with Selenium..."
#            while IFS= read -r url; do
#                python3 "$base_dir/fallback_selenium.py" "$url" "$urls_dir"
#                if [[ $? -eq 0 ]]; then
#                    echo "Successfully downloaded with Selenium: $url"
#                    sed -i '' "\|^$url\$|d" gallery_failed_urls.log
#                else
#                    echo "Failed to process $url after all retries. Skipping."
#                    rotate_tor_circuit
#                fi
#            done < gallery_failed_urls.log
#            rm gallery_failed_urls.log
#        fi
#        
##        rotate_tor_circuit
#
#        # Cleanup
#        if [[ ! -s "$urls_file" ]]; then
#            rm "$urls_file"
#        fi
#    done
#done



#!/bin/bash

# Directories
scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
base_dir="$(dirname "$scripts_dir")"
raw_data_dir="$base_dir/raw_data"

# Class names
declare -a class_names=(
#    "neutral"
#    "porn"
#    "drawings"
    "sexy"
#    "hentai"
)

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

# Download function
download_with_curl() {
    local url="$1"
    local dest_dir="$2"
    user_agents=("Mozilla/5.0 (Windows NT 10.0; Win64; x64)" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)" "Mozilla/5.0 (X11; Linux x86_64)")
    user_agent="${user_agents[$RANDOM % ${#user_agents[@]}]}"
    curl --socks5-hostname 127.0.0.1:9050 \
         --user-agent "$user_agent" \
         --retry 3 --max-time 60 \
         --create-dirs --output "$dest_dir/$(basename "$url")" "$url" 2>&1
}

# Process URLs
for cname in "${class_names[@]}"; do
    class_dir="$raw_data_dir/$cname"
    find "$class_dir" -type f -name "urls.txt" | while read -r urls_file; do
        urls_dir="$(dirname "$urls_file")"
        echo "Processing URLs from: $urls_file"
        
        cat "$urls_file" | xargs -n 1 -P 20 -I {} bash -c '
            download_with_curl "{}" "'"$urls_dir"'"
            if [[ $? -ne 0 ]]; then
                echo "{}" >> failed_urls.log
                rotate_tor_circuit
            fi
        '

        # Retry failed downloads with gallery-dl
        if [[ -f failed_urls.log && -s failed_urls.log ]]; then
            echo "Retrying failed URLs with gallery-dl..."
            mv failed_urls.log temp_urls.txt
            while IFS= read -r url; do
                gallery_output=$(gallery-dl --config "$base_dir/.config/gallery-dl/config.json" \
                    --verbose --no-mtime --dest "$urls_dir" \
                    --filename "{category}_{id}_{num}.{extension}" \
                    "$url" 2>&1)

                if echo "$gallery_output" | grep -q 'HTTP/1.1" 200'; then
                    echo "Successfully downloaded with gallery-dl: $url"
                    sed -i '' "\|^$url\$|d" temp_urls.txt  # Remove successful URL
                elif echo "$gallery_output" | grep -q "429"; then
                    handle_429_error
                    rotate_tor_circuit
                else
                    echo "$url" >> gallery_failed_urls.log
                    rotate_tor_circuit
                fi
            done < temp_urls.txt
            rm temp_urls.txt
        fi

        # Final fallback with Selenium and Tor
        if [[ -f gallery_failed_urls.log && -s gallery_failed_urls.log ]]; then
            echo "Retrying failed URLs with Selenium..."
            while IFS= read -r url; do
                python3 "$base_dir/fallback_selenium.py" "$url" "$urls_dir"
                if [[ $? -eq 0 ]]; then
                    echo "Successfully downloaded with Selenium: $url"
                    sed -i '' "\|^$url\$|d" gallery_failed_urls.log
                else
                    echo "Failed to process $url after all retries. Skipping."
                    rotate_tor_circuit
                fi
            done < gallery_failed_urls.log
            rm gallery_failed_urls.log
        fi
        
        # Cleanup
        if [[ ! -s "$urls_file" ]]; then
            rm "$urls_file"
        fi
    done
done
