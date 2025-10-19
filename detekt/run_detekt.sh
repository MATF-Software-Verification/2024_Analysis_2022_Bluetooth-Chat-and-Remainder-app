#!/bin/bash
set -e

# Navigate to repository root (script is in detekt/)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Repository root (parent of detekt folder)
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

# Path to Android project
PROJECT_DIR="$REPO_ROOT/2022_Bluetooth-Chat-and-Remainder-app"

# # Path for Detekt report
REPORT_PATH="reports/detekt.html"
mkdir -p "$(dirname "$REPORT_PATH")"

cd "$PROJECT_DIR"

# # Run Detekt via Gradle
./gradlew detekt \
  --info

echo "Detekt report generated at $REPORT_PATH"