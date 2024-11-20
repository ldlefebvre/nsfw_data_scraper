##!/bin/bash
#
#scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#base_dir="$(dirname "$scripts_dir")"
#raw_data_dir="$base_dir/raw_data"
#mkdir -p "$raw_data_dir/neutral"
#
##wget http://www.vision.caltech.edu/Image_Datasets/Caltech256/256_ObjectCategories.tar -P "$raw_data_dir/neutral"
#wget "https://data.caltech.edu/records/nyy15-4j048/files/256_ObjectCategories.tar?download=1" -O "$raw_data_dir/neutral/256_ObjectCategories.tar"
#
#tar -xf "$raw_data_dir/neutral/256_ObjectCategories.tar" -C "$raw_data_dir/neutral"

#!/bin/bash

scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
base_dir="$(dirname "$scripts_dir")"
raw_data_dir="$base_dir/raw_data"
mkdir -p "$raw_data_dir/neutral"

# Define the file paths
tar_file="$raw_data_dir/neutral/256_ObjectCategories.tar"
extraction_dir="$raw_data_dir/neutral/256_ObjectCategories"

# Check if the tar file exists
if [ -f "$tar_file" ]; then
    echo "File already exists: $tar_file"
else
    echo "Downloading the neutral dataset..."
    wget "https://data.caltech.edu/records/nyy15-4j048/files/256_ObjectCategories.tar?download=1" -O "$tar_file"
fi

# Check if the dataset has already been extracted
if [ -d "$extraction_dir" ]; then
    echo "Dataset already extracted at: $extraction_dir"
else
    echo "Extracting the dataset..."
    tar -xf "$tar_file" -C "$raw_data_dir/neutral"
fi
