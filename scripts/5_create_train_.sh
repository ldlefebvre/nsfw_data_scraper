##!/bin/bash
#
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#data_dir="$base_dir/data"
#
#declare -a class_names=(
##	"neutral"
##	"drawings"
#	"sexy"
##	"porn"
##	"hentai"
#	)
#
#train_dir="$data_dir/train"
#mkdir -p "$train_dir"
#
#echo "Copying image to the training folder"
#for cname in "${class_names[@]}"
#do
#	raw_data_class_dir="$raw_data_dir/$cname"
#	if [[ -d "$raw_data_class_dir" ]]
#	then
#		mkdir -p "$train_dir/$cname"
#		find "$raw_data_class_dir" -type f \( -name '*.jpg' -o -name '*.jpeg' \) -print0 |
#		while IFS= read -r -d '' jpg_f
#		do
#            checksum=$(sha256sum "$jpg_f" | awk '{print $1}')
#            cp "$jpg_f" "$train_dir/$cname/${checksum}.jpg"
#
##		    cp "$jpg_f" "$train_dir/$cname/$(sha256sum $jpg_f | awk '{print $1}').jpg"
#		done
#	fi
#done
#
#echo "Removing corrupted images"
#find "$train_dir" -type f -name '*.jpg' -print0 |
#while IFS= read -r -d '' jpg_f
#do
#    is_corrupted="$(convert "$jpg_f" /dev/null &> /dev/null; echo $?)"
#	if [[ "$is_corrupted" -eq  "1" ]]
#	then
#		echo "removing: $jpg_f"
#		rm "$jpg_f"
#	fi
#done
#
##echo "Removing very large (>10M) and very small (<6K) images"
##find "$train_dir" -type 'f' -size +10M -delete
##find "$train_dir" -type 'f' -size -6k -delete
#
#mkdir -p "$train_dir/too_big"
#mkdir -p "$train_dir/too_small"
#
#echo "Moving very large (>10M) images to $train_dir/too_big"
#find "$train_dir" -type f -size +10M -exec mv {} "$train_dir/too_big" \;
#
#echo "Moving very small (<6K) images to $train_dir/too_small"
#find "$train_dir" -type f -size -6k -exec mv {} "$train_dir/too_small" \;
#
#echo "Number of files per class:"
#for subdir in $(ls "$train_dir")
#do
#	echo "$subdir": "$(find "$train_dir/$subdir" -type f | wc -l)"
#done



#!/bin/bash

scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
base_dir="$(dirname "$scripts_dir")"
raw_data_dir="$base_dir/raw_data"
data_dir="$base_dir/data"
removed_dir="$base_dir/removed_image"

declare -a class_names=(
    "neutral"
    "drawings"
    "sexy"
    "porn"
    "hentai"
)

train_dir="$data_dir/train"
mkdir -p "$train_dir"
mkdir -p "$removed_dir" # Create the root folder for removed images

echo "Copying and converting images to the training folder"
for cname in "${class_names[@]}"
do
    raw_data_class_dir="$raw_data_dir/$cname"
    if [[ -d "$raw_data_class_dir" ]]
    then
        mkdir -p "$train_dir/$cname"
        mkdir -p "$removed_dir/wrong_extension/$cname" # For unsupported files
        mkdir -p "$removed_dir/corrupted_images/$cname" # For corrupted images
        mkdir -p "$removed_dir/too_big/$cname" # For too large images
        mkdir -p "$removed_dir/too_small/$cname" # For too small images

        find "$raw_data_class_dir" -type f ! \( -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' \) -print0 |
        while IFS= read -r -d '' file
        do
            echo "Moving unsupported file: $file"
            mv "$file" "$removed_dir/wrong_extension/$cname/"
        done

        find "$raw_data_class_dir" -type f \( -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' \) -print0 |
        while IFS= read -r -d '' img_f
        do
            # Compute checksum for deduplication
            checksum=$(sha256sum "$img_f" | awk '{print $1}')

            # Handle PNG conversion to JPEG
            if [[ "$img_f" == *.png ]]
            then
                echo "Converting PNG to JPEG: $img_f"
                convert "$img_f" "$train_dir/$cname/${checksum}.jpg"
            else
                # Copy JPG or JPEG directly
                cp "$img_f" "$train_dir/$cname/${checksum}.jpg"
            fi
        done
    fi
done

echo "Checking for corrupted images"
find "$train_dir" -type f -name '*.jpg' -print0 |
while IFS= read -r -d '' jpg_f
do
    is_corrupted="$(convert "$jpg_f" /dev/null &> /dev/null; echo $?)"
    if [[ "$is_corrupted" -eq  "1" ]]
    then
        class_name=$(basename "$(dirname "$jpg_f")")
        echo "Moving corrupted image: $jpg_f"
        mv "$jpg_f" "$removed_dir/corrupted_images/$class_name/"
    fi
done

echo "Checking for very large and very small images"
find "$train_dir" -type f -size +10M -print0 |
while IFS= read -r -d '' large_f
do
    class_name=$(basename "$(dirname "$large_f")")
    echo "Moving large image: $large_f"
    mv "$large_f" "$removed_dir/too_big/$class_name/"
done

find "$train_dir" -type f -size -6k -print0 |
while IFS= read -r -d '' small_f
do
    class_name=$(basename "$(dirname "$small_f")")
    echo "Moving small image: $small_f"
    mv "$small_f" "$removed_dir/too_small/$class_name/"
done

echo "Number of files per class:"
for subdir in $(ls "$train_dir")
do
    echo "$subdir": "$(find "$train_dir/$subdir" -type f | wc -l)"
done
