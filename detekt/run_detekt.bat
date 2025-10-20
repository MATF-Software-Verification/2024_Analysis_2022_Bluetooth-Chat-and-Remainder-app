@echo off
setlocal

REM Navigate to repository root (script is in detekt/)
cd /d "%~dp0"

REM Repository root (parent of detekt folder)
set "REPO_ROOT=%~dp0.."

REM Path to Android project
set "PROJECT_DIR=%REPO_ROOT%\2022_Bluetooth-Chat-and-Remainder-app"

REM Path for Detekt report
set "REPORT_PATH=..\detekt\reports\detekt.html"
if not exist "..\detekt\reports" mkdir "..\detekt\reports"

cd /d "%PROJECT_DIR%"

echo Running Detekt analysis...
echo.

REM Run Detekt via Gradle
gradlew.bat detekt --info

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo Detekt analysis completed successfully!
    echo ========================================
    echo.
    echo Report location: %PROJECT_DIR%\app\build\reports\detekt\detekt.html
    echo Copying report to: %REPO_ROOT%\detekt\reports\detekt.html
    if exist "%PROJECT_DIR%\app\build\reports\detekt\detekt.html" (
        copy "%PROJECT_DIR%\app\build\reports\detekt\detekt.html" "%REPO_ROOT%\detekt\reports\detekt.html" >nul
    )
    echo.
) else (
    echo.
    echo ========================================
    echo Detekt analysis failed with errors!
    echo ========================================
    echo.
)

pause
