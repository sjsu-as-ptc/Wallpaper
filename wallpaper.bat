@echo off

bitsadmin /create WallpaperScriptDownload
bitsadmin /transfer WallpaperScriptDownload /download /priority normal http://sjsu-as-ptc.github.io/wallpaper/files.txt c:\wallpaper\files.txt

bitsadmin /create Wallpaper
SET "FILENAME=%~dp0\name.ext"
bitsadmin /addfileset wallpaper c:\wallpaper\files.txt
bitsadmin /transfer wallpaper /download /priority normal c:\wallpaper\%filename%
pause 5
