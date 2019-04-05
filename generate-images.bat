@echo off

setlocal enableextensions enabledelayedexpansion

REM Edit these variables as needed
set video_dir=C:\Users\will\Downloads\videos
set interval=15
set output_dir=C:\Users\will\Downloads\generated-images

if not exist "%output_dir%" mkdir "%output_dir%"

set /a COUNT=0
for %%F in ("%video_dir%\*.mp4") do (
    echo "ok"
    for /F "tokens=*" %%F in ('ffprobe.exe -v error -show_entries "format=duration" -of "default=noprint_wrappers=1:nokey=1" "%%~F"') do (
        set duration=%%F
    )

    for /L %%I in (0, %interval%, !duration!) do (
        set /a COUNT += 1
        ffmpeg.exe -y -i "%video_dir%\%%~nF%%~xF" -ss %%I -vframes 1 "%output_dir%\img!COUNT!.jpg"
    )
)
endlocal
