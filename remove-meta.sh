#!/usr/bin/env bash

# https://askubuntu.com/questions/781497/how-can-i-compress-images
# convert -resize 85% test.jpg test-new.jpg
# convert -quality 50% test.jpg test-new.jpg

for fullpath in $(find static/images -name '[0-9].jpg'); do
  exiftool -overwrite_original -all= $fullpath
done

# find ~/Desktop -name '[0-9]-preview.jpg' -exec identify -verbose {} \; | grep Interlace