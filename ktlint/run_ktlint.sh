#!/bin/bash

# ktlint runner script for Bluetooth Chat and Remainder app
# This script provides an easy way to run ktlint using Gradle wrapper

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
ANDROID_PROJECT_DIR="$PROJECT_ROOT/2022_Bluetooth-Chat-and-Remainder-app"

# Function to print colored output
print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to show usage
show_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --check     Run ktlint check (default)"
    echo "  --format    Run ktlint format"
    echo "  --help      Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 --check"
    echo "  $0 --format"
    echo "  $0 --help"
}

# Check if Gradle wrapper exists
check_gradle_wrapper() {
    if [ ! -f "$ANDROID_PROJECT_DIR/gradlew" ]; then
        print_error "Gradle wrapper not found at $ANDROID_PROJECT_DIR/gradlew"
        print_info "Make sure you're running this script from the correct directory"
        exit 1
    fi
    
    if [ ! -x "$ANDROID_PROJECT_DIR/gradlew" ]; then
        print_warning "Gradle wrapper is not executable, fixing permissions..."
        chmod +x "$ANDROID_PROJECT_DIR/gradlew"
    fi
}

# Run ktlint check using Gradle
run_check() {
    print_info "Running ktlint check using Gradle..."
    cd "$ANDROID_PROJECT_DIR" || exit 1
    
    ./gradlew ktlintCheck
    
    if [ $? -eq 0 ]; then
        print_info "ktlint check passed! ✅"
    else
        print_error "ktlint check failed! ❌"
        print_info "Check the output above for style violations"
        exit 1
    fi
}

# Run ktlint format using Gradle
run_format() {
    print_info "Running ktlint format using Gradle..."
    cd "$ANDROID_PROJECT_DIR" || exit 1
    
    ./gradlew ktlintFormat
    
    if [ $? -eq 0 ]; then
        print_info "ktlint format completed! ✅"
    else
        print_error "ktlint format failed! ❌"
        print_info "Some issues may require manual fixing"
        exit 1
    fi
}

# Main script logic
main() {
    # Default action is check
    ACTION="check"
    
    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --check)
                ACTION="check"
                shift
                ;;
            --format)
                ACTION="format"
                shift
                ;;
            --help)
                show_usage
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                show_usage
                exit 1
                ;;
        esac
    done
    
    # Check if Gradle wrapper is available
    check_gradle_wrapper
    
    # Run the appropriate action
    case $ACTION in
        check)
            run_check
            ;;
        format)
            run_format
            ;;
        *)
            print_error "Invalid action: $ACTION"
            exit 1
            ;;
    esac
}

# Run main function
main "$@"