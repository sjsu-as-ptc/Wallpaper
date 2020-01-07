rem @echo off

bitsadmin /create WallpaperScriptDownload
bitsadmin /transfer WallpaperScriptDownload /download /priority normal http://sjsu-as-ptc.github.io/wallpaper/files.txt c:\wallpaper\files.txt
bitsadmin /create wallpaper15
bitsadmin /addfileset wallpaper15 c:\wallpaper\files.txt
rem bitsadmin /transfer wallpaper15 /download /priority normal c:\wallpaper\name.ext
pause 5
