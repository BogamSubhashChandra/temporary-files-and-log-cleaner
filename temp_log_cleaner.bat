@echo off
setlocal enabledelayedexpansion

:: --- CONFIG ---
set LOG_DIR=%~dp0logs
set RETENTION_DAYS=7

:: --- Ensure log folder exists ---
if not exist "%LOG_DIR%" mkdir "%LOG_DIR%"

:: --- Log file (dated) ---
set LOG=%LOG_DIR%\cleanup_%date:~10,4%-%date:~4,2%-%date:~7,2%.txt

:: --- Delete old logs ---
forfiles /p "%LOG_DIR%" /s /m *.txt /d -%RETENTION_DAYS% /c "cmd /c del @path" 2>nul

:: --- Get initial free space ---
for /f "tokens=3" %%a in ('dir /-c "%SystemDrive%\" ^| find "bytes free"') do set BEFORE=%%a
set BEFORE=%BEFORE:,=%

echo [%date% %time%] Cleanup started >> "%LOG%"

:: --- Clean user temp ---
for /d %%D in ("%TEMP%\*") do rd /s /q "%%D" 2>>"%LOG%"
del /f /q "%TEMP%\*" 2>>"%LOG%"

:: --- Clean Windows temp ---
for /d %%D in ("C:\Windows\Temp\*") do rd /s /q "%%D" 2>>"%LOG%"
del /f /q "C:\Windows\Temp\*" 2>>"%LOG%"

:: --- Clean Prefetch ---
if exist "C:\Windows\Prefetch\" (
    for /d %%D in ("C:\Windows\Prefetch\*") do rd /s /q "%%D" 2>>"%LOG%"
    del /f /q "C:\Windows\Prefetch\*" 2>>"%LOG%"
)

:: --- Get final free space ---
for /f "tokens=3" %%a in ('dir /-c "%SystemDrive%\" ^| find "bytes free"') do set AFTER=%%a
set AFTER=%AFTER:,=%

:: --- Calculate freed space ---
set /a FREED=%AFTER% - %BEFORE%

echo Freed bytes: %FREED% >> "%LOG%"
echo [%date% %time%] Cleanup completed >> "%LOG%"
echo -------------------------------------- >> "%LOG%"

endlocal
exit
