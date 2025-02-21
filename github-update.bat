@echo off
color 0A
title AUDAA GitHub Auto Update

echo ====================================
echo    AUDAA - GitHub Update Tool
echo    By: far9ouch
echo ====================================
echo.

:: Configure Git if not already done
echo Configuring Git...
git config --global user.email "far9ouc07@gmail.com"
git config --global user.name "far9ouch"

:: First try to pull any changes
echo.
echo Checking for remote changes...
git pull origin main

:: Add all changes
echo.
echo Adding changes to Git...
git add .

:: Get current date and time for commit message
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set datetime=%%I
set commit_date=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%
set commit_time=%datetime:~8,2%:%datetime:~10,2%

:: Commit with timestamp
echo.
echo Creating commit...
git commit -m "Update %commit_date% %commit_time%"

:: Try normal push first
echo.
echo Attempting to push to GitHub...
git push origin main

:: If normal push fails, offer force push option
if errorlevel 1 (
    echo.
    echo Normal push failed. Would you like to:
    echo [1] Force push (overwrites remote changes)
    echo [2] Cancel
    echo.
    set /p choice="Enter your choice (1 or 2): "
    
    if "%choice%"=="1" (
        echo.
        echo Force pushing to GitHub...
        git push -f origin main
        
        if errorlevel 1 (
            echo.
            echo Error: Force push failed!
            echo Please check your internet connection or GitHub credentials.
            pause
            exit /b 1
        )
    ) else (
        echo.
        echo Update cancelled.
        pause
        exit /b 0
    )
)

echo.
echo ====================================
echo    Update Complete!
echo    Changes pushed to GitHub
echo    Repository: audaa.byabdu
echo ====================================
echo.

:: Open the repository in browser
echo Opening repository in browser...
start https://github.com/far9ouch/audaa.byabdu

pause 