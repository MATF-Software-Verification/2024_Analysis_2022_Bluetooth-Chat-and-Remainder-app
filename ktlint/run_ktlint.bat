@echo off
REM ktlint runner script for Bluetooth Chat and Remainder app
REM This script provides an easy way to run ktlint using Gradle wrapper

setlocal enabledelayedexpansion

REM Get the directory where this script is located
set "SCRIPT_DIR=%~dp0"
set "PROJECT_ROOT=%SCRIPT_DIR%.."
set "ANDROID_PROJECT_DIR=%PROJECT_ROOT%\2022_Bluetooth-Chat-and-Remainder-app"

REM Default action is check
set "ACTION=check"

REM Parse command line arguments
:parse_args
if "%~1"=="" goto :run_action
if "%~1"=="--check" (
    set "ACTION=check"
    shift
    goto :parse_args
)
if "%~1"=="--format" (
    set "ACTION=format"
    shift
    goto :parse_args
)
if "%~1"=="--help" (
    goto :show_usage
)
echo [ERROR] Unknown option: %~1
goto :show_usage

:show_usage
echo Usage: %~nx0 [OPTIONS]
echo.
echo Options:
echo   --check     Run ktlint check (default)
echo   --format    Run ktlint format
echo   --help      Show this help message
echo.
echo Examples:
echo   %~nx0 --check
echo   %~nx0 --format
echo   %~nx0 --help
exit /b 0

:check_gradle_wrapper
if not exist "%ANDROID_PROJECT_DIR%\gradlew.bat" (
    echo [ERROR] Gradle wrapper not found at %ANDROID_PROJECT_DIR%\gradlew.bat
    echo [INFO] Make sure you're running this script from the correct directory
    exit /b 1
)
exit /b 0

:run_check
echo [INFO] Running ktlint check using Gradle...
cd /d "%ANDROID_PROJECT_DIR%"
if %errorlevel% neq 0 (
    echo [ERROR] Failed to change to Android project directory
    exit /b 1
)

call gradlew.bat ktlintCheck
if %errorlevel% equ 0 (
    echo [INFO] ktlint check passed! ✅
) else (
    echo [ERROR] ktlint check failed! ❌
    echo [INFO] Check the output above for style violations
    exit /b 1
)
goto :eof

:run_format
echo [INFO] Running ktlint format using Gradle...
cd /d "%ANDROID_PROJECT_DIR%"
if %errorlevel% neq 0 (
    echo [ERROR] Failed to change to Android project directory
    exit /b 1
)

call gradlew.bat ktlintFormat
if %errorlevel% equ 0 (
    echo [INFO] ktlint format completed! ✅
) else (
    echo [ERROR] ktlint format failed! ❌
    echo [INFO] Some issues may require manual fixing
    exit /b 1
)
goto :eof

:run_action
REM Check if Gradle wrapper is available
call :check_gradle_wrapper
if %errorlevel% neq 0 exit /b 1

REM Run the appropriate action
if "%ACTION%"=="check" (
    call :run_check
) else if "%ACTION%"=="format" (
    call :run_format
) else (
    echo [ERROR] Invalid action: %ACTION%
    exit /b 1
)

if %errorlevel% neq 0 exit /b 1
echo [INFO] ktlint operation completed successfully!