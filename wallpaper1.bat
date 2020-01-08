@echo off

bitsadmin /transfer DownloadWget /download /priority normal http://sjsu-as-ptc.github.io/wallpaper/wget.exe c:\wallpaper\wget.exe

start wget.exe -N -q -O c:\wallpaper\files.txt http://sjsu-as-ptc.github.io/wallpaper/files.txt c:\wallpaper\files.txt
timeout 5
rem copy wget.exe c:\wallpaper\wget.exe
cd c:\wallpaper
start wget.exe -N -q -i c:\wallpaper\files.txt
