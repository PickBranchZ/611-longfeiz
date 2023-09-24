#!/bin/bash

# Define an associative array to store the line counts for each command
declare -A line_counts

# Function to count lines in the man page and store the count in the array
count_lines() {
    local command_name="$1"
    local man_page_lines
    man_page_lines=$(man "$command_name" | wc -l)
    line_counts["$command_name"]=$man_page_lines
}

# Count lines for each command
count_lines "man"
count_lines "ls"
count_lines "find"

# Print the results in descending order of line counts
for command_name in "${!line_counts[@]}"; do
    echo "$command_name: ${line_counts[$command_name]}"
done | sort -k2nr
