@echo off
setlocal

:: Ask if the sync task should be run
echo Do you want to run the sync task? (Y/N):
set /p RUN_SYNC=
if /I not "%RUN_SYNC%"=="Y" (
    echo Sync task cancelled.
    pause
    goto :EOF
)

:: Get the directory of the current script
set "SCRIPT_DIR=%~dp0"

:: Set relative paths
set "SRC_POSTS=%SCRIPT_DIR%..\obsidian-notes\blog\posts"
set "SRC_IMGS=%SCRIPT_DIR%..\obsidian-notes\blog\images"
set "DST_POSTS=%SCRIPT_DIR%content\posts"
set "DST_IMGS=%SCRIPT_DIR%static\images"

:: Check if source paths exist
echo Checking source paths...
if not exist "%SRC_POSTS%" (
    echo ERROR: Source posts directory not found: %SRC_POSTS%
    echo Please confirm that the blog-obsidian project location is correct.
    pause
    goto :EOF
)

if not exist "%SRC_IMGS%" (
    echo ERROR: Source images directory not found: %SRC_IMGS%
    echo Please confirm that the blog-obsidian project location is correct.
    pause
    goto :EOF
)

echo Source path check passed.
echo.
echo Starting synchronization...

:: Run synchronization
echo Syncing posts directory...
robocopy "%SRC_POSTS%" "%DST_POSTS%" /MIR

echo.
echo Syncing images directory...
robocopy "%SRC_IMGS%" "%DST_IMGS%" /MIR

echo.
echo Synchronization complete!
pause

endlocal