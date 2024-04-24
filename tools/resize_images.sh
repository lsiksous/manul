#!/bin/bash

# Counter variable to track the index for renaming
counter=1

# Desired width for web display
width=800

# Iterate over each PNG file in the current directory
for file in *.png; do
    # Check if the file is a regular file
    if [ -f "$file" ]; then
        # Resize the image using sips
        sips --resampleWidth $width "$file" --out "install_$(printf "%02d" $counter).png"

        # Increment the counter
        ((counter++))
    fi
done

