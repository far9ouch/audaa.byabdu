@echo off
color 0A
title AUDAA Initial Upload

echo ====================================
echo    AUDAA - First Time Upload
echo    By: far9ouch
echo ====================================
echo.

:: Check if required files exist
if not exist "app.py" (
    echo Error: app.py not found!
    echo Please make sure you're running this script in the project folder.
    pause
    exit /b 1
)

if not exist "requirements.txt" (
    echo Error: requirements.txt not found!
    echo Please make sure you're running this script in the project folder.
    pause
    exit /b 1
)

if not exist "static\style.css" (
    echo Error: static\style.css not found!
    echo Please make sure you're running this script in the project folder.
    pause
    exit /b 1
)

:: Configure Git if not already configured
echo Configuring Git...
git config --global user.email "far9ouc07@gmail.com"
git config --global user.name "far9ouch"

:: Remove existing .git if any
if exist .git (
    echo Removing existing Git configuration...
    rmdir /s /q .git
)

:: Initialize new git repository
echo.
echo Initializing new Git repository...
git init

:: Create .gitignore
echo.
echo Creating .gitignore...
(
    echo __pycache__/
    echo *.pyc
    echo .env
    echo venv/
    echo .vscode/
    echo .idea/
) > .gitignore

:: Create README if it doesn't exist
if not exist "README.md" (
    echo.
    echo Creating README.md...
    (
        echo # AUDAA Text-to-Speech Converter
        echo.
        echo A web-based text-to-speech converter using the Zyphra API.
        echo.
        echo ## Features
        echo - Multiple language support
        echo - Adjustable speaking rate
        echo - Multiple audio formats
        echo - Preview functionality
    ) > README.md
)

:: Add this after creating README.md
echo.
echo Creating static site files...
if exist "templates\index.html" (
    copy "templates\index.html" "index.html" >nul
)

:: Add this to .gitignore
echo.
echo Updating .gitignore for GitHub Pages...
(
    echo __pycache__/
    echo *.pyc
    echo .env
    echo venv/
    echo .vscode/
    echo .idea/
    echo templates/
    echo app.py
) > .gitignore

:: Add all files
echo.
echo Adding files to Git...
git add .

:: Initial commit
echo.
echo Creating initial commit...
git commit -m "Initial AUDAA Project Upload"

:: Configure and verify remote repository
echo.
echo Configuring remote repository...
git remote remove origin 2>nul
git remote add origin https://github.com/far9ouch/audaa.byabdu.git

:: Create and switch to main branch
echo.
echo Setting up main branch...
git branch -M main

:: Attempt to push (with error handling)
echo.
echo Attempting to upload to GitHub...
echo Please enter your GitHub credentials when prompted...
echo.
echo Note: If you're using a token, use it as the password.
echo.
git push -u origin main

if errorlevel 1 (
    echo.
    echo Upload failed! Please check:
    echo 1. Your internet connection
    echo 2. GitHub credentials
    echo 3. Repository exists at: https://github.com/far9ouch/audaa.byabdu
    echo.
    echo If using HTTPS, you might need a personal access token:
    echo 1. Go to GitHub Settings
    echo 2. Developer Settings ^> Personal Access Tokens ^> Tokens ^(classic^)
    echo 3. Generate new token with 'repo' access
    echo 4. Use the token as your password
    echo.
    pause
    exit /b 1
)

echo.
echo ====================================
echo Upload successful!
echo.
echo Your project is now available at:
echo https://github.com/far9ouch/audaa.byabdu
echo.
echo Next steps:
echo 1. Visit the repository URL above
echo 2. Go to Settings ^> Pages
echo 3. Enable GitHub Pages
echo ====================================
echo.
pause 