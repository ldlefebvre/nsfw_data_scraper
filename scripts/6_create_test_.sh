##!/bin/bash
#
#
#N=1000 # determines number of test images in each class
#
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#base_dir="$(dirname "$scripts_dir")"
#data_dir="$base_dir/data"
#
#declare -a class_names=(
#	"neutral"
#	"drawings"
#	"sexy"
#	"porn"
#	"hentai"
#	)
#
#
#train_dir="$data_dir/train"
#test_dir="$data_dir/test"
#mkdir -p "$test_dir"
#
#for cname in "${class_names[@]}"
#do
#	test_dir_class="$test_dir/$cname"
#	mkdir -p "$test_dir_class"
#	train_dir_class="$train_dir/$cname"
#	ls "$train_dir_class" | shuf -n $N | xargs -I{} mv "$train_dir_class/{}" "$test_dir_class"
#done
#
#echo "Number of files per class (train):"
#for subdir in $(ls "$train_dir")
#do
#	echo "$subdir": "$(find "$train_dir/$subdir" -type f | wc -l)"
#done
#
#echo "Number of files per class (test):"
#for subdir in $(ls "$test_dir")
#do
#	echo "$subdir": "$(find "$test_dir/$subdir" -type f | wc -l)"
#done


#for cname in "${class_names[@]}"
#do
#    test_dir_class="$test_dir/$cname"
#    mkdir -p "$test_dir_class"
#    train_dir_class="$train_dir/$cname"
#
#    total_images=$(ls "$train_dir_class" | wc -l)
#    if [ "$total_images" -eq 0 ]; then
#        echo "No images found in $train_dir_class"
#        continue
#    fi
#
#    # Determine split ratio based on the number of images
#    if [ "$total_images" -gt 1000 ]; then
#        # For ample data, use 80/20 split
#        split_ratio=0.2
#    elif [ "$total_images" -gt 200 ]; then
#        # For moderate data, use 90/10 split
#        split_ratio=0.1
#    else
#        # For limited data, use 95/5 split
#        split_ratio=0.05
#    fi
#
#    test_size=$(echo "($total_images * $split_ratio)/1" | bc)
#    if [ "$test_size" -lt 1 ]; then
#        test_size=1
#    fi
#
#    echo "Class: $cname"
#    echo "Total images: $total_images"
#    echo "Split ratio: $(echo "$split_ratio * 100" | bc)% test"
#    echo "Moving $test_size images from $train_dir_class to $test_dir_class"
#
#    ls "$train_dir_class" | shuf -n $test_size | xargs -I{} mv "$train_dir_class/{}" "$test_dir_class"
#done
#
#echo "Number of files per class (train):"
#for subdir in $(ls "$train_dir")
#do
#    echo "$subdir": "$(find "$train_dir/$subdir" -type f | wc -l)"
#done
#
#echo "Number of files per class (test):"
#for subdir in $(ls "$test_dir")
#do
#    echo "$subdir": "$(find "$test_dir/$subdir" -type f | wc -l)"
#done


#!/bin/bash

# Script 6: Split Data into Training and Test Sets

# Set the percentage of data to be used for testing
TEST_PERCENTAGE=0.2  # 20% test data

# Define directories
scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
base_dir="$(dirname "$scripts_dir")"
data_dir="$base_dir/data"

# Define class names
declare -a class_names=(
    "neutral"
    "drawings"
    "sexy"
    "porn"
    "hentai"
)

# Define training and test directories
train_dir="$data_dir/train"
test_dir="$data_dir/test"
mkdir -p "$test_dir"

# Loop over each class and split the data
for cname in "${class_names[@]}"
do
    train_dir_class="$train_dir/$cname"
    test_dir_class="$test_dir/$cname"
    mkdir -p "$test_dir_class"

    total_images=$(find "$train_dir_class" -type f | wc -l)
    N=$(echo "$total_images * $TEST_PERCENTAGE" | bc)
    N=$(printf "%.0f" "$N")  # Round to nearest integer

    # Ensure N is at least 1 and less than total_images
    if [ "$N" -lt 1 ] && [ "$total_images" -ge 1 ]; then
        N=1
    elif [ "$N" -ge "$total_images" ] && [ "$total_images" -gt 1 ]; then
        N=$((total_images - 1))
    fi

    echo "Moving $N images from $train_dir_class to $test_dir_class"

    # Move images if N is greater than 0
    if [ "$N" -ge 1 ]; then
        find "$train_dir_class" -type f -print0 | shuf -z -n "$N" | xargs -0 -I{} mv "{}" "$test_dir_class"
    else
        echo "Not enough images to move for class '$cname'. Skipping."
    fi
done

# Display the number of files in each class for train and test sets
echo "Number of files per class (train):"
for cname in "${class_names[@]}"
do
    count=$(find "$train_dir/$cname" -type f | wc -l)
    echo "$cname: $count"
done

echo "Number of files per class (test):"
for cname in "${class_names[@]}"
do
    count=$(find "$test_dir/$cname" -type f | wc -l)
    echo "$cname: $count"
done
