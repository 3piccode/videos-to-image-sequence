#!/usr/bin/env bash

trap "exit" INT

# Edit these variables as needed
video_dir=/home/will/Downloads/*.mp4
interval=15
output_dir=/home/will/generated-images

mkdir -p "$output_dir"
tmp_dir=$(mktemp -d)

i=1
for f in ${video_dir};
do
    # Use fps to seek and print all images in a single run. Much slower if we were
    # to manually re-seek and manually try and get each screenshot ourselves.
    ffmpeg -i "${f}" -vf fps=1/${interval} "${tmp_dir}/${i}-img%08d.jpg"
    i=$((i + 1))
done

total=$(ls ${tmp_dir} | wc -l)

# A little gross that we have to rename all the files in sequence as a post-step,
# but also much faster than naming/grabbing each still image individually.
i=1
for f in ${tmp_dir}/*;
do
    filename=$(printf "img%08d" ${i})
    mv "${f}" "${output_dir}/${filename}.jpg"
    i=$((i + 1))
done
