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
set "SRC_POSTS=%SCRIPT_DIR%..\obsidian-notes\posts"
set "DST_POSTS=%SCRIPT_DIR%content\posts"
set "SRC_RES=%SCRIPT_DIR%..\obsidian-notes\res"
set "DST_RES=%SCRIPT_DIR%static\res"

:: Check if source path exists
echo Checking source path...
if not exist "%SRC_POSTS%" (
    echo ERROR: Source posts directory not found: %SRC_POSTS%
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

echo Syncing res directory...
robocopy "%SRC_RES%" "%DST_RES%" /MIR

echo.
echo Synchronization complete!
pause

endlocal
