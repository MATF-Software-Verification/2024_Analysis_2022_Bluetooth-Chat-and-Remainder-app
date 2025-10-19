# Jacoco - Code Coverage Analysis

## Description
Jacoco is a tool for measuring code coverage in Java/Kotlin applications. It allows analysis of how much of the code is covered by tests.

## Installation
Jacoco is already configured in the Gradle build system

## Usage

### Windows
```bash
# Unit tests (default)
.\run_jacoco.bat

# Android tests (requires device/emulator)
.\run_jacoco.bat --android

# Combined tests (unit + Android)
.\run_jacoco.bat --combined

# Help
.\run_jacoco.bat --help
```

### Linux/Mac
```bash
# Unit tests (default)
chmod +x run_jacoco.sh
./run_jacoco.sh

# Android tests (requires device/emulator)
./run_jacoco.sh --android

# Combined tests (unit + Android)
./run_jacoco.sh --combined

# Help
./run_jacoco.sh --help
```

### Manual execution
```bash
cd 2022_Bluetooth-Chat-and-Remainder-app

# Unit tests
./gradlew clean testDebugUnitTest jacocoTestReport --no-daemon

# Android tests
./gradlew clean connectedDebugAndroidTest jacocoAndroidTestReport --no-daemon

# Combined tests
./gradlew clean testDebugUnitTest connectedDebugAndroidTest jacocoCombinedTestReport --no-daemon
```

## Results
After execution, reports are generated in:

### Unit tests
- **HTML report**: `app/build/reports/jacoco/jacocoTestReport/html/index.html`
- **XML report**: `app/build/reports/jacoco/jacocoTestReport/jacocoTestReport.xml`

### Android tests
- **HTML report**: `app/build/reports/jacoco/jacocoAndroidTestReport/html/index.html`
- **XML report**: `app/build/reports/jacoco/jacocoAndroidTestReport/jacocoAndroidTestReport.xml`

### Combined tests
- **HTML report**: `app/build/reports/jacoco/jacocoCombinedTestReport/html/index.html`
- **XML report**: `app/build/reports/jacoco/jacocoCombinedTestReport/jacocoCombinedTestReport.xml`


## Metrics
Jacoco measures the following types of coverage:
- **Line Coverage**: How much of the code lines are executed
- **Branch Coverage**: How much of the branches (if/else) are tested
- **Method Coverage**: How much of the methods are called
- **Class Coverage**: How much of the classes are tested


## Additional Information
- [Jacoco documentation](https://www.jacoco.org/jacoco/)
- [Gradle Jacoco plugin](https://docs.gradle.org/current/userguide/jacoco_plugin.html)