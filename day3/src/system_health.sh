#!/bin/bash

echo "--- SYSTEM HEALTH REPORT ---"

# 1. Check Disk Usage
echo "Checking Storage..."
df -h | grep "/$" # The '| grep "/$"' finds only your main hard drive

# 2. Check Memory
echo "Checking Memory..."
vm_stat | head -n 5 # On Mac, vm_stat shows memory usage

# 3. Create a Custom Shortcut (Alias)
# Note: This only lasts for this session, but it's good practice
alias ll='ls -la'

echo "Health Check Complete. Log saved to logs/health.log"

# 4. Save the result to your log folder
# We use $(date) to put the time in the log
echo "System checked at $(date)" >> ../logs/health.log