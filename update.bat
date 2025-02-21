@echo off
color 0A
title AUDAA Auto Upload and Update

echo ====================================
echo    AUDAA - Auto Upload Script
echo    By: far9ouch
echo ====================================
echo.

:: Check if .git exists
if not exist .git (
    echo First time setup...
    echo Initializing Git repository...
    
    :: Initialize git
    git init
    
    :: Configure remote repository
    git remote add origin https://github.com/far9ouch/audaa.byabdu.git
    
    :: Create and switch to main branch
    git branch -M main
    
    :: Add all files
    echo Adding files...
    git add .
    
    :: Initial commit
    echo Making initial commit...
    git commit -m "Initial commit - AUDAA Project"
    
    :: Push to GitHub
    echo Uploading to GitHub...
    git push -u origin main
    
    echo.
    echo Initial setup complete!
    echo.
) else (
    :: If .git exists, just update
    echo Updating repository...
    
    :: Add any new or modified files
    git add .
    
    :: Commit changes with timestamp
    git commit -m "Update %date% %time%"
    
    :: Push to GitHub
    git push origin main
    
    echo.
    echo Update complete!
    echo.
)

:: Install/Update dependencies
echo Installing/Updating dependencies...
pip install -r requirements.txt

echo.
echo All done! Press any key to exit.
pause > nul 