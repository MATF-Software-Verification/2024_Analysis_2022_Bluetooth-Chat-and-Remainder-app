# ktlint - Kotlin Code Style Checker

## What is ktlint?

ktlint is a Kotlin linter and formatter that enforces Kotlin coding standards. It helps maintain consistent code style across the project.

## Files in this directory

- `ktlint.yml` - ktlint configuration file with disabled rules and editorconfig overrides
- `.editorconfig` - Editor configuration for consistent code formatting
- `run_ktlint.sh` - Shell script to run ktlint (Linux/Mac)
- `run_ktlint.bat` - Batch script to run ktlint (Windows)

## Usage

### Using Scripts (Recommended)

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


### Using Gradle

The project is configured to use ktlint as a Gradle plugin. You can run:

```bash
# Check code style
./gradlew ktlintCheck

# Auto-fix code style issues
./gradlew ktlintFormat
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

## More Information

- [ktlint GitHub](https://github.com/pinterest/ktlint)
- [ktlint Gradle Plugin](https://github.com/JLLeitschuh/ktlint-gradle)