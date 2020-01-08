@echo off

MODE CON COLS=60 LINES=3

setlocal
setlocal enabledelayedexpansion
set _os=
set _sp=
rem use findstr to strip blank lines from wmic output
rem get OS
for /f "usebackq skip=1 tokens=3" %%i in (`wmic os get caption ^| findstr /r /v "^$"`) do (
  set "_os=%%i"
  )
rem get Service Pack
for /f "usebackq skip=1 tokens=*" %%i in (`wmic os get ServicePackMajorVersion ^| findstr /r /v "^$"`) do (
  set "_sp=%%i"
  )
rem get Architecture
for /f "usebackq skip=1 tokens=*" %%i in (`wmic OS get OSArchitecture ^| findstr /r /v "^$"`) do (
  set "_bits=%%i"
  )
rem echo Operating System Version: %_os%
rem echo Service Pack Major Version: %_sp%
rem echo Architecture: %_bits%

IF NOT "%_os%"=="10" (
    echo OS NOT SUPPORTED
    timeout 5
    exit
)

endlocal


bitsadmin /transfer DownloadWget /download /priority normal http://sjsu-as-ptc.github.io/wallpaper/wget.exe c:\wallpaper\wget.exe
cd c:\wallpaper
start  /min wget.exe -N -q -O c:\wallpaper\files.txt http://sjsu-as-ptc.github.io/wallpaper/files.txt c:\wallpaper\files.txt
echo Updating wallpapers.
timeout 5
cd c:\wallpaper
start  /min wget.exe -N -q -i c:\wallpaper\files.txt
