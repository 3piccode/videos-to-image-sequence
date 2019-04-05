@echo off

setlocal enableextensions enabledelayedexpansion

REM Edit these variables as needed
set video_dir=C:\Users\will\Downloads\videos
set interval=15
set output_dir=C:\Users\will\Downloads\generated-images

if not exist "%output_dir%" mkdir "%output_dir%"
set tmp_dir=%TEMP%\%RANDOM%
if not exist "%tmp_dir%" mkdir "%tmp_dir%"

set /a COUNT=1
for %%F in ("%video_dir%\*.mp4") do (
    REM Use fps to seek and print all images in a single run. Much slower if we were
    REM to manually re-seek and manually try and get each screenshot ourselves.
    ffmpeg.exe -i "%%~F" -vf fps=1/%INTERVAL% "%tmp_dir%\!COUNT!-img%%08d.jpg"
    set /a COUNT += 1
)

for /f %%A in ('dir %tmp_dir% ^| find "File(s)"') do set total=%%A

echo "total %total%"

REM A little gross that we have to rename all the files in sequence as a post-step,
REM but also much faster than naming/grabbing each still image individually.
set /a COUNT=1
for %%F in ("%tmp_dir%\*.jpg") do (
    move "%%~F" "%output_dir%\img!COUNT!.jpg"
    set /a COUNT += 1
)
endlocal
