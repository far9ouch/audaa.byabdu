@echo off
color 0A
title AUDAA GitHub Auto Update

echo ====================================
echo    AUDAA - GitHub Update Tool
echo    By: far9ouch
echo ====================================
echo.

:: Add all changes
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

:: Push to GitHub
echo.
echo Pushing to GitHub...
git push origin main

if errorlevel 1 (
    echo.
    echo Error: Push failed!
    echo Please check your internet connection or GitHub credentials.
    echo.
    echo If you need to set up credentials:
    echo 1. git config --global user.email "far9ouc07@gmail.com"
    echo 2. git config --global user.name "far9ouch"
    echo.
    pause
    exit /b 1
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