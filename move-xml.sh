#!/bin/bash

SOURCE="$HOME/network-files"
CAMERA_DIR="$SOURCE/ILCE7M4"

# check if the xml and photo folder exists, if not, then create one
FOLDERS=('sony-xml' 'sony-no-xml')
for folder in "${FOLDERS[@]}"; do
    if [ ! -d "$SOURCE/$folder" ]; then
        mkdir "$SOURCE/$folder"
        echo "Folder $folder has been created"
    else
        echo "Folder $folder already exists!"
    fi

done

# XML_FILES='SONY-ILCE-7M4-XML'
# PHOTO_FILES='SONY-ILCE-7M4'

find_files() {
    dest=$1
    for file in "$dest"/*; do
        if [ -f "$file" ]; then
            echo "$file"
            if [["$file" == "*.XML"]]; then
                mv "$file" "$SOURCE/${FOLDERS[0]}
            elif [["$file" == "*.JPG"]]; then
                mv "$file" "$SOURCE/${FOLDERS[1]}
            fi
        elif [ -d "$file" ]; then
            find_files "$file"
        fi
    done
}

find_files "$CAMERA_DIR"