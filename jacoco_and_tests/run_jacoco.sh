#!/bin/bash

echo "Starting Jacoco code coverage analysis for Bluetooth Chat Android App..."

cd "$(dirname "$0")/../2022_Bluetooth-Chat-and-Remainder-app"

# Default to unit tests
TEST_TYPE="unit"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --unit)
            TEST_TYPE="unit"
            shift
            ;;
        --android)
            TEST_TYPE="android"
            shift
            ;;
        --combined)
            TEST_TYPE="combined"
            shift
            ;;
        --help|-h)
            echo ""
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --unit     - Run unit tests with coverage (default)"
            echo "  --android  - Run Android tests with coverage (requires device/emulator)"
            echo "  --combined - Run both unit and Android tests with combined coverage"
            echo "  --help, -h - Show this help message"
            echo ""
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

echo ""
echo "Running $TEST_TYPE tests with Jacoco coverage report..."

case $TEST_TYPE in
    "unit")
        echo "Running unit tests only..."
        ./gradlew clean testDebugUnitTest jacocoTestReport --no-daemon
        REPORT_PATH="app/build/reports/jacocoTestReport/html/index.html"
        ;;
    "android")
        echo "Running Android tests only..."
        echo "Note: Requires connected Android device or emulator"
        ./gradlew clean connectedDebugAndroidTest jacocoAndroidTestReport --no-daemon
        REPORT_PATH="app/build/reports/jacocoAndroidTestReport/html/index.html"
        ;;
    "combined")
        echo "Running combined tests (unit + Android)..."
        echo "Note: Android tests require connected device or emulator"
        ./gradlew clean testDebugUnitTest connectedDebugAndroidTest jacocoCombinedTestReport --no-daemon
        REPORT_PATH="app/build/reports/jacoco/jacocoCombinedTestReport/html/index.html"
        ;;
    *)
        echo "ERROR: Invalid option '$TEST_TYPE'"
        echo "Usage: $0 [unit|android|combined]"
        exit 1
        ;;
esac

if [ $? -ne 0 ]; then
    echo ""
    echo "ERROR: Jacoco analysis failed!"
    echo "Check the output above for details."
    exit 1
fi

echo ""
echo "Jacoco analysis completed successfully!"
echo ""
echo "Coverage reports generated:"
case $TEST_TYPE in
    "unit")
        echo "- Unit Test HTML Report: app/build/reports/jacoco/jacocoTestReport/html/index.html"
        echo "- Unit Test XML Report: app/build/reports/jacoco/jacocoTestReport/jacocoTestReport.xml"
        ;;
    "android")
        echo "- Android Test HTML Report: app/build/reports/jacoco/jacocoAndroidTestReport/html/index.html"
        echo "- Android Test XML Report: app/build/reports/jacoco/jacocoAndroidTestReport/jacocoAndroidTestReport.xml"
        ;;
    "combined")
        echo "- Combined Test HTML Report: app/build/reports/jacoco/jacocoCombinedTestReport/html/index.html"
        echo "- Combined Test XML Report: app/build/reports/jacoco/jacocoCombinedTestReport/jacocoCombinedTestReport.xml"
        ;;
esac
echo ""
echo "Checking if HTML report exists..."
if [ -f "$REPORT_PATH" ]; then
    echo "HTML report found at: $REPORT_PATH"
    echo "Opening HTML report in default browser..."
    if command -v xdg-open > /dev/null; then
        xdg-open "$REPORT_PATH"
    elif command -v open > /dev/null; then
        open "$REPORT_PATH"
    else
        echo "Please open the HTML report manually: $REPORT_PATH"
    fi
else
    echo "ERROR: HTML report not found at: $REPORT_PATH"
    echo "Please check if the Jacoco task completed successfully."
fi

echo ""
echo "Jacoco analysis finished!"
