#!/bin/bash

# Read the JSON file and iterate over each color entry
jq -rc '.[] | [.name, .hex] | @sh' colors.json | while read -r line; do
    # Safely evaluate the JSON string
    eval "array=($line)"
    name="${array[0]}"
    hex="${array[1]}"

    # Create an image using ImageMagick convert command
    # Uses size 16x16, sets the background color to the specified hex, and saves it as a PNG with the unaltered name
    convert -size 16x16 xc:"$hex" "icons/${name}.png"
    echo "Generated '${name}.png'"
done