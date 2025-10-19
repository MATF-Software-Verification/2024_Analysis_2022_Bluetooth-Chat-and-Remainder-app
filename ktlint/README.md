# ktlint - Kotlin Code Style Checker

This directory contains ktlint configuration and scripts for the Bluetooth Chat and Remainder app project.

## What is ktlint?

ktlint is a Kotlin linter and formatter that enforces Kotlin coding standards. It helps maintain consistent code style across the project.

## Files in this directory

- `ktlint.yml` - ktlint configuration file with disabled rules and editorconfig overrides
- `.editorconfig` - Editor configuration for consistent code formatting
- `run_ktlint.sh` - Shell script to run ktlint (Linux/Mac)
- `run_ktlint.bat` - Batch script to run ktlint (Windows)
- `README.md` - This documentation file

## Usage

### Using Gradle (Recommended)

The project is configured to use ktlint as a Gradle plugin. You can run:

```bash
# Check code style
./gradlew ktlintCheck

# Auto-fix code style issues
./gradlew ktlintFormat
```

### Using Scripts (Uses Gradle Wrapper)

The provided scripts use the Gradle wrapper internally, so you don't need to install ktlint separately.

#### Linux/Mac
```bash
# Check code style
./ktlint/run_ktlint.sh --check

# Auto-fix code style
./ktlint/run_ktlint.sh --format
```

#### Windows
```cmd
# Check code style
ktlint\run_ktlint.bat --check

# Auto-fix code style
ktlint\run_ktlint.bat --format
```

## Configuration

The ktlint configuration is defined in `ktlint.yml` and includes:

- **Disabled rules**: Some rules are disabled to match project preferences
- **Editorconfig overrides**: Custom settings for specific ktlint rules

## IDE Integration

### IntelliJ IDEA / Android Studio

1. Install the ktlint plugin from the marketplace
2. Configure the plugin to use the project's ktlint configuration
3. Enable "Reformat code on save" for automatic formatting

### VS Code

1. Install the ktlint extension
2. Configure it to use the project's ktlint configuration file

## Troubleshooting

If you encounter issues:

1. Make sure you're in the project root directory
2. Check that the ktlint plugin is properly configured in `build.gradle`
3. Verify that the configuration files are in the correct location
4. Check the Gradle logs for detailed error messages

## More Information

- [ktlint GitHub](https://github.com/pinterest/ktlint)
- [ktlint Gradle Plugin](https://github.com/JLLeitschuh/ktlint-gradle)