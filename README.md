# 2024 Analysis - 2022 Bluetooth Chat and Reminder App

This repository contains a comprehensive analysis of the 2022 Bluetooth Chat and Reminder Android application, including code quality tools, testing frameworks, and documentation.

## Project Structure

```
2024_Analysis_2022_Bluetooth-Chat-and-Remainder-app/
├── 2022_Bluetooth-Chat-and-Remainder-app/    # Original Android project
├── ktlint/                                   # Code style checking
├── detekt/                                   # Static code analysis
├── jacoco/                                   # Code coverage analysis
├── unit-tests/                               # Testing framework
└── README.md                                 # This file
```

## Tools and Analysis

### 1. ktlint - Code Style Checker
- **Purpose**: Enforces Kotlin coding standards and formatting
- **Configuration**: `ktlint/ktlint.yml` and `.editorconfig`
- **Usage**: 
  - From project root: `./ktlint/run_ktlint.sh --check` or `./ktlint/run_ktlint.sh --format`
  - From ktlint directory: `cd ktlint && ./run_ktlint.sh --check` or `./run_ktlint.sh --format`
- **Documentation**: [ktlint/README.md](ktlint/README.md)

### 2. detekt - Static Code Analysis
- **Purpose**: Finds code problems, code smells, and style issues
- **Configuration**: `config/detekt/detekt.yml`
- **Usage**: 
  - From project root: `./detekt/run_detekt.sh` or `cd 2022_Bluetooth-Chat-and-Remainder-app && ./gradlew detekt`
  - From detekt directory: `cd detekt && bash run_detekt.sh`
- **Documentation**: [detekt/README.md](detekt/README.md)

### 3. Jacoco - Code Coverage
- **Purpose**: Measures code coverage for unit and Android tests
- **Configuration**: `app/build.gradle`
- **Usage**: 
  - From project root: `./jacoco/run_jacoco.sh --unit` or `./jacoco/run_jacoco.sh --android`
  - From jacoco directory: `cd jacoco && ./run_jacoco.sh --unit` or `./run_jacoco.sh --android`
- **Documentation**: [jacoco/README.md](jacoco/README.md)

### 4. Unit Tests
- **Purpose**: Automated testing framework
- **Frameworks**: JUnit 4, Mockito, Espresso
- **Usage**: 
  - From project root: `./unit-tests/run_unit_tests.sh` or `./unit-tests/run_android_tests.sh`
  - From unit-tests directory: `cd unit-tests && ./run_unit_tests.sh` or `./run_android_tests.sh`
- **Documentation**: [unit-tests/README.md](unit-tests/README.md)

## Quick Start

### Prerequisites
- Android Studio
- Gradle
- Android SDK
- Java 8+

### Running Analysis Tools

#### Option 1: Using Gradle directly
1. **Code Style Check**:
   ```bash
   cd 2022_Bluetooth-Chat-and-Remainder-app
   ./gradlew ktlintCheck
   ```

2. **Static Analysis**:
   ```bash
   cd 2022_Bluetooth-Chat-and-Remainder-app
   ./gradlew detekt
   ```

3. **Code Coverage**:
   ```bash
   cd 2022_Bluetooth-Chat-and-Remainder-app
   ./gradlew testDebugUnitTest jacocoTestReport
   ```

4. **Run Tests**:
   ```bash
   cd 2022_Bluetooth-Chat-and-Remainder-app
   ./gradlew testDebugUnitTest connectedDebugAndroidTest
   ```

#### Option 2: Using provided scripts
1. **Code Style Check**:
   ```bash
   # From project root
   ./ktlint/run_ktlint.sh --check
   
   # Or from ktlint directory
   cd ktlint && ./run_ktlint.sh --check
   ```

2. **Static Analysis**:
   ```bash
   # From project root
   ./detekt/run_detekt.sh
   
   # Or from detekt directory
   cd detekt && bash run_detekt.sh
   ```

3. **Code Coverage**:
   ```bash
   # From project root
   ./jacoco/run_jacoco.sh --unit
   
   # Or from jacoco directory
   cd jacoco && ./run_jacoco.sh --unit
   ```

4. **Run Tests**:
   ```bash
   # From project root
   ./unit-tests/run_unit_tests.sh
   
   # Or from unit-tests directory
   cd unit-tests && ./run_unit_tests.sh
   ```

## Analysis Results

### Code Quality Issues Found
- **Naming Issues**: 8 problems with variable naming conventions
- **Lateinit Usage**: 25 instances of excessive lateinit usage
- **Code Style**: 87 style-related issues including long lines, magic numbers, and missing braces

### Test Coverage
- **Unit Tests**: 1 test (ExampleUnitTest)
- **Android Tests**: 8 instrumented tests
- **Coverage Reports**: Available in `app/build/reports/jacoco/`

## Configuration Files

- **ktlint**: `ktlint/ktlint.yml`, `.editorconfig`
- **detekt**: `config/detekt/detekt.yml`
- **Jacoco**: `app/build.gradle` (jacoco configuration)
- **Gradle**: `build.gradle`, `app/build.gradle`

## Reports Location

- **ktlint**: Console output
- **detekt**: `detekt/build/reports/detekt/detekt.html`
- **Jacoco**: `app/build/reports/jacoco/`
- **Tests**: `app/build/reports/tests/`