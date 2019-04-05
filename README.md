# Videos to Image Sequence

## Install

On Linux install the appropriate `ffmpeg` package for your distribution.

On Windows download the [zeranoe](https://ffmpeg.zeranoe.com/builds/) build using the default options. Simply click the `Download Build` button. Once downloaded, extract `ffmpeg.exe` from the `bin` directory.

## Run

### Windows

Follow the instructions above to retrieve `ffmpeg` binaries.

Download `generate-images.bat` from this repository. Put `ffmpeg.exe` in the _same directory_ as `generate-images.bat`.

Edit `generate-images.bat` as needed. Change the variables as needed that indicate where the source videos are, what the interval should be, and where the output images should go.

Double click `generate-images.bat` to run the script.

### Linux

Follow the instructions above to install `ffmpeg` for your distribution.

Download `generate-images.sh` from this repository.

Edit `generate-images.sh` as needed. Change the variables as needed that indicate where the source videos are, what the interval should be, and where the output images should go.

Run the `generate-images.sh` script.

## Purpose

Imagine you have a nature/security/observation camera that automatically splits up video files. Maybe the video files are split every n seconds or when they reach n size.

```
video-2018-12-25-001.mp4
video-2018-12-25-002.mp4
video-2018-12-25-003.mp4
video-2018-12-25-004.mp4
video-2018-12-25-005.mp4
video-2018-12-25-006.mp4
video-2018-12-25-007.mp4
video-2018-12-25-008.mp4
etc
```

We want to create a sequence of images showing every nth second of each video. For hour example, let's say every `15` seconds. So if the first video is an hour long, we'll end up with `3600 seconds / 15 seconds = 240 images` for that video. And if we had `10` videos that means our final result would be `240 images * 10 videos = 2400 images`.

The image sequence will be named in a way that spans all the videos so we have one continuous set of images across every video segment/clip.

```
image-1.jpg
image-2.jpg
image-3.jpg
etc
```

