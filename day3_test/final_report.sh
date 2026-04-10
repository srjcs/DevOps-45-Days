

# echo "Testing Phase Initiated..."
# ls reports
# echo "Test passed on $(date)" > reports/status.log


#!/bin/bash

# 1. Define the "Home Base" of the script
# This magic command finds the exact folder where the script is stored
BASE_DIR=$(cd "$(dirname "$0")" && pwd)

# 2. Define your paths relative to that Base Directory
REPORTS_DIR="$BASE_DIR/reports"
LOG_FILE="$REPORTS_DIR/status.log"

# 3. Now use those variables instead of "naked" paths
echo "Testing phase initiated..."

# Check if the directory exists before using it
if [ -d "$REPORTS_DIR" ]; then
    ls "$REPORTS_DIR"
    echo "Test passed on $(date)" >> "$LOG_FILE"
else
    echo "Error: Reports directory not found at $REPORTS_DIR"
fi
