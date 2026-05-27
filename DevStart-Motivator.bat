@echo off
cls

color a

:: ==========================================
:: CONFIGURATION (Dynamically locates paths)
:: ==========================================
set "PROJECT_DIR=%USERPROFILE%\Documents\Projects"
set "VS_CODE_USER=%LocalAppData%\Programs\Microsoft VS Code\Code.exe"
set "VS_CODE_SYSTEM=%ProgramFiles%\Microsoft VS Code\Code.exe"
set "GIT_BASH_PATH=C:\Program Files\Git\git-bash.exe"
set "BROWSER_URL=https://github.com"

:: ==========================================
:: MORNING GREETING
:: ==========================================
echo ==================================================
echo  Good Morning, Developer! Time to build something.
echo ==================================================
echo.
echo Current Date: %date%
echo Current Time: %time%
echo AUTHOR  Shiferaw Belew
echo.

:: ==========================================
:: RANDOM MOTIVATIONAL QUOTE GENERATOR
:: ==========================================
set /a "random_num=%RANDOM% %% 5"

echo [TODAY'S MOTIVATION]
if %random_num%==0 echo "Make it work, make it right, make it fast." - Kent Beck
if %random_num%==1 echo "Before software can be reusable it first has to be usable." - Ralph Johnson
if %random_num%==2 echo "Your talent determines what you can do. Your motivation determines how much you are willing to do." - Lou Holtz
if %random_num%==3 echo "The best way to predict the future is to invent it." - Alan Kay
if %random_num%==4 echo "Code is like humor. When you have to explain it, it’s bad." - Cory House
echo.
echo ==================================================
echo.

:: ==========================================
:: LAUNCHING TOOLS
:: ==========================================
echo Starting up your environment...

:: 1. Launch VS Code (Points directly to executables to block all proxy logs)
if exist "%VS_CODE_USER%" (
    echo [OK] Launching VS Code...
    start "" "%VS_CODE_USER%" . >nul 2>&1
) else if exist "%VS_CODE_SYSTEM%" (
    echo [OK] Launching VS Code...
    start "" "%VS_CODE_SYSTEM%" . >nul 2>&1
) else (
    echo [ERROR] VS Code executable not found in standard paths.
)

:: 2. Launch Git Bash
if exist "%GIT_BASH_PATH%" (
    echo [OK] Launching Git Bash...
    start "" "%GIT_BASH_PATH%"
) else (
    echo [WARNING] Git Bash not found at standard path.
)

:: 3. Open favorite browser tab (GitHub)
echo [OK] Opening GitHub in browser...
start "" "%BROWSER_URL%"

echo.
echo Environment successfully launched! Have a productive session.
echo.
pause