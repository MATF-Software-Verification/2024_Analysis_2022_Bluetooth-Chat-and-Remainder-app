@echo off
echo Starting Jacoco code coverage analysis for Bluetooth Chat Android App...

cd /d "%~dp0\..\2022_Bluetooth-Chat-and-Remainder-app"

REM Default to unit tests
set TEST_TYPE=unit

REM Parse command line arguments
:parse_args
if "%1"=="" goto :run_tests
if "%1"=="--unit" (
    set TEST_TYPE=unit
    shift
    goto :parse_args
)
if "%1"=="--android" (
    set TEST_TYPE=android
    shift
    goto :parse_args
)
if "%1"=="--combined" (
    set TEST_TYPE=combined
    shift
    goto :parse_args
)
if "%1"=="--help" goto :show_help
if "%1"=="-h" goto :show_help
echo ERROR: Unknown option '%1'
echo Use --help for usage information
pause
exit /b 1

:show_help
echo.
echo Usage: %0 [OPTIONS]
echo.
echo Options:
echo   --unit     - Run unit tests with coverage (default)
echo   --android  - Run Android tests with coverage (requires device/emulator)
echo   --combined - Run both unit and Android tests with combined coverage
echo   --help, -h - Show this help message
echo.
pause
exit /b 0

:run_tests

echo.
echo Running %TEST_TYPE% tests with Jacoco coverage report...

if "%TEST_TYPE%"=="unit" (
    echo Running unit tests only...
    call gradlew.bat clean testDebugUnitTest jacocoTestReport --no-daemon
    if %ERRORLEVEL% neq 0 goto :error
    set REPORT_PATH=app\build\reports\jacoco\jacocoTestReport\html\index.html
    goto :success
)

if "%TEST_TYPE%"=="android" (
    echo Running Android tests only...
    echo Note: Requires connected Android device or emulator
    call gradlew.bat clean connectedDebugAndroidTest jacocoAndroidTestReport --no-daemon
    if %ERRORLEVEL% neq 0 goto :error
    set REPORT_PATH=app\build\reports\jacoco\jacocoAndroidTestReport\html\index.html
    goto :success
)

if "%TEST_TYPE%"=="combined" (
    echo Running combined tests (unit + Android)...
    echo Note: Android tests require connected device or emulator
    call gradlew.bat clean testDebugUnitTest connectedDebugAndroidTest jacocoCombinedTestReport --no-daemon
    if %ERRORLEVEL% neq 0 goto :error
    set REPORT_PATH=app\build\reports\jacoco\jacocoCombinedTestReport\html\index.html
    goto :success
)

:error
echo.
echo ERROR: Jacoco analysis failed!
echo Check the output above for details.
pause
exit /b 1

:success
echo.
echo Jacoco analysis completed successfully!
echo.
echo Coverage reports generated:
if "%TEST_TYPE%"=="unit" (
    echo - Unit Test HTML Report: app\build\reports\jacoco\jacocoTestReport\html\index.html
    echo - Unit Test XML Report: app\build\reports\jacoco\jacocoTestReport\jacocoTestReport.xml
) else if "%TEST_TYPE%"=="android" (
    echo - Android Test HTML Report: app\build\reports\jacoco\jacocoAndroidTestReport\html\index.html
    echo - Android Test XML Report: app\build\reports\jacoco\jacocoAndroidTestReport\jacocoAndroidTestReport.xml
) else if "%TEST_TYPE%"=="combined" (
    echo - Combined Test HTML Report: app\build\reports\jacoco\jacocoCombinedTestReport\html\index.html
    echo - Combined Test XML Report: app\build\reports\jacoco\jacocoCombinedTestReport\jacocoCombinedTestReport.xml
)
echo.
echo Opening HTML report in default browser...
start "%REPORT_PATH%"

echo.
echo Jacoco analysis finished!
pause