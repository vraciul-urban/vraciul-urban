#!/usr/bin/env bash

# sudo apt-get install imagemagick

# https://askubuntu.com/questions/781497/how-can-i-compress-images
# convert -resize 85% test.jpg test-new.jpg
# convert -quality 50% test.jpg test-new.jpg

for fullpath in $(find ~/Desktop/images/ -name '[0-9].??g'); do
    filename="${fullpath##*/}"                      # Strip longest match of */ from start
    dir="${fullpath:0:${#fullpath} - ${#filename}}" # Substring from 0 thru pos of filename
    base="${filename%.[^.]*}"                       # Strip shortest match of . plus at least one non-dot char from end
    ext="${filename:${#base} + 1}"                  # Substring from len of base thru end
    if [[ -z "$base" && -n "$ext" ]]; then          # If we have an extension and no base, it's really the base
        base=".$ext"
        ext=""
    fi

    # echo -e "$fullpath:\n\tdir  = \"$dir\"\n\tbase = \"$base\"\n\text  = \"$ext\""
    #convert -resize 40% $fullpath $dir$base-preview.$ext
    convert -resize 20% $fullpath $dir$base-preview.$ext
#    convert -quality 50% $fullpath $dir$base-preview.$ext
done

# find ~/Desktop -name '[0-9]-preview.jpg' -exec identify -verbose {} \; | grep Interlace
